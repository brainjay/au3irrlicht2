#include "au3Irrlicht2.au3"

Global $hNode

_IrrStart()

$hNode = _IrrAddSkyBoxToScene( _
		_IrrGetTexture("./media/irrlicht2_up.jpg"), _
		_IrrGetTexture("./media/irrlicht2_dn.jpg"), _
		_IrrGetTexture("./media/irrlicht2_rt.jpg"), _
		_IrrGetTexture("./media/irrlicht2_lf.jpg"), _
		_IrrGetTexture("./media/irrlicht2_ft.jpg"), _
		_IrrGetTexture("./media/irrlicht2_bk.jpg"))

_IrrAddCamera(0, 0, -50, 0, 0, 0)

_IrrSetWindowCaption(_IrrGetMaterialCount($hNode) & " materials are associated to this SkyBox node")

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(255, 255, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrEndScene()