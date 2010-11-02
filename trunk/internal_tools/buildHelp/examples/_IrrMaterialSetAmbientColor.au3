#include "au3Irrlicht2.au3"

Global $hNode, $hMaterial

_IrrStart()

$hNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture($hNode, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
$hMaterial = _IrrGetMaterial($hNode, 0)
_IrrSetAmbientLight(1, 1, 1)
_IrrAddCamera(10, 10, 10, 0, 0, 0)

While _IrrRunning() And Sleep(300)

	_IrrMaterialSetAmbientColor($hMaterial, Random(0, 255, 1), Random(0, 255, 1), Random(0, 255, 1), Random(0, 255, 1))

	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()