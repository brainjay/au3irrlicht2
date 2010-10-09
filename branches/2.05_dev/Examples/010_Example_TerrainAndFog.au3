; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 10 : Terrain and Fog
; This example creates a terrain from a bitmap heightfield and displays it in
; a foggy scene
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


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 10: Terrain and Fog" )

; here we create the terrain from a greyscale bitmap where bright pixels are
; high points and black pixels are low points. the command generates the mesh
; and automatically adds it ; a node to the scene
;Terrain = _IrrAddTerrain( "../media/terrain-heightmap.bmp" )
;Terrain = _IrrAddTerrain( "../media/heightmap_tmp.jpg" )
;Terrain = _IrrAddTerrain( "../media/200px-Heightmap.jpg" )
$Terrain = _IrrAddTerrain( "../media/terrain-heightmap.bmp" )

; the node is too small to be a proper terrain so we get the node object of the
; terrain and scale its size up 40 times along the X and Z axis and just 4 times
; along the Y axis
$TerrainNode = $Terrain
_IrrSetNodeScale( $TerrainNode, 40.0, 4.4, 40.0 )

; we load two textures in to apply to the terrain node
$TerrainTexture0 = _IrrGetTexture( "../media/terrain-texture.jpg" )

$TerrainTexture1 = _IrrGetTexture( "../media/detailmap3.jpg" )

; the first texture is a color texture that is applied across the entire
; surface of the map. this needs to be a fairly high resoloution ; the map is
; very large now
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture0, 0 )

; the second texture is tiled many times across the map this adds fine detail
; and structure to the first enlarged terain color
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture1, 1 )

; we set the scale of the detail map so its repeated 20 times across the map in
; the x and y axis
_IrrScaleTexture( $Terrain, 1.0, 60.0 )

; finally we apply some material texuring effects to the node
; the terrain is self illuminating
_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_LIGHTING, $IRR_OFF )
; the material type is detail type. this type applies the first texture across
; the entire node and then scales and applies the second texture across the node
; there are many different material types you can set, these can be found in the
; .bi definition file, experiment with them
_IrrSetNodeMaterialType ( $TerrainNode, $IRR_EMT_DETAIL_MAP )

; finally we switch on fog for this material so that this terrain will fade out
; into a fog in the distance
_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_FOG_ENABLE, $IRR_ON )

; now we need to add the fog to the scene. the first three parameters are the
; fog color, we set this to the same color ; our sky so the scene fogs out
; nicely into nothing, the next parameter specifies whether you want the fog
; to increase in a linear manner or exponentially. Next two parameters are only used
; when linear fog is set, they specify the distance at which the fog starts and the distance
; at which the fog reaches its maximum density. Last parameter is only used when
; exponential fog is set and determines how quickly the exponential change takes place
_IrrSetFog ( 100,100,100, $IRR_EXPONENTIAL_FOG, 0.0,0.0, 0.001)


; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$Camera = _IrrAddFPSCamera()
$CameraNode = $Camera
_IrrSetNodePosition( $CameraNode, 3942.8, 1102.7, 5113.9 )
_IrrSetNodeRotation( $CameraNode, 19, -185.5, 0 )

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

    ; draw the scene
    _IrrDrawScene()

	; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
