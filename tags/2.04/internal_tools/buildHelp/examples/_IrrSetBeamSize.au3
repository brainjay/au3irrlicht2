#include "au3Irrlicht2.au3"

Global $hBeamNode
Global $hTexture
Global $hCamera

_IrrStart()

$hBeamNode = _IrrAddBeamSceneNode()
_IrrSetBeamPosition($hBeamNode, 15.0, 20.0, 20.0, -15.0, -20.0, -20.0)
_IrrSetBeamSize($hBeamNode, 5.0)
$hTexture = _IrrGetTexture("./media/beam.png")
_IrrSetNodeMaterialTexture($hBeamNode, $hTexture, 0)
_IrrSetNodeMaterialType($hBeamNode, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL)

$hCamera = _IrrAddCamera(50, 0, 0, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()