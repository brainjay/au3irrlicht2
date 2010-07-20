; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 42: Managing Texture Resrouces
; This example demonstrates how texture resource can be managed. If many
; textures are loaded they should be deleted once no longer needed to ensure
; memory is not wasted.
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
; This wrapper uses a series of types to bring type errors to your attention
; when passing variables into the wrapper
DIM $IrrlichtLogo ; irr_texture
DIM $FreeBasicLogo ; irr_texture
DIM $NewIrrlichtLogo ; irr_texture
DIM $screen_width ; integer
DIM $screen_height ; integer
global const $SCRIPTTITLE = "Example 42: Managing texture resources"
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
_IrrSetWindowCaption( $SCRIPTTITLE )

; begin the scene, erasing the canvas with sky-blue before rendering
_IrrBeginScene( 0,0,0 )

; end drawing the scene and render it
_IrrEndScene()

; load a bitmap object temporarily
$IrrlichtLogo = _IrrGetTexture( "./media/irrlichtlogo.bmp" )
MsgBox( 0, $SCRIPTTITLE, "The address of the Irrlicht Logo is " & $IrrlichtLogo)

; remove the texture
_IrrRemoveTexture( $IrrlichtLogo )
MsgBox( 0, $SCRIPTTITLE, "The IrrlichtLogo has been removed")

; load a new texture
$FreeBasicLogo = _IrrGetTexture( "./media/freebasiclogo.bmp" )
MsgBox( 0, $SCRIPTTITLE, "The address of the FreeBasic Logo is " & $FreeBasicLogo)

; if the two images were in the same memory space notify the user
if  $IrrlichtLogo = $FreeBasicLogo then
	MsgBox( 0, $SCRIPTTITLE, "NOTICE: The address of the Irrlicht and FreeBasic logo's are the same" & @LF & _
		"this is because IrrlichtLogo was removed and the memory was reused for" & @LF & _
		"the FreeBasicLogo. If this was a large texture the saving could be huge")
endif

; reload the first image again
$NewIrrlichtLogo = _IrrGetTexture( "./media/irrlichtlogo.bmp" )
MsgBox( 0, $SCRIPTTITLE, "The new address of the Irrlicht Logo is " & $NewIrrlichtLogo)

; if the image is in a different location to where it was before display a message
if  $IrrlichtLogo <> $NewIrrlichtLogo then
	MsgBox( 0, $SCRIPTTITLE, "NOTICE: The address of the two Irrlicht logo's are different" & @LF & _
    	"this is because IrrlichtLogo was removed and the memory was reused for" & @LF & _
		"the FreeBasicLogo. Now we have loaded it again it is in a different place")
endif

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()


