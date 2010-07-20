; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 48: Animated Billboards
; This example demonstrates animated billboards. The texture on the billboard
; is changed each frame to generate an animated surface.
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

global const $LAST_FRAME = 4

; irrlicht objects
DIM $Billboard ; irr_node
DIM $BillboardTexture[$LAST_FRAME] ; irr_texture
DIM $Camera ; irr_camera
DIM $xpos = 0.0
DIM $frame = 50
DIM $framesync = 0
; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 48: Animated Billboards" )

; load the texture resource for the billboard
$BillboardTexture[0] = _IrrGetTexture( "./media/1.tga" )
$BillboardTexture[1] = _IrrGetTexture( "./media/2.tga" )
$BillboardTexture[2] = _IrrGetTexture( "./media/3.tga" )
$BillboardTexture[3] = _IrrGetTexture( "./media/4.tga" )

; add the billboard to the scene, the first two parameters are the size of the
; billboard in this instance they match the pixel size of the bitmap to give
; the correct aspect ratio. the last three parameters are the position of the
; billboard object
$Billboard = _IrrAddBillBoardToScene( 10.0, 10.0,  0.0, 0.0, 0.0 )

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialTexture( $Billboard, $BillboardTexture[0], 0 )

; rather than have the billboard lit by light sources in the scene we can
; switch off lighting effects on the model and have it render ; if it were
; self illuminating
_IrrSetNodeMaterialFlag( $Billboard, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType ( $Billboard, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL )

; add a first person perspective camera into the scene so we can move around
; the billboard and see how it reacts
$Camera = _IrrAddCamera( 100,0,0, 0,0,0 )

; hide the mouse pointer
_IrrHideMouse()

; make a note of the time
$framesync = TimerInit()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 255, 255, 0 )

    ; move the billboard towards the camera by 0.01 units
    _IrrSetNodePosition( $Billboard, $xpos * 2, 0.0, 0.0 )
    $xpos += 0.01

    ; check to see if 0.1 seconds have advanced since we recorded the time
    if TimerDiff($framesync) > 100 then
        ; record the new time
        $framesync = TimerInit()
        ; advance to the next frame
        $frame += 1
        ; if we have passed the last frame rewind to the begining
        if $frame > $LAST_FRAME then $frame = 1

        ; change the texture used for the billboard
        _IrrSetNodeMaterialTexture( $Billboard, $BillboardTexture[$frame - 1], 0 )
    endif

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
