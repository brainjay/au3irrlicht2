#include "au3Irrlicht2.au3"

_IrrStart()

; set up a sphere into the scene:
local $nodeSphere = _IrrAddSphereSceneNode(5)
_IrrSetNodeMaterialTexture( $nodeSphere, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeSphere, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodePosition($nodeSphere, 10, 5, 10)

local $nodeCamera = _IrrAddFPSCamera()

; target the sphere with the camera:
_IrrSetCameraTarget($nodeCamera, 10, 5, 10)

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 25)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
