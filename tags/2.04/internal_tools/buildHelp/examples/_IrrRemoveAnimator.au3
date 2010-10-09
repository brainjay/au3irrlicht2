#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeCamera = _IrrAddCamera(10,10,10, 0,0,0 )
local $nodeTest = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture( $nodeTest, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeTest, $IRR_EMF_LIGHTING, $IRR_OFF )

local $animator = _IrrAddFlyCircleAnimator($nodeTest, 0, 0, 0, 5, 0.005)

local $timer = TimerInit()

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 0)
    _IrrDrawScene()
    _IrrEndScene()

	if TimerDiff($timer) > 3000 then _IrrRemoveAnimator($nodeTest, $animator)
WEND

_IrrStop()
