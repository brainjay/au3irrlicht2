#include "au3Irrlicht2.au3"

Global $hTextureDest, $hTextureSrc

_IrrStart()

$hTextureDest = _IrrGetTexture("./media/Diagonal.bmp")
$hTextureSrc = _IrrGetTexture("./media/cross.bmp")

_IrrBlendTextures($hTextureDest, $hTextureSrc, 0, 0, $BLEND_MULTIPLY)

While _IrrRunning() And Sleep(10)

    _IrrBeginScene(50, 50, 50)
    _IrrDraw2DImage($hTextureDest, 0, 0)
    _IrrEndScene()

WEnd

_IrrStop()
