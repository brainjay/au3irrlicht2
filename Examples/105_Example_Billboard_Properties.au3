; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 105: Billboard Propertuies
; This example demonstrates the modification of Billboard properties to a
; billboard that has been created in a scene
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "..\au3Irrlicht2.au3"
opt("MustDeclareVars", True)
HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit


; ////////////////////////////////////////////////////////////////////////////
; global variables

; irrlicht objects
DIM $Billboard ; irr_node
DIM $BillboardTexture ; irr_texture
DIM $Camera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 105: Billboard Properties" )

; load the texture resource for the billboard
$BillboardTexture = _IrrGetTexture( "../media/freebasiclogo_big.jpg" )

; add the billboard to the scene, the first two parameters are the size of the
; billboard in this instance they match the pixel size of the bitmap to give
; the correct aspect ratio. the last three parameters are the position of the
; billboard object
$Billboard = _IrrAddBillBoardToScene( 200.0,102, 0.0,0.0,100.0 )

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialTexture( $Billboard, $BillboardTexture, 0 )

; rather than have the billboard lit by light sources in the scene we can
; switch off lighting effects on the model and have it render ; if it were
; self illuminating
_IrrSetNodeMaterialFlag( $Billboard, $IRR_EMF_LIGHTING, $IRR_OFF )

; add a first person perspective camera into the scene so we can move around
; the billboard and see how it reacts
$Camera = _IrrAddFPSCamera()

; hide the mouse pointer
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
Dim $BillboardWidth = 200
Dim $timerDiff, $timer = TimerInit()
WHILE _IrrRunning()
;#ifndef RUN_FLAT_OUT
    ; is it time for another frame
    $timerDiff = TimerDiff($timer)
    if $timerDiff > 16.7 then
        ; record the start time of this frame
        $timer = TimerInit()

        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 240, 255, 255 )

        ; draw the scene
        _IrrDrawScene()

        ; Change billboard properties
        ; the first parameter is the billboard node
        ; the second parameter is the RGBA color of the top of the billboard
        ; the third parameter is the RGBA color of the bottom of the billboard
        _IrrSetBillBoardColor( $Billboard, _
                _IrrMakeARGB( 255, 255, 0, 0 ), _
                _IrrMakeARGB( 255, $BillboardWidth, $BillboardWidth, 255 ))

        ; change the size of the billboard
        _IrrSetBillBoardSize( $Billboard, $BillboardWidth, 100.0 )

        ; animate the width property
        if $BillboardWidth > 1.0 Then $BillboardWidth -= 0.2

        ; end drawing the scene and render it
        _IrrEndScene()
    EndIf
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
