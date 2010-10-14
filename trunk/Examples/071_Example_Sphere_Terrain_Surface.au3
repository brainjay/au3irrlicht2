; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by smashly
; ----------------------------------------------------------------------------
; Example 71 : Spherical Terrain Surface
; This example moves an object closely across the surface of a spherical
; terrain
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

Global $hBitmapFont
Global $hSphereTexture0, $hSphereTexture1, $hSphere
Global $hSkyBox, $hLight, $hCamera
Global $hBillboardTexture, $hBillboard, $hTestNode
Global $aXYZ, $iFace, $LogicalX, $LogicalZ

; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart($IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
		$IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON)

; send the window caption
_IrrSetWindowCaption("Example 071: Spherical Terrain Surface")

; load some textures and a font to use
$hBitmapFont = _IrrGetFont("../media/bitmapfont.bmp")
$hSphereTexture0 = _IrrGetTexture("../media/terrain-texture.jpg")
$hSphereTexture1 = _IrrGetTexture("../media/detailmap-dim.jpg")

; add the spherical terrain. this is supplied with six terrain heightmaps
; one for each of the faces on the cube
$hSphere = _IrrAddSphericalTerrain( _
		"../media/simplesphere.bmp", _
		"../media/simplesphere.bmp", _
		"../media/simplesphere.bmp", _
		"../media/simplesphere.bmp", _
		"../media/simplesphere.bmp", _
		"../media/simplesphere.bmp", _
		0, 0, 0, 0, 0, 0, 64.0, 64.0, 64.0, _
		255, 255, 255, 255, -30, 0, 4, $ETPS_17)

; add the sphere texture, detail, scale and material type.
_IrrSetNodeMaterialTexture($hSphere, $hSphereTexture0, 0)
_IrrSetNodeMaterialTexture($hSphere, $hSphereTexture1, 1)
_IrrScaleSphericalTexture($hSphere, 1.0, 60.0)
_IrrSetNodeMaterialType($hSphere, $IRR_EMT_DETAIL_MAP)

; add a simple skybox to the scene to represent space
$hSkyBox = _IrrAddSkyBoxToScene( _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"), _
		_IrrGetTexture("../media/stars.jpg"))

_IrrSetFog(255, 128, 0, $IRR_EXPONENTIAL_FOG, 0.0, 5000.0, 0.5)

;add some light so we can see the scene.
_IrrAddLight($IRR_NO_PARENT, 64000, 160000, 0, 1, 1, 1, 1922000.0)

; load the texture resource for the billboard
$hBillboardTexture = _IrrGetTexture("../media/sun.tga")

; add the billboard to the scene, the first two parameters are the size of the
; billboard in this instance they match the pixel size of the bitmap to give
; the correct aspect ratio. the last three parameters are the position of the
; billboard object
$hBillboard = _IrrAddBillBoardToScene(6000.0, 6000.0, 30000.0, 15000.0, 0.0)

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialTexture($hBillboard, $hBillboardTexture, 0)

; rather than have the billboard lit by light sources in the scene we can
; switch off lighting effects on the model and have it render as if it were
; self illuminating
_IrrSetNodeMaterialFlag($hBillboard, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrSetNodeMaterialType($hBillboard, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL)
_IrrMaterialSetMaterialTypeParam(_IrrGetMaterial($hBillboard, 0), 0.0001)

; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$hCamera = _IrrAddFPSCamera(0, 100, 2)
_IrrSetNodePosition($hCamera, 0, 30000, 0)

; the clipping distance of a camera is a distance beyond which no triangles are
; rendered, this speeds the scene up by not showing geometry that is in the
; distance and too small to see however our terrain is so huge we need to
; extend this distance out
_IrrSetCameraClipDistance($hCamera, 500000)

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; add a test node to the scene, we'll use this to travel along the surface of the of the spherical terrain.
$hTestNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialFlag($hTestNode, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrSetNodeScale($hTestNode, 100.0, 100.0, 100.0)

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
While _IrrRunning() And Sleep(16)

	; begin the scene, erasing the canvas with sky-blue before rendering
	_IrrBeginScene(0, 0, 0)

	; Do some stepping of the sperical Face, Logical X, Z positions each loop.
	$LogicalX += 8
	If $LogicalX > 240 Then
		$LogicalX = 0
		$LogicalZ += 8
	EndIf
	If $LogicalZ > 240 Then
		$LogicalZ = 0
		$iFace += 1
	EndIf
	If $iFace > 5 Then $iFace = 0

	; Get the spherical terrain surface position and angle based on Face and Logical X, Z positions
	; Then set the test node to the new surface position and angle
	$aXYZ = _IrrGetSphericalTerrainSurfacePositionAndAngle($hSphere, $iFace, $LogicalX, $LogicalZ)
	_IrrSetNodePosition($hTestNode, $aXYZ[0][0], $aXYZ[0][1], $aXYZ[0][2])
	_IrrSetNodeRotation($hTestNode, $aXYZ[1][0], $aXYZ[1][1], $aXYZ[1][2])

	; draw the scene
	_IrrDrawScene()

	; just text to display how many primitives are drawn in the scene.
	_Irr2DFontDraw($hBitmapFont, "PRIMS: " & _IrrGetPrimitivesDrawn(), 4, 4, 250, 24)

	; end drawing the scene and render it
	_IrrEndScene()
WEnd

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
