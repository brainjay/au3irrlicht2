#include "au3Irrlicht2.au3"

Global $hMesh, $hNode, $hTexture, $i, $fScale = 1.01

_IrrStart()

$hMesh = _IrrGetMesh("./media/capsuleX.obj")
$hNode = _IrrAddMeshToScene($hMesh)
$hTexture = _IrrGetTexture("./media/default_texture.png")
_IrrSetNodeMaterialTexture($hNode, $hTexture, 0)
_IrrSetNodeMaterialFlag($hNode, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrAddCamera(0, 0, 10, 0, 0, 0)

While _IrrRunning() And Sleep(10)
	$i += 1
	If $i = 140 Then
		If $fScale = 1.01 Then
			$fScale = 0.99
		Else
			$fScale = 1.01
		EndIf
		$i = 0
	EndIf

	_IrrScaleMesh($hMesh, $fScale)

	_IrrBeginScene(0, 0, 0)
	_IrrDrawScene()
	_IrrEndScene()
WEnd