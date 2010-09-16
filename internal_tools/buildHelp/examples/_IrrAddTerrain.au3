#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeTerrain = _IrrAddTerrain( "./media/terrain-heightmap.bmp" )
_IrrSetNodeScale( $nodeTerrain, 40.0, 4.4, 40.0 )

_IrrSetNodeMaterialTexture( $nodeTerrain, _IrrGetTexture( "./media/terrain-texture.jpg" ), 0 )
_IrrSetNodeMaterialTexture( $nodeTerrain, _IrrGetTexture( "./media/detailmap3.jpg" ), 1 )

_IrrScaleTexture( $nodeTerrain, 1.0, 60.0 )

_IrrSetNodeMaterialFlag( $nodeTerrain, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType ( $nodeTerrain, $IRR_EMT_DETAIL_MAP )

local $nodeCamera = _IrrAddFPSCamera()
_IrrSetNodePosition( $nodeCamera, 3942.8, 1102.7, 5113.9 )

_IrrSetCameraClipDistance( $nodeCamera, 12000 )

WHILE _IrrRunning()
    _IrrBeginScene( 240, 255, 255 )
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
