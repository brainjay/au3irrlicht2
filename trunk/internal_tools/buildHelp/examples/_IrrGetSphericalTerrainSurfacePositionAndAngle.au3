#include "au3Irrlicht2.au3"

Global $hSphere, $sGSbmp = "./media/simplesphere.bmp"
Global $hTexture, $hTestNode, $aXYZ, $iFace, $LogicalX, $LogicalZ

_IrrStart($IRR_EDT_OPENGL, 800, 600)

$hSphere = _IrrAddSphericalTerrain($sGSbmp, $sGSbmp, $sGSbmp, $sGSbmp, $sGSbmp, $sGSbmp)
$hTexture = _IrrGetTexture("./media/terrain-texture.jpg")
_IrrSetSphericalTerrainTexture($hSphere, $hTexture, $hTexture, $hTexture, $hTexture, $hTexture, $hTexture)
$hTestNode = _IrrAddTestSceneNode()
_IrrSetNodeScale($hTestNode, 2.5, 2.5, 2.5)
_IrrSetAmbientLight( 1, 1, 1)
_IrrAddCamera(0, 440, 0, 0, 0, 0)

While _IrrRunning() And Sleep(50)
	_IrrBeginScene(0, 0, 0)

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

	$aXYZ = _IrrGetSphericalTerrainSurfacePositionAndAngle($hSphere, $iFace, $LogicalX, $LogicalZ)
	_IrrSetNodePosition($hTestNode, $aXYZ[0][0], $aXYZ[0][1], $aXYZ[0][2])
	_IrrSetNodeRotation($hTestNode, $aXYZ[1][0], $aXYZ[1][1], $aXYZ[1][2])

	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()
