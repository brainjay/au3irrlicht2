; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 13: Camera Position
; This example creates a map for you to move around and displays the current
; position of the camera and its rotation on the screen
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
DIM $BSPMesh ; irr_mesh
DIM $BSPNode ; irr_node
DIM $Camera ; irr_camera
DIM $CameraNode ; irr_node
DIM $BitmapFont ; irr_font
DIM $X ; Single
DIM $Y ; Single
DIM $Z ; Single
DIM $metrics ; wstring * 256


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )
; send the window caption
_IrrSetWindowCaption( "Example 13: Camera Position and Rotation" )

; create a frist person perspective camera that can be controlled with mouse
; and cursor keys
$Camera = _IrrAddFPSCamera()
; when we add a camera we are returned a camera object however we can perform
; node operations on many different object types that are entities within the
; scene however first we need to convert the camera type into a node type
$CameraNode = $Camera

; reposition and rotate the camera to look at a nice part of the map
_IrrSetNodePosition( $CameraNode, 1750, 149, 1369 )
_IrrSetNodeRotation( $CameraNode, 4, -461.63, 0 )

; load a Quake 3 BSP Map from a zip archive
_IrrAddZipFile( "../media/map-20kdm2.pk3", $IRR_IGNORE_CASE, $IRR_IGNORE_PATHS )
$BSPMesh = _IrrGetMesh( "20kdm2.bsp" )
$BSPNode = _IrrAddMeshToSceneAsOcttree( $BSPMesh )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "../media/bitmapfont.bmp" )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 50, 50, 50 )

    ; draw the scene
    _IrrDrawScene()

    ; get the position of the camera into the three supplied variables
	dim $a_vector3df[3]
	_IrrGetNodePosition($CameraNode, $a_vector3df)

    ; create a wide string with a list of the positions in
    $metrics = "POSITION " & round($a_vector3df[0],0) & " " & round($a_vector3df[1],0) & " " & round($a_vector3df[2],0) & "              "

    ; draw this position information to the screen
    _Irr2DFontDraw ( $BitmapFont, $metrics, 4, 4, 250, 24 )

    ; get the rotation of the camera into the three supplied variables
    _IrrGetNodeRotation( $CameraNode, $a_vector3df )

    ; create a wide string with a list of the rotations in
    $metrics = "ROTATION " & round($a_vector3df[0],0) & " " & round($a_vector3df[1],0) & " " & round($a_vector3df[2],0) & "              "

    ; draw this position information to the screen
    _Irr2DFontDraw ( $BitmapFont, $metrics, 4, 32, 250, 52 )

    ; end drawing the scene and display it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
