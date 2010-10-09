; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 29 : Skydome
; This example adds a skydome around the whole scene that makes a backdrop
; for your scene to be rendered against
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


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 29: Skydome" )

; the skydome is a simple hollow sphere that surrounds the whole scene. a single
; texture is applied to the entire surface of the sphere. Portions of the sphere
; can be rendered to optimise the performance of the scene
local $SkyDome = _IrrAddSkyDomeToScene( _
        _IrrGetTexture("../media/skydome2.jpg"), _
        16, 8, 1.0, 1.2)
_IrrAddRotationAnimator($SkyDome, 0, 0.003, 0)

; we add a terrain to the scene for demonstration purposes, for a detailed
; explaination of the process please refer to example 10
local $TerrainNode = _IrrAddTerrain( "../media/terrain-heightmap.bmp" )
_IrrSetNodeScale( $TerrainNode, 40.0, 4.4, 40.0 )
local $TerrainTexture0 = _IrrGetTexture( "../media/terrain-texture.jpg" )
local $TerrainTexture1 = _IrrGetTexture( "../media/detailmap3.jpg" )
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture0, 0 )
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture1, 1 )
_IrrScaleTexture( $TerrainNode, 1.0, 60.0 )
_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType ( $TerrainNode, $IRR_EMT_DETAIL_MAP )

; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
local $Camera = _IrrAddFPSCamera()
_IrrSetNodePosition( $Camera, 3942.8, 1102.7, 5113.9 )
_IrrSetCameraClipDistance( $Camera, 12000 )

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
