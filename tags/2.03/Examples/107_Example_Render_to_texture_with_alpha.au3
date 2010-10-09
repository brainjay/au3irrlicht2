; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 107 : Render to texture with alpha
; This example demonstrates rendering to a texture while using the alpha
; channel to create shaped and animated HUD elements
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
DIM $TextureCamera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 107: Render to texture with alpha" )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; make sure that vertex color does not affect any lighting
_IrrSetNodeColorByVertex( $SceneNode, $ECM_NONE )

; set up some lighting colors
_IrrSetNodeAmbientColor( $SceneNode, _IrrMakeARGB( 255,0,0,255 ))
_IrrSetNodeDiffuseColor( $SceneNode, _IrrMakeARGB( 64,255,96,255 ))
_IrrSetNodeSpecularColor( $SceneNode, _IrrMakeARGB( 255,255,0,255 ))
_IrrSetNodeEmissiveColor( $SceneNode, _IrrMakeARGB( 0,0,0,255 ))

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; play an animation sequence embeded in the mesh. MD2 models have a group of
; preset animations for various poses and actions. this animation sequence is
; the character standing idle
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$TextureCamera = _IrrAddCamera( 50,0,0, 0,0,0 )
$OurCamera = _IrrAddCamera( 50,0,0, 0,0,0 )

; add a  light source
_IrrAddLight( $IRR_NO_PARENT, 100,100,-100, 0.9,0.9,0.9, 600.0 )

; add some ambient lighting
_IrrSetAmbientLight( 0.1, 0.1, 0.1 )

; create a surface for rendering the image to
Dim $Texture = _IrrCreateRenderTargetTexture( 200, 200 )

; circle the camera around the object
_IrrAddFlyCircleAnimator( $OurCamera, 0.0, 0.0, 0.0, 40.0, 0.001 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
Dim $timerDiff, $timer = TimerInit()
DIm $X, $Y

WHILE _IrrRunning()
    ; is it time for another frame
    $timerDiff = TimerDiff($timer)
    if $timerDiff > 16.7 then
        ; record the start time of this frame
        $timer = TimerInit()

        ; render to a texture
        _IrrSetRenderTarget( $Texture, _IrrMakeARGB( 0,128,128,128), $IRR_ON, $IRR_ON )

        ; switch to the texture camera
        _IrrSetActiveCamera( $TextureCamera )

        ; draw the scene to the texture
        _IrrDrawScene()

        ; set the render target back to the screen
        _IrrSetRenderTarget(0)

        ; switch to the display camera
        _IrrSetActiveCamera( $OurCamera )

        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene ( 128, 128, 192 )

        ; draw the scene
        _IrrDrawScene()

        ; draw a the texture with the alpha channel to the screen
        _IrrDraw2DImageElement( $Texture, _
                               4, 4, _
                               0,0,200,200, $IRR_USE_ALPHA )

        ; end drawing the scene and render it
        _IrrEndScene()
    EndIF
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
