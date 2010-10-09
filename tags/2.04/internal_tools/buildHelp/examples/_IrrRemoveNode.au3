#include "au3Irrlicht2.au3"

_IrrStart()

local $camera = _IrrAddCamera(2,2,2, 0,0,0 )

local $mesh = _IrrGetMesh( ".\media\capsuleX.obj" )
local $sceneNode = _IrrAddMeshToScene( $mesh )

local $texture = _IrrGetTexture(".\media\default_texture.png")
_IrrSetNodeMaterialTexture( $sceneNode, $texture, 0)
_IrrSetNodeMaterialFlag( $sceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

local $time = TimerInit()
WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()

	if $sceneNode <> 0 AND TimerDiff($time) > 3000 then
		_IrrRemoveNode($sceneNode)
		_IrrRemoveTexture($texture) ; no longer needed
		$sceneNode = 0
	EndIf

WEND

_IrrStop()
