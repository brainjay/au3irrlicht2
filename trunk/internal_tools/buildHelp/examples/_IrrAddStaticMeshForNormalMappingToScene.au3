#include "au3Irrlicht2.au3"

Global $hMesh, $hNode, $hTexture1, $hTexture2

_IrrStart()

$hMesh = _IrrAddSphereSceneMesh("Sphere Mesh 1", 10, 32)

$hNode = _IrrAddStaticMeshForNormalMappingToScene($hMesh)

_IrrSetNodeMaterialType($hNode, $IRR_EMT_PARALLAX_MAP_SOLID)
$hTexture1 = _IrrGetTexture("./media/earth.jpg")
_IrrSetNodeMaterialTexture($hNode, $hTexture1, 0)
$hTexture2 = _IrrGetTexture("./media/earthbump.bmp")
_IrrMakeNormalMapTexture($hTexture2, 15)
_IrrSetNodeMaterialTexture($hNode, $hTexture2, 1)
_IrrMaterialSetSpecularColor(_IrrGetMaterial($hNode, 0), 0, 0, 0, 0)
_IrrMaterialSetMaterialTypeParam(_IrrGetMaterial($hNode, 0), 0.025)
_IrrAddRotationAnimator($hNode, 0, 0.1, 0)
_IrrAddLight($IRR_NO_PARENT, -5, 5, 45, 1, 1, 1, 1000.0)
_IrrAddCamera(0, 0, 25, 0, 0, 0)

While _IrrRunning()
	_IrrBeginScene(0, 0, 200)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()