#include "au3Irrlicht2.au3"

Global $hMesh, $iVertexCount, $tVertex, $tVertices, $j = 1, $hNode

_IrrStart()

; Load a Cube mesh and we'll set some of the vertices color to Red.
$hMesh = _IrrGetMesh("./media/cube.x")
_IrrSetMeshVertexSingleColor($hMesh, _IrrMakeARGB(255, 255, 0, 0), 0, 0, 3)

; Get the vertices of the loaded mesh
$iVertexCount = _IrrGetMeshVertices($hMesh, 0, $tVertex)

; Create a struct for containing an array of changed vertices.
$tVertices = DllStructCreate("float[" & $iVertexCount * 3 & "]")

; Loop through vertices we retrieved from _IrrGetMeshVertices
; Add the new adjusted vertice coordinate to the DllStruct we created.
; I'm changing all vertex coordinates and making the cube rectangular.
For $i = 0 To $iVertexCount - 1
	DllStructSetData($tVertices, 1, __GetVertStruct($tVertex, $i, $VERT_X) * 6, $j)
	DllStructSetData($tVertices, 1, __GetVertStruct($tVertex, $i, $VERT_Y) * 4, $j + 1)
	DllStructSetData($tVertices, 1, __GetVertStruct($tVertex, $i, $VERT_Z) * 2, $j + 2)
	$j += 3
Next

; pass a pointer to the struct array of adjusted vertex coordinates to set all the mesh vertex coordinates
_IrrSetMeshVertexCoords($hMesh, DllStructGetPtr($tVertices))

$hNode = _IrrAddMeshToScene($hMesh)
_IrrSetNodeMaterialFlag($hNode, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrAddRotationAnimator($hNode, 0.1, 0.7, 0.1)
_IrrAddCamera(0, 20, 0, 0, 0, 0)

While _IrrRunning()
	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()