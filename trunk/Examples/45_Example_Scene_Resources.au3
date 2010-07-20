; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 45: Managing Scene Resources
; This example loads and creates a series of models and then deletes them all
; before creating another scene. These methods can be used when changing the
; objects in a scene perhaps between loading levels in a game or chapters in
; animation, while freeing memory for new resources
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
DIM $MD2Mesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $BoxTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $Box1Node ; irr_node
DIM $Box2Node ; irr_node
DIM $OurCamera ; irr_camera
DIM $Light ; irr_node
DIM $frame = 0

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 45: Managing Scene Resources" )

; add credits for the model ; a static text GUI object on the display
_IrrAddStaticText( "Zumlin model by Rowan 'Sumaleth; Crawford", 4,0,200,16, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "./media/zumlin.md2" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "./media/zumlin.pcx" )
$BoxTexture = _IrrGetTexture( "./media/water.png" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; add two simple cube nodes to the scene
$Box1Node = _IrrAddCubeSceneNode( 20.0 )
$Box2Node = _IrrAddCubeSceneNode( 20.0 )
_IrrSetNodePosition( $Box1Node, 0, -10, -30 )
_IrrSetNodePosition( $Box2Node, 0, -10, 30 )

; apply a material to the nodes to give them surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )
_IrrSetNodeMaterialTexture( $Box1Node, $BoxTexture, 0 )
_IrrSetNodeMaterialTexture( $Box2Node, $BoxTexture, 0 )

; play an animation sequence embeded in the mesh. MD2 models have a group of
; preset animations for various poses and actions. this animation sequence is
; the character standing idle
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

; add a simple point light
$Light = _IrrAddLight( $IRR_NO_PARENT, -100,100,100, 1.0,1.0,1.0, 600.0 )

; apply a low ambient lighting level to the light source
_IrrSetLightAmbientColor ( $Light, 0.25,0.25,0.25 )

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddCamera( 50,5,25, 0,0,0 )


; -----------------------------------------------------------------------------
; Display the scene for 500 frames
WHILE ( _IrrRunning() And $frame < 500 )
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    ; draw the scene
    _IrrDrawScene()

    ; draw the GUI
    _IrrDrawGUI()

    ; end drawing the scene and render it
    _IrrEndScene()

    $frame += 1
WEND

; clear the scene removing all nodes and then all meshes
_IrrRemoveAllNodes()
_IrrClearUnusedMeshes()

; add a simple spherical node to the scene
$Box1Node = _IrrAddSphereSceneNode( 20.0, 16 )

; texture the node
_IrrSetNodeMaterialTexture( $Box1Node, $BoxTexture, 0 )

; add a simple point light
$Light = _IrrAddLight( $IRR_NO_PARENT, 0,100,100, 1.0,1.0,1.0, 600.0 )

; apply a low ambient lighting level to the light source
_IrrSetLightAmbientColor ( $Light, 0.25,0.25,0.25 )

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddCamera( 50,5,25, 0,0,0 )

; -----------------------------------------------------------------------------
; Display the scene
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

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
