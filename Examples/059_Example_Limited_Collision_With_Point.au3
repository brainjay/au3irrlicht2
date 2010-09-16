; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 59: Limited Collision with a Point
; This example demonstrates the use of tests of collisions between a point and
; objects in a scene limited by the ID of the those objects
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
DIM $CameraNode ; irr_node
DIM $zone ; irr_node
DIM $x ; integer
DIM $z ; integer
DIM $BitmapFont ; irr_font
DIM $nodelabel ; string
DIM $nodename ; wstring * 256
DIM $vector ; $IRR_VECTOR
DIM $SelectedNode ; irr_node
DIM $RootNode ; irr_node


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 59: Limited Collision with a Point" )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "../media/bitmapfont.bmp" )

; create a series of zones
for $x = -3 to 3
    for $z = -3 to 3
        $zone = _IrrAddZoneManager(0,9999)
        _IrrSetZoneManagerBoundingBox( $zone, 0, 0, 0,  100, 100, 100 )
        _IrrSetNodePosition( $zone, $x*100, 0, $z*100 )
        _IrrDebugDataVisible( $zone, 0xFFFF )
        $nodelabel = "ZONE " & $X+3 & "," & $Z+3
        _IrrSetNodeName( $zone, $nodelabel )
    next ; $z
next ; $x

; add a first person perspective camera into the scene so we can move around
; the billboard and see how it reacts
$Camera = _IrrAddFPSCamera()
$CameraNode = $Camera

; hide the mouse pointer
_IrrHideMouse()

; get the root node of the scene
$RootNode = _IrrGetRootSceneNode()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas
    _IrrBeginScene( 0, 0, 0 )

    ; draw the scene
    _IrrDrawScene()

    ; get the position of the camera
    _IrrGetNodePosition( $CameraNode, $vector )

    ; get the first object that is the subject of a collision with the specified
    ; point, the call is supplied with the Parent node to test, a bitmask to
    ; tlimit the ID of the nodes included into the test a flag to declare
    ; whether the entire tree of nodes is tested and finally the point to be
    ; tested against
    $SelectedNode = _IrrGetChildCollisionNodeFromPoint( _
            $RootNode, 0, $IRR_OFF, $vector )

    ; if a node was selected
    if NOT $SelectedNode = 0 then
        ; get the name of the zone
        $nodename = "SELECTED NODE IS:" & _IrrGetNodeName($SelectedNode)

        ; draw this position information to the screen
        _Irr2DFontDraw ( $BitmapFont, $nodename, 4, 32, 250, 52 )
    endif

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
