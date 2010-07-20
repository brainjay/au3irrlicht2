; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 09 : Skybox
; This example adds a skybox around the whole scene that makes a backdrop
; for your scene to be rendered against
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
DIM $SkyBox ; irr_node
DIM $Camera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 09: Skybox" )

; the skybox is a simple hollow cube that surrounds the whole scene. textures
; are applied to all of the six sides of the cube creating an image around the
; entire scene instead of simply the color of the blank canvas
; here we load the textures ; parameters of the skybox command (they could
; of course be loaded seperatly and assigned to irr_texture variables
$SkyBox = _IrrAddSkyBoxToScene( _
        _IrrGetTexture("./media/irrlicht2_up.jpg"), _
        _IrrGetTexture("./media/irrlicht2_dn.jpg"), _
        _IrrGetTexture("./media/irrlicht2_rt.jpg"), _
        _IrrGetTexture("./media/irrlicht2_lf.jpg"), _
        _IrrGetTexture("./media/irrlicht2_ft.jpg"), _
        _IrrGetTexture("./media/irrlicht2_bk.jpg"))

; we add a first person perspective camera to the scene so you can look about
$Camera = _IrrAddFPSCamera()

; hide the mouse pointer
_IrrHideMouse()

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
