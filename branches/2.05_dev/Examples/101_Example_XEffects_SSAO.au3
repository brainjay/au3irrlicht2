; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 101: XEffects Screen Space Ambient Occlusion
; This example demonstrates the use of the XEffects module to display the SSAO
; effect.
;
; SSAO (Screen Space Ambient Occlusion) is an method used to approximate the
; effect of Ambient Occlusion which darkens areas of an object that are not
; recieving ; much ambient light for example the inside of a cup is darker
; than the outside ; not ; much ambient light shines upon it.
;
; Calculating real AO (Ambient Occlusion) is very expensive and cannot be
; realistically done in Realtime yet. So this clever approximated method
; simulates the effect in a less expensive realtime shader
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
DIM $RoomMesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 101: XEffects Screen Space Ambient Occlusion" )


; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddFPSCamera( 0, 100.0, 0.01 )
_IrrSetNodePosition( $OurCamera, 8.3, 1.0, 8.3 )
_IrrSetCameraTarget( $OurCamera, 0.0, 3.2, 0.0 )

; set the camera clip distance. this is VERY important with the SSAO effect as
; the effect is distributed across this distance
_IrrSetCameraClipDistance( $OurCamera, 50, 0.001 )

; start the XEffects system
_IrrXEffectsStart( $IRR_OFF, $IRR_OFF, $IRR_ON )

; SSAO needs a depth pass to be rendered so enable the depth render pass
_IrrXEffectsEnableDepthPass( $IRR_ON )

; add the SSAO shader effect to the scene and two blur shaders (horizontal and
; vertical) the SSAO effect uses random noise that needs to be blurred out.
_IrrXEffectsAddPostProcessingFromFile( "../media/shaders/SSAO.glsl", 1 )
_IrrXEffectsAddPostProcessingFromFile( "../media/shaders/BlurVLowHP.glsl" )
_IrrXEffectsAddPostProcessingFromFile( "../media/shaders/BlurVLowVP.glsl" )
_IrrXEffectsAddPostProcessingFromFile( "../media/shaders/SSAOCombine.glsl" )

; load a mesh this acts ; a blue print for the model
$RoomMesh = _IrrGetMesh( "../media/temple.obj" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $RoomMesh )

; Add the room to the depth pass test
_IrrXEffectsAddNodeToDepthPass( $SceneNode )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; XEffects does not use the background color defeined in _IrrBeginScene to
; display ; empty space, instead it uses the color defined here.
_IrrXEffectsSetClearColor( 255,250,100,0 )

; hide the mouse from the display
_IrrHideMouse()


; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
Dim $timer = TimerInit()
WHILE _IrrRunning()
    ; is it time for another frame
    if TimerDiff($timer) > 16.7 then
        ; record the start time of this frame
        $timer = TimerInit()

        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 240, 255, 255 )

        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()
    Endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
