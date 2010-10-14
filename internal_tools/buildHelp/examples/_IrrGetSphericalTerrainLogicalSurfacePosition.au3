#include "au3Irrlicht2.au3"

HotKeySet("{ESC}", "_exit")
Func _exit()
	_IrrStop()
	Exit
EndFunc

Global $hSphere, $sGSbmp = "./media/simplesphere.bmp"
Global $hTexture, $hTestNode, $hCamera, $aXYZ, $aFXZ

_IrrStart($IRR_EDT_OPENGL)

$hSphere = _IrrAddSphericalTerrain($sGSbmp, $sGSbmp, $sGSbmp, $sGSbmp, $sGSbmp, $sGSbmp)
$hTexture = _IrrGetTexture("./media/terrain-texture.jpg")
_IrrSetSphericalTerrainTexture($hSphere, $hTexture, $hTexture, $hTexture, $hTexture, $hTexture, $hTexture)
$hTestNode = _IrrAddTestSceneNode()
_IrrSetNodeScale($hTestNode, 2.4, 2.4, 2.4)
_IrrSetAmbientLight(1, 1, 1)
$hCamera = _IrrAddFPSCamera()
_IrrSetNodePosition($hCamera, 0, 0, 500)

_IrrHideMouse()

While _IrrRunning()
	_IrrBeginScene(0, 0, 0)

	$aXYZ = _IrrGetNodePosition($hCamera)

	$aFXZ = _IrrGetSphericalTerrainLogicalSurfacePosition($hSphere, $aXYZ[0], $aXYZ[1], $aXYZ[2])
	_IrrSetWindowCaption("Face: " & $aFXZ[0] & "  LogicalX: " & $aFXZ[1] & "  LogicalZ: " & $aFXZ[2])

	$aXYZ = _IrrGetSphericalTerrainSurfacePosition($hSphere, $aFXZ[0], $aFXZ[1] * 256, $aFXZ[2] * 256)
	_IrrSetNodePosition($hTestNode, $aXYZ[0], $aXYZ[1], $aXYZ[2])

	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()