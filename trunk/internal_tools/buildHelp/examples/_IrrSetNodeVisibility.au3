#include "au3Irrlicht2.au3"

Global $hNode, $Timer, $iState

_IrrStart()

$hNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialFlag($hNode, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrAddCamera(0, 0, -40, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	If TimerDiff($Timer) > 1000 Then
		$Timer = TimerInit()
		If $iState Then
			$iState = 0
		Else
			$iState = 1
		EndIf

		_IrrSetNodeVisibility($hNode, $iState)

	EndIf
	_IrrBeginScene(100, 100, 100)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()