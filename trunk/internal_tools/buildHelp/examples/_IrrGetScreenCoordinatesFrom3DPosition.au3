#include "au3Irrlicht2.au3"

_IrrStart()

local $x, $y, $vect[3]
local $BitmapFont = _IrrGetFont ( "./media/bitmapfont.bmp" )

local $SceneNode = _IrrAddMeshToScene( _IrrGetMesh( "./media/zumlin.md2" ) )
_IrrSetNodeMaterialTexture( $SceneNode, _IrrGetTexture( "./media/zumlin.pcx" ), 0 )
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

local $nodeCam = _IrrAddFPSCamera( $IRR_NO_OBJECT, 100.0, 0.1 )
_IrrSetNodePosition( $nodeCam, 80,0,0 )
_IrrSetCameraTarget( $nodeCam, 0,0,0 )

$vect[1] = 35 ; move the vector to just over the nodes head

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 25)
    _IrrDrawScene()

    ; using 3D coordinate get x/y position of this coordinate; it appears on the screen
    _IrrGetScreenCoordinatesFrom3DPosition( $x, $y, $vect )
    ; draw the name of the model over the head of the model
    _Irr2DFontDraw ( $BitmapFont, "ZUMLIN", $x-15, $y-8, $x+35, $y )

    _IrrEndScene()
WEND

_IrrStop()
