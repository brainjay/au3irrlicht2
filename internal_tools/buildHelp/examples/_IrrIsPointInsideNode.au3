#include "au3Irrlicht2.au3"

HotKeySet("{ESC}", "_exit")

Global $hNode, $hCamera, $aV3d

_IrrStart()

$hNode = _IrrAddTestSceneNode()
$hCamera = _IrrAddFPSCamera()
_IrrSetNodePosition($hCamera, 0, 0, -100)

While _IrrRunning() And Sleep(10)
	$aV3d = _IrrGetCameraTarget($hCamera)
	_IrrSetWindowCaption("Point is inside node: " & (_IrrIsPointInsideNode($hNode,  $aV3d[0], $aV3d[1], $aV3d[2]) = 1))
	_IrrBeginScene(240, 255, 255)
	_IrrDrawScene()
	_IrrEndScene()
WEnd

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit