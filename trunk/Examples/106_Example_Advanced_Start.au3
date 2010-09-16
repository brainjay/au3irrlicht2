; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 106 : Advanced Starting
; This example demonstrates an Advanced Method of Starting the Display that
; allows for the use of anti-aliasing and high precision FPU maths
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
DIM $MD2Mesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera
dim $vect
const $STITLE = "Example 106: Advanced Start (Resize window!)"

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStartAdvanced ( _
    $IRR_EDT_OPENGL, _       ; Use OpenGL
    800, 600, _              ; screen size
    $IRR_BITS_PER_PIXEL_32, _; using 32 bit true color
    $IRR_WINDOWED, _         ; in a window
    $IRR_NO_SHADOWS, _       ; without stencil shadows
    $IRR_IGNORE_EVENTS, _    ; dont capture keystrokes and mouse
    $IRR_VERTICAL_SYNC_ON, _ ; sync to the monitor refresh rate
    0, _                    ; 0 = use the most appropriate window device
    $IRR_ON, _               ; Switch on double buffering of the display
    4, _                    ; Anti-aliasing level 4
    $IRR_ON )                ; use high precision floating point math

; set the window caption
_IrrSetWindowCaption( $STITLE )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; make sure that vertex color does not affect any lighting
_IrrSetNodeColorByVertex( $SceneNode, $ECM_NONE )

; set up some lighting colors
_IrrSetNodeAmbientColor( $SceneNode, _IrrMakeARGB(255,0,0,255) )
_IrrSetNodeDiffuseColor( $SceneNode, _IrrMakeARGB( 64,255,96,255 ))
_IrrSetNodeSpecularColor( $SceneNode, _IrrMakeARGB( 255,255,0,255 ))
_IrrSetNodeEmissiveColor( $SceneNode, _IrrMakeARGB( 0,0,0,255 ))

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; play an animation sequence embeded in the mesh. MD2 models have a group of
; preset animations for various poses and actions. this animation sequence is
; the character standing idle
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )
_IrrAddRotationAnimator($SceneNode, 0, 0.3, 0)

; add a camera into the scene and target zumlin
_IrrGetNodePosition($SceneNode, $vect)
$OurCamera = _IrrAddCamera( 30, 30, 20, $vect[0], $vect[1], $vect[2] )

; add a  light source
_IrrAddLight( $IRR_NO_PARENT, 100,100,-100, 0.9,0.9,0.9, 600.0 )

; add some ambient lighting
_IrrSetAmbientLight( 0.1, 0.1, 0.1 )

; allow the window to be resized
_IrrSetResizableWindow( $IRR_ON )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
Dim $timer = TimerInit()
dim $X, $Y
dim $i = -50, $dir = -0.3
Dim $metrics
WHILE _IrrRunning()
    ; is it time for another frame
    if TimerDiff($timer) > 16.7 then
        ; record the start time of this frame
        $timer = TimerInit()

        ; begin the scene
        _IrrBeginSceneAdvanced ( _IrrMakeARGB( 0, 25, 25, 128 ), $IRR_ON, $IRR_ON )

        ; draw the scene
        _IrrDrawScene()

		$i += $dir
		if $i < -50 or $i > -12 then $dir *= -1
		_IrrSetNodePosition($OurCamera, $i, -$i, 0)
        _IrrGet2DPositionFromScreenCoordinates ( 0, 0, $x, $y, $OurCamera )
        $metrics = $STITLE & " / 2D Pos: " & int($x) & "," & int($y)
        _IrrSetWindowCaption( $metrics )

        ; end drawing the scene and render it
        _IrrEndScene()
    EndIf
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
