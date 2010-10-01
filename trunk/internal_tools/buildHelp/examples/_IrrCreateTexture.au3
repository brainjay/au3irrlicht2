#include "au3Irrlicht2.au3"

Global $hTexture

_IrrStart()

$hTexture = _IrrCreateTexture("MyTexture", 128, 128, $ECF_A8R8G8B8)

While _IrrRunning()

	_IrrBeginScene(255, 255, 0)
	_IrrDraw2DImage($hTexture, 0, 0)
	_IrrEndScene()

WEnd

_IrrStop()


