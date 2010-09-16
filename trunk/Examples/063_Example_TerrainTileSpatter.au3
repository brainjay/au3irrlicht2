; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 63 : Terrain Tile Splatter
; This example applies a texture to a terrain that uses a form of texture
; spattering, several greyscale textures are stored in the color channels of
; the detail texture and can be mixed onto the terrain by setting the vertex
; color of the terrain more red in the vertex will add more of the greyscale
; texture stored in the red channel of the detail texture for example
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
DIM $heightMap ; irr_image
DIM $colorMap ; irr_image
DIM $vector3df[3]


global const $TILE_SIZE = 128
; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 63: Terrain Tile Splatter" )

; load the terrain textures
$TerrainTexture0 = _IrrGetTexture( "../media/splatter.tga" )
$TerrainTexture1 = _IrrGetTexture( "../media/splatter-color.tga" )

; load the heighmap for the terrain object, this is an image file that is not
; stored in video card memory
$heightMap = _IrrGetImage( "../media/splatter-height.tga" )

; load a color map used to coloring the verticies, this again is an image file
; that is not stored in video memory
$colorMap = _IrrGetImage( "../media/splatter-detail.tga" )

; here we create the terrain from a greyscale bitmap
$Terrain = _IrrAddTerrainTile( $heightMap, $TILE_SIZE, 0, 0 )
_IrrSetTileColor( $Terrain, $colorMap )
$TerrainNode = $Terrain
_IrrSetNodeScale( $TerrainNode, 40.0, 4.4, 40.0 )
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture0, 0 )
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture1, 1 )
_IrrScaleTileTexture( $Terrain, 64.0, 1.0 )
_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_FOG_ENABLE, $IRR_ON )

; ; the vertex color is used for mixing in the channels of the texture the
; spattered object cannot support lighting and the lighting needs to be baked
; into the color map
_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; the four detail map is the meterial type used for texture spattering
_IrrSetNodeMaterialType ( $TerrainNode, $IRR_EMT_FOUR_DETAIL_MAP )

; now we need to add the fog to the scene.
_IrrSetFog ( 240,255,255, $IRR_EXPONENTIAL_FOG, 0.0,4000.0, 0.5 )

; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$Camera = _IrrAddFPSCamera()
$CameraNode = $Camera
_IrrSetNodePosition( $CameraNode, 1200.0, 1750.0, 1200.0 )

; the clipping distance of a camera is a distance beyond which no triangles are
; rendered, this speeds the scene up by not showing geometry that is in the
; distance and too small to see however our terrain is so huge we need to
; extend this distance out
_IrrSetCameraClipDistance( $Camera, 12000 )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    _IrrGetNodePosition( $CameraNode, $vector3df )
    $vector3df[1] = _IrrGetTerrainTileHeight( $Terrain, $vector3df[0], $vector3df[2] )
    _IrrSetNodePosition( $CameraNode, $vector3df[0], $vector3df[1]+80, $vector3df[2] )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
