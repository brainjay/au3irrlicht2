#include "au3Irrlicht2.au3"

Global $hNode, $hLight

_IrrStart()

$hNode = _IrrAddCubeSceneNode(10)
$hLight = _IrrAddLight($IRR_NO_PARENT, 50.0, 50.0, 50.0, 1.0, 1.0, 1.0, 100.0)
_IrrAddCamera(10, 10, 10, 0, 0, 0)

While _IrrRunning() And Sleep(500)
	_IrrBeginScene(0, 0, 0)

	_IrrSetLightAmbientColor($hLight, Random(0, 1), Random(0, 1), Random(0, 1))

	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()