; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 60: Getting Node Children
; This example demonstrates acquiring the child nodes connected to a parent
; node
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
DIM $MeshTexture ; irr_texture
DIM $Camera ; irr_camera
DIM $zone ; irr_node
DIM $x ; integer
DIM $z ; integer
DIM $n ; integer
DIM $BitmapFont ; irr_font
DIM $nodelabel ; string
DIM $nodename ; wstring * 256
DIM $TestNode ; irr_node
DIM $RootNode ; irr_node
DIM $position ; any ptr
dim $sInfo
const $SCRIPTTITLE = "Example 60: Getting Node Children"
; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( $SCRIPTTITLE )

; load the test cube texture
$MeshTexture = _IrrGetTexture( "../media/texture.jpg" )

; create a series of zones
for $x = -3 to 3

    for $z = -3 to 3
        $zone = _IrrAddZoneManager(0,9999)
        _IrrSetZoneManagerBoundingBox( $zone, 0, 0, 0,  100, 100, 100 )
        _IrrSetNodePosition( $zone, $x*100, 0, $z*100 )
        _IrrDebugDataVisible( $zone, 0xFFFF )
        $nodelabel = "ZONE " & $X+3 & "," & $Z+3
        _IrrSetNodeName( $zone, $nodelabel )

        ; save the details of one of the zone nodes
        if $x = 0 and $z = 0 then $RootNode = $zone

        for $n = 0 to 5
            $TestNode = _IrrAddTestSceneNode()
            _IrrSetNodePosition( $TestNode, Random() * 50, Random() * 50, Random() * 50 )
            _IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
            _IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

            $nodelabel = "ZONE " & $X+3 & "," & $Z+3 & "," &$N
            _IrrSetNodeName( $TestNode, $nodelabel )

            _IrrAddChildToParent( $TestNode, $zone )

        next ; $n
    next ; $z
next ; $x

; add a first person perspective camera into the scene so we can move around
; the billboard and see how it reacts
$Camera = _IrrAddFPSCamera()

; now that everything is created itterate through all of the children attached
; to the zone node we saved
$TestNode = _IrrGetNodeFirstChild( $RootNode, $position )

while NOT $TestNode = $IRR_NO_OBJECT
    if _IrrIsNodeLastChild( $RootNode, $position ) = 0 then
		$sInfo &= "Child node name is " & _IrrGetNodeName( $TestNode ) & @LF
    else
        $sInfo &= "Last Child node name is " & _IrrGetNodeName( $TestNode )
    endif

	$TestNode = _IrrGetNodeNextChild( $RootNode, $position )
wend

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
local $flag = True
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas
    _IrrBeginScene( 0, 0, 0 )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()

	if $flag Then ; show info after first frame is drawn
		MsgBox(0, $SCRIPTTITLE, $sInfo)
		$flag = False
		; hide the mouse pointer
		_IrrHideMouse()
	EndIf
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
