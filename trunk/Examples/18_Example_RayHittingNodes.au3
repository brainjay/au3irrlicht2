; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 18 : Selecting Nodes with a Ray
; This example selects a node in the scene that is hit by a ray we specify as
; a line in 3D space
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

global const $TEST_NODES = 19

; irrlicht objects
DIM $MeshTexture ; irr_texture
DIM $TestNode[$TEST_NODES] ; irr_node
DIM $SelectedNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $BitmapFont ; irr_font
DIM $x ; single
DIM $y ; single
DIM $KeyEvent ; $IRR_KEY_EVENT PTR
dim $keyEventKey
DIM $selected_node ; wstring * 128
DIM $start_vector[3] ; $IRR_VECTOR
DIM $end_vector[3] ; $IRR_VECTOR
DIM $POS[3]
DIM $i ; integer

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 18: Selecting Nodes with a Ray" )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "./media/bitmapfont.bmp" )

; load the test cube texture
$MeshTexture = _IrrGetTexture( "./media/texture.jpg" )

; itterate all of the test nodes
for $i = 0 to $TEST_NODES - 1
    ; add a test node to the scene
    $TestNode[$i] = _IrrAddTestSceneNode()

    ; move the node so that it is arranged into a circle
    _IrrSetNodePosition( $TestNode[$i], 00, sin($i/3) * 50, cos($i/3) * 50 )

    ; apply a material to the node
    _IrrSetNodeMaterialTexture( $TestNode[$i], $MeshTexture, 0 )
next ; $i

; add a camera into the scene and move it into position
$OurCamera = _IrrAddCamera( 120,50,50, 0,0,0)

; prepare to display a message informing the user how to move the cubes
$selected_node = "MOVE WITH W A S D "

; define a ray starting at (100,0,0) and passing through (0,0,0) make sure that
; it doesn't pass through the camera ; this can be identified ; the nearest
; node too
$start_vector[0] = 100
$start_vector[1] = 0
$start_vector[2] = 0

$end_vector[0] = 0
$end_vector[1] = 0
$end_vector[2] = 0

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with grey before rendering
    _IrrBeginScene( 128,128,128 )

    ; draw the scene
    _IrrDrawScene()

    ; while there are key events waiting
    while _IrrKeyEventAvailable()
        ; read the key event out
        $KeyEvent = _IrrReadKeyEvent()
		$keyEventKey = __getKeyEvt($keyEvent, $EVT_KEY_IKEY)

        ; if this is a key down event we might need to start moving in a
        ; specific direction
		if __getKeyEvt($KeyEvent, $EVT_KEY_IDIRECTION) = $IRR_KEY_DOWN then
            select
            case $keyEventKey = 65 ; A
                $y = 0.4
            case $keyEventKey = 87 ; W
                $x = -0.4
            case $keyEventKey = 68 ; S
                $y = -0.4
            case $keyEventKey = 83 ; D
                $x = 0.4
            endselect
        else
            ; this is a key up event we might need to stop moving in a specific
            ; direction
			select
            case $keyEventKey = 87 OR $keyEventKey = 83 ; W and D
                $x = 0
            case $keyEventKey = 65 OR $keyEventKey = 68 ; A and S
                $y = 0
            endselect
        endif
    wend

    ; reposition all of the objects
    for $i = 0 to $TEST_NODES - 1
        _IrrGetNodePosition( $TestNode[$i], $POS )
        $POS[1] += $x
        $POS[2] += $y
        _IrrSetNodePosition( $TestNode[$i], $POS[0], $POS[1], $POS[2] )
    next ; $i

    ; get the nearest node that collides with the ray we defined earlier
    $SelectedNode = _IrrGetCollisionNodeFromRay( $start_vector, $end_vector )

    ; if the node value that was returned is 0 there is no node selected
    if $SelectedNode = 0 then
        ; Display a message informing the user how to move the cubes
        $selected_node = "MOVE RAY WITH W A S D"
    else
        ; some node was hit, scan through the array of nodes to find which one
        ; it was
        for $i = 0 to $TEST_NODES - 1
            ; if this was the collided node
            if  $SelectedNode = $TestNode[$i] then
                ; display the node index
                $selected_node = "NODE " & $i & " SELECTED"
                ; switch lighting off on this node to indicate that it is
                ; selected
                _IrrSetNodeMaterialFlag( $SelectedNode, $IRR_EMF_LIGHTING, $IRR_ON )
            else
                ; this node is not selected, switch lighting on for this node
                ; to indicate this fact
                _IrrSetNodeMaterialFlag( $TestNode[$i], $IRR_EMF_LIGHTING, $IRR_OFF )
            endif
        next ; $i
    endif
    ; draw the text indicating which node was selected
    _Irr2DFontDraw ( $BitmapFont, $selected_node, 0, 0, 100, 16 )

    ; draw the ray so we can see what is happening
    _IrrDraw3DLine( $start_vector[0], $start_vector[1], $start_vector[2], _
                    $end_vector[0], $end_vector[1], $end_vector[2], _
                    255,0,0 )


    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
