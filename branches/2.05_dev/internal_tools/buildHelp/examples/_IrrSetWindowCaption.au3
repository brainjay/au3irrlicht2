#include "au3Irrlicht2.au3"

_IrrStart()

_IrrSetWindowCaption("Title of the window")

local $nodeCamera = _IrrAddCamera(10,10,10, 0,0,0 )
local $testNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture( $testNode, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $testNode, $IRR_EMF_LIGHTING, $IRR_OFF )

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 0)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
