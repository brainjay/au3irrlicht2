#include "au3Irrlicht2.au3"

_IrrStart()

local $mesh = _IrrGetMesh( "./media/cube.x" )

local $tVertex; variable for the vertex array struct
; copy the vertex information into the array
local $vertex_count = _IrrGetMeshVertices( $mesh, 0, $tVertex)

local $i
for $i = 0 to $vertex_count - 1 ; itterate through all of the vertices
    ; shrink vertex X location by half its size, then change vertex colour value
	__SetVertStruct($tVertex, $i, $VERT_X, __GetVertStruct($tVertex, $i, $VERT_X) * 0.5 )
	__SetVertStruct($tVertex, $i, $VERT_VCOLOR, _IrrMakeARGB(0, Random(0,255), Random(0,255), Random(0,255) ) )
next ; $i

; copy the altered vertex infomation back to the mesh
_IrrSetMeshVertices( $mesh, 0, $tVertex )

; add mesh and camera to the scene:
local $nodeCube = _IrrAddMeshToScene( $mesh )
_IrrSetNodeMaterialFlag( $nodeCube, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodePosition($nodeCube, -0.5, -0.5, 5)

_IrrAddFPSCamera($IRR_NO_OBJECT, 5, 0.01 )

WHILE _IrrRunning()
    _IrrBeginScene( 0, 0, 25 )
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
