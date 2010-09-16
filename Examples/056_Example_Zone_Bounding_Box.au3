; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 56: Zone Management Bounding Boxes
; This example demonstrates the display of bounding boxes created by adding
; child objects to parent zone managment objects
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
DIM $zone ; irr_node
DIM $x ; integer
DIM $z ; integer
DIM $n ; integer


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 56: Zone Management Bounding Boxes" )

; load the texture resource for the billboard
$BillboardTexture = _IrrGetTexture( "../media/freebasiclogo_big.jpg" )

; add the billboard to the scene, the first two parameters are the size of the
; billboard in this instance they match the pixel size of the bitmap to give
; the correct aspect ratio. the last three parameters are the position of the
; billboard object
for $x = -15 to 15
    for $z = -15 to 15
        $zone = _IrrAddZoneManager(0,600)
        ; _IrrSetZoneManagerBoundingBox( $zone, 0, 0, 0,  100, 100, 100 )
        _IrrSetZoneManagerProperties( $zone, 0, 600, 1 )
        _IrrSetNodePosition( $zone, $x*100, 0, $z*100 )
        _IrrDebugDataVisible( $zone, 0xFFFF )

        for $n = 0 to 5
            $Billboard = _IrrAddBillBoardToScene( 5.0, 5.0 )
            _IrrSetNodeMaterialTexture( $Billboard, $BillboardTexture, 0 )
            _IrrSetNodeMaterialFlag( $Billboard, $IRR_EMF_LIGHTING, $IRR_OFF )
            _IrrSetNodePosition( $Billboard, Random(0, 50), Random(0, 50), Random(0, 50) )
            _IrrAddChildToParent( $Billboard, $zone )
        next ; $n
    next ; $z
next ; $x

; add a first person perspective camera into the scene so we can move around
; the billboard and see how it reacts
$Camera = _IrrAddFPSCamera()

; hide the mouse pointer
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas
    _IrrBeginScene( 0, 0, 0 )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
