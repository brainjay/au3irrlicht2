#include "au3Irrlicht2.au3"

Global $hNodeA, $hNodeB, $hTexture

_IrrStart()

$hTexture = _IrrGetTexture("./media/skydome2.jpg")
$hNodeA = _IrrAddCubeSceneNode(10)
_IrrSetNodeMaterialTexture($hNodeA, $hTexture, 0)
_IrrAddRotationAnimator($hNodeA, 0.4, 0.3, 0.0)
$hNodeB = _IrrAddSphereSceneNode(5, 32)
_IrrSetNodeMaterialTexture($hNodeB, $hTexture, 0)
_IrrSetNodePosition($hNodeB, 9.0, 9.0, 9.0)
_IrrAddRotationAnimator($hNodeB, 1.0, 1.0, 1.0)

_IrrAddChildToParent($hNodeB, $hNodeA)

_IrrSetAmbientLight(1.0, 1.0, 1.0)
_IrrAddCamera(0, 0, -40, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(100, 100, 100)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()