; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 31 : Loading an IrrEdit Scene
; This example loads a scene created with the IrrEdit tool this allows a large
; number of meshes, textures and nodes to be loaded and created in one call
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


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( 3, 800, 600, 32, $IRR_WINDOWED, _
          $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 31: Loading a scene" )

; load an example scene created in irrEdit
_IrrLoadScene( "../media/SimpleScene.irr" )

; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$Camera = _IrrAddFPSCamera()
$CameraNode = $Camera
_IrrSetNodePosition( $CameraNode, 60, 0, 0 )
_IrrSetNodeRotation( $CameraNode, 0, -90, 0 )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

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
