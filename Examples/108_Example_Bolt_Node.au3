; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 108 : Lighting Bolt node
; A special effects node that simulates a electrical discharge
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
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 108: Lighting Bolt Node" )

; load a mesh this acts ; a blue print for the model
Dim $Mesh = _IrrGetMesh( "./media/cylinderX.obj" )

; load texture resources for texturing the scene nodes
Dim $Texture = _IrrGetTexture( "./media/water.png" )

; create the a base for the effect and move, scale and rotate it into position
$SceneNode = _IrrAddMeshToScene( $Mesh )
_IrrSetNodePosition( $SceneNode, 0,47,0)
_IrrSetNodeRotation( $SceneNode, 0,0,90 )
_IrrSetNodeScale( $SceneNode, 45,2,2 )

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $Texture, 0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; add the lightning bolt node to the scene
$SceneNode = _IrrAddBoltSceneNode()

; apply a material to the beam to give its surface color
$Texture = _IrrGetTexture( "./media/beam.png" )
_IrrSetNodeMaterialTexture( $SceneNode, $Texture, 0 )

; set the bolt properties
_IrrSetBoltProperties ( $SceneNode, _
        0,90,0, _                 ; the start point for the bolt
        0,0,0, _                  ; the end point for the bolt
        50, _                     ; the bolt updates every 50 miliseconds
        10, _                     ; the bolt is 10 units wide
        5, _                      ; the bolt is 5 units thick
        10, _                     ; there are 10 sub parts in each bolt
        4, _                      ; there are 4 individual bolts
        $IRR_ON, _                 ; the end is not connected to an exact point
        _IrrMakeARGB( 255, 255, 255, 255 )) ; Lighting color

; add a camera into the scene
$OurCamera = _IrrAddCamera( 40,50,40, 0,50,0 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
Dim $timerDiff, $timer = TimerInit()
WHILE _IrrRunning()
    ; is it time for another frame
    $timerDiff = TimerDiff($timer)
    if $timerDiff > 16.7 then
        ; record the start time of this frame
        $timer = TimerInit()

        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 16, 24, 32 )

        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()
    Endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
