; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 21 : Carrying Objects
; This example demonstrates how you can attach a child model to an animated
; Direct X model containing joints
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
DIM $DirectXMesh ; irr_mesh
DIM $BoxTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $JointNode ; irr_node
DIM $TestNode ; irr_node


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 21: Carrying Objects" )

; load a mesh, when loading a .x file the textures will be automatically loaded
; and applied to the model
$DirectXMesh = _IrrGetMesh( "../media/dwarf.x" )

; add the mesh to the scene
$SceneNode = _IrrAddMeshToScene( $DirectXMesh )

; switch off lighting effects on this model
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; set the speed of playback for the animated Direct X model
_IrrSetNodeAnimationSpeed( $SceneNode, 400 )

; add a camera into the scene pointing at the model
$OurCamera = _IrrAddCamera( 75,40,-50, 0,40,0 )

; create a test node to represent the object that is being carried
$TestNode = _IrrAddTestSceneNode()

; load texture resources for texturing the box
$BoxTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )

; assign a texture to the carried object
_IrrSetNodeMaterialTexture( $TestNode, $BoxTexture, 0 )

; switch off lighting effects on the test box
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; offset the position of the node so that it appears to be attached to the
; characters hand
_IrrSetNodePosition( $TestNode, 20,-15,-10 )

; get an invisible node that is attached to the specified joint on the animated node
;$JointNode = _IrrGetDirectXJointNode ( $SceneNode, "Joint16" )
$JointNode = _IrrGetJointNode($SceneNode, "Joint16")
; attach the carried test node to this invisible joint node from now on the
; carried object will move along with the joint without any more intervention
; from us
_IrrAddChildToParent ( $TestNode, $JointNode )


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
