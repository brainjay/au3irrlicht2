#include "au3Irrlicht2.au3"

Global $hNode, $hSelected, $hCamera

_IrrStart()

$hNode = _IrrAddTestSceneNode()
_IrrSetNodePosition($hNode, -10, 0, 0)
_IrrSetNodeName($hNode, "Test Node 1")

$hNode = _IrrAddTestSceneNode()
_IrrSetNodePosition($hNode, 10, 0, 0)
_IrrSetNodeName($hNode, "Test Node 2")

$hCamera = _IrrAddFPSCamera($IRR_NO_OBJECT, 100, 0.5)
_IrrSetNodePosition($hCamera, 0, 0, -50)

While _IrrRunning() And Sleep(10)
	$hSelected = _IrrGetCollisionNodeFromCamera($hCamera)

	_IrrSetWindowCaption("Name of selected node: " & _IrrGetNodeName($hSelected))

	_IrrBeginScene(255, 255, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()