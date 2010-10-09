; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 33 : Rendering to a texture
; This example renders a 3D model and a cube to the scene and uses the 3D model
; to texture the cube.
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
DIM $RenderTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $CubeNode ; irr_node
DIM $StaticCamera ; irr_camera
DIM $FPSCamera ; irr_camera
DIM $pixels ; uinteger ptr

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 33: Rendering to a texture" )

; add credits for the model ; a static text GUI object on the display
_IrrAddStaticText( "Zumlin model by Rowan 'Sumaleth; Crawford", 4,4,200,16, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP )
; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )

; create a texture surface that is suitable for rendering a display onto
; the renderview must be the same size or larger than this texture
$RenderTexture = _IrrCreateRenderTargetTexture ( 128, 128 )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; add a simple cube to the scene that will be textured with the rendered surface
$CubeNode = _IrrAddCubeSceneNode( 30.0 )
_IrrSetNodePosition( $CubeNode, 0, 0, 100 )

; apply a material to the nodes to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )
_IrrSetNodeMaterialTexture( $CubeNode, $RenderTexture, 0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialFlag( $CubeNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; play an animation sequence embeded in the mesh. MD2 models have a group of
; preset animations for various poses and actions. this animation sequence is
; the character standing idle
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

; add a static camera that is used to render the scene to a texture
$StaticCamera = _IrrAddCamera( 50,0,0, 0,0,0 )

; add a first person camera that is used for the display view
$FPSCamera = _IrrAddFPSCamera( $IRR_NO_OBJECT, 100.0, 0.1 )
_IrrSetNodePosition( $FPSCamera, 40, 0, 110 )
_IrrSetCameraTarget( $FPSCamera, 0,0,80 )
;_IrrSetNodeRotation( FPSCamera, 160, -400.0, 0 )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; switch to the static camera and render the scene to the texture
    _IrrSetActiveCamera ( $StaticCamera )
    _IrrDrawSceneToTexture ( $RenderTexture )

    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    ; switch to the FPS camera draw the scene
    _IrrSetActiveCamera ( $FPSCamera )
    _IrrDrawScene()

    ; draw the GUI
    _IrrDrawGUI()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
