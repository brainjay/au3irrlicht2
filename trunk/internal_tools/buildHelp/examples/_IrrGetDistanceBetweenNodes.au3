#include "au3Irrlicht2.au3"

Global $hNodeA, $hNodeB

_IrrStart()

$hNodeA = _IrrAddTestSceneNode()
$hNodeB = _IrrAddTestSceneNode()
_IrrAddFlyStraightAnimator($hNodeB, 0, 0, -60, 0, 0, 60, 20000, $IRR_LOOP)
_IrrAddCamera(50, 0, 0, 0, 0, 0)


WHILE _IrrRunning()
    _IrrBeginScene(255, 255, 100)
    _IrrDrawScene()
    _IrrEndScene()
	_IrrSetWindowCaption('Distance between 2 nodes is: ' & _IrrGetDistanceBetweenNodes($hNodeA, $hNodeB))
WEND

_IrrStop()