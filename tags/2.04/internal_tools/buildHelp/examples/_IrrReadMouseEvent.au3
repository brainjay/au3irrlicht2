#include "au3Irrlicht2.au3"

local $pMouseEvent

; enable event capturing:
_IrrStart($IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
			$IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_CAPTURE_EVENTS)

WHILE _IrrRunning()
	_IrrBeginScene(0, 0, 25)

		; process all available mouse events:
        while _IrrMouseEventAvailable()
            $pMouseEvent = _IrrReadMouseEvent()

			; check for mousewheel event, report up or down movement inside this window title:
            if __getMouseEvt($pMouseEvent, $EVT_MOUSE_IACTION) = $IRR_EMIE_MOUSE_WHEEL then
				if __getMouseEvt($pMouseEvent, $EVT_MOUSE_FDELTA) > 0 Then
					_IrrSetWindowCaption("Mousewheel up")
				Else
					_IrrSetWindowCaption("Mousewheel down")
				EndIf
            endif
        wend

	_IrrEndScene()
WEND

