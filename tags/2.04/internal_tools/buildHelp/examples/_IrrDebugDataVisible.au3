
#include "au3Irrlicht2.au3"

_IrrStart()

local $camera = _IrrAddFPSCamera()
local $mesh = _IrrGetMesh( ".\media\capsuleX.obj" )
local $nodeTest = _IrrAddMeshToScene( $mesh )
_IrrSetNodeMaterialTexture( $nodeTest, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeTest, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodePosition($nodeTest, 0, 0, 8 )

_IrrDebugDataVisible($nodeTest, $EDS_FULL )

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()