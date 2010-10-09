#include "au3Irrlicht2.au3"

; better example welcome :)

_IrrStart()

_IrrAddTestSceneNode()
local $nodeCamera = _IrrAddFPSCamera()
_IrrSetNodePosition($nodeCamera, 0, 0, -50)

local $aVectForward, $aVectUpward, $aVectSide

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 50)

	_IrrGetCameraOrientation($nodeCamera, $aVectForward, $aVectUpward, $aVectSide)
	_IrrSetWindowCaption('Upward vector: ' & _
		$aVectUpward[0] & ' / Y: ' & $aVectUpward[1] & ' / Z: ' & $aVectUpward[2] )

    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
