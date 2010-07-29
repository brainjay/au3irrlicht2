; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 08: Shadows and Lights
; This example loads a map and a model into the scene and then applies realtime
; shadows to the model cast from lights in the scene that can be seen on the
; surface of other objects.
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
DIM $BSPMesh ; irr_mesh
DIM $BSPNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $Light ; irr_node

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, $IRR_WINDOWED, _
          $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 08: Shadows and Lights" )

; load the MD2 model from example 4 into the scene
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

; load the bsp map from example 5 into the scene
_IrrAddZipFile( "../media/map-20kdm2.pk3", $IRR_IGNORE_CASE, $IRR_IGNORE_PATHS )
$BSPMesh = _IrrGetMesh( "20kdm2.bsp" )
$BSPNode = _IrrAddMeshToSceneAsOcttree( $BSPMesh )

; move the map into position around the model
_IrrSetNodePosition( $BSPNode, -1370,-88,-1400)

; add a camera into the scene
$OurCamera = _IrrAddCamera( 50,0,0, 0,0,0 )

; switching shadows on is very simple just call the command for the scene node
; that you want to cast shadows
_IrrAddNodeShadow( $SceneNode )

; the shadow colour is a global property for the whole scene (however you can
; change it ; you move into different areas of your scene) the first
; parameter is the alpha blend for the shadow this shadow is half washed out
; which gives the appearence of ambient light in the room illuminating the
; shadowed surface, the second set of numbers defines the color of the shadow
; which in this case is black
_IrrSetShadowColor( 128, 0, 0, 0 )

; finally we need to add a light into the scene to cast some shadows. when using
; shadows you probably only want one or two lights ; they can be time consuming
; the first set of parameters for this light specify the position its created
; at, the second set of parameters define the color - rather than 255 integer
; levels the intensity of red/green/blue is defined from 0 to 1 and finally
; you define the radius of effect of the light
$Light = _IrrAddLight( $IRR_NO_PARENT, 100,100,-100, 0.9,0.3,0.3, 600.0 )

; the second light is an ambient light and illuminates all surfaces in the scene
; uniformly. this is usually a low value that is used to change the lighting
; level across the entire scene
_IrrSetAmbientLight( 0.1, 0.1, 0.1 )


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
