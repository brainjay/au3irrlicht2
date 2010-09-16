; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 53 : Grass
; An example of a grass object that is layered over a terrain to create extra
; detail to a terrain increasing the realism
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
dim $terrainHeight ; irr_image
dim $terrainColor ; irr_image
dim $grassMap ; irr_image
dim $grassTexture ; irr_texture
dim $grassNode ; irr_node
dim $x, $y, $z ; single
dim $aVector3df[3]

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 53: Grass by G Davidson" )

; allow transparency to write to the z buffer, this is often nessecary to make
; many transparent objects appear in the correct order especially transparent
; objects is opaque elements like grass and leaves, the only consideration is
; that there will be an impact on performance
_IrrTransparentZWrite()

; here we create the terrain from a greyscale bitmap where bright pixels are
; high points and black pixels are low points. the command generates the mesh
; and automatically adds it ; a node to the scene
$Terrain = _IrrAddTerrain( "../media/terrain-heightmap.bmp" )

; the node is too small to be a proper terrain so we get the node object of the
; terrain and scale its size up 40 times along the X and Z axis and just 4 times
; along the Y axis
$TerrainNode = $Terrain
_IrrSetNodeScale( $TerrainNode, 40.0, 2.4, 40.0 )

; we load two textures in to apply to the terrain node
$TerrainTexture0 = _IrrGetTexture( "../media/terrain-texture.jpg" )
$TerrainTexture1 = _IrrGetTexture( "../media/detailmap3.jpg" )

; set up the terrain node with textures lighting
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture0, 0 )
_IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture1, 1 )
_IrrScaleTexture( $Terrain, 1.0, 60.0 )
_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType ( $TerrainNode, $IRR_EMT_DETAIL_MAP )
_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_FOG_ENABLE, $IRR_ON )

; load the textures and images for that node
$terrainHeight = _IrrGetImage( "../media/terrain-heightmap.bmp" )
$terrainColor = _IrrGetImage( "../media/terrain-texture.jpg" )
$grassMap = _IrrGetImage( "../media/terrain-grassmap.bmp" )
$grassTexture = _IrrGetTexture( "../media/grass.png" )

; we add the grass in ; 100 seperate patches, these could even be grouped
; under a set of zone managers to make them more efficient
for $x = 0 to 3
    for $y = 0 to 3
        ; here we add the grass object, it has the following parameters: -
        ; a terrain onto which the grass layered,
        ; an x and y tile coordinate for the patch (multiplied by the patch size)
        ; a size for the patch
        ; the distance in patches upto which all blades of grass are drawn
        ; whether pairs of grass are aligned in a cross $IRR_ON to enable
        ; a scale for the grass height
        ; the height map associated with the terrain used for setting grass height
        ; the texture map associated with the terrain used for coloring the grass
        ; a grass map defining the types of grass placed onto the terrain
        ; a texture map containing the images of the grass
        $grassNode = _IrrAddGrass ( _
                                $Terrain, _
                                $x, $y, _
                                1100*3, _
                                2.0, _
                                $IRR_OFF, _
                                1.0, _
                                250, 0, 0, _
                                $terrainHeight, $terrainColor, _
                                $grassMap, $grassTexture )

        ; here we set how much grass is visible firstly the number of grass
        ; particles that can be seen and secondly the distance upto which they
        ; are drawn
        _IrrSetGrassDensity ( $grassNode, 300, 4000 )

        ; here we set the wind effect on the grass, first parameter sets the
        ; strength of the wind and the second the resoloution
        _IrrSetGrassWind ( $grassNode, 3.0, 1.0 )

        _IrrSetNodeMaterialFlag( $grassNode, $IRR_EMF_LIGHTING, $IRR_OFF )
        _IrrSetNodeMaterialFlag( $grassNode, $IRR_EMF_FOG_ENABLE, $IRR_ON )
    next ; $y
next ;$x

; now we need to add the fog to the scene
_IrrSetFog ( 64,100,128, $IRR_EXPONENTIAL_FOG, 0.0,4000.0, 0.5 )


; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$Camera = _IrrAddFPSCamera()
$CameraNode = $Camera
_IrrSetNodePosition( $CameraNode, 3942.0, 650.0, 5113.0 )
_IrrSetNodeRotation( $CameraNode, 19, -185.5, 0 )

; the clipping distance of a camera is a distance beyond which no triangles are
; rendered
_IrrSetCameraClipDistance( $Camera, 12000 )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
;    _IrrBeginScene( 240, 255, 255 )
    _IrrBeginScene( 64, 100, 125 )

    _IrrGetNodePosition( $CameraNode, $aVector3df )
    $aVector3df[1] = _IrrGetTerrainTileHeight( $Terrain, $aVector3df[0], $aVector3df[2] )
    _IrrSetNodePosition( $CameraNode, $aVector3df[0], $aVector3df[1]+160, $aVector3df[2] )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
