#include "au3Irrlicht2.au3"

Global $hCloudNode, $hCloudTexture

_IrrStart()

$hCloudTexture = _IrrGetTexture("./media/cloud4.png")
$hCloudNode = _IrrAddClouds($hCloudTexture, 10, 1, 200)
_IrrSetNodePosition($hCloudNode, 0, 200, 0)

_IrrAddCamera(50, 0, 0, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(128, 128, 255)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()