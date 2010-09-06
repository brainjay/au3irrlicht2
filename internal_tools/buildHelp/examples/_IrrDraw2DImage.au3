#include "au3Irrlicht2.au3"

_IrrStart()

local $logo = _IrrGetTexture("./media/cross.bmp")

WHILE _IrrRunning()
    _IrrBeginScene(50, 0, 0)
    _IrrDraw2DImage( $logo, 0, 0 )
    _IrrEndScene()
WEND

_IrrStop()
