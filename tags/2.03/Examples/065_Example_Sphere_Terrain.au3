; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 65 : Spherical Terrain
; This example creates a spherical terrain by attaching six terrain objects
; together in a cube and then applying a spherical distortion to the terrains.
; the six textures applied to the terrain sphere need to be carefully
; constructed so that they are properly applied.
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
Global $Terrain ; irr_terrain
Global $TerrainNode ; irr_node
Global $TerrainTexture0 ; irr_texture
Global $TerrainTexture1 ; irr_texture
DIM $Camera ; irr_camera
DIM $CameraNode ; irr_node
DIM $metrics ; string
DIM $Light ; irr_node
DIM $SkyBox ; irr_node
DIM $Billboard ; irr_node
DIM $BillboardTexture ; irr_texture



Func AddPlanet( $px, $py, $pz, $rx, $ry, $rz)

; add the spherical terrain. this is supplied with six terrain highmaps one for
; each of the faces on the cube
$Terrain = _IrrAddSphericalTerrain( _
            "../media/simplesphere.bmp", _
            "../media/simplesphere.bmp", _
            "../media/simplesphere.bmp", _
            "../media/simplesphere.bmp", _
            "../media/simplesphere.bmp", _
            "../media/simplesphere.bmp", _
                             $px,$py,$pz,  $rx,$ry,$rz,6.4,6.4,6.4, _
                             255, 255, 255, 255, -30, 0, 4, $ETPS_17 )
    $TerrainNode = $Terrain
    _IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture0, 0 )
    _IrrSetNodeMaterialTexture( $TerrainNode, $TerrainTexture1, 1 )
    _IrrScaleSphericalTexture( $Terrain, 1.0, 60.0 )
    _IrrSetNodeMaterialType ( $TerrainNode, $IRR_EMT_DETAIL_MAP )

EndFunc ; AddPlanet
; ////////////////////////////////////////////////////////////////////////////

; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 65: Spherical Terrain" )

$TerrainTexture0 = _IrrGetTexture( "../media/terrain-texture.jpg" )
$TerrainTexture1 = _IrrGetTexture( "../media/detailmap-dim.jpg" )

; add a spherical terrain to the scene
AddPlanet( 0,0,0, 0,0,0)

; add a simple skybox to the scene to represent space
$SkyBox = _IrrAddSkyBoxToScene( _
        _IrrGetTexture("../media/stars.jpg"), _
        _IrrGetTexture("../media/stars.jpg"), _
        _IrrGetTexture("../media/stars.jpg"), _
        _IrrGetTexture("../media/stars.jpg"), _
        _IrrGetTexture("../media/stars.jpg"), _
        _IrrGetTexture("../media/stars.jpg"))



_IrrSetFog ( 255,128,0, $IRR_EXPONENTIAL_FOG, 0.0,500.0, 0.5 )


$Light = _IrrAddLight( $IRR_NO_PARENT, 6400,16000,0, 1,1,1, 192200.0 )
; _IrrSetAmbientLight( 0.1, 0.1, 0.1 )


; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$Camera = _IrrAddFPSCamera()
$CameraNode = $Camera
_IrrSetNodePosition( $CameraNode, 0, 2000, 0 )

; load the texture resource for the billboard
$BillboardTexture = _IrrGetTexture( "../media/sun.tga" )

; add the billboard to the scene, the first two parameters are the size of the
; billboard in this instance they match the pixel size of the bitmap to give
; the correct aspect ratio. the last three parameters are the position of the
; billboard object
$Billboard = _IrrAddBillBoardToScene( 600.0,600.0,  3000.0, 1500.0, 0.0 )

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialTexture( $Billboard, $BillboardTexture, 0 )

; rather than have the billboard lit by light sources in the scene we can
; switch off lighting effects on the model and have it render ; if it were
; self illuminating
_IrrSetNodeMaterialFlag( $Billboard, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType( $Billboard, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL )
_IrrMaterialSetMaterialTypeParam( _IrrGetMaterial( $Billboard, 0 ), 0.0001 )




; the clipping distance of a camera is a distance beyond which no triangles are
; rendered, this speeds the scene up by not showing geometry that is in the
; distance and too small to see however our terrain is so huge we need to
; extend this distance out
_IrrSetCameraClipDistance( $Camera, 500000 )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 0, 0, 0 )

    ; draw the scene
    _IrrDrawScene()

    $metrics = "Example 65: Spherical Terrain (" & _IrrGetFPS() & ") fps (" & _IrrGetPrimitivesDrawn() & " Polygons)"
    _IrrSetWindowCaption( $metrics )

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
