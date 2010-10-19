#include "au3Irrlicht2.au3"

Global $hMesh, $hCharaterNode, $hNode, $hJointNode, $hCamera

_IrrStart()

$hMesh = _IrrGetMesh("./media/dwarf.x")
$hCharaterNode = _IrrAddMeshToScene($hMesh)
_IrrSetNodeAnimationSpeed($hCharaterNode, 500)
$hNode = _IrrAddTestSceneNode()
_IrrSetNodePosition($hNode, 20, -15, -10)

$hJointNode = _IrrGetJointNode($hCharaterNode, "Joint16")
_IrrAddChildToParent($hNode, $hJointNode)

$hCamera = _IrrAddCamera(75, 40, -50, 0, 40, 0)
_IrrSetAmbientLight(1, 1, .2)

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(200, 200, 100)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()