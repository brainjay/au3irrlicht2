#include "au3Irrlicht2.au3"

_IrrStart()

local $logo = _IrrGetTexture("./media/cross.bmp")
_IrrColorKeyTexture($logo, 255, 255, 255)

WHILE _IrrRunning()
    _IrrBeginScene(50, 0, 0)
    _IrrDraw2DImageElement( $logo, 0, 0 , 0, 0, 128, 64, $IRR_IGNORE_ALPHA)
    _IrrDraw2DImageElement( $logo, 0, 64, 0, 64, 128, 128, $IRR_USE_ALPHA)
    _IrrEndScene()
WEND

_IrrStop()
