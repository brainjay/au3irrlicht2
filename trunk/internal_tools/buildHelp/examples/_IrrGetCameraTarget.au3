#include "au3Irrlicht2.au3"

_IrrStart()

_IrrAddTestSceneNode()
local $nodeCamera = _IrrAddFPSCamera()
_IrrSetNodePosition($nodeCamera, 0, 0, -50)

local $aTarget

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 50)

	_IrrGetCameraTarget($nodeCamera, $aTarget)
	_IrrSetWindowCaption('Targeting: X: ' & int($aTarget[0]) & ' / Y: ' & int($aTarget[1]) & ' / Z: ' & int($aTarget[2]) )

    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
