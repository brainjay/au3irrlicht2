#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeCamera = _IrrAddCamera(10, 10, 10, 0, 0, 0)
local $nodeCube = _IrrAddCubeSceneNode(12)
_IrrSetNodeMaterialTexture( $nodeCube, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeCube, $IRR_EMF_LIGHTING, $IRR_OFF )

_IrrSetNodeMaterialFlag( $nodeCube, $IRR_EMF_FOG_ENABLE, $IRR_ON )
_IrrSetFog ( 100,100,100, $IRR_EXPONENTIAL_FOG, 0.0, 0.0, 0.15)

WHILE _IrrRunning()
    _IrrBeginScene(100, 100, 100)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
