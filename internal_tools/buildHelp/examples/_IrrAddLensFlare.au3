#include "au3Irrlicht2.au3"

_IrrStart()

local $hFlare = _IrrAddLensFlare(_IrrGetTexture( "./media/flares.jpg" ))
_IrrSetNodePosition($hFlare, 300,100,1000 )

_IrrAddFPSCamera()
_IrrHideMouse()

While _IrrRunning()
    _IrrBeginScene( 180, 225, 255 )
    _IrrDrawScene()
    _IrrEndScene()
WEnd

_IrrStop()