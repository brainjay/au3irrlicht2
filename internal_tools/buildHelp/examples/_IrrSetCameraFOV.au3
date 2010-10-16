#include "au3Irrlicht2.au3"

Global $hCamera, $PI = 4 * ATan(1), $d = 2.5, $e = "$d + 0.005"

_IrrStart()

_IrrAddSkyBoxToScene( _
		_IrrGetTexture("./media/irrlicht2_up.jpg"), _
		_IrrGetTexture("./media/irrlicht2_dn.jpg"), _
		_IrrGetTexture("./media/irrlicht2_rt.jpg"), _
		_IrrGetTexture("./media/irrlicht2_lf.jpg"), _
		_IrrGetTexture("./media/irrlicht2_ft.jpg"), _
		_IrrGetTexture("./media/irrlicht2_bk.jpg"))

$hCamera = _IrrAddCamera(0, 0, 0, 0, 0, 1)

While _IrrRunning() And Sleep(10)
	If $d <= 1.25 Then $e = "$d + 0.005"
	If $d >= 3.75 Then $e = "$d - 0.005"
	$d = Execute($e)

	_IrrSetCameraFOV($hCamera, $PI / $d)

	_IrrBeginScene(0, 0, 255)
	_IrrDrawScene()
	_IrrEndScene()
WEnd