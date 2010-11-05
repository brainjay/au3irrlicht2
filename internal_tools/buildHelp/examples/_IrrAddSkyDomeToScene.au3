#include "au3Irrlicht2.au3"

Global $hSkyDome, $hCamera

_IrrStart()

$hSkyDome = _IrrAddSkyDomeToScene(_IrrGetTexture("./media/skydome2.jpg"), 16, 8, 1.0, 1.2)

$hCamera = _IrrAddFPSCamera()

While _IrrRunning()
    _IrrBeginScene(0, 200, 200)
    _IrrDrawScene()
    _IrrEndScene()
WEnd