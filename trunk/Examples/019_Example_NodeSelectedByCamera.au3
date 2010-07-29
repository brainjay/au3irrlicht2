; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 19 : Selecting Nodes through the camera
; This example selects a node in the scene that is hit by a ray that is cast
; out through the centre of the camera
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

global const $TEST_NODES = 125

; irrlicht objects
DIM $MeshTexture ; irr_texture
DIM $TestNode[$TEST_NODES] ; irr_node
DIM $SelectedNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $BitmapFont ; irr_font
DIM $x ; integer
DIM $y ; integer
DIM $MouseEvent ; $IRR_MOUSE_EVENT PTR
DIM $selected_node ; wstring * 128
DIM $i ; integer


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 19: 2D Text label on a 3D model" )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "../media/bitmapfont.bmp" )
$MeshTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )

; itterate all of the test nodes
for $i = 1 to $TEST_NODES
    ; add a test node to the scene
    $TestNode[$i-1] = _IrrAddTestSceneNode()

    ; move the node so that it is arranged into a large 3D cubed array of nodes

    _IrrSetNodePosition( $TestNode[$i-1], _
						( int(($i-1) / 25) ) * 40, _
						( mod( ( int(($i-1) / 5)), 5) ) * 40, _
						mod( ($i-1), 5) * 40 )

    ; apply a material to the node
    _IrrSetNodeMaterialTexture( $TestNode[$i-1], $MeshTexture, 0 )
next ; $i

; add an FPS camera into the scene and move it into position
$OurCamera = _IrrAddFPSCamera()
_IrrSetNodePosition( $OurCamera, 400, 200, 0 )
_IrrSetCameraTarget( $OurCamera, 0,0,0)

; prepare a message that indicates that there is no node selected in the scene
$selected_node = "NOTHING SELECTED"

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with grey before rendering
    _IrrBeginScene( 128,128,128 )

    ; draw the scene
    _IrrDrawScene()

    ; get the node that collides with a ray cast out through the center of the
    ; camera
    $SelectedNode = _IrrGetCollisionNodeFromCamera( $OurCamera )

    ; if the node value that was returned is 0 there is no node selected
    if $SelectedNode = 0 then
        ; Display a message informing the user how to move the cubes
        $selected_node = "NOTHING SELECTED"
    else
        ; some node was hit, scan through the array of nodes to find which one
        ; it was
        for $i = 1 to $TEST_NODES
            ; if this was the collided node
            if  $SelectedNode = $TestNode[$i-1] then
                ; display the node index
                $selected_node = "NODE " & $i & " SELECTED"
                ; switch lighting off on this node to indicate that it is
                ; selected
                _IrrSetNodeMaterialFlag( $SelectedNode, $IRR_EMF_LIGHTING, $IRR_ON )
            else
                ; this node is not selected, switch lighting on for this node
                ; to indicate this fact
                _IrrSetNodeMaterialFlag( $TestNode[$i-1], $IRR_EMF_LIGHTING, $IRR_OFF )
            endif
        next ; $i
    endif

    ; draw the text indicating which node was selected
    _Irr2DFontDraw ( $BitmapFont, $selected_node, 0, 0, 100, 16 )

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
