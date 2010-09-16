; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 91 : Distance and Collision
; This example demonstrates some additional commands that have been included to
; provide a new set of operations that return information on distance and
; collisions
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
DIM $BlueTexture ; irr_texture
DIM $RedTexture ; irr_texture
DIM $TestBox[5] ; irr_node
DIM $CirclingBox ; irr_node
DIM $IndicatorObject ; irr_node
DIM $Animator ; irr_animator
DIM $Camera ; irr_camera
DIM $BitmapFont ; irr_font
DIM $box_index ; integer
DIM $Distance ; Single
DIM $ResultString ; wstring * 256



; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 91: Distance and Collision" )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "../media/bitmapfont.bmp" )

; add a bright ambient light to the scene to brighten everything up
_IrrSetAmbientLight( 1,1,1 )

; first lets load some textures that we can use on the test boxes in the scene
$BlueTexture = _IrrGetTexture( "../media/Cross.bmp" )
$RedTexture = _IrrGetTexture( "../media/Diagonal.bmp" )

; loop around and set up some boxes so we can show each of the animators
for $box_index = 0 to 4
    ; create the box
    $TestBox[$box_index] = _IrrAddTestSceneNode()

    ; texture the box
    _IrrSetNodeMaterialTexture( $TestBox[$box_index], $BlueTexture, 0 )

    ; scale the box up a little
    _IrrSetNodeScale( $TestBox[$box_index], 2.5, 2.5, 2.5 )

    ; place the boxes in a circle on the ground
    _IrrSetNodePosition( $TestBox[$box_index], _
                        Cos( ($box_index + 1) * 1.3) * 80, _
                        0, _
                        Sin( ($box_index + 1) * 1.3) * 80 )
next ; $box_index

; create the animated box
$CirclingBox = _IrrAddTestSceneNode()

; texture the animated box
_IrrSetNodeMaterialTexture( $CirclingBox, $BlueTexture, 0 )

; this animator will fly the box around in a circle, the first 3 parameters
; specify the center of the circle, the next specifies the radius of the circle
; and finally a speed parameter to specify how far the box is moved each frame
$Animator = _IrrAddFlyCircleAnimator( $CirclingBox, 0,15,0, 75, 0.001 )

; add a sphere object that will mark a point in space and that will be used to
; to indicate when this location is inside the animated box.
; the sphere we create has a radius of 10.0 and is made from rings of 12
; verticies
$IndicatorObject = _IrrAddSphereSceneNode( 10.0, 12)

; move the sphere to the location we are going to test
_IrrSetNodePosition( $IndicatorObject, 50,15,50 )

; texture the sphere
_IrrSetNodeMaterialTexture( $IndicatorObject, $BlueTexture, 0 )

; add a static camera to the scene to observe the animation
$Camera = _IrrAddCamera( 80,120,80, 0, 0, 0 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
Dim $timer = TimerInit()
WHILE _IrrRunning()
    ; is it time for another frame
    if TimerDiff($timer) > 16.7 then
        ; calculate the time the next frame starts
        $timer = TimerInit()

        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 64, 64, 64 )

        ; draw the scene
        _IrrDrawScene()

        ; Get the Distance between the animated box and one of the others
        $Distance = _IrrGetDistanceBetweenNodes( $CirclingBox, $TestBox[0])

        ; create a wide string with a list of the positions in
        $ResultString = "DISTANCE " & int($Distance)

        ; draw this position information to the screen
        _Irr2DFontDraw ( $BitmapFont, $ResultString, 4, 4, 700, 24 )

        ; Examine each of the boxes
        for $box_index = 0 to 4
            ; if the animated box touching this box
            If _IrrAreNodesIntersecting( $CirclingBox, $TestBox[$box_index]) Then
                ; turn the box red
                _IrrSetNodeMaterialTexture( $TestBox[$box_index], $RedTexture, 0 )
            Else
                ; it is not touching so make the box blue
                _IrrSetNodeMaterialTexture( $TestBox[$box_index], $BlueTexture, 0 )
            EndIf
        next ; $box_index

        ; if this point in space is inside the animated box
        If _IrrIsPointInsideNode( $CirclingBox, 56,15,56 ) Then
            ; turn the sphere red
            _IrrSetNodeMaterialTexture( $IndicatorObject, $RedTexture, 0 )
        Else
            ; the point is not inside the box, make the sphere blue
            _IrrSetNodeMaterialTexture( $IndicatorObject, $BlueTexture, 0 )
        EndIf

        ; end drawing the scene and render it
        _IrrEndScene()
    endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
