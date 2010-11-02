#include "au3Irrlicht2.au3"

Global $hNode, $i = -1, $e

_IrrStart()

$hNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture($hNode, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrAddLight($IRR_NO_PARENT, 0, 200, 0, 0.3, 0.3, 0.4, 250.0)
_IrrAddCamera(10, 10, 10, 0, 0, 0)

While _IrrRunning() And Sleep(50)
	If $i <= -1 Then
		$e = "$i + 0.1"
	ElseIf $i >= 1 Then
		$e = "$i - 0.1"
	EndIf
	$i = Execute($e)

	_IrrMaterialSetShininess( _IrrGetMaterial($hNode, 0), $i)

	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()