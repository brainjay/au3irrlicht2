; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 58 : Limiting Collision with a Ray
; This example highlights a node selected by collision with a ray, the subset
; of objects in the scene is limited by only testing objects with a specific
; ID this can greatly reduce the number of objects that need to be consided
; thereby reducing the amount of processing required and making time for more
; activites, such ; more tests perhaps
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
DIM $MeshTexture ; irr_texture
DIM $TestNode ; irr_node
DIM $SelectedNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $start_vector[3] ; $IRR_VECTOR
DIM $end_vector[3] ; $IRR_VECTOR

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 58: Limited collision with a ray" )

; load the test cube texture
$MeshTexture = _IrrGetTexture( "../media/texture.jpg" )

; create all of the test nodes
$TestNode = _IrrAddTestSceneNode()
_IrrSetNodeID( $TestNode, 1 )
_IrrSetNodePosition( $TestNode, -100, 0, 100 )
_IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

$TestNode = _IrrAddTestSceneNode()
_IrrSetNodePosition( $TestNode, 0, 0, 100 )
_IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

$TestNode = _IrrAddTestSceneNode()
_IrrSetNodePosition( $TestNode, 100, 0, 100 )
_IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

$TestNode = _IrrAddTestSceneNode()
_IrrSetNodePosition( $TestNode, 200, 0, 100 )
_IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; add a camera into the scene and move it into position
$OurCamera = _IrrAddFPSCamera()
_IrrHideMouse()
_IrrSetNodePosition( $OurCamera, 50, 0, -200 )

; define a ray starting at (0,0,0) to (0,0,1000)
$start_vector[0] = -200
$start_vector[1] = 0
$start_vector[2] = 100

$end_vector[0] = 1000
$end_vector[1] = 0
$end_vector[2] = 100

$SelectedNode = $IRR_NO_OBJECT

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with grey before rendering
    _IrrBeginScene( 128,128,128 )

    ; draw the scene
    _IrrDrawScene()

    ; the selection test must be performed inside the main loop
    ; we only need to perform it once
    if $SelectedNode = 0 then
        ; we will be testing all objects in the scene so get the parent object
        ; of all scene objects
        $TestNode = _IrrGetRootSceneNode()

        ; get the nearest node that collides with the ray we defined earlier
        ; the ID must also contain the bit pattern of '2'. this excludes the
        ; first object we created ; we gave that an ID of 1
        $SelectedNode = _IrrGetChildCollisionNodeFromRay( $TestNode, 2, $IRR_OFF, $start_vector, $end_vector )

        ; if a node was selected
        if NOT $SelectedNode = 0 then
            ; switch lighting off on this node to indicate that it is selected
            _IrrSetNodeMaterialFlag( $SelectedNode, $IRR_EMF_LIGHTING, $IRR_ON )
        endif
    endif

    ; draw the ray so we can see what is happening
    _IrrDraw3DLine( -200,0,100, 1000,0,100, 255,0,0 )
    _IrrDraw3DLine( -200,5,95, -200,-5,105, 255,0,0 )
    _IrrDraw3DLine( -200,-5,95, -200,5,105, 255,0,0 )

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
