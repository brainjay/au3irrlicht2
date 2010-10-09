; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by linus
; ----------------------------------------------------------------------------
; Example 02: 2D Images
; This example uses a range of 2D image drawing operations to draw graphics
; on the display
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
DIM $IrrlichtLogo ; irr_texture
DIM $FreeBasicLogo ; irr_texture
DIM $FBIDELogo ; irr_texture
DIM $CodeBlocksLogo ; irr_texture
DIM $WrapperLogo ; irr_texture
DIM $screen_width ; integer
DIM $screen_height ; integer

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
_IrrSetWindowCaption( "Example 02: 2D Images" )

; load bitmap images of important Open Source tools used in this development
; and store them in irrlicht texture objects
$IrrlichtLogo = _IrrGetTexture( "../media/IrrlichtLogo.bmp" )
$FreeBasicLogo = _IrrGetTexture( "../media/FreeBasicLogo.bmp" )
$FBIDELogo = _IrrGetTexture( "../media/FBIDELogo.bmp" )
$CodeBlocksLogo = _IrrGetTexture( "../media/CodeBlocksLogo.bmp" )
$WrapperLogo = _IrrGetTexture( "../media/wrapperby.tga" )

; create a mask for the FreeBasic logo that makes the white areas of the
; logo transparent
_IrrColorKeyTexture( $FreeBasicLogo, 255, 255, 255 )

; while the scene is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas to Yellow before rendering
    _IrrBeginScene( 255,255,0 )

    ; the basic 2D drawing operation copies the whole texture to the screen
    ; at the specified co-ordinates
    _IrrDraw2DImage( $IrrlichtLogo, 4, 4 )

    ; a more flexible method for drawing to the screen this copies a rectangular
    ; area of the texture to the screen and can use a color keyed mask or an
    ; alpha channel in the image to make parts of the image transparent.
    ; first supply the texture, then the destination co-ordinates, then the
    ; co-ordinates of the rectangular area to copy and finally a flag to
    ; specify whether to use the alpha channel for transparency
    _IrrDraw2DImageElement( $FreeBasicLogo, _
                           $screen_width - 60 - 4, 4, _
                           0,0,60,31, $IRR_USE_ALPHA )
    _IrrDraw2DImageElement( $FBIDELogo, _
                           4, $screen_height - 32 - 4, _
                           0,0,128,32, $IRR_IGNORE_ALPHA )
    _IrrDraw2DImageElement( $WrapperLogo, _
                           ( $screen_width - 110 ) / 2, $screen_height - 32 - 4, _
                           0,0,100,32, $IRR_USE_ALPHA )
    _IrrDraw2DImageElement( $CodeBlocksLogo, _
                           $screen_width - 110 - 4, $screen_height - 32 - 4, _
                           0,0,110,32, $IRR_IGNORE_ALPHA )

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
