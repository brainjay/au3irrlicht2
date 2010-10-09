#include "au3Irrlicht2.au3"

_IrrStart()

_IrrAddZipFile( "./media/map-20kdm2.pk3", $IRR_IGNORE_CASE, $IRR_IGNORE_PATHS )
$BSPMesh = _IrrGetMesh( "20kdm2.bsp" )
local $BSPNode = _IrrAddMeshToSceneAsOcttree( $BSPMesh )

local $camera = _IrrAddFPSCamera()
_IrrSetNodePosition( $camera, 1750, 149, 1369 )

WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
