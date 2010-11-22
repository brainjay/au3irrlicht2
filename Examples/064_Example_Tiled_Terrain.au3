; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by smashly
; ----------------------------------------------------------------------------
; Example 64 : Tiled Terrain
; This example creates a tiled terrain these are vast terrain objects that are
; generated from tiles that are moved around out of sight of the viewer.
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
Global $aTerrain[4]
Global $aZone[16]
Global $tStructureMap
Global $hTerrainTexture0
Global $hTerrainTexture1
Global $hHeightMap
Global $hColorMap
Global $iTileSize = 128
Global $iIndex
Global $hCamera

; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart($IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
		$IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON)

; send the window caption
_IrrSetWindowCaption("Example 64: Tiled Terrain")

; Load the terrain textures and image.
$hTerrainTexture0 = _IrrGetTexture("../media/terrain-texture.jpg")
$hTerrainTexture1 = _IrrGetTexture("../media/detailmap3.jpg")
$hHeightMap = _IrrGetImage("../media/terrain-heightmap.bmp")

; Create four terrain tiles that are moved across the grid of zones
For $i = 0 To 3
	; here we create the terrain from a greyscale bitmap
	$aTerrain[$i] = _IrrAddTerrainTile($hHeightMap, $iTileSize, 0, 0)
	_IrrSetNodeScale($aTerrain[$i], 40.0, 0.5, 40.0)
	_IrrSetNodeMaterialTexture($aTerrain[$i], $hTerrainTexture0, 1)
	_IrrSetNodeMaterialTexture($aTerrain[$i], $hTerrainTexture1, 0)
	_IrrScaleTileTexture($aTerrain[$i], 64.0, 1.0)
	_IrrSetNodeMaterialFlag($aTerrain[$i], $IRR_EMF_LIGHTING, $IRR_OFF)
	_IrrSetNodeMaterialType($aTerrain[$i], $IRR_EMT_DETAIL_MAP)
	_IrrSetNodeMaterialFlag($aTerrain[$i], $IRR_EMF_FOG_ENABLE, $IRR_ON)
Next

; a terrain is a huge object, even a small 128 x 128 terrain has over 16,000
; faces to reduce this number a terrain displays less detail in the distance by
; skipping over points. when arranging terrains edge to edge to form a larger
; sheet you have to attach these terrains at the edges so that they can match
; the number of points they skip with their neighbour otherwise cracks will
; become visible at the seam between the terrains
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

; the terrain is to be arranged as depicted in the diagram below, a grid of
; 16 zones is created and one of the four terrain objects is assigned to each
; of the zones in a tiled pattern. as the camera moves into the range of one of
; the zones it takes the terrain it has been assigned from the zone that
; is using it, moves it into its own position and loads it with the terrain
; details it has been assigned
;|---|---|---|---|
;| 2 | 3 | 2 | 3 |
;|---|---|---|---|
;| 0 | 1 | 0 | 1 |
;|---|---|---|---|
;| 2 | 3 | 2 | 3 |
;|---|---|---|---|
;| 0 | 1 | 0 | 1 |
;|---|---|---|---|
; this zone grid can be extended out to form vast terrains that still only use 4 terrain objects.

; Create a DllStruct to pass a string to the path of the StructureMap used by _IrrSetZoneManagerAttachTerrain
$tStructureMap = DllStructCreate("char[" & StringLen("../media/simpletile.tga") & "]")
DllStructSetData($tStructureMap, 1, "../media/simpletile.tga")

; Add the terrain to to the terrain zone manager.
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

; now we need to add the fog to the scene. the first three parameters are the
; fog color, we set this to the same color as our sky so the scene fogs out
; nicely into nothing, the next parameter specifies whether you want the fog
; to increase in a linear mannar or exponentially - exponential fog usually
; looks more atmospheric while linear looks more like a dense sea fog, the next
; two parameters specify the distance at which the fog starts and the distance
; at which the fog reaches its maximum density and finally the fog density -
; this is only used with exponential fog and determines how quickly the
; exponential change takes place
_IrrSetFog(240, 255, 255, $IRR_EXPONENTIAL_FOG, 0.0, 2240.0, 0.0015)


; we add a first person perspective camera to the scene so you can look about
$hCamera = _IrrAddFPSCamera()
_IrrSetNodePosition($hCamera, 2500.0, 100.0, 2500.0)

; the clipping distance of a camera is a distance beyond which no triangles are
; rendered, this speeds the scene up by not showing geometry that is in the
; distance and too small to see however our terrain is so huge we need to
; extend this distance out
_IrrSetCameraClipDistance($hCamera, 12000)

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
While _IrrRunning()
	; begin the scene, erasing the canvas with sky-blue before rendering
	_IrrBeginScene(240, 255, 255)

	; draw the scene
	_IrrDrawScene()

	; end drawing the scene and render it
	_IrrEndScene()
WEnd

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()