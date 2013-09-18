/*
Copyright (C) 2012 Luca Siciliano

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the 
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies 
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS 
BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT 
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#include "HMDStereoRender.h"
//#include "OVR.h"

#include <iostream>
#include <cassert>


using namespace irr;
using namespace core;
using namespace scene;
using namespace video;
using namespace std;
using namespace OVR;

// linus: replaced gl_TexCoord[0].st with gl_TexCoord[0] (otherwise not working with Intel Graphics)
static const char* vertexShader =
"void main() {"
"  gl_Position = vec4(gl_Vertex.xy, 0.0, 1.0);"
"  gl_TexCoord[0] = gl_MultiTexCoord0;"
"}";

static const char *fragShader =
"uniform vec2 scale;"
"uniform vec2 scaleIn;"
"uniform vec2 lensCenter;"
"uniform vec4 hmdWarpParam;"
"uniform sampler2D texid;"
"void main()"
"{"
"  vec2 uv = (gl_TexCoord[0].st*2.0)-1.0;" // range from [0,1] to [-1,1]
"  vec2 theta = (uv-lensCenter)*scaleIn;"
"  float rSq = theta.x*theta.x + theta.y*theta.y;"
"  vec2 rvector = theta*(hmdWarpParam.x + hmdWarpParam.y*rSq + hmdWarpParam.z*rSq*rSq + hmdWarpParam.w*rSq*rSq*rSq);"
"  vec2 tc = (lensCenter + scale * rvector);"
"  tc = (tc+1.0)/2.0;" // range from [-1,1] to [0,1]
"  if (any(bvec2(clamp(tc, vec2(0.0,0.0), vec2(1.0,1.0))-tc)))"
"    gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);"
"  else"
"    gl_FragColor = texture2D(texid, tc);"
"}";


HMDStereoRender::HMDStereoRender(irr::IrrlichtDevice *device, HMDDescriptor HMD, f32 worldScale)
  : _worldScale(worldScale),
    _renderTexture(NULL)
{
	_device = device;
  _smgr = device->getSceneManager();
  _driver = device->getVideoDriver();
  _timer = device->getTimer();

  // Create perspectiva camera used for rendering
  _pCamera = _smgr->addCameraSceneNode();

  // Init shader parameters
  _distortionCB.scale[0] = 1.0f; _distortionCB.scale[1] = 1.0f;
  _distortionCB.scaleIn[0] = 1.0f; _distortionCB.scaleIn[1] = 1.0f;
  _distortionCB.lensCenter[0] = 0.0f;_distortionCB.lensCenter[1] = 0.0f;
  _distortionCB.hmdWarpParam[0] = 1.0f;_distortionCB.hmdWarpParam[1] = 0.0f;_distortionCB.hmdWarpParam[2] = 0.0f;_distortionCB.hmdWarpParam[3] = 0.0f;
  
  // Plane
  _planeVertices[0] = video::S3DVertex(-1.0f, -1.0f, 1.0f,1,1,0, video::SColor(255,0,255,255), 0.0f, 0.0f);
  _planeVertices[1] = video::S3DVertex(-1.0f,  1.0f, 1.0f,1,1,0, video::SColor(255,0,255,255), 0.0f, 1.0f);
  _planeVertices[2] = video::S3DVertex( 1.0f,  1.0f, 1.0f,1,1,0, video::SColor(255,0,255,255), 1.0f, 1.0f);
  _planeVertices[3] = video::S3DVertex( 1.0f, -1.0f, 1.0f,1,1,0, video::SColor(255,0,255,255), 1.0f, 0.0f);
  _planeIndices[0] = 0; _planeIndices[1] = 1; _planeIndices[2] = 2; _planeIndices[3] = 0; _planeIndices[4] = 2; _planeIndices[5] = 3;

  // Create shader material
  _renderMaterial.Wireframe = false;
  _renderMaterial.Lighting = false;
  _renderMaterial.TextureLayer[0].TextureWrapU = ETC_CLAMP;
  _renderMaterial.TextureLayer[0].TextureWrapV = ETC_CLAMP;

  IGPUProgrammingServices* gpu = _driver->getGPUProgrammingServices(); 
  _renderMaterial.MaterialType=(E_MATERIAL_TYPE)gpu->addHighLevelShaderMaterial(vertexShader, "main", EVST_VS_3_0, fragShader, "main", EPST_PS_3_0, &_distortionCB);

  m_bRiftRunning = OVRInit();

  m_pYaw   = _smgr->addEmptySceneNode(0, 0);
  m_pHeadX = _smgr->addEmptySceneNode(m_pYaw  , 0);
  m_pHeadY = _smgr->addEmptySceneNode(m_pHeadX, 0);
  m_pHeadZ = _smgr->addEmptySceneNode(m_pHeadY, 0);

  m_pLeftEye = _smgr->addEmptySceneNode(m_pHeadZ, 0); m_pLeftEye->setPosition(irr::core::vector3df(-0.25, 0, 0));
  m_pRghtEye = _smgr->addEmptySceneNode(m_pHeadZ, 0); m_pRghtEye->setPosition(irr::core::vector3df( 0.25, 0, 0));

  setHMD(HMD);
}

HMDStereoRender::~HMDStereoRender() {
}

void HMDStereoRender::setHMD(HMDDescriptor HMD) {
  _HMD = HMD;

  // Compute aspect ratio and FOV
  float aspect = HMD.hResolution / (2.0f*HMD.vResolution);

  // Fov is normally computed with:
  //   2*atan2(HMD.vScreenSize,2*HMD.eyeToScreenDistance)
  // But with lens distortion it is increased (see Oculus SDK Documentation)
  float r = -1.0f - (4.0f * (HMD.hScreenSize/4.0f - HMD.lensSeparationDistance/2.0f) / HMD.hScreenSize);
  float distScale = (HMD.distortionK[0] + HMD.distortionK[1] * pow(r,2) + HMD.distortionK[2] * pow(r,4) + HMD.distortionK[3] * pow(r,6));
  float fov = 2.0f*atan2(HMD.vScreenSize*distScale, 2.0f*HMD.eyeToScreenDistance);

  // Compute camera projection matrices
  matrix4 centerProjection = matrix4().buildProjectionMatrixPerspectiveFovLH (fov, aspect, 1, 10000);
  float h = 4 * (HMD.hScreenSize/4 - HMD.interpupillaryDistance/2) / HMD.hScreenSize;
  _projectionLeft = matrix4().setTranslation(vector3df(h, 0.0, 0.0)) * centerProjection;
  _projectionRight = matrix4().setTranslation(vector3df(-h, 0.0, 0.0)) * centerProjection;

  // Compute camera offset
  _eyeSeparation = _worldScale * HMD.interpupillaryDistance/2.0f;

  // Compute Viewport
  _viewportLeft = rect<s32>(0, 0, HMD.hResolution/2, HMD.vResolution);
  _viewportRight = rect<s32>(HMD.hResolution/2, 0, HMD.hResolution, HMD.vResolution);

  // Distortion shader parameters
  _lensShift = 4.0f * (HMD.hScreenSize/4.0f - HMD.lensSeparationDistance/2.0f) / HMD.hScreenSize;

  _distortionCB.scale[0] = 1.0f/distScale;
  _distortionCB.scale[1] = 1.0f*aspect/distScale;
  
  _distortionCB.scaleIn[0] = 1.0f;
  _distortionCB.scaleIn[1] = 1.0f/aspect;
  
  _distortionCB.hmdWarpParam[0] = HMD.distortionK[0];
  _distortionCB.hmdWarpParam[1] = HMD.distortionK[1];
  _distortionCB.hmdWarpParam[2] = HMD.distortionK[2];
  _distortionCB.hmdWarpParam[3] = HMD.distortionK[3];

  // Create render target
  if (_driver->queryFeature(video::EVDF_RENDER_TO_TARGET))
  {
    if (_renderTexture != NULL) _renderTexture->drop();
    _renderTexture = _driver->addRenderTargetTexture(dimension2d<u32>(HMD.hResolution*distScale/2.0f, HMD.vResolution*distScale));
    _renderMaterial.setTexture(0, _renderTexture);
  }
  else {
    // Render to target not supported
    assert(0);
  }
}



// void HMDStereoRender::drawAll(ISceneManager* smgr) 
void HMDStereoRender::drawAll() 
{
//	static bool firstCall = true; 
	irr::scene::ICameraSceneNode *l_pCamera = _smgr->getActiveCamera();

// ============================================================================

	    irr::s32 m_iMove,
             m_iStrafe;

      m_iMove   = 0;
      m_iStrafe = 0;
	  irr::gui::ICursorControl *m_pCursor;
	  
      m_pCursor = _device->getCursorControl();

      //irr::scene::ICameraSceneNode *l_pCam = _smgr->getActiveCamera();
	  l_pCamera->bindTargetAndRotation(false);
      //irr::ITimer *l_pTimer = m_pDevice->getTimer();

      irr::u32 l_iLastTime = _timer->getTime();
      irr::f32 fRot = 0.0f;

        irr::u32 l_iThisTime   = _timer->getTime(),
                 l_iDiffTime   = l_iThisTime - l_iLastTime;
        irr::s32 l_iMouseX     = (_driver->getScreenSize().Width / 2) - m_pCursor->getPosition().X;
        irr::f32 l_fMoveFactor = ((irr::f32)l_iDiffTime) / 10.0f;
		
        m_pCursor->setPosition( (int)(_driver->getScreenSize().Width / 2), (int)(_driver->getScreenSize().Height / 2));
		
        l_iLastTime = l_iThisTime;

        irr::core::vector3df l_vPos  = l_pCamera->getPosition(),
                             l_vTgt  = l_pCamera->getTarget() - l_vPos,
                             l_vUp   = l_pCamera->getUpVector(),
                             l_vSide = l_vTgt.crossProduct(l_vUp),
                             l_vRot  = l_pCamera->getRotation(),

							 l_vTar  = l_pCamera->getTarget();
		l_pCamera->setPosition(l_vPos + l_fMoveFactor * m_iMove * l_vTgt + l_fMoveFactor * m_iStrafe * l_vSide);
		l_pCamera->setRotation(irr::core::vector3df(l_vRot.X, l_vRot.Y - ((irr::f32)l_iMouseX) / 15.0f, l_vRot.Z + fRot));
// ============================================================================

  l_pCamera->OnAnimate(_timer->getTime());

  // Start of Oculus Rift Code provided by Christian Keimel / bulletbyte.de

  irr::core::matrix4 l_cMat;

//irr::core::vector3df orgOri = l_pCamera->getRotation();
//irr::core::vector3df orgPos = l_pCamera->getPosition();

  if (m_bRiftRunning) {
	float yaw, pitch, roll;
/*	vector3df riftOrientation;
	riftOrientation.X = pitch;
	riftOrientation.Y = yaw;
	riftOrientation.Z = roll;
*/

