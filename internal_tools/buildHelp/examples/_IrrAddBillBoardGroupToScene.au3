#include "au3Irrlicht2.au3"

Global $hBillboardGroup
Global $hBillboardTexture
Global $aBillboard[6]
Global $hCamera

_IrrStart()

$hBillboardGroup = _IrrAddBillBoardGroupToScene()
For $i = 1 To 5
	$aBillboard[$i] = _IrrAddBillBoardToGroup($hBillboardGroup, 150, 100, -450 + ($i * 150), 0, 400, 0, 255, 255, 255, 255)
Next
$hBillboardTexture = _IrrGetTexture("./media/au3irr2_logo.jpg")
_IrrSetNodeMaterialTexture($hBillboardGroup, $hBillboardTexture, 0)
_IrrSetNodeMaterialFlag($hBillboardGroup, $IRR_EMF_LIGHTING, $IRR_OFF)

$hCamera = _IrrAddFPSCamera($IRR_NO_OBJECT, 100.0, 0.1)
_IrrSetCameraClipDistance($hCamera, 128000)

_IrrHideMouse()

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(0, 0, 255)
	_IrrDrawScene()
	_IrrEndScene()
WEnd