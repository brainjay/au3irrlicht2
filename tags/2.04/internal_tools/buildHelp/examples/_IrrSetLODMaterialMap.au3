#include "au3Irrlicht2.au3"

Global $ROWS_AND_COLUMNS = 20
Global $hLOD1Mesh
Global $hLOD2Mesh
Global $hMeshTexture
Global $iAmountNodes = $ROWS_AND_COLUMNS * $ROWS_AND_COLUMNS
Global $aSceneNodes[$iAmountNodes]
Global $hMaterial
Global $k = 0
Global $hLODManager
Global $hCamera

_IrrStart()

$hLOD1Mesh = _IrrGetMesh("./media/cylinderY.obj")
$hLOD2Mesh = _IrrGetMesh("./media/cylinderYLow.obj")
_IrrScaleMesh($hLOD1Mesh, 8.0)
_IrrScaleMesh($hLOD2Mesh, 8.0)
_IrrSetMeshHardwareAccelerated($hLOD1Mesh)
_IrrSetMeshHardwareAccelerated($hLOD2Mesh)
$hMeshTexture = _IrrGetTexture("./media/Cross.bmp")
For $i = -($ROWS_AND_COLUMNS / 2) To ($ROWS_AND_COLUMNS / 2) - 1
	For $j = -($ROWS_AND_COLUMNS / 2) To ($ROWS_AND_COLUMNS / 2) - 1
		$aSceneNodes[$k] = _IrrAddMeshToScene($hLOD1Mesh)
		_IrrSetNodePosition($aSceneNodes[$k], $i * 40.0, 0.0, $j * 40.0)
		_IrrSetNodeMaterialTexture($aSceneNodes[$k], $hMeshTexture, 0)
		_IrrSetNodeMaterialFlag($aSceneNodes[$k], $IRR_EMF_LIGHTING, $IRR_ON)
		$hMaterial = _IrrGetMaterial($aSceneNodes[$k], 0)
		_IrrMaterialVertexColorAffects($hMaterial, $ECM_NONE)
		_IrrMaterialSetAmbientColor($hMaterial, 255, 255, 255, 255)
		_IrrMaterialSetDiffuseColor($hMaterial, 255, 255, 255, 255)
		$k += 1
	Next
Next
$hLODManager = _IrrAddLODManager(2, $IRR_ON)
_IrrSetLODMaterialMap($hLODManager, $IRR_EMT_TRANSPARENT_ADD_COLOR, $IRR_EMT_TRANSPARENT_ADD_COLOR)
_IrrAddLODMesh($hLODManager, 0.0, $hLOD1Mesh)
_IrrAddLODMesh($hLODManager, 300.0, $hLOD2Mesh)
_IrrAddLODMesh($hLODManager, 500.0, $IRR_NO_OBJECT)
_IrrSetNodeMaterialFlag($hLODManager, $IRR_EMF_LIGHTING, $IRR_OFF)
For $i = 0 To $k - 1
	_IrrAddChildToParent($aSceneNodes[$i], $hLODManager)
Next

$hCamera = _IrrAddFPSCamera($IRR_NO_OBJECT, 100.0, 0.05)
_IrrSetNodePosition($hCamera, 0, $ROWS_AND_COLUMNS * 4, $ROWS_AND_COLUMNS * 2)
_IrrSetCameraTarget($hCamera, 0, 50, 0)
_IrrSetCameraClipDistance($hCamera, 2500.0)

_IrrSetAmbientLight(1, 1, 1)

_IrrHideMouse()

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()