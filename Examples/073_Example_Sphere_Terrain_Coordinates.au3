; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by smashly.
; ----------------------------------------------------------------------------
; Example 73 : Spherical Terrain Coordinates
; This example demonstrates converting between grid co-ordinates on a cube and
; spherical coordinates on a spherical terrain.
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "..\au3Irrlicht2.au3"

Opt("MustDeclareVars", 1)

HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc   ;==>_exit

; ////////////////////////////////////////////////////////////////////////////
; global variables
Global $hTerrain
Global $hTerrainNode
Global $hTerrainTexture
Global $hCamera
Global $hCameraNode
Global $hBitmapFont
Global $hLight
Global $hSkyBox
Global $hBillboard
Global $hBillboardTexture
Global $hTestNode
Global $aV3D, $aFXZ

Func _AddPlanet($px, $py, $pz, $rx, $ry, $rz)

	; add the spherical terrain. this is supplied with six terrain highmaps one for
	; each of the faces on the cube
	$hTerrain = _IrrAddSphericalTerrain( _
			"../media/simplesphere.bmp", _
			"../media/simplesphere.bmp", _
			"../media/simplesphere.bmp", _
			"../media/simplesphere.bmp", _
			"../media/simplesphere.bmp", _
			"../media/simplesphere.bmp", _
			$px, $py, $pz, $rx, $ry, $rz, 6.4, 6.4, 6.4, _
			255, 255, 255, 255, -30, 0, 4, $ETPS_17)

	_IrrSetSphericalTerrainTexture($hTerrain, _
			_IrrGetTexture("../media/cube_top.jpg"), _
			_IrrGetTexture("../media/cube_front.jpg"), _
			_IrrGetTexture("../media/cube_back.jpg"), _
			_IrrGetTexture("../media/cube_left.jpg"), _
			_IrrGetTexture("../media/cube_right.jpg"), _
			_IrrGetTexture("../media/cube_bottom.jpg"), _
			0)

	$hTerrainNode = $hTerrain
	_IrrSetNodeMaterialTexture($hTerrainNode, $hTerrainTexture, 1)
	_IrrScaleSphericalTexture($hTerrain, 1.0, 60.0)
	_IrrSetNodeMaterialType($hTerrainNode, $IRR_EMT_DETAIL_MAP)
	_IrrSetNodeMaterialFlag($hTerrainNode, $IRR_EMF_LIGHTING, $IRR_OFF)

EndFunc   ;==>_AddPlanet

; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart($IRR_EDT_OPENGL, 512, 512, $IRR_BITS_PER_PIXEL_32, _
		$IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON)

; send the window caption
_IrrSetWindowCaption("Example 73: Logical Spherical Terrain Coordinates")

$hBitmapFont = _IrrGetFont("../media/bitmapfont.bmp")
$hTerrainTexture = _IrrGetTexture("../media/detailmap-dim.jpg")

; add a spherical terrain to the scene
_AddPlanet(0, 0, 0, 0, 0, 0)

; add a simple skybox to the scene to represent space
$hSkyBox = _IrrAddSkyBoxToScene( _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"))

_IrrSetFog(255, 128, 0, $IRR_EXPONENTIAL_FOG, 0.0, 500.0, 0.5)
$hLight = _IrrAddLight($IRR_NO_PARENT, 6400, 16000, 0, 1, 1, 1, 192200.0)

; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$hCamera = _IrrAddFPSCamera()
$hCameraNode = $hCamera
_IrrSetNodePosition($hCameraNode, 0, 2000, 0)

; load the texture resource for the billboard
$hBillboardTexture = _IrrGetTexture("../media/sun.tga")

; add the billboard to the scene, the first two parameters are the size of the
; billboard in this instance they match the pixel size of the bitmap to give
; the correct aspect ratio. the last three parameters are the position of the
; billboard object
$hBillboard = _IrrAddBillBoardToScene(600.0, 600.0, 3000.0, 1500.0, 0.0)

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialTexture($hBillboard, $hBillboardTexture, 0)

; rather than have the billboard lit by light sources in the scene we can
; switch off lighting effects on the model and have it render as if it were
; self illuminating
_IrrSetNodeMaterialFlag($hBillboard, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrSetNodeMaterialType($hBillboard, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL)
_IrrMaterialSetMaterialTypeParam( _IrrGetMaterial($hBillboard, 0), 0.0001)

; create a test nodes
$hTestNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture($hTestNode, $hTerrainTexture, 0)
_IrrSetNodeMaterialFlag($hTestNode, $IRR_EMF_LIGHTING, $IRR_OFF)

; the clipping distance of a camera is a distance beyond which no triangles are
; rendered, this speeds the scene up by not showing geometry that is in the
; distance and too small to see however our terrain is so huge we need to
; extend this distance out
_IrrSetCameraClipDistance($hCamera, 5000)

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
While _IrrRunning()
	; begin the scene, erasing the canvas with sky-blue before rendering
	_IrrBeginScene(0, 0, 0)

	; get the position of the camera
	$aV3D = _IrrGetNodePosition($hCameraNode)

	; translate the camera coordinates into logical coordinates using a face
	; and an X,Z on that face. This translation is not perfectly accurate yet
	; I would advise the translation is done at altitude and the difference
	; blended across as the vehicle decends
	; the height above the surface can be calculated simply by calculating the
	; length of the center of the planet to the surface and then the center of
	; the planet to the space coordinate and subracting the two
	; the momentum could be calculated by converting two samples and then
	; measing the difference in height and X and Z on the face
	$aFXZ = _IrrGetSphericalTerrainLogicalSurfacePosition($hTerrain, $aV3D[0], $aV3D[1], $aV3D[2])

	; get the surface cordinate for placing the test node
	$aV3D = _IrrGetSphericalTerrainSurfacePosition($hTerrain, $aFXZ[0], $aFXZ[1] * 256, $aFXZ[2] * 256)
	_IrrSetNodePosition($hTestNode, $aV3D[0], $aV3D[1], $aV3D[2])

	; draw the scene
	_IrrDrawScene()

	; Draw the info in the scene
	_Irr2DFontDraw($hBitmapFont, "X:" & $aFXZ[1] & " Y:" & $aFXZ[2] & " Face:" & $aFXZ[0], 4, 4, 250, 24)

	; end drawing the scene and render it
	_IrrEndScene()
WEnd

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()