#include "au3Irrlicht2.au3"

Global $hNode, $aScale

_IrrStart()

$hNode = _IrrAddTestSceneNode()

$aScale = _IrrGetNodeScale($hNode)
_IrrSetWindowCaption("Scale of Node X:" & $aScale[0] & " Y:" & $aScale[1] & " Z:" & $aScale[2])

_IrrAddCamera(0, 0, -40, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(100, 100, 100)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()