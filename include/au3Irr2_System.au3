#include-once

#include "au3Irr2_constants.au3"

; #INDEX# =======================================================================================================================
; Title .........: [todo]
; AutoIt Version : [todo]
; Language ......: English
; Description ...: [todo]
;                  [todo]
;                  [todo]
; Author(s) .....: [todo]
; Dll(s) ........: [todo]
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Not working/documented/implemented at this time
;_IrrSetViewPort
;_IrrBeginScene
;_IrrBeginSceneAdvanced
;_IrrDrawScene
;_IrrDrawSceneToTexture
;_IrrSetRenderTarget
;_IrrDrawGUI
;_IrrEndScene
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;_IrrStart
;_IrrStartAdvanced
;_IrrRunning
;_IrrStop
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

; #FUNCTION# =============================================================================================================
; Name...........: _IrrStart
; Description ...: opens the IrrlichtWrapper.dll and starts Irrlicht engine.;
; Syntax.........: _IrrStart($i_DeviceType = 3, $i_ScreenWidth = 800, $i_ScreenHeight = 600, $i_BitsPerPixel = 1, $i_FullScreen = 0, $i_Shadows = 0, $i_InputCapture = 0, $i_VSync = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: Success - True
;                  Failure - 1: error occured on dll call
;                  |2: IrrlichtWrapper.dll not found
; Author ........: [todo]
; Modified.......:
; Remarks .......: if .dll cannot be opened, path environment is extended with .\bin (so program can have its
;                  binaries in separate dir) and .\.. (so e.g. au3irrlicht2-examples can be run from sub-dir)
;                  Nevertheless, this is a fallback. EnvUpdate can take some time, so best is to be sure .dll
;                  can be found at once!
;                  Other needed .dll's (Irrlicht.dll + maybe msvcp71.dll are NOT checked but simply expected
;                  to be at last in same dir as the IrrlichtWrapper.dll.
; Related .......: _IrrStartAdvanced, _IrrRunning, _IrrStop
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrStart($i_DeviceType = 3, $i_ScreenWidth = 800, $i_ScreenHeight = 600, $i_BitsPerPixel = 1, $i_FullScreen = 0, $i_Shadows = 0, $i_InputCapture = 0, $i_VSync = 0)

	$_irrDll = DllOpen("IrrlichtWrapper.dll")
	if $_irrDll = -1 Then ; .dll cannot be opened - try to get it by extending %path%:
		EnvSet("PATH", @ScriptDir & "\bin;" & @ScriptDir & "\..\;" & EnvGet("PATH"))
		EnvUpdate()

		$_irrDll = DllOpen("IrrlichtWrapper.dll")
		if $_irrDll = -1 Then ; no chance, so return error:
			Return Seterror(2,0,False)
		EndIf
	EndIf

	DllCall($_irrDll, "none:cdecl", "IrrStart", "int", $i_DeviceType, "int", $i_ScreenWidth, "int", $i_ScreenHeight, "int", $i_BitsPerPixel, "uint", $i_FullScreen, "int", $i_Shadows, "int", $i_InputCapture, "int", $i_VSync)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrStart



; #FUNCTION# =============================================================================================================
; Name...........: _IrrStartAdvanced
; Description ...: opens the IrrlichtWrapper.dll and starts Irrlicht engine with advanced method.
; Syntax.........: _IrrStartAdvanced($i_DeviceType = 3, $i_ScreenWidth = 800, $i_ScreenHeight = 600, $i_BitsPerPixel = 1, $i_FullScreen = 0, $i_Shadows = 0, $i_InputCapture = 0, $i_VSync = 0, $i_TypeOfDevice = 0, $i_DoublebufferEnabled = 0, $i_AntialiasEnabled = 0, $i_HighPrecisionFpu = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: Success - Return value from the dll call.
;                  Failure - 1: error occured on dll call
;                  |2: IrrlichtWrapper.dll not found
; Author ........: [todo]
; Modified.......:
; Remarks .......: if .dll cannot be opened, path environment is extended with .\bin (so program can have its
;                  binaries in separate dir) and .\.. (so e.g. au3irrlicht2-examples can be run from sub-dir)
;                  Nevertheless, this is a fallback. EnvUpdate can take some time, so best is to be sure .dll
;                  can be found at once!
;                  Other needed .dll's (Irrlicht.dll + maybe msvcp71.dll are NOT checked but simply expected
;                  to be at last in same dir as the IrrlichtWrapper.dll.
; Related .......: _IrrStart, _IrrRunning, _IrrStop
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _IrrStartAdvanced($i_DeviceType = 3, $i_ScreenWidth = 800, $i_ScreenHeight = 600, $i_BitsPerPixel = 1, $i_FullScreen = 0, $i_Shadows = 0, $i_InputCapture = 0, $i_VSync = 0, $i_TypeOfDevice = 0, $i_DoublebufferEnabled = 0, $i_AntialiasEnabled = 0, $i_HighPrecisionFpu = 0)

	$_irrDll = DllOpen("IrrlichtWrapper.dll")
	if $_irrDll = -1 Then ; .dll cannot be opened - try to get it by extending %path%:
		EnvSet("PATH", @ScriptDir & "\bin;" & @ScriptDir & "\..\;" & EnvGet("PATH"))
		EnvUpdate()

		$_irrDll = DllOpen("IrrlichtWrapper.dll")
		if $_irrDll = -1 Then ; no chance, so return error:
			Return Seterror(2,0,False)
		EndIf
	EndIf

	$result = DllCall($_irrDll, "uint:cdecl", "IrrStart", "int", $i_DeviceType, "int", $i_ScreenWidth, "int", $i_ScreenHeight, _
			"int", $i_BitsPerPixel, "uint", $i_FullScreen, "uint", $i_Shadows, "uint", $i_InputCapture, "uint", $i_VSync, _
			"uint", $i_TypeOfDevice, "uint", $i_DoublebufferEnabled, "uint", $i_AntialiasEnabled, "uint", $i_HighPrecisionFpu)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrStartAdvanced



; #FUNCTION# =============================================================================================================
; Name...........: _IrrRunning
; Description ...: [todo]
; Syntax.........: _IrrRunning()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: _IrrStart, _IrrStartAdvanced, _IrrStop
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _IrrRunning()
	$result = DllCall($_irrDll, "int:cdecl", "IrrRunning")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrRunning


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetViewPort
; Description ...: [todo]
; Syntax.........: _IrrSetViewPort($i_TopX, $i_TopY, $i_BottomX, $i_BottomY)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetViewPort($i_TopX, $i_TopY, $i_BottomX, $i_BottomY)
	DllCall($_irrDll, "none:cdecl", "IrrSetViewPort", "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetViewPort


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrBeginScene
; Description ...: [todo]
; Syntax.........: _IrrBeginScene($i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrBeginScene($i_Red, $i_Green, $i_Blue)
; initialise the frame drawing cycle, erasing the canvas ready for drawing
	DllCall($_irrDll, "none:cdecl", "IrrBeginScene", "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrBeginScene



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrBeginSceneAdvanced
; Description ...: [todo]
; Syntax.........: _IrrBeginSceneAdvanced($i_SceneBGColor, $i_ClearBackBuffer = 1, $i_ClearZBuffer = 1)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrBeginSceneAdvanced($i_SceneBGColor, $i_ClearBackBuffer = 1, $i_ClearZBuffer = 1)
; Readies a scene for rendering, erasing the canvas and setting a background color.
	DllCall($_irrDll, "none:cdecl", "IrrBeginSceneAdvanced", "uint", $i_SceneBGColor, "byte", $i_ClearBackBuffer, "byte", $i_ClearZBuffer)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrBeginSceneAdvanced



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDrawScene
; Description ...: [todo]
; Syntax.........: _IrrDrawScene()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrDrawScene()
	DllCall($_irrDll, "none:cdecl", "IrrDrawScene")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDrawScene


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDrawSceneToTexture
; Description ...: [todo]
; Syntax.........: _IrrDrawSceneToTexture($h_RenderTargetTexture)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrDrawSceneToTexture($h_RenderTargetTexture)
;use IrrCreateRenderTargetTexture to get $h_RenderTargetTexture
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrDrawSceneToTexture", "ptr", $h_RenderTargetTexture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrDrawSceneToTexture



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetRenderTarget
; Description ...: [todo]
; Syntax.........: _IrrSetRenderTarget($h_Texture, $i_SceneBGColor = 0, $i_ClearBackBuffer = 1, $i_ClearZBuffer = 1)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetRenderTarget($h_Texture, $i_SceneBGColor = 0, $i_ClearBackBuffer = 1, $i_ClearZBuffer = 1)
; Sets a texture as a render target, or sets the device if the pointer is 0.
	DllCall($_irrDll, "none:cdecl", "IrrSetRenderTarget", "ptr", $h_Texture, "uint", $i_SceneBGColor, _
			"byte", $i_ClearBackBuffer, "byte", $i_ClearZBuffer)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetRenderTarget



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDrawGUI
; Description ...: [todo]
; Syntax.........: _IrrDrawGUI()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrDrawGUI()
	DllCall($_irrDll, "none:cdecl", "IrrDrawGUI")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDrawGUI


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrEndScene
; Description ...: [todo]
; Syntax.........: _IrrEndScene()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrEndScene()
	DllCall($_irrDll, "none:cdecl", "IrrEndScene")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrEndScene


; #FUNCTION# =============================================================================================================
; Name...........: _IrrStop
; Description ...: Stops Irrlicht engine and closes the IrrlichtWrapper.dll
; Syntax.........: _IrrStop()
; Parameters ....: None
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: _IrrStart, _IrrStartAdvanced, _IrrRunning
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _IrrStop()

	DllCall($_irrDll, "none:cdecl", "IrrStop")
	if @error Then
		Return Seterror(1,0,False)
	Else
		DllClose($_irrDll)
		Return true
	EndIf
EndFunc   ;==>_IrrStop



















