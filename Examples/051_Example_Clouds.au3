; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 51 : Clouds
; This example demonstrates the billboard cloud objects that are particularly
; useful for simulating aircraft flying through cloud cover and also for
; creating a light cloud embelishment for a skydome
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
DIM $Terrain ; irr_terrain
DIM $TerrainNode ; irr_node
DIM $TerrainTexture0 ; irr_texture
DIM $TerrainTexture1 ; irr_texture
DIM $Camera ; irr_camera
DIM $CameraNode ; irr_node
DIM $CloudTexture ; irr_texture
DIM $CloudNode ; irr_node
dim $aVector3df[3]
dim $TerrainHeight ; single


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 51: Billboard Clouds by G Davidson" )

; load the cloud image in ; a video texture
$CloudTexture = _IrrGetTexture( "../media/cloud4.png" )

; add the clouds to the scene
; the first parameter is the level of detail, higher values add more structure
; to the cloud when it is closer to the camera
; the second parameter sets the number of child clouds created higher values
; create more structure
; the third parameter defines how many clouds are created
$CloudNode = _IrrAddClouds( $CloudTexture, 3, 1, 500 )

; switch the fog on the clouds to prevent the clouds popping up in the distance
_IrrSetNodeMaterialFlag( $CloudNode, $IRR_EMF_FOG_ENABLE, $IRR_ON )

; raise the clouds into the sky
_IrrSetNodePosition( $CloudNode, 0,2700,0 )

; slowly rotate the clouds to simulate drift across the sky
_IrrAddRotationAnimator( $CloudNode, 0, 0.01, 0 )

; we add a terrain to the scene for demonstration purposes, for a detailed
; explaination of the process please refer to example 10
$Terrain = _IrrAddTerrain( "../media/terrain-heightmap.bmp" )
$TerrainNode = $Terrain
_IrrSetNodeScale( $TerrainNode, 40.0, 4.4, 40.0 )
$TerrainTexture0 = _IrrGetTexture( "../media/terrain-texture.jpg" )
$TerrainTexture1 = _IrrGetTexture( "../media/detailmap3.jpg" )
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture0, 0 )
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture1, 1 )
_IrrScaleTexture( $Terrain, 1.0, 60.0 )
_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType ( $TerrainNode, $IRR_EMT_DETAIL_MAP )
_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_FOG_ENABLE, $IRR_ON )

; add a fog to the scene to gently fade the clouds out in the distance
_IrrSetFog ( 128,128,255, $IRR_EXPONENTIAL_FOG, 0.0,4000.0, 0.5 )

; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$Camera = _IrrAddFPSCamera()
$CameraNode = $Camera
_IrrSetNodePosition( $CameraNode, 3942.8, 1102.7, 5113.9 )

; the clipping distance of a camera is a distance beyond which no triangles are
; rendered, this speeds the scene up by not showing geometry that is in the
; distance and too small to see however our terrain is so huge we need to
; extend this distance out
_IrrSetCameraClipDistance( $Camera, 12000 )

_IrrAddTestSceneNode()

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 128, 128, 255 )

    _IrrGetNodePosition( $CameraNode, $aVector3df)
    $TerrainHeight = _IrrGetTerrainHeight( $TerrainNode, $aVector3df[0], $aVector3df[2] )+50
    if $aVector3df[1] < $TerrainHeight THEN
        _IrrSetNodePosition( $CameraNode, $aVector3df[0], $TerrainHeight, $aVector3df[3] )
    ENDIF

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
