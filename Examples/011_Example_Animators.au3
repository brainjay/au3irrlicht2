; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 11 : Animators
; This example demonstrates animators, these are mechanisms applied to nodes
; in the scene that animate the object in some manner over time. this wrapper
; exposes six animators five of which are shown here
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
DIM $BoxTexture ; irr_texture
DIM $FloorBox ; irr_node
DIM $AnimatedBox[5] ; irr_node
DIM $DeletedBox ; irr_node
DIM $CircleBox ; irr_node
DIM $FlyBox ; irr_node
DIM $RotateBox ; irr_node
DIM $SplineBox ; irr_node
DIM $ret ; irr_animator
DIM $Camera ; irr_camera
DIM $sx[4] ; single
DIM $sy[4] ; single
DIM $sz[4] ; single
DIM $box_index ; integer


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 11: Animators" )

; add a bright ambient light to the scene to brighten everything up
_IrrSetAmbientLight( 1,1,1 )

; first lets load a texture that we can use on the test boxes in the scene
$BoxTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )

; loop around and set up 5 boxes so we can show each of the animators
for $box_index = 0 to 4
    ; create the box
    $AnimatedBox[$box_index] = _IrrAddTestSceneNode()
    ; texture the box
    _IrrSetNodeMaterialTexture( $AnimatedBox[$box_index], $BoxTexture, 0 )
    ; scale the box up to a visible size
    _IrrSetNodeScale( $AnimatedBox[$box_index], 2.5,2.5,2.5 )
next


; this animator will delete the box after a specified number of milliseconds
; have passed, in this case 5 seconds
$ret = _IrrAddDeleteAnimator( $AnimatedBox[0], 5000 )


; this animator will fly the box around in a circle, the first 3 parameters
; specify the center of the circle, the next specifies the radius of the circle
; and finally a speed parameter to specify how far the box is moved each frame
$ret = _IrrAddFlyCircleAnimator( $AnimatedBox[1], 0,50,0, 50, 0.001 )


; this animator will fly the box in a straight line, the first three parameters
; specify the start position, the next three the end position, the next number
; is the number of milliseconds it takes to fly the path (in this case 3
; seconds) and finally you can specify if it is to fly the path once or to loop
; around flying it endlessly
$ret = _IrrAddFlyStraightAnimator( $AnimatedBox[2], 0,50,-300, 0,50,300, 3000, $IRR_LOOP )

; this animator will spin the box around its centre, its very easy to set up
; and simply consists of the speed its to be rotated each frame
;$ret = _IrrAddRotationAnimator( $AnimatedBox[3], 0, 0.1, 0 )

; we move this box out of the way also so it doesnt obscure the deleted box
_IrrSetNodePosition( $AnimatedBox[3], 0,100,0 )


; the last animator is the Spline Animator, its more difficult to set up but
; is very natural looking and powerful. A spline is a curved line that passed
; through or close to a list of co-ordinates, creating a smooth flight.

; this animator needs a list of coordinates stored in three arrays, one array
; each for the X, Y and Z locations of all the points. The arrays defined here
; create a 4 point circle that wobbles up and down a bit. another good way to
; get co-ordinates is to load in the camera position example and move your
; camera to a point and write down its co-ordinates, this is particularly good
; for getting points on a map

$sx[0] = -100
$sy[0] = 50
$sz[0] = 0

$sx[1] = 0
$sy[1] = 100
$sz[1] = -100

$sx[2] = 100
$sy[2] = 50
$sz[2] = 0

$sx[3] = 0
$sy[3] = 100
$sz[3] = 100

; once the points are defined we can create the animator first we tell it how
; many points are in the list (in this case 4) then we pass the first element
; of the array of points for each of the x, y and z arrays, the next parameter
; defines the starting point on the curve, the next the speed the node travels
; along the curve and the final number specifies how tightly the curve is tied
; to the points (0 is angular and 1 is loose)

$ret = _IrrAddSplineAnimator( $AnimatedBox[4], 4, $sx, $sy, $sz, 0, 0.5, 1)

; add a static camera to the scene to observe the animation
$Camera = _IrrAddCamera( 150,50,0, 0,50,0 )

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
