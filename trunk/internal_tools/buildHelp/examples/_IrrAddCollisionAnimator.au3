#include "au3Irrlicht2.au3"

_IrrStart()

_IrrAddZipFile( "./media/map-20kdm2.pk3", $IRR_IGNORE_CASE, $IRR_IGNORE_PATHS )
$meshBSP = _IrrGetMesh( "20kdm2.bsp" )
local $nodeBSP = _IrrAddMeshToSceneAsOcttree( $meshBSP )

local $nodeCamera = _IrrAddFPSCamera()
_IrrSetNodePosition( $nodeCamera, 1750, 149, 1369 )

local $selectorMap = _IrrGetCollisionGroupFromComplexMesh( $meshBSP, $nodeBSP )
local $animator = _IrrAddCollisionAnimator($selectorMap, $nodeCamera, _
                         30.0,30.0,30.0,   0.0,-9.8,0.0,   0.0,50.0,0.0 )

WHILE _IrrRunning()
    _IrrBeginScene(50, 50, 50)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
