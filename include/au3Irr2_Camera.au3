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
;_IrrAddCamera
;_IrrAddMayaCamera
;_IrrSetCameraTarget
;_IrrGetCameraTarget
;_IrrGetCameraUpDirection
;_IrrSetCameraUpDirection
;_IrrGetCameraOrientation
;_IrrRevolveCamera
;_IrrSetCameraUpAtRightAngle
;_IrrSetCameraOrthagonal
;_IrrSetCameraClipDistance
;_IrrSetActiveCamera
;_IrrSetCameraFOV
;_IrrSetCameraAspectRatio
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;_IrrAddFPSCamera
;__CreatePtrKeyMapArray
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddFPSCamera
; Description ...: [todo]
; Syntax.........: _IrrAddFPSCamera($h_ParentNode = 0, $f_RotateSpeed = 100.0, $f_MoveSpeed = 0.5, $i_ID = -1, $h_KeyMapArray = 0, $i_KeyMapSize = 0, $i_NoVerticalMovement = 0, $f_JumpSpeed = 0.0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: __CreatePtrKeyMapArray
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddFPSCamera($h_ParentNode = 0, $f_RotateSpeed = 100.0, $f_MoveSpeed = 0.5, $i_ID = -1, $h_KeyMapArray = 0, $i_KeyMapSize = 0, $i_NoVerticalMovement = 0, $f_JumpSpeed = 0.0)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddFPSCamera", "UINT_PTR", $h_ParentNode, "float", $f_RotateSpeed, "float", $f_MoveSpeed, "int", $i_ID, "ptr", $h_KeyMapArray, "int", $i_KeyMapSize, "int", $i_NoVerticalMovement, "float", $f_JumpSpeed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFPSCamera


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddCamera
; Description ...: [todo]
; Syntax.........: _IrrAddCamera($f_CamX, $f_CamY, $f_CamZ, $f_TargetX, $f_TargetY, $f_TargetZ)
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
Func _IrrAddCamera($f_CamX, $f_CamY, $f_CamZ, $f_TargetX, $f_TargetY, $f_TargetZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCamera", "float", $f_CamX, "float", $f_CamY, "float", $f_CamZ, "float", $f_TargetX, "float", $f_TargetY, "float", $f_TargetZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCamera


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddMayaCamera
; Description ...: [todo]
; Syntax.........: _IrrAddMayaCamera($h_Node, $f_Rotate, $f_Zoom, $f_Move)
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
Func _IrrAddMayaCamera($h_Node, $f_Rotate, $f_Zoom, $f_Move)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddMayaCamera", "ptr", $h_Node, "float", $f_Rotate, "float", $f_Zoom, "float", $f_Move)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddMayaCamera


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetCameraTarget
; Description ...: [todo]
; Syntax.........: _IrrSetCameraTarget($h_Camera, $f_CamX, $f_CamY, $f_CamZ)
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
Func _IrrSetCameraTarget($h_Camera, $f_CamX, $f_CamY, $f_CamZ)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraTarget", "ptr", $h_Camera, "float", $f_CamX, "float", $f_CamY, "float", $f_CamZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraTarget


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCameraTarget
; Description ...: [todo]
; Syntax.........: _IrrGetCameraTarget($h_Camera, ByRef $a_Vector3df)
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
Func _IrrGetCameraTarget($h_Camera, ByRef $a_Vector3df)
	Dim $a_Vector3df[3]
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetCameraTarget", "ptr", $h_Camera, "float*", $a_Vector3df[0], "float*", $a_Vector3df[1], "float*", $a_Vector3df[2])
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector3df[0] = $result[2]
		$a_Vector3df[1] = $result[3]
		$a_Vector3df[2] = $result[4]
		Return True
	EndIf
EndFunc   ;==>_IrrGetCameraTarget


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCameraUpDirection
; Description ...: [todo]
; Syntax.........: _IrrGetCameraUpDirection($h_Camera, ByRef $a_Vector3df)
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
Func _IrrGetCameraUpDirection($h_Camera, ByRef $a_Vector3df)
	Dim $a_Vector3df[3]
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetCameraUpDirection", "ptr", $h_Camera, "float*", $a_Vector3df[0], "float*", $a_Vector3df[1], "float*", $a_Vector3df[2])
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector3df[0] = $result[2]
		$a_Vector3df[1] = $result[3]
		$a_Vector3df[2] = $result[4]
		Return True
	EndIf
EndFunc   ;==>_IrrGetCameraUpDirection


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetCameraUpDirection
; Description ...: [todo]
; Syntax.........: _IrrSetCameraUpDirection($h_Camera, $f_CamX, $f_CamY, $f_CamZ)
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
Func _IrrSetCameraUpDirection($h_Camera, $f_CamX, $f_CamY, $f_CamZ)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraUpDirection", "UINT_PTR", $h_Camera, "float", $f_CamX, "float", $f_CamY, "float", $f_CamZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraUpDirection



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCameraOrientation
; Description ...: [todo]
; Syntax.........: _IrrGetCameraOrientation($h_Camera, ByRef $a_Vector1, ByRef $a_Vector2, ByRef $a_Vector3)
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
Func _IrrGetCameraOrientation($h_Camera, ByRef $a_Vector1, ByRef $a_Vector2, ByRef $a_Vector3)
	Dim $a_Vector1[3], $a_Vector2[3], $a_Vector3[3]
	local $v1 = DllStructCreate("float;float;float")
	local $v2 = DllStructCreate("float;float;float")
	local $v3 = DllStructCreate("float;float;float")

	$result = DllCall($_irrDll, "none:cdecl", "IrrGetCameraOrientation", "UINT_PTR", $h_Camera, _
		"ptr", DllStructGetPtr($v1), "ptr", DllStructGetPtr($v2), "ptr", DllStructGetPtr($v3))
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector1[0] = DllStructGetData($v1, 1)
		$a_Vector1[1] = DllStructGetData($v1, 2)
		$a_Vector1[2] = DllStructGetData($v1, 3)
		$a_Vector2[0] = DllStructGetData($v2, 1)
		$a_Vector2[1] = DllStructGetData($v2, 2)
		$a_Vector2[2] = DllStructGetData($v2, 3)
		$a_Vector3[0] = DllStructGetData($v3, 1)
		$a_Vector3[1] = DllStructGetData($v3, 2)
		$a_Vector3[2] = DllStructGetData($v3, 3)
		return true
	EndIf
EndFunc   ;==>_IrrGetCameraOrientation



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRevolveCamera
; Description ...: [todo]
; Syntax.........: _IrrRevolveCamera($h_Camera, $f_Yaw, $f_Pitch, $f_Roll, $f_Drive, $f_Strafe, $f_Elevate)
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
Func _IrrRevolveCamera($h_Camera, $f_Yaw, $f_Pitch, $f_Roll, $f_Drive, $f_Strafe, $f_Elevate)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraUpDirection", "UINT_PTR", $h_Camera, "float", $f_Yaw, "float", $f_Pitch, "float", $f_Roll, "float", $f_Drive, "float", $f_Strafe, "float", $f_Elevate)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRevolveCamera


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetCameraUpAtRightAngle
; Description ...: [todo]
; Syntax.........: _IrrSetCameraUpAtRightAngle($h_Camera)
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
Func _IrrSetCameraUpAtRightAngle($h_Camera)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraUpAtRightAngle", "UINT_PTR", $h_Camera)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraUpAtRightAngle


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetCameraOrthagonal
; Description ...: [todo]
; Syntax.........: _IrrSetCameraOrthagonal($h_Camera, $f_DistanceX, $f_DistanceY, $f_DistanceZ)
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
Func _IrrSetCameraOrthagonal($h_Camera, $f_DistanceX, $f_DistanceY, $f_DistanceZ)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraOrthagonal", "UINT_PTR", $h_Camera, "float", $f_DistanceX, "float", $f_DistanceY, "float", $f_DistanceZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraOrthagonal


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetCameraClipDistance
; Description ...: [todo]
; Syntax.........: _IrrSetCameraClipDistance($h_Camera, $f_Distance, $f_NearDistance = 1.0)
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
Func _IrrSetCameraClipDistance($h_Camera, $f_Distance, $f_NearDistance = 1.0)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraClipDistance", "ptr", $h_Camera, "float", $f_Distance, "float", $f_NearDistance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraClipDistance


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetActiveCamera
; Description ...: [todo]
; Syntax.........: _IrrSetActiveCamera($h_Camera)
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
Func _IrrSetActiveCamera($h_Camera)
	DllCall($_irrDll, "none:cdecl", "IrrSetActiveCamera", "UINT_PTR", $h_Camera)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetActiveCamera


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetCameraFOV
; Description ...: [todo]
; Syntax.........: _IrrSetCameraFOV($h_Camera, $f_FOV)
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
Func _IrrSetCameraFOV($h_Camera, $f_FOV)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraFOV", "ptr", $h_Camera, "float", $f_FOV)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraFOV


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetCameraAspectRatio
; Description ...: [todo]
; Syntax.........: _IrrSetCameraAspectRatio($h_Camera, $f_AspectRatio)
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
Func _IrrSetCameraAspectRatio($h_Camera, $f_AspectRatio)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraAspectRatio", "ptr", $h_Camera, "float", $f_AspectRatio)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraAspectRatio


; #FUNCTION# =============================================================================================================
; Name...........: __CreatePtrKeyMapArray
; Description ...: Helper function: returns pointer to a keymap for _IrrAddFPSCamera.
; Syntax.........: __CreatePtrKeyMapArray(ByRef $keyStruct, $i_kForward = $KEY_KEY_W, $i_kBackward = $KEY_KEY_S, $i_kLeft = $KEY_KEY_A, $i_kRight = $KEY_KEY_D, $i_kJump = $KEY_SPACE)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: Keymap itself is created into any (empty) var which can be set to '0' after call of _IrraddFPSCamera.
;                  Usage with defaults creates WASD keys:
;                  usage e.g. _IrrAddFPSCamera (..., __CreatePtrKeyMapArray($keyStruct), [numberOfKeysToPassFromMapArray - max. 5], ...)
; Related .......: _IrraddFPSCamera
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func __CreatePtrKeyMapArray(ByRef $keyStruct, $i_kForward = $KEY_KEY_W, $i_kBackward = $KEY_KEY_S, $i_kLeft = $KEY_KEY_A, $i_kRight = $KEY_KEY_D, $i_kJump = $KEY_SPACE)

	$keyStruct = DllStructCreate("int action1;int key1;int action2;int key2;int action3;int key3;int action4;int key4;int action5;int key5")
	dllstructsetdata($keyStruct, "action1", 0)
	dllstructsetdata($keyStruct, "key1", $i_kForward)
	dllstructsetdata($keyStruct, "action2", 1)
	dllstructsetdata($keyStruct, "key2", $i_kBackward)
	dllstructsetdata($keyStruct, "action3", 2)
	dllstructsetdata($keyStruct, "key3", $i_kLeft)
	dllstructsetdata($keyStruct, "action4", 3)
	dllstructsetdata($keyStruct, "key4", $i_kRight)
	dllstructsetdata($keyStruct, "action5", 4)
	dllstructsetdata($keyStruct, "key5", $i_kJump)
	return DllStructGetPtr($keyStruct)
EndFunc   ;==>__CreatePtrKeyMapArray



















