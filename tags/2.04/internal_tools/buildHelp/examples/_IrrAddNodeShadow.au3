#include "au3Irrlicht2.au3"

_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

local $texture = _IrrGetTexture(".\media\au3irr2_logo.jpg")

local $meshReceive = _IrrAddHillPlaneMesh( "Plane", 8, 8, 1, 1)
local $nodeReceive = _IrrAddMeshToScene( $meshReceive )
_IrrSetNodeMaterialTexture( $nodeReceive, $texture, 0)

local $meshCast = _IrrGetMesh(".\media\sphere.obj")
local $nodeCast = _IrrAddMeshToScene($meshCast)
_IrrSetNodeMaterialTexture( $nodeCast, $texture, 0)
_IrrAddFlyCircleAnimator($nodeCast, 1, 3, 1, 3, 0.0005)

local $nodeLight = _IrrAddLight($IRR_NO_PARENT, 0,50,0, 0.9,0.3,0.3, 1000.0)
_IrrAddNodeShadow($nodeCast)

local $nodeCamera = _IrrAddCamera(-5,5,-6, 0,0,0 )

WHILE _IrrRunning()
    _IrrBeginScene(100, 100, 100)
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()