; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 06: Billboards
; This example demonstrates Billboards. A billboard is a single rectangular
; polygon that always faces the camera. It is often referred to ; a 3D sprite
; and is especially good for spherical effects like glowing floating lights
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
DIM $Billboard ; irr_node
DIM $BillboardTexture ; irr_texture
DIM $Camera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 06: Billboards" )

; load the texture resource for the billboard
$BillboardTexture = _IrrGetTexture( "./media/freebasiclogo_big.jpg" )

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
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
