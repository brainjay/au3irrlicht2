; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 94 : Bump Mapping
; This example loads in a Mesh Model and then then textures it using a bump
; mapping technique called Normal Mapping. To see this effect your graphics
; card will need to support pixel and vertex shaders version 1.1
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
DIM $ModelMesh ; irr_mesh
DIM $DiffuseTexture ; irr_texture
DIM $BumpTexture ; irr_texture
DIM $SceneNodeNormal ; irr_node
DIM $SceneNodeParallax ; irr_node
DIM $OurCamera ; irr_camera
DIM $Light ; irr_node


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 94: Bump Mapping" )

; load a mesh this acts ; a blue print for the model
$ModelMesh = _IrrGetMesh( "../media/sphere.obj" )

; the mesh is quite small so scale it up without effecting lighting
_IrrScaleMesh( $ModelMesh, 12.5 )

; load texture resources for texturing the scene node
$DiffuseTexture = _IrrGetTexture( "../media/water.png" )
$BumpTexture = _IrrGetTexture( "../media/earthbump.bmp" )

; convert the grey scale image into a normal mapping texture. if you wish you
; can create your own normal mapping texture but it is often simpler to create
; a simple greyscale image ; a bump map that defines the height of the surface
_IrrMakeNormalMapTexture( $BumpTexture, 9.0 )

; add the mesh to the scene twice to display two types of bump mapping effects
; the mesh is added with a special command that creates a model with lighting
; information embedded into it this is required for bump mapping
$SceneNodeNormal = _IrrAddStaticMeshForNormalMappingToScene( $ModelMesh )
_IrrSetNodePosition( $SceneNodeNormal, 0, 0, -15 )
$SceneNodeParallax = _IrrAddStaticMeshForNormalMappingToScene( $ModelMesh )
_IrrSetNodePosition( $SceneNodeParallax, 0, 0, 15 )

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNodeNormal, $DiffuseTexture, 0 )
_IrrSetNodeMaterialTexture( $SceneNodeNormal, $BumpTexture, 1 )
_IrrSetNodeMaterialTexture( $SceneNodeParallax, $DiffuseTexture, 0 )
_IrrSetNodeMaterialTexture( $SceneNodeParallax, $BumpTexture, 1 )

; Bump mapping is pointless unless lighting in enabled. we set the materials on
; one of the nodes to Normal Mapping and on the other to Parallax mapping.
; parallax mapping gives a richer deeping bump mapping effect but does require
; a more modern graphics card
_IrrSetNodeMaterialType ( $SceneNodeNormal, $IRR_EMT_NORMAL_MAP_SOLID )
_IrrSetNodeMaterialType ( $SceneNodeParallax, $IRR_EMT_PARALLAX_MAP_SOLID )
_IrrSetNodeMaterialFlag( $SceneNodeNormal, $IRR_EMF_LIGHTING, $IRR_ON )
_IrrSetNodeMaterialFlag( $SceneNodeParallax, $IRR_EMF_LIGHTING, $IRR_ON )

; add a camera into the scene
$OurCamera = _IrrAddCamera( 40,0,0, 0,0,0 )

; finally we need to add a light into the scene. bump mapping requires a
; dynamic light to create the bump mapping effect. additionally the lights need
; to be animated to show the changing light on the surface.
$Light = _IrrAddLight( $IRR_NO_PARENT, 100,100,-100, 0.9,0.3,0.3, 600.0 )
_IrrAddFlyCircleAnimator( $Light, 0,0,0, 100, 0.001 )

; hide the mouse pointer away
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
local $frameTime = TimerInit()
WHILE _IrrRunning()
    ; is it time for another frame
	if TimerDiff($frameTime) > 16.7 then
		; record the start time of this frame
        $frameTime = TimerInit()

        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 0, 0, 0 )

        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()
    EndIf
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
