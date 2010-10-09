; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 78: 2D Overlaid Hud
; This example loads a BSP map from a pk3 archive and creates a first person
; perspective camera so you can move around and view the map it also overlays
; a 2D hud onto the screen to display information
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
DIM $HUDBulletTexture ; irr_texture
DIM $HUDCharacterTexture ; irr_texture
DIM $I ; integer

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 78: 2D Overlaid HUD" )

; first we add the pk3 archive to our filing system. once we have done this
; we can open any of the files in the archive ; if they were in the current
; working directory
_IrrAddZipFile( "../media/map-20kdm2.pk3", $IRR_IGNORE_CASE, $IRR_IGNORE_PATHS )

; load the BSP map from the archive ; a mesh object. any polygons in the mesh
; that do not have textures will be removed from the scene!
$BSPMesh = _IrrGetMesh( "20kdm2.bsp" )


; load hud components
$HUDBulletTexture = _IrrGetTexture( "../media/HUDBullet.tga" )
$HUDCharacterTexture = _IrrGetTexture( "../media/HUDCharacter.tga" )

; add the map to the scene ; a node. when adding the mesh this call uses a
; mechanism called an octtree that if very efficient at rendering large amounts
; of complext geometry most of which cant be seen, using this call for maps
; will greatly improve your framerates
$BSPNode = _IrrAddMeshToSceneAsOcttree( $BSPMesh )

; add a first person perspective camera into the scene that is controlled with
; the mouse and the cursor keys. if however you capture events when starting
; irrlicht this will become a normal camera that can only be moved by code
$Camera = _IrrAddFPSCamera()

; when we add a camera we are returned a camera object however we can perform
; node operations on many different object types that are entities within the
; scene however first we need to convert the camera type into a node type
$CameraNode = $Camera

; reposition and rotate the camera to look at a nice part of the map
_IrrSetNodePosition( $CameraNode, 1750, 149, 1369 )
_IrrSetNodeRotation( $CameraNode, 4, -461.63, 0 )

; hide the mouse pointer
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    ; draw the scene
    _IrrDrawScene()

    ; draw some bullets
    for $i = 0 to 8
        _IrrDraw2DImageElement( $HUDBulletTexture, _
                               764, 4 + $i * 16, _
                               0,0,32,16, $IRR_USE_ALPHA )
    next ; $i

    ; draw a character
    _IrrDraw2DImageElement( $HUDCharacterTexture, _
                           4, 4, _
                           0,0,64,64, $IRR_USE_ALPHA )

    ; end drawing the scene and display it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
