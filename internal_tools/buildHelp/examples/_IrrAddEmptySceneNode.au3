#include "au3Irrlicht2.au3"

Global $hSphereNode, $hMD2Node, $hEmptyNode

_IrrStart()

$hSphereNode = _IrrAddSphereSceneNode(8, 32)
_IrrSetNodeMaterialTexture($hSphereNode, _IrrGetTexture(".\media\skydome2.jpg"), 0)
_IrrSetNodeMaterialFlag($hSphereNode, $IRR_EMF_LIGHTING, $IRR_OFF)
$hMD2Node = _IrrAddMeshToScene(_IrrGetMesh(".\media\zumlin.md2"))
_IrrSetNodeMaterialTexture($hMD2Node, _IrrGetTexture(".\media\zumlin.pcx"), 0)
_IrrSetNodeScale($hMD2Node, 0.1, 0.1, 0.1)
_IrrSetNodePosition($hMD2Node, 11.2, 0, 0)
_IrrSetNodeRotation($hMD2Node, 0, 80, -72)
_IrrPlayNodeMD2Animation($hMD2Node, $IRR_EMAT_RUN)
_IrrSetNodeMaterialFlag($hMD2Node, $IRR_EMF_LIGHTING, $IRR_OFF)

$hEmptyNode = _IrrAddEmptySceneNode()
_IrrAddRotationAnimator($hEmptyNode, 0, 0.6, 0)
_IrrAddChildToParent($hMD2Node, $hEmptyNode)

_IrrAddCamera(0, 20, 0, 0, 0, 0)

While _IrrRunning()
	_IrrBeginScene(255, 255, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()