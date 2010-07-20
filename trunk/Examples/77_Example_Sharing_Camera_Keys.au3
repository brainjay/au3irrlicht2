; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 77 : Sharing Camera Keys
; This example describes capturing keys but sharing them with a camera object
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "au3Irrlicht2.au3"
opt("MustDeclareVars", True)

; !!! ESCAPE is not handled with au3 function but with irrlicht functions
; inside the main loop! !!!

; HotKeySet("{ESC}", "_exit")

;Func _exit()
;	_IrrStop()
;	Exit
;EndFunc ; _exit

; ////////////////////////////////////////////////////////////////////////////
; global variables

; irrlicht objects
DIM $MeshTexture ; irr_texture
DIM $TestNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $pKeyEvent ; $IRR_KEY_EVENT PTR
DIM $pMouseEvent ; $IRR_MOUSE_EVENT PTR


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 512, 512, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 77: Sharing Camera Keys" )

; load the test cube texture
$MeshTexture = _IrrGetTexture( "./media/texture.jpg" )

; create a test nodes
$TestNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; add a camera into the scene and move it into position
$OurCamera = _IrrAddFPSCamera()
_IrrSetNodePosition( $OurCamera, 0, 10, -20 )
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
DIM $quitApp = $IRR_OFF
WHILE _IrrRunning() AND $quitApp = $IRR_OFF
    ; begin the scene, erasing the canvas with grey before rendering
    _IrrBeginScene( 128,128,128 )

    ; while there are key events waiting to be processed
    while _IrrKeyEventAvailable()
        ; read the key event out.
        $pKeyEvent = _IrrReadKeyEvent()

        ; arbitrate based on the key that was pressed
        if __getKeyEvt($pKeyEvent, $EVT_KEY_IKEY) = $KEY_ESCAPE then
            $quitApp = $IRR_ON
        endif
    wend

    ; while there are mouse events waiting
    while _IrrMouseEventAvailable()
        ; read the mouse event out
        $pMouseEvent = _IrrReadMouseEvent()
    wend

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