//    irr::core::vector3df v;

//    OVRReadSensorData(v.X, v.Y, v.Z);
	OVRReadSensorData(pitch, yaw, roll);

/*    v.X *=  irr::core::RADTODEG;
    v.Y *= -irr::core::RADTODEG;
    v.Z *= -irr::core::RADTODEG;
*/
    m_pYaw  ->setRotation(l_pCamera->getRotation()); // irr::core::vector3df(        0, l_pCamera->getRotation().Y,   0));
    m_pHeadY->setRotation(irr::core::vector3df(        0, -yaw                       ,   0));
    m_pHeadX->setRotation(irr::core::vector3df(      pitch,   0                       ,   0));
    m_pHeadZ->setRotation(irr::core::vector3df(        0,   0                       , -roll));

    l_cMat.setRotationDegrees(m_pHeadZ->getAbsoluteTransformation().getRotationDegrees());
}

  irr::core::vector3df vFore = irr::core::vector3df(0, 0, -1),
                       vUp   = irr::core::vector3df(0, 1,  0);

  l_cMat.transformVect(vFore);
  l_cMat.transformVect(vUp  );

irr::core::vector3df orgTarget = l_pCamera->getTarget();
irr::core::vector3df orgUpVector = l_pCamera->getUpVector();
  l_pCamera->setTarget  (l_pCamera->getAbsolutePosition() + vFore);
  l_pCamera->setUpVector(                           vUp  );

  // keep changed vectors for Camera at first function call; this will sync camera view with current rift orientation (user's head)
  // for all following calls of this function the active camera will be re-set with its original vectors to decouple movement from
  // rift orientation
