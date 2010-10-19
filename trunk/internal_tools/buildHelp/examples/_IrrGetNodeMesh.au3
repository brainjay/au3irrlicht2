#include "au3Irrlicht2.au3"

Global $hNode

_IrrStart()

$hNode = _IrrAddMeshToScene(_IrrGetMesh("./media/column.obj"))
_IrrSetNodePosition($hNode, -10, 0, -20)

_IrrAddMeshToScene(_IrrGetNodeMesh($hNode))

_IrrAddCamera(0, 0, -50, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(255, 255, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()