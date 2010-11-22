#include "au3Irrlicht2.au3"

Global $aTerrain[4]
Global $aZone[16]
Global $tStructureMap
Global $hCamera
Global $hTerrainTexture0
Global $hTerrainTexture1
Global $hHeightMap
Global $iTileSize = 128
Global $iIndex

_IrrStart()

$hHeightMap = _IrrGetImage("./media/terrain-heightmap.bmp")
$hTerrainTexture0 = _IrrGetTexture("./media/terrain-texture.jpg")
$hTerrainTexture1 = _IrrGetTexture("./media/detailmap3.jpg")


For $i = 0 To 3
	$aTerrain[$i] = _IrrAddTerrainTile($hHeightMap, $iTileSize, 0, 0)
	_IrrSetNodeScale($aTerrain[$i], 40.0, 0.5, 40.0)
	_IrrSetNodeMaterialTexture($aTerrain[$i], $hTerrainTexture0, 1)
	_IrrSetNodeMaterialTexture($aTerrain[$i], $hTerrainTexture1, 0)
	_IrrScaleTileTexture($aTerrain[$i], 64.0, 1.0)
	_IrrSetNodeMaterialFlag($aTerrain[$i], $IRR_EMF_LIGHTING, $IRR_OFF)
	_IrrSetNodeMaterialType($aTerrain[$i], $IRR_EMT_DETAIL_MAP)
	_IrrSetNodeMaterialFlag($aTerrain[$i], $IRR_EMF_FOG_ENABLE, $IRR_ON)
Next

_IrrAttachTile($aTerrain[0], $aTerrain[2], $RIGHT_EDGE)
_IrrAttachTile($aTerrain[0], $aTerrain[2], $LEFT_EDGE)
_IrrAttachTile($aTerrain[0], $aTerrain[1], $BOTTOM_EDGE)
_IrrAttachTile($aTerrain[0], $aTerrain[1], $TOP_EDGE)

_IrrAttachTile($aTerrain[1], $aTerrain[3], $RIGHT_EDGE)
_IrrAttachTile($aTerrain[1], $aTerrain[3], $LEFT_EDGE)
_IrrAttachTile($aTerrain[1], $aTerrain[0], $BOTTOM_EDGE)
_IrrAttachTile($aTerrain[1], $aTerrain[0], $TOP_EDGE)

_IrrAttachTile($aTerrain[2], $aTerrain[0], $RIGHT_EDGE)
_IrrAttachTile($aTerrain[2], $aTerrain[0], $LEFT_EDGE)
_IrrAttachTile($aTerrain[2], $aTerrain[3], $BOTTOM_EDGE)
_IrrAttachTile($aTerrain[2], $aTerrain[3], $TOP_EDGE)

_IrrAttachTile($aTerrain[3], $aTerrain[1], $RIGHT_EDGE)
_IrrAttachTile($aTerrain[3], $aTerrain[1], $LEFT_EDGE)
_IrrAttachTile($aTerrain[3], $aTerrain[2], $BOTTOM_EDGE)
_IrrAttachTile($aTerrain[3], $aTerrain[2], $TOP_EDGE)

; Create a DllStruct to pass a string to the path of the StructureMap used by _IrrSetZoneManagerAttachTerrain
$tStructureMap = DllStructCreate("char[" & StringLen("./media/simpletile.tga") & "]")
DllStructSetData($tStructureMap, 1, "./media/simpletile.tga")

For $j = 0 To 3
	For $i = 0 To 3
		$aZone[$i + $j * 4] = _IrrAddZoneManager(0, 112 * 40)
		_IrrSetNodePosition($aZone[$i + $j * 4], $i * 112 * 40, 0, $j * 112 * 40)
		If Mod($i, 2) = 0 Then
			$iIndex = 0
		Else
			$iIndex = 1
		EndIf
		If Mod($j, 2) = 1 Then $iIndex += 2
		_IrrSetZoneManagerAttachTerrain($aZone[$i + $j * 4], $aTerrain[$iIndex], _
				DllStructGetPtr($tStructureMap), $IRR_NO_OBJECT, $IRR_NO_OBJECT, 0, 0, 32)
	Next
Next

_IrrSetFog(240, 255, 255, $IRR_EXPONENTIAL_FOG, 0.0, 2200.0, 0.001)
$hCamera = _IrrAddFPSCamera()
_IrrSetNodePosition($hCamera, 2500.0, 100.0, 2500.0)
_IrrSetCameraClipDistance($hCamera, 12000)
_IrrHideMouse()

While _IrrRunning()
	_IrrBeginScene(240, 255, 255)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()