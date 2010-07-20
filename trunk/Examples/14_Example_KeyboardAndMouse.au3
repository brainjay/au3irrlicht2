; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 14 : Keyboard and Mouse
; This example captures keyboard and mouse events it uses the keyboard events
; to straff the camera around with the arrow keys (in a simple manner) and
; displays the mouse information on the screen. Please take careful note of
; the _IrrStart command that has now been changed to capture events
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
DIM $BSPMesh ; irr_mesh
DIM $BSPNode ; irr_node
DIM $Camera ; irr_camera
DIM $CameraNode ; irr_node
DIM $MapCollision ; irr_selector
DIM $BitmapFont ; irr_font
DIM $ret ; irr_selector
DIM $pKeyEvent ; $IRR_KEY_EVENT PTR
dim $keyCode
DIM $pMouseEvent ; $IRR_MOUSE_EVENT PTR
DIM $POS[3] ; single
DIM $metrics ; wstring * 256
DIM $XStrafe ; integer
DIM $ZStrafe ; integer
DIM $SPIN ; single
DIM $TILT ; single
DIM $vX[3] ; $IRR_VECTOR
DIM $vY[3] ; $IRR_VECTOR
DIM $vZ[3] ; $IRR_VECTOR
DIM $MX ; single
DIM $MY ; single


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
; here we
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 14: Keyboard and Mouse" )

; first we load the example map into the scene for details on this please
; read example 5
_IrrAddZipFile( "./media/map-20kdm2.pk3", $IRR_IGNORE_CASE, $IRR_IGNORE_PATHS )
$BSPMesh = _IrrGetMesh( "20kdm2.bsp" )
$BSPNode = _IrrAddMeshToSceneAsOcttree( $BSPMesh )

; next we add a first person perspective camera to the scene
$Camera = _IrrAddCamera( 0,0,0, 0,0,0 )
; $Camera = _IrrAddFPSCamera()

; and move it into the middle of the map
$CameraNode = $Camera
_IrrSetNodePosition( $CameraNode, 1750, 149, 1369 )
_IrrSetNodeRotation( $CameraNode, 4, -461.63, 0 )


; the first thing we need to do with collision is to create an object called a
; selector that contains a selection of triangle to be used in the collision
; calculations there are a number of different ways of doing this depending on
; the type of mesh you are working with. in this example we are using the
; complex BSP map and therefore should use the following command
$MapCollision = _IrrGetCollisionGroupFromComplexMesh( $BSPMesh, $BSPNode )


; now we can add the sixth and final animator to our camera object the collision
; animator. This takes a long list of parameters that define the following :-
; 1) the collision object created from the map
; 2) the node that is going to be collided against the map
; 3) 3 vaues defining the radius of the node (the camera in this case). if you
;    make this value too small you wont be able to climb steps, if its too big
;    you might get stuck in a doorway or be able to jump over a wall. the best
;    thing to do is to have some fun experimenting
; 4) 3 values defining the pull of gravity, in this case a weak downward force
; 5) finally 3 values defining the offset of the node from the collision point
;    this will enable you to bring an object to the surface
$CameraNode = $Camera
$ret = _IrrAddCollisionAnimator($MapCollision, _
                                $CameraNode, _
                                30.0,30.0,30.0, _
                                0.0,-3.0,0.0, _
                                0.0,50.0,0.0 )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "./media/bitmapfont.bmp" )

