; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 20 : Getting the point of collision
; This example gets the point of collision between a selector group and a ray
; we cast out into the scene through the center of the camera
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
DIM $aStartVector[3] ; $IRR_VECTOR
DIM $aEndVector[3] ; $IRR_VECTOR
DIM $aCollideAt[3] ; $IRR_VECTOR


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 20: Getting the point of collision" )
dim $BitmapFont = _IrrGetFont ( "../media/bitmapfont.bmp" )

; load a mesh
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing models
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )
$TestTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )

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
$CollisionGroup = _IrrGetCollisionGroupFromBox( $SceneNode )

; hide the mouse from the display so we can see things better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    ;_IrrBeginScene( 240, 255, 255 )
	_IrrBeginScene( 50, 50, 50 )

    _IrrGetNodePosition( $OurCamera, $aStartVector )
    _IrrGetCameraTarget( $OurCamera, $aEndVector )

    ; extend the line through the target point for 5000 times its origonal length

    ; reset the collision point so that if the
	$aCollideAt[0] = 0
	$aCollideAt[1] = 0
	$aCollideAt[2] = 0

    ; using the line we have defined and the collision group created from the
    ; object get the point at which the two collide
    _IrrGetCollisionPoint( $aStartVector, $aEndVector, $CollisionGroup, $aCollideAt )

    ; move the test object to this location to indicate the point of collision
    _IrrSetNodePosition( $TestNode, $aCollideAt[0], $aCollideAt[1], $aCollideAt[2] )

	_Irr2DFontDraw( $BitmapFont, "POINT OF COLISION " & Ceiling($aCollideAt[0]) & " " & Ceiling($aCollideAt[1]) _
					& " " & Ceiling($aCollideAt[2]) & "              ", 4, 4, 250, 24 )
	; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
