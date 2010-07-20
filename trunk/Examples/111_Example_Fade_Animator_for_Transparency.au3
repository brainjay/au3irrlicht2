; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 111: Fade Animator for Transparency
; This example demonstrates the fade animator applied to transparent nodes.
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
DIM $Billboard[3] ; irr_node
DIM $BillboardTexture ; irr_texture
DIM $Camera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 512, 512, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 111: Fade Animator for Transparency" )

; load the texture resource for the billboard
$BillboardTexture = _IrrGetTexture( "./media/beam.png" )

; add the billboard to the scene, the first two parameters are the size of the
; billboard in this instance they match the pixel size of the bitmap to give
; the correct aspect ratio. the last three parameters are the position of the
; billboard object
$Billboard[0] = _IrrAddBillBoardToScene( 30.0,100.0, -30.0,0.0,100.0 )
$Billboard[1] = _IrrAddBillBoardToScene( 30.0,100.0,   0.0,0.0,100.0 )
$Billboard[2] = _IrrAddBillBoardToScene( 30.0,100.0,  30.0,0.0,100.0 )

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialTexture( $Billboard[0], $BillboardTexture, 0 )
_IrrSetNodeMaterialTexture( $Billboard[1], $BillboardTexture, 0 )
_IrrSetNodeMaterialTexture( $Billboard[2], $BillboardTexture, 0 )

; fading requires that lighting is enabled
_IrrSetNodeMaterialFlag( $Billboard[0], $IRR_EMF_LIGHTING, $IRR_ON )
_IrrSetNodeMaterialFlag( $Billboard[1], $IRR_EMF_LIGHTING, $IRR_ON )
_IrrSetNodeMaterialFlag( $Billboard[2], $IRR_EMF_LIGHTING, $IRR_ON )

; apply transparent materials types
_IrrSetNodeMaterialType ( $Billboard[0], $IRR_EMT_TRANSPARENT_ADD_COLOR )
_IrrSetNodeMaterialType ( $Billboard[1], $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL )
_IrrSetNodeMaterialType ( $Billboard[2], $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL_REF )

; add a first person perspective camera into the scene so we can move around
; the billboard and see how it reacts
$Camera = _IrrAddCamera( 0,0,0, 0,0,10 )

; hide the mouse pointer
_IrrHideMouse()

; set the ambient light level across the entire scene
_IrrSetAmbientLight( 1,1,1 )

_IrrSetNodeScale( $Billboard[0], 0.5,0.5,0.5 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
local $frames = 0
local $frameTime = TimerInit()
WHILE _IrrRunning()
    ; is it time for another frame
	if TimerDiff($frameTime) > 16.7 then
		; record the start time of this frame
        $frameTime = TimerInit()

         ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 128, 128, 128 )

        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()

        ; wait until 100 frames have elapsed
        $frames += 1
        if $frames = 100 then
            ; Add the fade, scale and delete animator
            _IrrAddFadeAnimator( $Billboard[0], 3000, -0.5 )      ; shrink
            _IrrAddFadeAnimator( $Billboard[1], 3000,  0.0 )      ; dont scale
            _IrrAddFadeAnimator( $Billboard[2], 3000,  0.5 )      ; expand
        endif
    endif

WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
