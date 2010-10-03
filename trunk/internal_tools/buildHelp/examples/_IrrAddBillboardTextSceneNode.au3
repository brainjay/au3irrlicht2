#include "au3Irrlicht2.au3"

_IrrStart()

local $font = _IrrGetFont( "./media/fonthaettenschweiler.bmp" )

_IrrAddBillboardTextSceneNode( $font, "au3Irrlicht2 ...", 30.0, 15.0, 0.0, 0.0, 20.0, 0, _
								_IrrMakeARGB(0, 255, 0, 0), _IrrMakeARGB(0, 255, 255, 0) )
_IrrAddBillboardTextSceneNode( $font, "... what else?", 30.0, 15.0, 0.0, -5.0, 17.0, 0, _
								_IrrMakeARGB(0, 255, 255, 0), _IrrMakeARGB(0, 0, 255, 0) )

_IrrAddFPSCamera()

WHILE _IrrRunning()
	_IrrBeginScene(0,0,25)
	_IrrDrawScene()
	_IrrEndScene()
WEND

_IrrStop()
