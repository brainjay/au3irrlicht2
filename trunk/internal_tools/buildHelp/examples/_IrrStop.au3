#include "au3Irrlicht2.au3"

_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON )

local $Camera = _IrrAddCamera(10,10,10, 0,0,0 )
local $testNode = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture( $testNode, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $testNode, $IRR_EMF_LIGHTING, $IRR_OFF )

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 0)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
