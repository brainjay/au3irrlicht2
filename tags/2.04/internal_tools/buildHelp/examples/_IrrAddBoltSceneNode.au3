#include "au3Irrlicht2.au3"

Global $hBoltNode, $hTexture, $hCamera

_IrrStart()

$hBoltNode = _IrrAddBoltSceneNode()
_IrrSetBoltProperties($hBoltNode, 0, 90, 0, 0, 0, 0, 50, 10, 2, 10, 6, $IRR_ON, 0xFFFFFFFF)
$hTexture = _IrrGetTexture("./media/ParticleBlue.bmp")
_IrrSetNodeMaterialTexture($hBoltNode, $hTexture, 0)

$hCamera = _IrrAddCamera(40, 50, 40, 0, 50, 0)

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(16, 24, 32)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()