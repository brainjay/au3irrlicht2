; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 34 : Finding nodes
; This example creates and labels nodes in a scene and then finds those nodes
; ; if it wasn't aware of them. This is particularly useful when a scene is
; loaded from a file and the system does not have node pointers to its objects
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
DIM $CreatedNode ; irr_node
DIM $FoundNode ; irr_node
DIM $NodeTexture ; irr_texture
DIM $Camera ; irr_camera
DIM $i ; integer
dim $position[9][2] = [ [-30,-30], [-30,0], [-30,30], [0,-30], [0,0], [0,30], [30,-30], [30,0], [30,30]]
dim $sOut
const $TITLE = "Example 34: Finding nodes"
; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( $TITLE )

; load texture resources for texturing the scene nodes
$NodeTexture = _IrrGetTexture( "./media/irrlichtlogo.bmp" )

; Add a series of test objects, texture and label them
for $i = 1 to 9
    ; alternate between a cube and a sphere
    if mod($i, 2) = 0 then
        $CreatedNode = _IrrAddCubeSceneNode( 20.0 )
    else
        $CreatedNode = _IrrAddSphereSceneNode ( 10.0, 16 )
    endif

    ; texture and lebel the node
    _IrrSetNodeMaterialTexture( $CreatedNode, $NodeTexture, 0 )
    _IrrSetNodeMaterialFlag( $CreatedNode, $IRR_EMF_LIGHTING, $IRR_OFF )
    _IrrSetNodeID( $CreatedNode, $i )
	_IrrAddRotationAnimator($CreatedNode, 0.1*$i, 0.1*$i, 0.1*$i)

next ; $i

MsgBox(0, $TITLE, "If this works correctly we should not find nodes 0 and 10")

; now search for the nodes through their ID's and position them into a grid
; we are deliberately looking for the unknown ID's 0 and 10 to generate an error
for $i = 0 to 10
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $i = ' & $i & @crlf & '>Error code: ' & @error & @crlf) ;### Debug Console
    $FoundNode = _IrrGetSceneNodeFromId ( $i )
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $FoundNode = ' & $FoundNode & @crlf & '>Error code: ' & @error & @crlf) ;### Debug Console
    if $FoundNode <> 0 then
        _IrrSetNodePosition( $FoundNode, $position[$i-1][0], $position[$i-1][1], 0 )
    else
		$sOut &= "Could not find the node ID " & $i & @LF
    endif
next ; $i

MsgBox(0, $TITLE, $sOut)

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$Camera = _IrrAddCamera( 0,0,75, 0,0,0 )

; we also hide the mouse pointer to see the view better
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
