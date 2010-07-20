; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 17 : Selecting Nodes with the Mouse
; This example allows you to move the mouse around the display and to select
; nodes on the screen by hovering over them.
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

global const $TEST_NODES = 25

; irrlicht objects
DIM $MeshTexture ; irr_texture
DIM $TestNode[$TEST_NODES] ; irr_node
DIM $SelectedNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $BitmapFont ; irr_font
DIM $pMouseEvent ; $IRR_MOUSE_EVENT PTR
DIM $mouseX ; integer
DIM $mouseY ; integer
DIM $selected_node ; wstring * 128
DIM $i ; integer


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 17: Selecting Nodes with the Mouse" )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "./media/bitmapfont.bmp" )

; load the test cube texture
$MeshTexture = _IrrGetTexture( "./media/texture.jpg" )

; itterate all of the test nodes
for $i = 1 to $TEST_NODES
    ; add a test node to the scene
    $TestNode[$i-1] = _IrrAddTestSceneNode()

    ; move the node so that it is arranged into a square grid
    _IrrSetNodePosition( $TestNode[$i-1], 0, ( int(($i-1) / 5) ) * 20, (mod(($i-1), 5)) * 20 )

    ; apply a material to the node
    _IrrSetNodeMaterialTexture( $TestNode[$i-1], $MeshTexture, 0 )
next ; $i

; add a camera into the scene and move it into position
$OurCamera = _IrrAddCamera( 120,40,40, 0,40,40)

; start with the phrase saying nothing is selected
$selected_node = "NOTHING SELECTED"

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with grey before rendering
    _IrrBeginScene( 128,128,128 )

    ; draw the scene
    _IrrDrawScene()

    ; if there is a mouse event waiting
    ; while there are mouse events waiting
    while _IrrMouseEventAvailable()
        ; read the mouse event out
        $pMouseEvent = _IrrReadMouseEvent()

        ; if this is a mouse move event
        if __getMouseEvt($pMouseEvent, $EVT_MOUSE_IACTION) = $IRR_EMIE_MOUSE_MOVED then
			$mouseX = __getMouseEvt($pMouseEvent, $EVT_MOUSE_IX)
			$mouseY = __getMouseEvt($pMouseEvent, $EVT_MOUSE_IY)

            ; Get the node object that is under the mouse
            $SelectedNode = _IrrGetCollisionNodeFromScreenCoordinates($mouseX, $mouseY)

            ; if the node object that was return is 0
            if $SelectedNode = 0 then
                ; there is no node under the mouse
                $selected_node = "NOTHING SELECTED AT " & $mouseX & "," & $mouseY
            else
                ; scan through the list of nodes to find which one is selected
                for $i = 1 to $TEST_NODES
                    ; if this is the selected node
                    if  $SelectedNode = $TestNode[$i-1] then
                        ; display the node number
                        $selected_node = "NODE " & $i & " SELECTED AT " & $mouseX & "," & $mouseY
                        ; switch lighting off on the node making it appear black
                        _IrrSetNodeMaterialFlag( $SelectedNode, $IRR_EMF_LIGHTING, $IRR_ON )
                    else
                        ; switch lighting on for this node
                        _IrrSetNodeMaterialFlag( $TestNode[$i-1], $IRR_EMF_LIGHTING, $IRR_OFF )
                    endif
                next ; $i
            endif
        endif

    wend

    ; draw the text indicating which node was selected
    _Irr2DFontDraw ( $BitmapFont, $selected_node, 0, 0, 100, 16 )

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
