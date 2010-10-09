; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 89 : Orthagonal Camera
; This example creates a split screen display where one of the cameras displays
; a persepective view and the other displays an orthagonal view
; ----------------------------------------------------------------------------


; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "..\au3Irrlicht2.au3"
opt("MustDeclareVars", True)
HotKeySet("{ESC}", "_exit")

; needed to get camera keys working properly - see main loop
#include <Misc.au3>
opt("SendKeyDelay", 0)

Func _exit()
	_IrrStop()
	Return
EndFunc ; _exit

; ////////////////////////////////////////////////////////////////////////////
; global variables

; irrlicht objects
DIM $MD2Mesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $FirstCamera ; irr_camera
DIM $SecondCamera ; irr_camera
DIM $camPos[3] ; irr_vector
DIM $keyStruct ; needed for setup of FPS cam

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 400, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 89: Orthagonal Camera (use WASD + mouse)" )

; add credits for the model ; a static text GUI object on the display
_IrrAddStaticText( "Zumlin model by Rowan 'Sumaleth' Crawford", 4,0,200,16, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )
_IrrSetNodeScale( $SceneNode, 20,20,20 )

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; play an animation sequence embeded in the mesh. MD2 models have a group of
; preset animations for various poses and actions. this animation sequence is
; the character standing idle
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$FirstCamera = _IrrAddFPSCamera(0, 100, 0.5, -1, __CreatePtrKeyMapArray($keyStruct), 4)
_IrrSetNodePosition( $FirstCamera, 500,0,0 )
_IrrSetCameraTarget( $FirstCamera, 0,0,0 )
$SecondCamera = _IrrAddCamera( -500,0,0, 0,0,0 )

; the window we are opening is twice wide it is high. All camera objects are
; given a default aspect ratio of 0.5, however we want to draw two windows side
; by side 400x400 so we need to set the aspect ratios of the camera to 1.0
_IrrSetCameraAspectRatio( $FirstCamera, 1.0 )
_IrrSetCameraAspectRatio( $SecondCamera, 1.0 )

; hide the mouse pointer
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    ; draw the scene on the left
    _IrrSetActiveCamera( $FirstCamera )

; Direction events are only captured while the FPS cam is active. This main loop
; switches permanently between two cams, which may result in lost events during
; activity of second cam. If a released direction key is lost, the FPS cam will
; move on and on ...
; Seems to be an au3 specific problem, the original freeBasic example works
; well - maybe au3 is simply to slow because interpreted, not really compiled.
; Own processing of all waiting events should avoid this (see example 014), but for
; this small example we do it quick and dirty by 'preventive' release of direction
; keys. Please notice the opt("SendKeyDelay", 0) at top of the script, otherwise
; every single send would create a 5 ms delay - so up to 20 ms lost every frame!
	if NOT _IsPressed(57) then Send("{w up}")
	if NOT _IsPressed(41) then Send("{a up}")
	if NOT _IsPressed(53) then Send("{s up}")
	if NOT _IsPressed(44) then Send("{d up}")

	_IrrSetViewPort( 0,0,400,400 )
    _IrrDrawScene()

    ; Make the second camera track the first camera by copying the first camera
    ; position and target into the second camera
    _IrrGetCameraTarget( $FirstCamera, $camPos)
    _IrrSetCameraTarget( $SecondCamera, $camPos[0], $camPos[1], $camPos[2] )
    _IrrGetNodePosition( $FirstCamera, $camPos)
    _IrrSetNodePosition( $SecondCamera, $camPos[0], $camPos[1], $camPos[2] )

    ; Set the orthagonal settings of the second camera, this switches
    ; perspective display off on this camera. the X, Y and Z values are
    ; the distance to the target, but ; Zumlin is at 0,0,0 this distance is
    ; simply the cameras position. if we were looking at a target that was not
    ; at 0,0,0 we would supply the parameters ; camPos.X - targetPos.X etc...
    ; this distance generates a zoom effect making the model bigger and smaller
    ; in the display.
    _IrrSetCameraOrthagonal( $SecondCamera, $camPos[0], $camPos[1], $camPos[2] )

    ; draw the scene on the left
    _IrrSetActiveCamera( $SecondCamera )
    _IrrSetViewPort( 400,0,800,400 )
    _IrrDrawScene()
    ; set the viewport back to the whole screen
    _IrrSetViewPort( 0,0, 800,400 )

	; switch back to the first Camera so that key events are send to it
    _IrrSetActiveCamera( $FirstCamera )
	; draw the GUI
    _IrrDrawGUI()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
