#include "au3Irrlicht2.au3"

Global $hTexture
Global $iWidthHeight = 128
Global $iPixelsAmount = $iWidthHeight * $iWidthHeight
Global $pPixels, $tPixels
Global $iColor = 0xFFFF0000 ; Red

_IrrStart()

$hTexture = _IrrCreateTexture("Red", $iWidthHeight, $iWidthHeight, $ECF_A8R8G8B8)
$pPixels = _IrrLockTexture($hTexture)
$tPixels = DllStructCreate("uint[" & $iPixelsAmount & "]", $pPixels)
For $i = 1 To $iPixelsAmount
	DllStructSetData($tPixels, 1, $iColor, $i)
	$pPixels += 1
Next
_IrrUnlockTexture($hTexture)
$tPixels = 0

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(255, 255, 0)
	_IrrDraw2DImage($hTexture, 0, 0)
	_IrrEndScene()
WEnd

_IrrStop()