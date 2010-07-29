; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 41 : Blending animation
; This example loads an animated model controlled by bones and then switches
; between two frames of the animation while blending the transition so that
; instead of snapping instantly to the new position the bones move smoothly
; over a set period of time
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
DIM $MD2Mesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $TransitionNode ; irr_node
DIM $NormalNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $frame ; integer = 0


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 41: Blending animation" )

; add credits for the model ; a static text GUI object on the display
_IrrAddStaticText( "Dwarf model by Yagodib, many thanks", 4,0,200,16, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/dwarf.x" )

; add two copies of the model one that will be blended and one that will not
$TransitionNode = _IrrAddMeshToScene( $MD2Mesh )
$NormalNode = _IrrAddMeshToScene( $MD2Mesh )

; reposition the nodes
_IrrSetNodePosition( $TransitionNode, -30,0,0 )
_IrrSetNodePosition( $NormalNode, 30,0,0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $TransitionNode, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialFlag( $NormalNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; set the animation range and speed on the two nodes
_IrrSetNodeAnimationRange ( $TransitionNode, 0, 1600 )
_IrrSetNodeAnimationSpeed ( $TransitionNode, 250 )
_IrrSetNodeAnimationRange ( $NormalNode, 0, 1600 )
_IrrSetNodeAnimationSpeed ( $NormalNode, 250 )

; set the time in seconds across which two animation frames are blended
_IrrSetTransitionTime( $TransitionNode, 0.5 )

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddCamera( 0,35,-75, 0,35,0 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    ; when the animation reaches the 1000th frame
    if _IrrGetNodeAnimationFrame( $TransitionNode ) = 1000 then
        ; set the current frame number being played in the animation
        _IrrSetNodeAnimationFrame( $TransitionNode, 0 )
        _IrrSetNodeAnimationFrame( $NormalNode, 0 )
    Endif

    ; Animates the mesh based on the position of the joints, this should be used at
    ; the end of any manual joint operations including blending and joints animated
    ; using $IRR_JOINT_MODE_CONTROL and _IrrSetNodeRotation on a bone node
    _IrrAnimateJoints( $TransitionNode )

    ; draw the scene
    _IrrDrawScene()

    ; draw the GUI
    _IrrDrawGUI()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
