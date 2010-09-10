#include "au3Irrlicht2.au3"

_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

local $nodeSphere = _IrrAddSphereSceneNode(4, 32)
_IrrSetNodeMaterialTexture( $nodeSphere, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)

local $nodeLight = _IrrAddLight($IRR_NO_PARENT, 0,50,0, 0.9,0.9,0.9, 1000.0)
_IrrSetAmbientLight(8, 0, 0)
_IrrAddFlyCircleAnimator($nodeLight, 0, 0, 0, 500, 0.001)

local $nodeCamera = _IrrAddCamera(-5,5,-6, 0,0,0 )

WHILE _IrrRunning()
    _IrrBeginScene(100, 100, 100)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()