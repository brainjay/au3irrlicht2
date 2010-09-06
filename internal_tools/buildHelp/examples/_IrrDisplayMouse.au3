#include "au3Irrlicht2.au3"

_IrrStart()

local $camera = _IrrAddCamera(0,0,0, 0,0,0 )

local $time = TimerInit()
WHILE _IrrRunning()

	_IrrDisplayMouse( int(mod( (TimerDiff($time) / 1000), 2 )) )

    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
