#include "au3Irrlicht2.au3"

_IrrStart()

local $BillboardTexture = _IrrGetTexture( "./media/au3irr2_logo.jpg" )
local $Billboard = _IrrAddBillBoardToScene( 200.0,102, 0.0,0.0,100.0 )

_IrrSetNodeMaterialTexture( $Billboard, $BillboardTexture, 0 )
_IrrSetNodeMaterialFlag( $Billboard, $IRR_EMF_LIGHTING, $IRR_OFF )

local $Camera = _IrrAddFPSCamera()

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 0)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
