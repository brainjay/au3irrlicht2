; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 87 : Multipass rendering
; This example demonstrates multipass rendering, in the first pass the standard
; Zumlin model is drawn to the screen, a second rendering pass is then drawn
; to blend a detail map over the Zumlin model.
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
DIM $TextureA ; irr_texture
DIM $TextureB ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $Material ; irr_material


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 600, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 87 : Multipass rendering" )

; add credits for the model ; a static text GUI object on the display
_IrrAddStaticText( "Zumlin model by Rowan 'Sumaleth; Crawford", 4,0,200,16, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing the scene nodes
$TextureA = _IrrGetTexture( "../media/zumlin.pcx" )
$TextureB = _IrrGetTexture( "../media/detailmap3.jpg" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; play an animation sequence embeded in the mesh. MD2 models have a group of
; preset animations for various poses and actions. this animation sequence is
; the character standing idle
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType( $SceneNode, $IRR_EMT_TRANSPARENT_ADD_COLOR )

; get the material associated with our node and set its blending. this will
; set the material to blend the source pixels and the destination pixels
; together
$Material = _IrrGetMaterial( $SceneNode, 0 )
_IrrSetMaterialBlend( $Material, $EBF_SRC_COLOR, $EBF_DST_COLOR )


; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddCamera( 50,0,0, 0,0,0 )


; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 0, 0, 0 )

    ; set the material type and the texture on this node for this render pass
    _IrrSetNodeMaterialTexture( $SceneNode, $TextureA, 0 )
    _IrrSetNodeMaterialType( $SceneNode, $IRR_EMT_SOLID )

    ; draw this render pass
    _IrrDrawScene()

    ; set the material type and the texture on this node for this render pass
    ; the one texture blend function uses the blend settings defined early to
    ; mix the pixels drawn to the screen with the pixels from the last render
    _IrrSetNodeMaterialTexture( $SceneNode, $TextureB, 0 )
    _IrrSetNodeMaterialType( $SceneNode, $IRR_EMT_ONE_TEXTURE_BLEND )

    ; draw the second render pass
    _IrrDrawScene()

    ; end the scene swapping the buffers and displaying the rendered scene
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
