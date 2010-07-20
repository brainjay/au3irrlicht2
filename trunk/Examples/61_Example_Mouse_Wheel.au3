; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 61 : Processing events from the mouse wheel
; This example processes mouse wheel events and performs an action based on the
; events
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "au3Irrlicht2.au3"
opt("MustDeclareVars", True)
HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit

; ////////////////////////////////////////////////////////////////////////////
; global variables

; irrlicht objects
DIM $MeshTexture ; irr_texture
DIM $TestNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $MouseEvent ; $IRR_MOUSE_EVENT PTR
DIM $metrics ; wstring * 256
DIM $BitmapFont ; irr_font
DIM $mouseDelta ; single
DIM $scale = 1.0


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 61: Mouse Wheel Events" )

; load the test cube texture
$MeshTexture = _IrrGetTexture( "./media/texture.jpg" )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "./media/bitmapfont.bmp" )

; create a test nodes
$TestNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; add a camera into the scene and move it into position
$OurCamera = _IrrAddCamera( 0,0,-100, 0,0,0 )
_IrrHideMouse()
_IrrSetNodePosition( $OurCamera, 10, 10, -20 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with grey before rendering
    _IrrBeginScene( 128,128,128 )

    ; while there are mouse events waiting
    while _IrrMouseEventAvailable()
        ; read the mouse event out
        $MouseEvent = _IrrReadMouseEvent()
		__getMouseEvt($MouseEvent, $EVT_MOUSE_IACTION)
        ; if this is a mouse wheel event
        if __getMouseEvt($MouseEvent, $EVT_MOUSE_IACTION) = $IRR_EMIE_MOUSE_WHEEL then
			$mouseDelta = __getMouseEvt($MouseEvent, $EVT_MOUSE_FDELTA)

            if $mouseDelta > 0 then
                $scale += 0.01
				$metrics = "MOUSEWHEEL UP"
            else
                if $mouseDelta < 0 then
                    $scale -= 0.01
				$metrics = "MOUSEWHEEL DOWN"
                endif
            endif

            _IrrSetNodeScale( $TestNode, 1.0, $scale, 1.0 )

        endif
    wend

    ; draw the mouse co-ordinates information to the screen
    _Irr2DFontDraw ( $BitmapFont, $metrics, 4, 4, 250, 24 )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
