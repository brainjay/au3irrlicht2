#include "au3Irrlicht2.au3"

_IrrStart()

local $MD2Mesh = _IrrGetMesh( "./media/zumlin.md2" )
local $MeshTexture = _IrrGetTexture( "./media/zumlin.pcx" )
local $SceneNode = _IrrAddMeshToScene( $MD2Mesh )
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_SALUTE )

local $camera = _IrrAddCamera( 50,0,0, 0,0,0 )

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 0)
    _IrrDrawScene()
    _IrrEndScene()
WEND