; hide the mouse pointer
_IrrHideMouse()

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

        ; We need to set the mouse back to the center of the screen so that it
        ; doesnt wander off. when we do this MX and MY will contain how far the
        ; mouse was moved so it was back in the center of the screen
        $MX = 0.5
		$MY = 0.5
        _IrrSetMousePosition( $MX, $MY )

        ; get the position of the camera
        _IrrGetNodePosition( $CameraNode, $POS)

        ; while there are key events waiting to be processed
        while _IrrKeyEventAvailable()

            ; read the key event out. the key event has three parameters the key
            ; scan code, the direction of the key and flags that indicate whether
            ; the control key or the shift keys were also pressed
            $pKeyEvent = _IrrReadKeyEvent()

            ; arbitrate based on the key that was pressed
			$keyCode = __getKeyEvt($pKeyEvent, $EVT_KEY_IKEY)
            select
            case $keyCode = $KEY_KEY_D     ; Left Arrow
                ; if the key is going down
                if __getKeyEvt($pKeyEvent, $EVT_KEY_IDIRECTION) = $IRR_KEY_DOWN then
                    $XStrafe = 5
                else
                    if $XStrafe = 5 then
                        $XStrafe = 0
                    endif
                endif

            case $keyCode = $KEY_KEY_W     ; Up Arrow
                ; if the key is going down
                if __getKeyEvt($pKeyEvent, $EVT_KEY_IDIRECTION) = $IRR_KEY_DOWN then
                    $ZStrafe = 5
                else
                    if $ZStrafe = 5 then
                        $ZStrafe = 0
                    endif
                endif

            case $keyCode = $KEY_KEY_A     ; Right Arrow
                ; if the key is going down
                if __getKeyEvt($pKeyEvent, $EVT_KEY_IDIRECTION) = $IRR_KEY_DOWN then
                    $XStrafe = -5
                else
                    if $XStrafe = -5 then
                        $XStrafe = 0
                    endif
                endif

            case $keyCode = $KEY_KEY_S     ; Down Arrow
                ; if the key is going down
                if __getKeyEvt($pKeyEvent, $EVT_KEY_IDIRECTION) = $IRR_KEY_DOWN then
                    $ZStrafe = -5
                else
                    if $ZStrafe = -5 then
                        $ZStrafe = 0
                    endif
                endif

            endselect
        wend

        ; this command gets the camera orientation these are vectors describing the
        ; cameras forward updward and sideways vector
		_IrrGetCameraOrientation( $Camera, $vX,$vY,$vZ)

        ; these vectors will be different lengths depending on how much the camera
        ; is rotated we can use these values to add the fowards distance to both the
        ; X and Z position by different amounts that are related to the direction
        ; that the camera is pointed
        $POS[0] += $vY[0] * $ZStrafe + $vY[2] * $XStrafe
        $POS[2] -= $vY[0] * $XStrafe - $vY[2] * $ZStrafe

        ; update the position of the camera we call this before Draw Scene so that
        ; the objects positions are updated before we draw the scene
        _IrrSetNodePosition($CameraNode, $POS[0], $POS[1], $POS[2])

        ; while there are mouse events waiting
        while _IrrMouseEventAvailable()
            ; read the mouse event out
            $pMouseEvent = _IrrReadMouseEvent()

            ; if this is a mouse move event
            if __getMouseEvt($pMouseEvent, $EVT_MOUSE_IACTION) = $IRR_EMIE_MOUSE_MOVED then
				; create a wide string with a list of the positions in
				$metrics = "POSITION " & __getMouseEvt($pMouseEvent, $EVT_MOUSE_IX) & " " & __getMouseEvt($pMouseEvent, $EVT_MOUSE_IY)
            endif
        wend

        ; MX contains the distance the mouse was moved we can use this to raise or
        ; lower a number that is used to set the camera spin
        $SPIN += ( $MX - 0.5 ) * 2.0

        ; MY contains the distance the mouse was moved vertically we can use this
        ; raise or lower a number that is used to control the camera tilt
        $TILT += ( $MY - 0.5 ) * 2.0

        ; the camera can spin around in circles but it should only be able to tilt
        ; up a down a certain distance otherwise if the player moved their mouse up
        ; a lot they would see very little change at the top but the target would
        ; still be rising a long way into the distance. however they would need to
        ; moved their mouse down a lot to get the camera to tilt back down. this
        ; would feel very strange
        if $TILT > 1.5 then $TILT = 1.5
        if $TILT < -1.5 then $TILT = -1.5

        ; we change the camera direction by setting the cameras target
        ; the X target is the cameras position plus the Sin value of the SPIN
        ; the Z target is the cameras position plus the Cos value of the SPIN
        ; together the Cos and Sin of a constantly rising number will plot cirlce
        ; and when added to the camera position we get a circle going around camera
        ; by multipling the value by a 1000 the circle has a radius of 1000, we set
        ; the camera target this far away because the collision system that moves
        ; our camera is going to move the camera too to stop it going through walls
        ; and if we set the target to close the angle of the view will change
        ; drastically and look awful
        ; The camera tilting is done very simply,
        _IrrSetCameraTarget( _
            $Camera, $POS[0] + sin ( $SPIN ) * 1000, _
            -$TILT * 1500, _
            $POS[2] + cos ( $SPIN ) * 1000 )

        ; draw the scene
        _IrrDrawScene()

        ; draw the mouse co-ordinates information to the screen
        _Irr2DFontDraw ( $BitmapFont, $metrics, 4, 4, 250, 24 )

        ; end drawing the scene and render it
        _IrrEndScene()
    Endif

WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
