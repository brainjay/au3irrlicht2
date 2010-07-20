; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 109 : Beam node
; This example demonstrates the beam node
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
DIM $MD2Mesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 400, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 109: Beam node" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "./media/beam.png" )

; add a new beam node to the scene
$SceneNode = _IrrAddBeamSceneNode()

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; use transparency with this billboard type node
_IrrSetNodeMaterialType ( $SceneNode, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL )

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddCamera( 50,0,0, 0,0,0 )

; generate an initial random position
dim $x = -400
dim $y = Random(0, 1) * 100-50
dim $z = random(0, 1) * 100-50

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
Dim $timer = TimerInit()
dim $timerDiff ; Single timeElapsed, currentTime, frameTime = timer
WHILE _IrrRunning()
    ; is it time for another frame

    $timerDiff = TimerDiff($timer)
    if $timerDiff > 16.7 then
        ; record the start time of this frame
        $timer = TimerInit()

        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 0, 0, 0 )

        ; set the beam position
        $x += 10
        _IrrSetBeamPosition( $Scenenode, $x,$y,$z,  $x+100,$y,$z )

        ; If the beam exceeds 1000 restart it
        if $x > 200 then
            $x = - 400
            $y = Random(0, 1) * 100-50
            $z = Random(0, 1) * 100-50

        ; set the beam size
        _IrrSetBeamSize( $Scenenode, (Random(0, 1) + 0.01) * 10.0 )

        Endif


        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()
    Endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
