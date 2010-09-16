; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 88: Billboard text over nodes
; This example demonstrates automatically generated billboard text objects that
; can be used to label nodes or locations in a scene.
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
DIM $Billboard ; irr_node
DIM $Camera ; irr_camera
DIM $font ; irr_font


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 88: Billboard text over nodes" )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; play an animation sequence embeded in the mesh. MD2 models have a group of
; preset animations for various poses and actions. this animation sequence is
; the character standing idle
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

; Load a font to use on the billboard
$font = _IrrGetFont( "../media/fonthaettenschweiler.bmp" )

; add the text billboard to the scene, the font is supplied or you can pass
; $IRR_NO_OBJECT and the system font will be used. The text is a wide character
; string followed by the width and height of the billboard and the X, Y, Z
; coordinates. A scenenode can be supplied that will become the billboards
; parent (often the node that its attached to) finally two colours are supplied
; for the top and the bottom of the billboard
$Billboard = _IrrAddBillboardTextSceneNode( $font, "Zumlin model below!", _
		64.0, 12.0, 0.0, 40.0, 0.0, 0, _
		_IrrMakeARGB(255, 255, 0, 0), _IrrMakeARGB(0, 0, 0, 255) )

; add a first person perspective camera into the scene so we can move around
; the billboard and see how it reacts
$Camera = _IrrAddFPSCamera()
_IrrSetNodePosition( $Camera, 0, 30, -75 )

; hide the mouse pointer
_IrrHideMouse()
;16776960
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
