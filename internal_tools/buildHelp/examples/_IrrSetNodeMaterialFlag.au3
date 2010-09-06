#include "au3Irrlicht2.au3"

_IrrStart()

local $camera = _IrrAddCamera(2,2,2, 0,0,0 )

local $mesh = _IrrGetMesh( ".\media\capsuleX.obj" )
local $sceneNode = _IrrAddMeshToScene( $mesh )

local $texture = _IrrGetTexture(".\media\default_texture.png")
_IrrSetNodeMaterialTexture( $sceneNode, $texture, 0)
_IrrSetNodeMaterialFlag( $sceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
