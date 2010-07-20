; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 80 : Hardware Accelerated Mesh
; This example creates a simple sphere object and then makes it a hardware
; accelerated object, if the mesh was animated the call to make the object
; hardware accelerated would need to be called each time it is changed.
; obviously if you need to call it each frame it defeats the purpose of the
; hardware acceleration
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
DIM $DenseMesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $BitmapFont ; irr_font
DIM $metrics ; wstring * 256
DIM $Light ; irr_node


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 80: Hardware Accelerated Mesh ... Please wait 6 seconds" )

; load a mesh this acts ; a blue print for the model
$DenseMesh = _IrrGetMesh( "./media/sphere.x" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $DenseMesh )

; add a simple point light
$Light = _IrrAddLight( $IRR_NO_PARENT, -100,100,100, 1.0,1.0,1.0, 600.0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_ON )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "./media/bitmapfont.bmp" )

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddCamera( -2,0,0, 0,0,0 )

; set the recorded frame rates to zero (unrecorded)
dim $unacceleratedFPS = 0
dim $acceleratedFPS = 0

; record the value of the timer so we can judge time by how far it moves
dim $startTime = TimerInit()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 128, 128, 64 )

    ; draw the scene
    _IrrDrawScene()

    ; if the unaccelerated frame rate is not recorded we are still timing it
    if $unacceleratedFPS = 0 then
        ; if 3 seconds have elapsed we should be able to judge the frame rate
        if TimerDiff($startTime) > 3000 then
            ; record the unaccelerated frame rate
            $unacceleratedFPS = _IrrGetFPS()

            ; Flag the mesh ; a hardware accelerated object
            _IrrSetMeshHardwareAccelerated( $DenseMesh, 0 )

        endif
    else
        ; if the accelerated frame rate is not recorded we are still timing it
        if $acceleratedFPS = 0 then

            ; if another 3 seconds have elapsed we should be able to judge the
            ; frame rate again
            if TimerDiff($startTime) > 6000 then
                ; record the accelerated frame rate
                $acceleratedFPS = _IrrGetFPS()
            endif
        else
            ; we have both the unaccelerated and accelerated frame rates we
            ; can now display the results of the timings

            ; create a string containing the unaccelerated frame rate
            $metrics = "UNACCELERATED FPS " & $unacceleratedFPS

            ; draw this to the screen
            _Irr2DFontDraw ( $BitmapFont, $metrics, 8, 8, 250, 24 )

            ; create a string containing the accelerated frame rate
            $metrics = "ACCELERATED FPS   " & $acceleratedFPS

            ; draw this to the screen
            _Irr2DFontDraw ( $BitmapFont, $metrics, 8, 16, 250, 24 )
        endif
    endif

    ; draw the GUI
    _IrrDrawGUI()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
