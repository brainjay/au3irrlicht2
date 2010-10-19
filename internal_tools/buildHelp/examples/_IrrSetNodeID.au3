#include "au3Irrlicht2.au3"

Global $hNode, $hCamera, $hSelected

_IrrStart()

For $i = 0 To 4
	$hNode = _IrrAddTestSceneNode()
	_IrrSetNodePosition($hNode, -40 + ($i * 20), 0, 0)
	_IrrSetNodeID($hNode, $i + 1)
Next
$hCamera = _IrrAddFPSCamera()
_IrrSetNodePosition($hCamera, 0, 0, -70)

While _IrrRunning() And Sleep(10)
	$hSelected = _IrrGetCollisionNodeFromCamera($hCamera)
	_IrrSetWindowCaption("Selected Node ID: " & _IrrGetNodeID($hSelected))
	_IrrBeginScene(200, 200, 100)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()