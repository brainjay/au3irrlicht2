; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by smashly
; ----------------------------------------------------------------------------
; Example 96 : Shadow Maps
; This example provides a sandbox for playing around with lighting switching
; lights on and off and enabling baked shadows in a shadow map.
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "../au3Irrlicht2.au3"

Opt("MustDeclareVars", 1)

HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc   ;==>_exit

; ////////////////////////////////////////////////////////////////////////////
; global variables
Global $hMesh, $hMeshTexture, $hSceneNode
Global $hSunTexture, $hSun, $hMoonTexture, $hMoon
Global $hCamera, $hLight
Global $fRed = 0.2, $fGreen = 0.2, $fBlue = 0.3, $fFallOff = 100.0
Global $fRedInc, $fGreenInc, $fBlueInc, $fFallOffInc
Global $iIndex = 0, $iBlend = 0
Global $Timer = TimerInit()

; Just so we can get an idea of what the data in the $aLighting array is related to;
;  $aLighting[x][0] = Red
;  $aLighting[x][1] = Blue
;  $aLighting[x][2] = Green
;  $aLighting[x][3] = FallOff
Dim $aLighting[7][4] = [[0.2, 0.2, 0.3, 100.0], _
		[0.6, 0.4, 0.4, 200.0], _
		[0.9, 0.8, 0.6, 400.0], _
		[1.0, 1.0, 0.9, 600.0], _
		[1.0, 1.0, 0.9, 400.0], _
		[0.7, 0.6, 0.3, 200.0], _
		[0.2, 0.2, 0.3, 100.0]]

; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart($IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
		$IRR_WINDOWED, $IRR_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON)

; set the window caption
_IrrSetWindowCaption("Example 96: Shadow Maps")

; load a mesh this acts as a blue print for the model
$hMesh = _IrrGetMesh("../media/pot.obj")
_IrrScaleMesh($hMesh, 20.0)

; load texture resources for texturing the scene nodes
_IrrSetTextureCreationFlag($ETCF_CREATE_MIP_MAPS, $IRR_OFF)
$hMeshTexture = _IrrGetTexture("../media/PotLightMap.jpg")

; add the mesh to the scene as a new node, the node is an instance of the
; mesh object supplied here
$hSceneNode = _IrrAddMeshToScene($hMesh)

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture($hSceneNode, $hMeshTexture, 0)

; Create a billboard representing the $hSun
; load the texture resource for the billboard
$hSunTexture = _IrrGetTexture("../media/Sun.tga")

; add the billboard to the scene
$hSun = _IrrAddBillBoardToScene(256.0, 256.0, 300.0, 275.0, 500.0)

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialTexture($hSun, $hSunTexture, 0)

; hide transparent areas
_IrrSetNodeMaterialFlag($hSun, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrSetNodeMaterialType($hSun, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL)

; Create a billboard representing the $hMoon
; load the texture resource for the billboard
$hMoonTexture = _IrrGetTexture("../media/Moon.tga")

; add the billboard to the scene
$hMoon = _IrrAddBillBoardToScene(128.0, 128.0, 300.0, 0.0, 500.0)

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialFlag($hMoon, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrSetNodeMaterialTexture($hMoon, $hMoonTexture, 0)

; hide transparent areas
_IrrSetNodeMaterialType($hMoon, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL)

; add a camera into the scene
$hCamera = _IrrAddFPSCamera($IRR_NO_OBJECT, 100.0, 0.1)
_IrrSetNodePosition($hCamera, 40, 40, -100)
_IrrSetCameraTarget($hCamera, 40, 20, 0)

; add light sorce to the sun
$hLight = _IrrAddLight($IRR_NO_PARENT, 0, 0, 0, 0.9, 0.7, 0.3, 1200.0)
_IrrAddChildToParent($hLight, $hSun)

_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running

While _IrrRunning()
	; is it time for another frame
	If TimerDiff($Timer) > 16.7 Then
		$Timer = TimerInit()

		; begin the scene, erasing the canvas with color before rendering
		_IrrBeginScene(192 * $fRed, 192 * $fGreen, 256 * $fBlue)

		; Blend colors
		If $iBlend = 0 Then
			$iIndex += 1
			If $iIndex > 6 Then $iIndex = 0
			$fRedInc = ($aLighting[$iIndex][0] - $fRed) / 200
			$fGreenInc = ($aLighting[$iIndex][1] - $fGreen) / 200
			$fBlueInc = ($aLighting[$iIndex][2] - $fBlue) / 200
			$fFallOffInc = ($aLighting[$iIndex][3] - $fFallOff) / 200
			$iBlend = 200
		EndIf

		$iBlend -= 1
		$fRed += $fRedInc
		$fGreen += $fGreenInc
		$fBlue += $fBlueInc
		$fFallOff += $fFallOffInc

		; change the color of the lighting
		_IrrSetLightDiffuseColor($hLight, $fRed, $fGreen, $fBlue)
		_IrrSetLightFallOff($hLight, $fFallOff)

		; Change the Position of the $hSun and $hMoon
		_IrrSetNodePosition($hSun, Cos(($fFallOff - 300) / 200) * 310.0, _
				Sin(($fFallOff - 300) / 200) * 480.0, _
				Cos(($fFallOff - 300) / 200) * 510.0)
		_IrrSetNodePosition($hMoon, Cos((300 - $fFallOff) / 200) * 350.0, _
				Sin((300 - $fFallOff) / 200) * 475.0, _
				Cos((300 - $fFallOff) / 200) * 400.0)

		; draw the scene
		_IrrDrawScene()

		; end drawing the scene and render it
		_IrrEndScene()
	EndIf
WEnd
