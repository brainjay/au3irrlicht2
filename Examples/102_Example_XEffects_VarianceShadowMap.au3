; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 99: XEffects Dynamic Shadows
; This example demonstrates the use of the XEffects module to display VSM
; dynamic shadows.
;
; VSM (Variance Shadow Maps) are a shadow mapping technique like the origonal
; shadow maps in example 99. But they can have filtering applied to them to
; smooth out the aliasing problems that can affect the previous shadow map
; technique. Although VSM produces higher quality shadows it does require more
; memory and computation time.
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
DIM $RoomMesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; Start the XEffects shader system switch on VSM, Soft Shadowing and also 32 bit
; buffers. These are highly recommended for VSM
_IrrXEffectsStart( $IRR_ON, $IRR_ON, $IRR_ON )

; set the window caption
_IrrSetWindowCaption( "Example 99: XEffects Dynamic Shadows" )

; load a mesh this acts ; a blue print for the model
$RoomMesh = _IrrGetMesh( "./media/temple.obj" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "./media/temple_lightmap.jpg" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $RoomMesh )

; scale the node up a little (this will not effect this shaders lighting)
_IrrSetNodeScale( $SceneNode, 14.0, 14.0, 14.0 )

; add dynamic shadows to this node
_IrrXEffectsAddShadowToNode( $SceneNode, $EFT_8PCF, $ESM_BOTH )

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; add a dynamic shadow casting light
; 1) the size of the shadow map texure this should always be a power of two.
;    512, 1024, 2048, etc ... bigger numbers = more quality = more memory
; 2) three numbers specify the X,Y,Z position of the light
; 3) three numbers specify the X,Y,Z target of the light. a dynamic light is
;    shaped like a spotlight so it needs a target to shine at.
; 4) four numbers specify the R,G,B,A intensity of the light
; 5) two numbers specify the near and far distance of the effect of the light
; 6) the angle of the spotlight 90 degrees in this case
_IrrXEffectsAddShadowLight ( 512, 200,200,0, 0,0,0, 0.9,0.9,0.6,0.0, 1.0, 1200.0, 89.99 )

; set the ambient lighting applied by the XEffects system
_IrrXEffectsSetAmbientColor( 0,128,128,128)


; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddFPSCamera( 0, 100.0, 0.1 )
_IrrSetNodePosition( $OurCamera, 150,80,100 )
_IrrSetCameraTarget( $OurCamera, 0,0,0 )

; hide the mouse
_IrrHideMouse()


; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
Dim $moveCircle = 0.0
Dim $time = TimerInit()
WHILE _IrrRunning()
    ; is it time for another frame
    if TimerDiff($time) > 16.7 then
        ; record the start time of this frame
        $time = TimerInit()

        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 240, 255, 255 )

        ; move the light about to show the dynamic lighting effect
        _IrrXEffectsSetShadowLightPosition( 0, _
                200, (Cos( $moveCircle ) + 1) * 75 + 50, (Sin( $moveCircle ) + 1 ) * 75 + 50 )
        $moveCircle += 0.01

        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()
    Endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
