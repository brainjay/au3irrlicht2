#include "au3Irrlicht2.au3"

_IrrStart()

local $camera = _IrrAddFPSCamera()

local $mesh = _IrrGetMesh( ".\media\capsuleX.obj" )
local $sceneNode = _IrrAddMeshToScene( $mesh )
_IrrSetNodePosition($sceneNode, 0, 0, 5 )

local $texture = _IrrGetTexture(".\media\default_texture.png")
_IrrSetNodeMaterialTexture( $sceneNode, $texture, 0)
_IrrSetNodeMaterialFlag( $sceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

_IrrSetWindowCaption("Move with mouse + cursor keys - quit with ALT-F4!")
WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
