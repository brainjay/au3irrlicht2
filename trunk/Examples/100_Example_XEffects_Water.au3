; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 100: XEffects Water
; This example demonstrates the water shader supplied with the XEffects system
; by Blindside. The effect occurs on the plane at Y = 0.0 and an effect is
; generated both above and below the water. The animated effect is created by
; changing the bitmap used to define the surface normal. While this set of
; images are free to use, you will likely want to source a higher quality set
; to improve the effect.
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

; SPECIFIES the number of frames in the water animation
global const $WATER_FRAMES = 18
; SPECIFIES that a new water frame will be used every two frames
global const $NEW_IMAGE_EVERY = 2

; irrlicht objects
DIM $RoomMesh ; irr_mesh
DIM $WaterTexture[$WATER_FRAMES] ; irr_texture
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $i ; integer
DIM $filename ; string


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 1024, 768, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 100: XEffects Water" )

; add a camera into the scene, position and target it
$OurCamera = _IrrAddFPSCamera( 0, 100.0, 0.1 )
_IrrSetNodePosition( $OurCamera, 150,80,100 )
_IrrSetCameraTarget( $OurCamera, 0,0,0 )

; start the XEffects system
_IrrXEffectsStart( $IRR_OFF, $IRR_OFF, $IRR_ON )

; enable the depth render pass, this is required for the water shader
_IrrXEffectsEnableDepthPass( $IRR_ON )

; load a series of dump map images that define the bumpyness of the surface of
; the water. these are then turned into normal maps for the shader to use
for $i = 0 to $WATER_FRAMES - 1
	$filename = StringRight("000" & $i + 1, 4)
    $filename = "../media/water/water_" & $filename & ".png"
    $WaterTexture[$i] = _IrrGetTexture( $filename )
    _IrrMakeNormalMapTexture( $WaterTexture[$i], 6.0 )
Next ; $i

; load the shader associated with water rendering
_IrrXEffectsAddPostProcessingFromFile( "../media/shaders/ScreenWater.glsl" )

; load a mesh this acts ; a blue print for the model
$RoomMesh = _IrrGetMesh( "../media/temple.obj" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "../media/temple_lightmap.jpg" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $RoomMesh )

; scale the node up a little (this will not effect this shaders lighting)
_IrrSetNodeScale( $SceneNode, 14.0, 14.0, 14.0 )

; Add the room to the depth pass test
_IrrXEffectsAddNodeToDepthPass( $SceneNode )

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; XEffects does not use the background color defeined in _IrrBeginScene to
; display ; empty space, instead it uses the color defined here.
_IrrXEffectsSetClearColor( 255,64,64,128 )

; hide the mouse from the display
_IrrHideMouse()


; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
$i = $NEW_IMAGE_EVERY
DIM $direction = 1
Dim $timerDiff, $timer = TimerInit()
WHILE _IrrRunning()
    ; is it time for another frame
    $timerDiff = TimerDiff($timer)
    if $timerDiff > 16.7 then
        ; record the start time of this frame
        $timer = TimerInit()

        ; set the image used ; the surface texture for this water frame
        _IrrXEffectsSetPostProcessingUserTexture( $WaterTexture[ int($i / $NEW_IMAGE_EVERY) - 1] )

        ; keep on counting up images and reset back the begining if needed
        $i += $direction
        if $i = (($WATER_FRAMES + 1) * $NEW_IMAGE_EVERY) then $i = $NEW_IMAGE_EVERY

        ; begin the scene
        _IrrBeginScene( 0, 0, 0 )

        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()
    Endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
