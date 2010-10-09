
#include "au3Irrlicht2.au3"


_IrrStart()

local $orgMesh = _IrrGetMesh( "./media/zumlin.md2" )

local $tVertex; variable for the vertex array struct
; copy the vertex information into the array:
local $vertex_count = _IrrGetMeshVertices( $orgMesh, 0, $tVertex)

local $i
for $i = 0 to $vertex_count - 1 ; itterate through all of the vertices
    ; shrink vertex Y location by half its size, then change vertex colour value
    __SetVertStruct($tVertex, $i, $VERT_Y, __GetVertStruct($tVertex, $i, $VERT_Y) * 0.5 )
    __SetVertStruct($tVertex, $i, $VERT_VCOLOR, _IrrMakeARGB(0, Random(0,255), Random(0,255), Random(0,255) ) )
next ; $i

; create a second mesh with the modified vertices data and unmodified indices:
local $aIndices ; variable that will hold array of indices:
_IrrGetMeshIndices($orgMesh, 0, $aIndices)
local $secondMesh = _IrrCreateMesh("secondMesh", $tVertex, $aIndices )

local $texture = _IrrGetTexture(".\media\default_texture.png")

; add both meshes and a camera to the scene:
local $nodeCube1 = _IrrAddMeshToScene( $orgMesh )
_IrrSetNodeMaterialTexture( $nodeCube1, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeCube1, $IRR_EMF_LIGHTING, $IRR_OFF )
local $nodeCube2 = _IrrAddMeshToScene( $secondMesh )
_IrrSetNodeMaterialFlag( $nodeCube2, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodePosition($nodeCube2, 0, 0, 30)

_IrrAddCamera(50, 0, 30, 0, 0, 18)

WHILE _IrrRunning()
    _IrrBeginScene( 0, 0, 25 )
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()