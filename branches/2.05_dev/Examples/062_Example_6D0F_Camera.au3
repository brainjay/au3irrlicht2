; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 62 : Camera with Six Degrees of freedom
; This example allows you to control the camera using movements that are free
; all six degrees, this action is very important for camera motions that
; represent aircraft and spacecraft movements
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "..\au3Irrlicht2.au3"
#include <misc.au3>

opt("MustDeclareVars", True)
HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit

; ////////////////////////////////////////////////////////////////////////////
; global variables

; irrlicht objects
DIM $SkyBox ; irr_node
DIM $Camera ; irr_camera
DIM $MeshTexture ; irr_texture
DIM $TestNode ; irr_node

; camera control objects
DIM $yaw = 0
DIM $yaw_dif = 0
DIM $pitch = 0
DIM $pitch_dif = 0
DIM $roll_dif = 0
DIM $KeyEvent ; IRR_KEY_EVENT PTR
DIM $KeyEvent_Dir
DIM $MouseEvent ; IRR_MOUSE_EVENT PTR
DIM $X = 0
DIM $Y = 0
DIM $drive = 0
DIM $strafe = 0
DIM $elevate = 0


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 62: Camera with Six Degrees of freedom (Mouse + QWEASDXC)" )

; the skybox is a simple hollow cube that surrounds the whole scene. textures
; are applied to all of the six sides of the cube creating an image around the
; entire scene instead of simply the color of the blank canvas
; here we load the textures ; parameters of the skybox command (they could
; of course be loaded seperatly and assigned to irr_texture variables
$SkyBox = _IrrAddSkyBoxToScene( _
        _IrrGetTexture("../media/irrlicht2_up.jpg"), _
        _IrrGetTexture("../media/irrlicht2_dn.jpg"), _
        _IrrGetTexture("../media/irrlicht2_rt.jpg"), _
        _IrrGetTexture("../media/irrlicht2_lf.jpg"), _
        _IrrGetTexture("../media/irrlicht2_ft.jpg"), _
        _IrrGetTexture("../media/irrlicht2_bk.jpg"))

$MeshTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )
$TestNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; here we add in the camera object. this is the recommended starting position
; for a camera pointing forward at a right angle to the default up direction
$Camera = _IrrAddCamera( 0,0,0, 0,0,1 )

; when using six degrees of freedom controls if you need to use
; _IrrSetNodePosition, IrrSetCameraTarget or IrrSetCameraUpDirection you will
; have to make sure the camera position, target and up direction are at right
; angles to one another the IrrSetCameraUpAtRightAngle command is provided to
; allow you to do this simply.
_IrrSetNodePosition( $Camera, 70, 100, 0 )
_IrrSetCameraTarget( $Camera, 0,0,0 )
_IrrSetCameraUpAtRightAngle( $Camera )

; when performing camera operations you need to take note of the order that the
; transformations are applied. in the following example the camera is pitched
; down 90 degrees and then elevated 100 units. This is alot different from
; elevating 100 units and then pitching down 90 degrees
;    IrrRevolveCamera( Camera, 0, -1.571, 0,  0, 0, 100 )

; hide the mouse pointer
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )
    $X = 0.5
	$Y = 0.5
    _IrrSetMousePosition( $X, $Y )

    ; while there are mouse events waiting
    while _IrrMouseEventAvailable()
        ; read the mouse event out
        $MouseEvent = _IrrReadMouseEvent()

        ; if this is a mouse move event
        if __getMouseEvt($MouseEvent, $EVT_MOUSE_IACTION) = $IRR_EMIE_MOUSE_MOVED then
            ; spin the camera around
            $yaw_dif = $X - 0.5
            $yaw_dif /= 1
            $yaw = $X

            $pitch_dif = $Y - 0.5
            $pitch_dif /= 1
            $pitch = $Y
        endif
    wend

    ; while there are key events waiting to be processed
    while _IrrKeyEventAvailable()

        ; read the key event out. the key event has three parameters the key
        ; scan code, the direction of the key and flags that indicate whether
        ; the control key or the shift keys were also pressed
        $KeyEvent = _IrrReadKeyEvent()
		$KeyEvent_Dir = __getKeyEvt($KeyEvent, $EVT_KEY_IDIRECTION)

        ; arbitrate based on the key that was pressed
        switch __getKeyEvt($KeyEvent, $EVT_KEY_IKEY)
			case $KEY_KEY_Q ; if the key is going down
				$roll_dif = _Iif($KeyEvent_Dir = $IRR_KEY_DOWN, 0.005, 0.0)
			case $KEY_KEY_E ; if the key is going down
				$roll_dif = _Iif($KeyEvent_Dir = $IRR_KEY_DOWN, -0.005, 0.0)

			case $KEY_KEY_W ; if the key is going down
				$drive = _Iif($KeyEvent_Dir = $IRR_KEY_DOWN, 0.1, 0.0)
			case $KEY_KEY_S ; if the key is going down
				$drive = _Iif($KeyEvent_Dir = $IRR_KEY_DOWN, -0.1, 0.0)

			case $KEY_KEY_A ; if the key is going down
				$strafe = _Iif($KeyEvent_Dir = $IRR_KEY_DOWN, 0.1, 0.0)
			case $KEY_KEY_D ; if the key is going down
				$strafe = _Iif($KeyEvent_Dir = $IRR_KEY_DOWN, -0.1, 0.0)

			case $KEY_KEY_C ; if the key is going down
				$elevate = _Iif($KeyEvent_Dir = $IRR_KEY_DOWN, 0.1, 0.0)
			case $KEY_KEY_X ; if the key is going down
				$elevate = _Iif ($KeyEvent_Dir = $IRR_KEY_DOWN, -0.1, 0.0)
		EndSwitch

    wend

    _IrrRevolveCamera( $Camera, -$roll_dif, $pitch_dif, -$yaw_dif, $drive, $strafe, $elevate )
    $yaw_dif = 0.0
    $pitch_dif = 0.0

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND


; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
