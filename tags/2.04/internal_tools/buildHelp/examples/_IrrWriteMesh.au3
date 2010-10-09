#include "au3Irrlicht2.au3"

Global $hMD2Mesh
Global $hMeshTexture
Global $hSceneNode
Global $hCamera
Global $hIrrMesh
Global $sIrrMesh = "ZumlinStaticMesh.irrmesh"

_IrrStart()

$hMD2Mesh = _IrrGetMesh("./media/zumlin.md2")
$hMeshTexture = _IrrGetTexture("./media/zumlin.pcx")
$hSceneNode = _IrrAddMeshToScene($hMD2Mesh)
_IrrSetNodeMaterialTexture($hSceneNode, $hMeshTexture, 0)
_IrrSetNodeMaterialFlag($hSceneNode, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrSetNodePosition($hSceneNode, 0, 0, 20)

If _IrrWriteMesh($hMD2Mesh, $EMWT_IRR_MESH, $sIrrMesh) And FileExists($sIrrMesh) Then
	$hIrrMesh = _IrrGetMesh($sIrrMesh)
	$hSceneNode = _IrrAddMeshToScene($hIrrMesh)
	_IrrSetNodeMaterialTexture($hSceneNode, $hMeshTexture, 0)
	_IrrSetNodeMaterialFlag($hSceneNode, $IRR_EMF_LIGHTING, $IRR_OFF)
	_IrrSetNodePosition($hSceneNode, 0, 0, -20)
	FileDelete($sIrrMesh)
EndIf

$hCamera = _IrrAddCamera(50, 0, 0, 0, 0, 0)

While _IrrRunning()
	_IrrBeginScene(240, 255, 255)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()