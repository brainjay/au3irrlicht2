; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 55: Zone Management
; This example demonstrates zone management objects, these are parent objects
; that manage the visibility of their child objects and can be used to remove
; numbers of objects out of the visible scene when the camera moves out of
; visible range
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
_IrrSetWindowCaption( "Example 55: Zone Management" )

; load the texture resource for the billboard
$BillboardTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )

; here we create 900 zones
for $x = -15 to 15
    for $z = -15 to 15

        ; we add in a zone management object and set the near distance to 100
        ; and the far distance to 300. the zone management object will only
        ; be visible if the zone is more than 100 units from the active camera
        ; and less than 300 units away, any child objects of this zone will be
        ; completely unprocessed.
        ; if you set your zone up in conjunction with fog you can have lots of
        ; complex objects in the scene and when the zone they were in was out of
        ; camera range the objects would be completely disabled and have no
        ; impact on the processing of the scene
        ; you could also place a large number of zone managers into another zone
        ; if your environment was sufficiently complex
        ; the near value also allows you to implement a simple level of detail
        ; LOD effect by having a low and high resoloution zones overlapping one
        ; another the high resoloution zone might display from 0 to 100 while
        ; the low resoloution zone displays from 100 to 500
        $zone = _IrrAddZoneManager(100,300)

        ; here we create 6 billboards for each zone, this would make nearly 4600
        ; billboards but ; only a small set are displayed there is minimal
        ; effect on the speed of the display
        for $n = 0 to 5
            $Billboard = _IrrAddBillBoardToScene( 5.0, 5.0 )
            _IrrSetNodeMaterialTexture( $Billboard, $BillboardTexture, 0 )
            _IrrSetNodeMaterialFlag( $Billboard, $IRR_EMF_LIGHTING, $IRR_OFF )
            _IrrSetNodePosition( $Billboard, random(0, 50), random(0, 50), random(0, 50) )

            ; finally we attach the billboard to the zone ; a child and the
            ; billboard is thereafter automatically managed by the zone manager
            _IrrAddChildToParent( $Billboard, $zone )
        next ; $n

        _IrrSetNodePosition( $zone, $x*100, 0, $z*100 )
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
    _IrrBeginScene( 0, 0, 75 )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
