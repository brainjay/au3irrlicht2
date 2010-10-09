; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 35 : Saving a scene
; This example constructs a scene from some simple objects and then saves the
; scene to a file
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
DIM $CreatedNode ; irr_node
DIM $FoundNode ; irr_node
DIM $NodeTexture ; irr_texture
DIM $Camera ; irr_camera
DIM $i ; integer
dim $sOutFile = @DesktopDir & "\myIrrlichtScene.irr"
Const $SSCRIPTTITLE = "Example 35: Saving a scene"
; array for x,y positions:
dim $position[9][2] = [ [-30,-30], [-30,0], [-30,30], [0,-30], [0,0], [0,30], [30,-30], [30,0], [30,30]]
; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, 32, $IRR_WINDOWED, _
          $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( $SSCRIPTTITLE )

; load texture resources for texturing the scene nodes
$NodeTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )

; Add a series of test objects, texture and label them
for $i = 0 to 8
    ; alternate between a cube and a sphere
    if mod($i+1, 2) = 0 then
        $CreatedNode = _IrrAddCubeSceneNode( 20.0 )
    else
        $CreatedNode = _IrrAddSphereSceneNode ( 10.0, 16 )
    endif

    ; texture and lebel the node
    _IrrSetNodeMaterialTexture( $CreatedNode, $NodeTexture, 0 )
    _IrrSetNodeMaterialFlag( $CreatedNode, $IRR_EMF_LIGHTING, $IRR_OFF )
    _IrrSetNodePosition( $CreatedNode, $position[$i][0], $position[$i][1], 0 )
	_IrrAddRotationAnimator($CreatedNode, 0.1*$i, 0.1*$i, 0.1*$i)

next ; $i

; add a camera to the scene to view the objects
$Camera = _IrrAddCamera( 0,0,75, 0,0,0 )

; Save the scene to file
_IrrSaveScene( $sOutFile )
; erase the scene
_IrrRemoveAllNodes()
MsgBox(0, $SSCRIPTTITLE, "Example Scene created and removed from memory after saving to " _
			& @LF & $sOutFile & @LF & "Now this complete scene will be reloaded ...")

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; load it back in from file
_IrrLoadScene( $sOutFile )

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
