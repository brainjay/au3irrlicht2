#include "au3Irrlicht2.au3"

Global $hNode, $hLight, $i = 0.0, $e

_IrrStart()

$hNode = _IrrAddCubeSceneNode(10)
_IrrSetNodePosition($hNode, -20, 0, 0)
$hNode = _IrrAddCubeSceneNode(10)
_IrrSetNodePosition($hNode, 0, 0, -20)
_IrrAddCubeSceneNode(10)
_IrrAddCamera(10, 10, 10, 0, 0, 0)

$hLight = _IrrAddLight($IRR_NO_PARENT, 50.0, 50.0, 50.0, 1.0, 1.0, 1.0, $i)

While _IrrRunning() And Sleep(10)
	If $i <= 0 Then
		$e = "$i + 1.0"
	ElseIf $i >= 150.0 Then
		$e = "$i - 1.0"
	EndIf
	$i = Execute($e)
	_IrrBeginScene(0, 0, 0)

	_IrrSetLightRadius($hLight, $i)

	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()