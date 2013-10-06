//
// Irrlicht Wrapper for Imperative Languages
// Frank Dodd (2006)
//
// This wrapper DLL encapsulates a sub-set of the features of the powerful
// Irrlicht 3D Graphics Engine exposing the Object Oriented architecture and
// providing a functional 3D SDK for languages that are not object oriented.
//
// This source was created with the help of the great examples in the Irrlicht
// SDK and the excellent Irrlicht documentation. 
//

/* ////////////////////////////////////////////////////////////////////////////
includes
*/
#include "au3irr2.h"
#include "HMDStereoRender.h"

/* ////////////////////////////////////////////////////////////////////////////
global variables
*/

/* ////////////////////////////////////////////////////////////////////////////
external variables
*/
extern IrrlichtDevice *device;
extern IVideoDriver* driver;
extern ISceneManager* smgr;
extern IGUIEnvironment* guienv;
extern HMDStereoRender* renderer;

/* ////////////////////////////////////////////////////////////////////////////
Global Function Declarations

all of the below functions are declared as C functions and are exposed without
any mangled names so that they can be easily imported into imperative
languages like FreeBasic
*/
extern "C"
{

/* ////////////////////////////////////////////////////////////////////////////
OCULUS FUNCTIONS
*/


/* ----------------------------------------------------------------------------
.......
*/
void DLL_EXPORT IrrRiftInit()
{
    HMDDescriptor HMD;
    // Parameters from the Oculus Rift DK1
    HMD.hResolution = driver->getScreenSize().Width;
    HMD.vResolution = driver->getScreenSize().Height;
    HMD.hScreenSize = 0.14976f;
    HMD.vScreenSize = 0.0936f;
    HMD.interpupillaryDistance = 0.064f;
    HMD.lensSeparationDistance = 0.064f;
    HMD.eyeToScreenDistance = 0.041f;
    HMD.distortionK[0] = 1.0f;
    HMD.distortionK[1] = 0.22f;
    HMD.distortionK[2] = 0.24f;
    HMD.distortionK[3] = 0.0f;

    renderer = new HMDStereoRender(device, HMD, 10);
	/*renderer->OVRInit();*/
}

void DLL_EXPORT IrrRiftStop()
{
	if(renderer->isRiftRunning()) {
	renderer->OVRStop();
	}
}

bool DLL_EXPORT IrrRiftRunning()
{
	return renderer->isRiftRunning();
}


void DLL_EXPORT IrrRiftReadSensorData(float *yaw, float *pitch, float *roll)
{
	renderer->OVRReadSensorData(*yaw, *pitch, *roll);
}

/* ----------------------------------------------------------------------------
.......
*/
void DLL_EXPORT IrrRiftDrawScene()
{
	/* renderer->drawAll(smgr); */
	renderer->drawAll();
}

/* ////////////////////////////////////////////////////////////////////////////
all of the above functions are declared as C functions and are exposed without
any mangled names
*/
}
