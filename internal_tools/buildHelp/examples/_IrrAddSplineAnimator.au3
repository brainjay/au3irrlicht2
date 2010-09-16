#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeCamera = _IrrAddCamera(150,50,0, 0,75,0)
local $nodeTest = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture( $nodeTest, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeTest, $IRR_EMF_LIGHTING, $IRR_OFF )

local $sx[4] = [-100, 0, 100, 0]
local $sy[4] = [50, 100, 50, 100]
local $sz[4] = [0, -100, 0, 100]

_IrrAddSplineAnimator($nodeTest, 4, $sx, $sy, $sz, 0, 0.5, 1)

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 0)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
