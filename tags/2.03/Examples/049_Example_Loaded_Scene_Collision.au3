; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 49 : Collision in a Loaded IrrEdit Scene
; This example demonstrates collision in a scene that was created in IrrEdit
; the nodes in the scene are found and then collision selection objects are
; created for them in the same way ; you would with a custom created scene
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
DIM $Camera ; irr_camera
DIM $CameraNode ; irr_node
DIM $NodeGround ; irr_node
DIM $NodeBox ; irr_node
DIM $SelectorGround ; irr_selector
DIM $SelectorBox ; irr_selector
DIM $CombinedCollision ; irr_selector
DIM $CollisionAnimator ; irr_animator


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800,600, 32, $IRR_WINDOWED, _
          $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 49: Collision in a Loaded Scene" )

; load an example scene created in irrEdit
_IrrChangeWorkingDirectory("../media")
_IrrLoadScene( "CollisionScene.irr" )

; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$Camera = _IrrAddFPSCamera()
$CameraNode = $Camera
_IrrSetNodePosition( $CameraNode, 200, 100, 0 )
_IrrSetNodeRotation( $CameraNode, 0, -90, 0 )

; first we need to get references to the objects in the scene that the viewer
; can collide with
$NodeGround = _IrrGetSceneNodeFromName( "Ground" )
$NodeBox = _IrrGetSceneNodeFromName( "Pillar" )

; next we need to create collision objects from the nodes
$SelectorGround = _IrrGetCollisionGroupFromBox( $NodeGround )
$SelectorBox = _IrrGetCollisionGroupFromBox( $NodeBox )

; now that we have collision objects for each of the nodes we need to combine
; them into a collision group
$CombinedCollision = _IrrCreateCombinedCollisionGroup ()

; creates a meta-selector that is a group of selector objects
_IrrAddCollisionGroupToCombination ( $CombinedCollision, $SelectorGround )
_IrrAddCollisionGroupToCombination ( $CombinedCollision, $SelectorBox )

; finally we add a collision animator to the camera, this constrains the camera
; so that its movement is restricted by collision with the collision groups we
; just created. the parameters we supply are ; follows: -
;       The collision objects, the node to be effected by collision,
;       x, y and z radius of the collision area,
;       x, y and z force of gravity to apply to the node affected by collision,
;       x, y and z offset of the node
$CollisionAnimator = _IrrAddCollisionAnimator( _
        $CombinedCollision, $CameraNode, _
        30.0,30.0,30.0, _
        0.0,-3.0,0.0, _
        0.0,50.0,0.0 )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 200, 200, 255 )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
