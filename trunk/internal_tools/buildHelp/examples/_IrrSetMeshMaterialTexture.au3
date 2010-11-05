#include "au3Irrlicht2.au3"

Global $hMesh, $hTexture1, $hTexture2, $hNode

_IrrStart()

$hMesh = _IrrAddSphereSceneMesh("Shere Mesh 1", 8, 32)
$hTexture1 = _IrrGetTexture("./media/earth.jpg")
$hTexture2 = _IrrGetTexture("./media/earthbump.bmp")
_IrrMakeNormalMapTexture($hTexture2, 15)

_IrrSetMeshMaterialTexture($hMesh, $hTexture1, 0)
_IrrSetMeshMaterialTexture($hMesh, $hTexture2, 1)

$hNode = _IrrAddStaticMeshForNormalMappingToScene($hMesh)
_IrrSetNodeMaterialType($hNode, $IRR_EMT_NORMAL_MAP_SOLID)
_IrrAddRotationAnimator($hNode, 0, 0.1, 0)
_IrrAddLight($IRR_NO_PARENT, -5, 5, 45, 1, 1, 1, 100)
_IrrAddCamera(0, 0, 20, 0, 0, 0)

While _IrrRunning()
	_IrrBeginScene(0, 100, 200)
	_IrrDrawScene()
	_IrrEndScene()
WEnd