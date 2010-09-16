#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeCube = _IrrAddCubeSceneNode(12)
_IrrSetNodeMaterialTexture( $nodeCube, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeCube, $IRR_EMF_LIGHTING, $IRR_OFF )

local $nodeCamera = _IrrAddCamera(10, 10, 10, 0, 0, 0)
_IrrSetCameraClipDistance($nodeCamera, 15)

WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
