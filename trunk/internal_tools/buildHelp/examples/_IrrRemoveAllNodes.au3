#include "au3Irrlicht2.au3"

Global $hNode, $iFlag, $Timer = TimerInit()

_IrrStart()

For $i = 0 To 4
	$hNode = _IrrAddTestSceneNode()
	_IrrSetNodePosition($hNode, -40 + ($i * 20), 0, 0)
	_IrrSetNodeID($hNode, $i + 1)
Next
_IrrAddCamera(0, 0, 60, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	If TimerDiff($Timer) > 2500 And Not $iFlag Then
		$iFlag = 1
		_IrrRemoveAllNodes()
	EndIf
	_IrrBeginScene(240, 240, 100)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()

