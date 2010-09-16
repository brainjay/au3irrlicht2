#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeCube = _IrrAddCubeSceneNode(5)
_IrrSetNodeMaterialTexture( $nodeCube, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeCube, $IRR_EMF_LIGHTING, $IRR_OFF )


_IrrSetNodePosition($nodeCube, 5, 5, 5 )
local $nodeCamera = _IrrAddCamera(0, 0, 0, 5, 5, 5)

WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
