#include "au3Irrlicht2.au3"

local $pKeyEvent

; enable event capturing:
_IrrStart($IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
			$IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_CAPTURE_EVENTS)

WHILE _IrrRunning()
	_IrrBeginScene(0, 0, 25)

		; process all available key events and check for ESC:
       while _IrrKeyEventAvailable()
            $pKeyEvent = _IrrReadKeyEvent()
			if __getKeyEvt($pKeyEvent, $EVT_KEY_IKEY) = $KEY_ESCAPE then _IrrStop()
		WEnd

	_IrrEndScene()
WEND

