; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 57 : Reading and writing the name of objects
; This example demonstrates reading and writing the names of objects that can
; be useful in identifying or storing information inside an object
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
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 57: Reading and Writing the Name of Objects" )

; add credits for the model ; a static text GUI object on the display
_IrrAddStaticText( "Zumlin model by Rowan 'Sumaleth; Crawford", 4,0,200,16, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; set the node name
_IrrSetNodeName( $SceneNode, "Zumlin" )

; read the name back
DIM $NodeName ; Const zstring ptr
$NodeName = _IrrGetNodeName( $SceneNode )
MsgBox(0, "Example 57: Reading and Writing the Name of Objects", "The node name read back in is >" & $NodeName & "<")

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; play an animation sequence embeded in the mesh. MD2 models have a group of
; preset animations for various poses and actions. this animation sequence is
; the character standing idle
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddCamera( 50,0,0, 0,0,0 )


; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 100, 100, 100 )

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
