#include "au3Irrlicht2.au3"

_IrrStart()

local $camera = _IrrAddCamera(2,2,2, 0,0,0 )

local $time = TimerInit()
WHILE _IrrRunning()

	if int(mod( (TimerDiff($time) / 1000), 2 )) = true Then
		_IrrHideMouse()
	Else
		_IrrShowMouse()
	EndIf

    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
