#include "au3Irrlicht2.au3"

Global $hNode, $Timer

_IrrStart()

$hNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture($hNode, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetAmbientLight(0.2, 0.2, 0.2)
_IrrAddCamera(10,10,10, 0,0,0 )

While _IrrRunning() And Sleep(10)
	If TimerDiff($Timer) > 500 Then

	    _IrrSetNodeEmissiveColor($hNode, _IrrMakeARGB(Random(0, 255, 1), Random(0, 255, 1), Random(0, 255, 1), Random(0, 255, 1)))

		$Timer = TimerInit()
	EndIf
    _IrrBeginScene(0, 0, 0)
    _IrrDrawScene()
    _IrrEndScene()
WEnd

_IrrStop()