#include "au3Irrlicht2.au3"

_IrrStart()

local $i
local $nodeCamera = _IrrAddFPSCamera()
_IrrSetCameraTarget($nodeCamera, 50, 0, 50)

WHILE _IrrRunning()
	_IrrBeginScene(0, 0, 50)

	; draw a grid to sreen before drawing the scene:
	for $i = 0 to 250 step 25
			_IrrDraw3DLine($i, -25, 0, $i, -25, 250, 255, 255, 0)
			_IrrDraw3DLine(0, -25, $i, 250, -25, $i, 255, 255, 0)
	next ; $i

	_IrrDrawScene()
	_IrrEndScene()
WEND

_IrrStop()
