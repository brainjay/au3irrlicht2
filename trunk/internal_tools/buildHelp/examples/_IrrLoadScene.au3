#include "au3Irrlicht2.au3"

Global $hCamera

_IrrStart()

_IrrAddZipFile("./media/example.zip", $IRR_IGNORE_CASE, $IRR_IGNORE_PATHS)

_IrrLoadScene("example.irr")

$hCamera = _IrrAddFPSCamera($IRR_NO_OBJECT, 100, 0.5)
_IrrSetNodePosition($hCamera, -20, 20, -50)
_IrrHideMouse()

While _IrrRunning()
	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()