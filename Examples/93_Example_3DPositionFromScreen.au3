; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 93 : 3D Position from Screen Coordinates
; This example demonstrates how to get a 3D position in space from a set of
; screen coordinates and the definition of a 2D plane in 3D space. this can
; be particularly useful in a scene management application for constraining
; the movement of an object to a specific axis
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
DIM $MyTexture ; irr_texture
DIM $CenterNode ; irr_node
DIM $IndicatorObject ; irr_node
DIM $Camera ; irr_camera
DIM $KeyEvent ; $IRR_KEY_EVENT PTR
dim $currentKey
DIM $MouseEvent ; $IRR_MOUSE_EVENT PTR
DIM $POS[3]
DIM $normalX = 0.0
DIM $normalY = 0.0
DIM $normalZ = 1.0
dim $sTitle = "Example 93 : 3D Position from Screen Coordinates" & _
                    " (Change constrained axis movement with X/Y/Z) - Now: "

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( $sTitle & 'Z')

; add a bright ambient light to the scene to brighten everything up
_IrrSetAmbientLight( 1,1,1 )

; first load a texture
$MyTexture = _IrrGetTexture( "./media/texture.jpg" )

; add a simple test node so we can visualise the world origin
$CenterNode = _IrrAddTestSceneNode()

; texture the node
_IrrSetNodeMaterialTexture( $CenterNode, $MyTexture, 0 )


; add a sphere object that will mark the point in 3D space
; the sphere we create has a radius of 10.0 and is made from rings of 12
; verticies
$IndicatorObject = _IrrAddSphereSceneNode( 10.0, 12)

; texture the sphere
_IrrSetNodeMaterialTexture( $IndicatorObject, $MyTexture, 0 )

; add a static camera to the scene
$Camera = _IrrAddCamera( 100,100,100, 0, 0, 0 )

; Hide the mouse pointer
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
        _IrrBeginScene( 255, 255, 255 )

        ; while there are key events waiting to be processed
        while _IrrKeyEventAvailable()
            ; read the key event out.
            $KeyEvent = _IrrReadKeyEvent()

            ; arbitrate based on the key that was pressed
			$currentKey = __getKeyEvt($KeyEvent, $EVT_KEY_IKEY)
            select
            case $currentKey = $KEY_KEY_X
                ; Constrain movement in the X axis
                $normalX  = 1.0
                $normalY  = 0.0
                $normalZ  = 0.0
				_IrrSetWindowCaption( $sTitle & 'X')
            case $currentKey = $KEY_KEY_Y
                ; Constrain movement in the Y axis
                $normalX  = 0.0
                $normalY  = 1.0
                $normalZ  = 0.0
				_IrrSetWindowCaption( $sTitle & 'Y')
            case $currentKey = $KEY_KEY_Z
                ; Constrain movement in the Z axis
                $normalX  = 0.0
                $normalY  = 0.0
                $normalZ  = 1.0
				_IrrSetWindowCaption( $sTitle & 'Z')
            endselect
        wend

        ; while there are mouse events waiting
        while _IrrMouseEventAvailable()
            ; read the mouse event out
            $MouseEvent = _IrrReadMouseEvent()

            ; if this is a mouse move event
            if __getMouseEvt($MouseEvent, $EVT_MOUSE_IACTION) = $IRR_EMIE_MOUSE_MOVED then

                ; get the position of the object projected against the plane
                _IrrGet3DPositionFromScreenCoordinates( _
                        __getMouseEvt($MouseEvent, $EVT_MOUSE_IX), __getMouseEvt($MouseEvent, $EVT_MOUSE_IY), _
                        $POS, $Camera, $normalX, $normalY, $normalZ )

                ; update the position of the indicator object
                _IrrSetNodePosition( $IndicatorObject, $POS[0] , $POS[1], $POS[2] )
            endif
        wend

        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()
    endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
