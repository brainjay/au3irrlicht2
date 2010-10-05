#include "au3Irrlicht2.au3"

Global $hSrcImage, $hDesTexture
Global $pSrcPixels, $pDesPixels
Global $tSrcPixels, $tDesPixels
Global $iWidthHeight = 256
Global $iPixelsAmount = $iWidthHeight * $iWidthHeight

_IrrStart()

$hSrcImage = _IrrGetImage("./media/splatter.tga")
$hDesTexture = _IrrCreateTexture("Desination", $iWidthHeight, $iWidthHeight, $ECF_A8R8G8B8)

$pSrcPixels = _IrrLockImage($hSrcImage)
$pDesPixels = _IrrLockTexture($hDesTexture)

$tSrcPixels = DllStructCreate("uint[" & $iPixelsAmount & "]", $pSrcPixels)
$tDesPixels = DllStructCreate("uint[" & $iPixelsAmount & "]", $pDesPixels)
For $i = 1 To $iPixelsAmount
	DllStructSetData($tDesPixels, 1, DllStructGetData($tSrcPixels, 1, $i), $i)
	$pDesPixels += 1
	$pSrcPixels += 1
Next

_IrrUnlockImage($hSrcImage)
_IrrUnlockTexture($hDesTexture)

$tSrcPixels = 0
$tDesPixels = 0

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(255, 255, 0)
	_IrrDraw2DImage($hDesTexture, 0, 0)
	_IrrEndScene()
WEnd

_IrrStop()