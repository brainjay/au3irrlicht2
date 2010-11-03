#include "au3Irrlicht2.au3"

Global $hMesh, $hNode

_IrrStart()

$hMesh = _IrrAddSphereSceneMesh("Shere Mesh 1", 8, 32)

_IrrSetMeshVertexSingleColor($hMesh, _IrrMakeARGB(255, 0, 0, 255))

$hNode = _IrrAddMeshToScene($hMesh)
_IrrSetNodeMaterialFlag($hNode, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrAddCamera(0, 20, 0, 0, 0, 0)

While _IrrRunning()
	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()