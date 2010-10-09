; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 47: Animation with 2D Images
; This example draws a sequence of 2D images to the screen generating an
; animation
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
; This wrapper uses a series of types to bring type errors to your attention
; when passing variables into the wrapper
DIM $AnimationStrip ; irr_texture
DIM $screen_width ; integer
DIM $screen_height ; integer
DIM $frame = 0
DIM $framesync = 0

global const $LAST_FRAME = 4

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface. The scene will be rendered using the Irrlicht,
; software renderer, the display will be a window 400 x 200 pixels in size, the
; display will not support shadows and we will not capture any keyboard and
; mouse events
$screen_width = 400
$screen_height = 200
_IrrStart( $IRR_EDT_OPENGL, $screen_width, $screen_height, $IRR_BITS_PER_PIXEL_32, _
          $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; Set the title of the display
_IrrSetWindowCaption( "Example 47: 2D Animation" )

; load bitmap images of important Open Source tools used in this development
; and store them in irrlicht texture objects
$AnimationStrip = _IrrGetTexture( "../media/strip.tga" )

; make a note of the time
$framesync = TimerInit()

; while the scene is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas to Yellow before rendering
    _IrrBeginScene( 255,255,0 )

    ; first supply the texture, then the destination co-ordinates, then the
    ; co-ordinates of the rectangular area to copy and finally a flag to
    ; specify whether to use the alpha channel for transparency
    _IrrDraw2DImageElement( $AnimationStrip, _
                           ($screen_width - 32) / 2, ($screen_height - 32) / 2, _
                           $frame * 64, 0, ( $frame + 1 ) * 64 - 1, 63, _
                           $IRR_USE_ALPHA )

    ; check to see if 0.1 seconds have advanced since we recorded the time
    if TimerDiff($framesync) > 100 then
        ; record the new time
        $framesync = TimerInit()
        ; advance to the next frame
        $frame += 1
        ; if we have passed the last frame rewind to the begining
        if $frame >= $LAST_FRAME then $frame = 0
    endif

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