/*  if(firstCall) {
	  firstCall = false;
	  return;
  }
*/
  // Render Left
  _driver->setRenderTarget(_renderTexture, true, true, irr::video::SColor(0,0,0,0));

  // End of Oculus Rift Code provided by Christian Keimel / bulletbyte.de

  _pCamera->setProjectionMatrix(_projectionLeft);

  //irr::core::vector3df l_vR = l_pCamera->getRotation();
  //irr::core::vector3df l_vTx(0, 0, 1);//-m_fEyeSeparation, 0.0, 0.0);
  //l_vTx.rotateXZBy(-l_vR.Y);
  //l_vTx.rotateYZBy(-l_vR.X);
  //l_vTx.rotateXYBy(-l_vR.Z);

  _pCamera->setPosition(l_pCamera->getAbsolutePosition() + m_pLeftEye->getAbsolutePosition());
  _pCamera->setTarget  (l_pCamera->getTarget  () + m_pLeftEye->getAbsolutePosition());//getTarget  () + l_vTx);
  _pCamera->setUpVector(l_pCamera->getUpVector());

  _smgr->setActiveCamera(_pCamera);
//l_pCamera->setTarget  (orgTarget);
//l_pCamera->setUpVector(orgUpVector);
  _smgr->drawAll();

  _driver->setRenderTarget(0, false, false, irr::video::SColor(0,100,100,100));
  _driver->setViewPort(_viewportLeft);

  _distortionCB.lensCenter[0] = _lensShift;

  _driver->setMaterial(_renderMaterial);
  _driver->drawIndexedTriangleList(_planeVertices, 4, _planeIndices, 2);

  // Render Right
  _driver->setRenderTarget(_renderTexture, true, true, irr::video::SColor(0,0,0,0));
  _pCamera->setProjectionMatrix(_projectionRight);

  //irr::core::vector3df l_vTxt2(0, 0, 1);//m_fEyeSeparation, 0.0, 0.0);
  //l_vTxt2.rotateXZBy(-l_vR.Y);
  //l_vTxt2.rotateYZBy(-l_vR.X);
  //l_vTxt2.rotateXYBy(-l_vR.Z);

