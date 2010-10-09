#include "au3Irrlicht2.au3"

_IrrStart()

_IrrAddSkyDomeToScene(_IrrGetTexture("./media/au3irr2_logo.jpg"), 16, 16, 1, 2)
local $nodeCamera = _IrrAddCamera( 0,0,5, 0,0,0 )
local $X, $Y, $camY

_IrrHideMouse()
WHILE _IrrRunning()
	_IrrBeginScene(0, 0, 25)

	; center mouse cursor
	$X = .5
	$Y = .5
	_IrrSetMousePosition($X, $Y)

	; add any mouse movement to the cam-Y position ...
	$camY += (0.5 - $Y)

	; ... and reset it slowly back to centre of the display:
	if $camY > 0 then $camY -= 0.005
	if $camY < 0 then $camY += 0.005
	_IrrSetCameraTarget($nodeCamera, 0, $camY, 0)

	_IrrDrawScene()
	_IrrEndScene()
WEND

_IrrStop()
