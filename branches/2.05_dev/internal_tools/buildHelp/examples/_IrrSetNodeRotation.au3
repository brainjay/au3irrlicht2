#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeCamera = _IrrAddCamera(10, 0, 0, 0, 0, 0)
local $nodeCube = _IrrAddCubeSceneNode(5)
_IrrSetNodeMaterialTexture( $nodeCube, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeCube, $IRR_EMF_LIGHTING, $IRR_OFF )

_IrrSetNodeRotation($nodeCube, 90, 45, 45 )

WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
