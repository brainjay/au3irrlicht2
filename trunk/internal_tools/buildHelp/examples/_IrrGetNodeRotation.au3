#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeTest = _IrrAddTestSceneNode()
local $nodeCamera = _IrrAddFPSCamera()
_IrrSetNodePosition($nodeCamera, 0, 0, -50)

local $aVector3df

WHILE _IrrRunning()
    _IrrBeginScene( 0, 0, 50 )
    _IrrDrawScene()

	$aVector3df = _IrrGetNodeRotation($nodeCamera)
	_IrrSetWindowCaption("Camera rotation (x/y/z): " & _
		int($aVector3df[0]) & " / " & int($aVector3df[1]) & " / " & int($aVector3df[2]))

    _IrrEndScene()
WEND

_IrrStop()
