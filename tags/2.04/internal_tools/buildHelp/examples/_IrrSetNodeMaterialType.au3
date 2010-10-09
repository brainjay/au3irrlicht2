#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeCamera = _IrrAddCamera(2,2,2, 0,0,0 )
local $nodeCube = _IrrAddCubeSceneNode(2) ; _IrrAddMeshToScene( $mesh )
_IrrSetNodeMaterialTexture( $nodeCube, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0 )

_IrrSetNodeMaterialFlag( $nodeCube, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType($nodeCube, $IRR_EMT_SPHERE_MAP)

_IrrAddRotationAnimator($nodeCube, 0.1, 0.1, 0.1)

WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