l_pCamera->setTarget  (l_pCamera->getAbsolutePosition() + vFore);
l_pCamera->setUpVector(                           vUp  );
  _pCamera->setPosition(l_pCamera->getAbsolutePosition() + m_pRghtEye->getAbsolutePosition()); //l_vTxt2);
  _pCamera->setTarget  (l_pCamera->getTarget  () + m_pRghtEye->getAbsolutePosition());
  _pCamera->setUpVector(l_pCamera->getUpVector());

//l_pCamera->setTarget  (orgTarget);
//l_pCamera->setUpVector(orgUpVector);
  _smgr->drawAll();

  _driver->setRenderTarget(0, false, false, irr::video::SColor(0,100,100,100));
  _driver->setViewPort(_viewportRight);

  _distortionCB.lensCenter[0] = -_lensShift;

  _driver->setMaterial(_renderMaterial);
  _driver->drawIndexedTriangleList(_planeVertices, 4, _planeIndices, 2);

//l_pCamera->setTarget  (orgTarget);
l_pCamera->setUpVector(orgUpVector);
  _driver->setViewPort(rect<s32>(0, 0, _HMD.hResolution, _HMD.vResolution));
  _smgr->setActiveCamera(l_pCamera);  
}



bool HMDStereoRender::OVRInit()
{
	bool g_bRiftAvailable = false;

	System::Init();
	pManager = DeviceManager::Create();
	g_bRiftAvailable = pManager->EnumerateDevices<OVR::HMDDevice>().IsAvailable();
	if(g_bRiftAvailable) 
	{
		pHMD = pManager->EnumerateDevices<HMDDevice>().CreateDevice();
		if (pHMD)
			{
			   InfoLoaded = pHMD->GetDeviceInfo(&Info);

		   pSensor = pHMD->GetSensor();
		}
		else
		{
		   pSensor = pManager->EnumerateDevices<SensorDevice>().CreateDevice();
		}

		if (pSensor)
		{
			FusionResult.AttachToSensor(pSensor);
		}
	}
  return g_bRiftAvailable;
}


void HMDStereoRender::OVRStop()
{
	pSensor->Release();
	pSensor->Release();
	pHMD->Release();
 	pManager->Release();

	System::Destroy();
}

bool HMDStereoRender::isRiftRunning()
{
	return m_bRiftRunning;
}

void HMDStereoRender::OVRReadSensorData(float &pitch, float &yaw, float &roll)
{
	OVR::Quatf l_cHmdOrient = FusionResult.GetOrientation();
    l_cHmdOrient.GetEulerAngles<OVR::Axis_X, OVR::Axis_Y, OVR::Axis_Z>(&pitch, &yaw, &roll);

		pitch = RadToDegree(pitch);
		yaw = RadToDegree(yaw);
		roll = RadToDegree(roll);
}