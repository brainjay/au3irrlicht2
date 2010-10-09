#include "au3Irrlicht2.au3"

Global $hMD2Mesh, $hMeshTexture, $hSceneNode, $hMayaCamera

_IrrStart()

$hMD2Mesh = _IrrGetMesh("./media/zumlin.md2")
$hMeshTexture = _IrrGetTexture("./media/zumlin.pcx")
$hSceneNode = _IrrAddMeshToScene($hMD2Mesh)
_IrrSetNodeMaterialTexture($hSceneNode, $hMeshTexture, 0)
_IrrSetNodeMaterialFlag($hSceneNode, $IRR_EMF_LIGHTING, $IRR_OFF)

$hMayaCamera = _IrrAddMayaCamera($hSceneNode)
_IrrSetCameraTarget($hMayaCamera, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	_IrrBeginScene(240, 255, 255)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

_IrrStop()