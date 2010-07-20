; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 46 : Spotlight
; This example creates a simple scene and then animates a spotlight moving
; across its surface
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
DIM $ObjectTexture ; irr_texture
DIM $SphereMesh ; irr_mesh
DIM $SphereNode ; irr_node
DIM $HillMesh ; irr_mesh
DIM $HillNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $Light ; irr_node
DIM $rotation = 70 ; single = 70


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 46: Spotlight" )

; load texture resources for texturing the scene nodes
$ObjectTexture = _IrrGetTexture( "./media/water.png" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SphereNode = _IrrAddSphereSceneNode( 20.0, 32 )

; add a hill plane mesh to the mesh pool, the flat surface is created from a
; flat hillplane so that there are a number of verticies in the object that
; better reflect the lighting effect
$HillMesh = _IrrAddHillPlaneMesh( "HillPlane", 5, 5, 32, 32 )
$HillNode = _IrrAddMeshToScene( $HillMesh )
_IrrSetNodePosition( $HillNode, 0, -20, 0 )

; apply a material to the nodes to give them surface color
_IrrSetNodeMaterialTexture( $SphereNode, $ObjectTexture, 0 )
_IrrSetNodeMaterialTexture( $HillNode, $ObjectTexture, 0 )

; add a simple point light
$Light = _IrrAddLight( $IRR_NO_PARENT, 30,200,0, 1.0,1.0,1.0, 600.0 )

; convert the light into a spotlight and set the light cones attributes
_IrrSetLightType( $Light, $ELT_SPOT )
_IrrSetLightInnerCone( $Light, 10 )
_IrrSetLightOuterCone( $Light, 20 )
_IrrSetLightFalloff( $Light, 100.0 )

; add a camera into the scene
$OurCamera = _IrrAddCamera( 0,50,50, 0,0,0 )

; -----------------------------------------------------------------------------
; Display the scene for 500 frames
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 0, 0, 16 )

    ; swing the light node around slowly
    _IrrSetNodeRotation( $Light, $rotation, 0, 0 )
    $rotation += 0.01


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
