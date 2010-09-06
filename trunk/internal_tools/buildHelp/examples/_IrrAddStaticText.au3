#include "au3Irrlicht2.au3"

_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON )

_IrrAddStaticText( "Hello AU3-World ;-)", 8, 8, 200, 20, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP)

WHILE _IrrRunning()
	_IrrBeginScene(0, 0, 0)
	_IrrDrawGUI()
	_IrrEndScene()
WEND

_IrrStop()
