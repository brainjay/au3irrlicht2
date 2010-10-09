; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 92: Moving Entities by Collision
; This example loads a map and a character model into the scene and then
; uses a collision function to let the character walk up the stairs in the map
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

DIM $selector ; irr_selector
DIM $ellipsoidPosition[3] ; $IRR_VECTOR
DIM $ellipsoidRadius[3] ; $IRR_VECTOR
DIM $velocity[3] ; $IRR_VECTOR
DIM $gravity[3] ; $IRR_VECTOR
DIM $outPosition[3] ; $IRR_VECTOR
DIM $outHitPosition[3] ; $IRR_VECTOR
DIM $outFalling ; Integer

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart(   $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
            $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 92: Moving Entities by Collision" )

; Load the character mode
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_RUN )
_IrrSetNodeScale( $SceneNode, 1.25, 1.25, 1.25 )
_IrrSetNodeRotation( $SceneNode, 0, 90, 0 )

; load the bsp environment
_IrrAddZipFile( "../media/map-20kdm2.pk3", $IRR_IGNORE_CASE, $IRR_IGNORE_PATHS )
$BSPMesh = _IrrGetMesh( "20kdm2.bsp" )
$BSPNode = _IrrAddMeshToSceneAsOcttree( $BSPMesh )

; move the map into position around the model
_IrrSetNodePosition( $BSPNode, -1370,-88,-1400)

; create a collision object from the map
$selector = _IrrGetCollisionGroupFromComplexMesh( $BSPMesh, $BSPNode )

; This is the velocity the character moves each frame, the upward velocity seams
; to help the character climb stairs but it should never be greater than gravity
$velocity[0] = 0.0
$velocity[1] =  2.0
$velocity[2] = -3.0

; the direction of gravity pulling the character to the ground, if you apply too
; little gravity you may find your character doesn't move
$gravity[0]  = 0.0
$gravity[1]  = -2.8
$gravity[2]  =  0.0

; the position of the character in the scene (just at the top of the stairs)
$ellipsoidPosition[0] = 40.0
$ellipsoidPosition[1] = 140.0
$ellipsoidPosition[2] = 500.0

; the size of the collision volume. this is important in moving up steps. too
; large and you will get stuck in a doorway, too small and you won't climb stairs
$ellipsoidRadius[0] = 30.0
$ellipsoidRadius[1] = 60.0
$ellipsoidRadius[2] = 30.0

; add a camera into the scene
$OurCamera = _IrrAddCamera( 150,0,0, 0,0,0 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
Dim $timer = TimerInit()
WHILE _IrrRunning()
    ; is it time for another frame
    if TimerDiff($timer) > 16.7 then
        ; calculate the time the next frame starts
        $timer = TimerInit()

        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 240, 255, 255 )

        ; Collides a moving ellipsoid with a 3d world with gravity and returns the
        ; resulting new position of the ellipsoid.
        _IrrGetCollisionResultPosition ( _
                $selector, _
                $ellipsoidPosition, _
                $ellipsoidRadius, _
                $velocity, _
                $gravity, _
                0.0005, _
                $ellipsoidPosition, _
                $outHitPosition, _
                $outFalling )

        ; move the character to the position that is the result of the test
        _IrrSetNodePosition( $SceneNode, _
                            $ellipsoidPosition[0], _
                            $ellipsoidPosition[1] + $gravity[1] - 30.0, _
                            $ellipsoidPosition[2] )

        ; make the camera follow the character
        _IrrSetNodePosition( $OurCamera, _
                            $ellipsoidPosition[0] + 50.0 + ($ellipsoidPosition[2] - 500 ) / 10.0, _
                            $ellipsoidPosition[1] + $gravity[1] + 40.0, _
                            $ellipsoidPosition[2] + 40.0 )

        ; point the camera at the character
        _IrrSetCameraTarget( $OurCamera, _
                            $ellipsoidPosition[0], _
                            $ellipsoidPosition[1] + $gravity[1], _
                            $ellipsoidPosition[2] )

        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()
    endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
