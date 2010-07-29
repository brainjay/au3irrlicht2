; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 44 : Manually Animating Bones
; This example loads an animated model containing bones and then adjusts one of
; those bones through programming
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
DIM $AnimatedNode ; irr_node
DIM $JointNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $rotation = 0.0
global const $SCRIPTTITLE = "Example 44: Manually Animating Bones"

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( $SCRIPTTITLE )

; add credits for the model ; a static text GUI object on the display
_IrrAddStaticText( "Dwarf model by Yagodib, many thanks", 4,0,200,16, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/dwarf.x" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$AnimatedNode = _IrrAddMeshToScene( $MD2Mesh )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $AnimatedNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; ensure that the bone can be controlled programmatically
_IrrSetJointMode( $AnimatedNode, $IRR_JOINT_MODE_CONTROL )

; get the bone node
$JointNode = _IrrGetJointNode( $AnimatedNode, "Joint4" )

if $JointNode = $IRR_NO_OBJECT then
    MsgBox(0, $SCRIPTTITLE, "Unable to get joint node")
endif

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddCamera( 75,30,0, 0,30,0 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    ; Animates the mesh based on the position of the joints, this should be used at
    ; the end of any manual joint operations including blending and joints animated
    ; using $IRR_JOINT_MODE_CONTROL and _IrrSetNodeRotation on a bone node
    _IrrAnimateJoints( $AnimatedNode )

    ; rotate the node
    _IrrSetNodeRotation( $JointNode, $rotation, 0.0, 0.0 )
    $rotation += 0.1


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
