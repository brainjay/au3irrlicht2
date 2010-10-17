#include "au3Irrlicht2.au3"

Global $hNode, $hCamera, $hSelected

_IrrStart()

$hNode = _IrrAddTestSceneNode()
_IrrAddFlyStraightAnimator($hNode, 0, -50, 0, 0, 50, 0, 3000, $IRR_LOOP)
$hCamera = _IrrAddCamera(50, 0, 0, 0, 0, 0)

While _IrrRunning()
	$hSelected = _IrrGetCollisionNodeFromCamera($hCamera)
	_IrrSetWindowCaption('Camera is colliding with node: ' & ($hSelected = $hNode))
	If $hSelected = $hNode Then
		_IrrSetAmbientLight(1, 0, 0)
	Else
		_IrrSetAmbientLight(0, 0, 0)
	EndIf
	_IrrBeginScene(255, 255, 100)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()