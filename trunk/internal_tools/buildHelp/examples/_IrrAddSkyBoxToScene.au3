#include <au3Irrlicht2.au3>

_IrrStart( )

local $nodeSkyBox = _IrrAddSkyBoxToScene( _
        _IrrGetTexture("./media/irrlicht2_up.jpg"), _
        _IrrGetTexture("./media/irrlicht2_dn.jpg"), _
        _IrrGetTexture("./media/irrlicht2_rt.jpg"), _
        _IrrGetTexture("./media/irrlicht2_lf.jpg"), _
        _IrrGetTexture("./media/irrlicht2_ft.jpg"), _
        _IrrGetTexture("./media/irrlicht2_bk.jpg"))

local $nodeCamera = _IrrAddFPSCamera()

WHILE _IrrRunning()
    _IrrBeginScene( 240, 255, 255 )
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
