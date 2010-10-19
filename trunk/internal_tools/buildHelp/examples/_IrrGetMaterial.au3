#include "au3Irrlicht2.au3"

Global $hNode, $hTexture

_IrrStart()

$hNode = _IrrAddSphereSceneNode(10, 32)
$hTexture = _IrrGetTexture("./media/water.png")
_IrrSetNodeMaterialTexture($hNode, $hTexture, 0)
_IrrSetNodeMaterialFlag($hNode, $IRR_EMF_LIGHTING, $IRR_ON)

_IrrMaterialSetAmbientColor(_IrrGetMaterial($hNode, 0), 255, 0, 255, 0)

_IrrSetAmbientLight(1, 1, 1)
_IrrAddCamera(0, 0, -20, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(100, 100, 100)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()