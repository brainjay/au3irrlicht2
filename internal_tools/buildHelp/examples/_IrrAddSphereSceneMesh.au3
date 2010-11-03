#include "au3Irrlicht2.au3"

Global $hMesh, $hNode

_IrrStart()

$hMesh = _IrrAddSphereSceneMesh("Shere Mesh 1", 8, 32)

$hNode = _IrrAddMeshToScene($hMesh)
_IrrSetNodeMaterialTexture($hNode, _IrrGetTexture(".\media\earth.jpg"), 0)
_IrrSetNodeMaterialFlag($hNode, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrAddCamera(0, 20, 0, 0, 0, 0)

While _IrrRunning()
	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()