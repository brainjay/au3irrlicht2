#include "au3Irrlicht2.au3"

_IrrStart()

local $keyStruct
local $camera = _IrrAddFPSCamera( 0, 150.0, 0.1, -1, _
                __CreatePtrKeyMapArray($keyStruct), 4 )
$keyStruct = 0

local $mesh = _IrrGetMesh( ".\media\capsuleX.obj" )
local $sceneNode = _IrrAddMeshToScene( $mesh )
_IrrSetNodePosition($sceneNode, 0, 0, 5 )

local $texture = _IrrGetTexture(".\media\default_texture.png")
_IrrSetNodeMaterialTexture( $sceneNode, $texture, 0)
_IrrSetNodeMaterialFlag( $sceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

_IrrSetWindowCaption("Move with mouse + WASD keys - quit with ALT-F4!")
WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
