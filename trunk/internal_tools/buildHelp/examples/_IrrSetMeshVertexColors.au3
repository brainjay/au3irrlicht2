#include "au3Irrlicht2.au3"

Global $hMesh, $iVertexCount, $tColor, $hNode

_IrrStart()

; Load a sphere mesh
$hMesh = _IrrAddSphereSceneMesh("Shere Mesh 1", 8, 32)

; Create a struct containing an array of colors
$iVertexCount = _IrrGetMeshVertexCount($hMesh, 0)
$tColor = DllStructCreate("uint[" & $iVertexCount & "]")
For $i = 1 To $iVertexCount
	If Not Mod($i, 4) Then
		DllStructSetData($tColor, 1, _IrrMakeARGB(255, 255, 255, 0), $i) ;yellow
	Else
		DllStructSetData($tColor, 1, _IrrMakeARGB(255, 255, 0, 0), $i) ; red
	EndIf
Next

; hand a pointer to the struct of array colors to set the mesh vertice colors
_IrrSetMeshVertexColors($hMesh, DllStructGetPtr($tColor))

; Clear the struct since we've finished with it.
$tColor = 0

; add the colored sphere mesh to the scene.
$hNode = _IrrAddMeshToScene($hMesh)
_IrrAddRotationAnimator($hNode, 0.1, 0.7, 0.1)
_IrrSetNodeMaterialFlag($hNode, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrAddCamera(0, 20, 0, 0, 0, 0)

While _IrrRunning()
	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()