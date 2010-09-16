; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 90 : Getting the point of collision
; This example gets the acurate point of collision between the triangles of a
; node and a ray we cast out into the scene through the center of the camera
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
DIM $TestTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $TestNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $CollisionGroup ; irr_selector
DIM $StartVector[3] ; $IRR_VECTOR
DIM $EndVector[3] ; $IRR_VECTOR
DIM $CollideAt[3] ; $IRR_VECTOR


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 90: Getting the point of collision" )

; load a mesh
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing models
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )
$TestTexture = _IrrGetTexture( "../media/texture.jpg" )

; add the mesh to the scene
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; add a test node to the scene, we are going to use this test node ; the
; marker for the point that is detected by the collision
$TestNode = _IrrAddTestSceneNode()
; rescale the node so that it is an unobtrusive size
_IrrSetNodeScale( $TestNode, 0.2, 0.2, 0.2 )

; apply materials to the objects
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )
_IrrSetNodeMaterialTexture( $TestNode, $TestTexture, 0 )

; switch off lighting effects on the model
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; stop the animation playing
_IrrSetNodeAnimationRange( $SceneNode, 0,0)

; add a first person camera into the scene and point it at the model
$OurCamera = _IrrAddFPSCamera()
_IrrSetNodePosition( $OurCamera, 50,0,0 )
_IrrSetCameraTarget( $OurCamera, 0,0,0 )

; create a simple collision group from the triangles containing within the
; bounding box of the model
$CollisionGroup = _IrrGetCollisionGroupFromMesh( $MD2Mesh, $SceneNode )

; hide the mouse from the display so we can see things better
_IrrHideMouse()

DIM $xpos, $ypos, $zpos, $xnorm, $ynorm, $znorm
DIM $nodeHit
; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    _IrrGetNodePosition( $OurCamera, $StartVector )
    _IrrGetCameraTarget( $OurCamera, $EndVector )

    ; extend the line through the target point for 5000 times its origonal length
    $EndVector[0] += (($EndVector[0] - $StartVector[0]) * 5000)
    $EndVector[1] += (($EndVector[1] - $StartVector[1]) * 5000)
    $EndVector[2] += (($EndVector[2] - $StartVector[2]) * 5000)

    ; reset the collision point so that if the
    $CollideAt[0] = 0
	$CollideAt[1] = 0
	$CollideAt[2] = 0

    ; using the line we have defined and the collision group created from the
    ; object get the point at which the two collide
    $nodeHit = _IrrGetNodeAndCollisionPointFromRay ( _
        $StartVector, $EndVector, _
        $nodeHit, $xpos,$ypos,$zpos, $xnorm,$ynorm,$znorm )
    if NOT $nodeHit = $IRR_NO_OBJECT then
        _IrrSetNodeMaterialFlag( $nodeHit, $IRR_EMF_LIGHTING, $IRR_OFF )
    else
        _IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_ON )
    endif

    ; move the test object to this location to indicate the point of collision
    _IrrSetNodePosition( $TestNode, $xpos,$ypos,$zpos )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
