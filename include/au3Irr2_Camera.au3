#include-once

#include "au3Irr2_constants.au3"

; #INDEX# =======================================================================================================================
; Title .........: Camera
; AutoIt Version : v3.3.6.1
; Language ......: English
; Description ...: Calls for creating and controlling cameras in the scene. The camera objects are used for
;                  defining a view point and a target point which is used to render the scene.
; Author(s) .....: jRowe, linus.
;                  DLL functionality by Frank Dodd and IrrlichtWrapper for FreeBasic team (IrrlichtWrapper.dll),
;                  and Nikolaus Gebhardt and Irrlicht team (Irrlicht.dll).
; Dll(s) ........: IrrlichtWrapper.dll, Irrlicht.dll, msvcp71.dll, msvcr71.dll
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Not working/documented/implemented at this time
;_IrrGetCameraUpDirection
;_IrrSetCameraUpDirection
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;_IrrAddFPSCamera
;_IrrAddCamera
;_IrrAddMayaCamera
;_IrrSetCameraTarget
;_IrrGetCameraTarget
;_IrrGetCameraOrientation
;_IrrRevolveCamera
;_IrrSetCameraUpAtRightAngle
;_IrrSetCameraOrthagonal
;_IrrSetCameraClipDistance
;_IrrSetActiveCamera
;_IrrSetCameraFOV
;_IrrSetCameraAspectRatio
;__CreatePtrKeyMapArray
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddFPSCamera
; Description ...: Adds a 'first person shooter' style camera with mouse and keyboard control into the scene.
; Syntax.........: _IrrAddFPSCamera($h_ParentNode = 0, $f_RotateSpeed = 100.0, $f_MoveSpeed = 0.5, $i_ID = -1, $h_KeyMapArray = 0, $i_KeyMapSize = 0, $i_NoVerticalMovement = 0, $f_JumpSpeed = 0.0)
; Parameters ....: $h_ParentNode - [optional] Parent scene node of the camera. Can be null.
;                  $f_RotateSpeed - [optional] Speed in degress with which the camera is rotated. This can be done only with the mouse.
;                  $f_MoveSpeed - [optional] Speed in units per millisecond with which the camera is moved. Movement is done with the cursor keys.
;                  $i_ID - [optional] 	id of the camera. This id can be used to identify the camera.
;                  $h_KeyMapArray - [optional] Adress of a key map as created with __CreatePtrKeyMapArray, specifying what keys should be used to move the camera. If this is null, the default keymap is used.
;                  |You can define actions more then one time in the array, to bind multiple keys to the same action.
;                  $i_KeyMapSize - [optional] Amount of items in the keymap array.
;                  $b_NoVerticalMovement - [optional] Setting this to true makes the camera only move within a horizontal plane, and disables vertical movement as known from most ego shooters.
;                  |Default is 'false', with which it is possible to fly around in space, if no gravity is there.
;                  $f_JumpSpeed - [optional] Speed with which the camera is moved when jumping.
; Return values..: Success - Handle of the camera object
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: Adds a camera scene node with an animator which provides mouse and keyboard control appropriate for first person shooters (FPS).
;                  If however you capture events when starting irrlicht this will become a normal camera that can only be moved by code.
;                  This FPS camera is intended to provide a demonstration of a camera that behaves like a typical First Person Shooter.
;                  It is useful for simple demos and prototyping but is not intended to provide a full solution for a production quality game.
;                  It binds the camera scene node rotation to the look-at target.
; Related .......: __CreatePtrKeyMapArray, _IrrAddCamera, _IrrAddMayaCamera
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddFPSCamera($h_ParentNode = 0, $f_RotateSpeed = 100.0, $f_MoveSpeed = 0.5, $i_ID = -1, $h_KeyMapArray = 0, $i_KeyMapSize = 0, $b_NoVerticalMovement = False, $f_JumpSpeed = 0.0)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddFPSCamera", "UINT_PTR", $h_ParentNode, "float", $f_RotateSpeed, "float", $f_MoveSpeed, "int", $i_ID, "ptr", $h_KeyMapArray, "int", $i_KeyMapSize, "byte", $b_NoVerticalMovement, "float", $f_JumpSpeed)
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFPSCamera


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddCamera
; Description ...: Adds a camera into the scene.
; Syntax.........: _IrrAddCamera($f_CamX, $f_CamY, $f_CamZ, $f_TargetX, $f_TargetY, $f_TargetZ)
; Parameters ....: $f_CamX - X value for view point of the camera.
;                  $f_CamY - Y value for view point of the camera.
;                  $f_CamZ - Z value for view point of the camera.
;                  $f_TargetX - X value for target of camera.
;                  $f_TargetY - Y value for target of camera.
;                  $f_TargetZ - Z value for target of camera.
; Return values .: Success - Handle of the camera object
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......:  The camera will be used to define the view point and target point and other attributes of the view into the 3D scene.
;                   Animators and other node functions can be applied to this node.
; Related .......: _IrrAddFPSCamera, _IrrAddMayaCamera
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddCamera($f_CamX, $f_CamY, $f_CamZ, $f_TargetX, $f_TargetY, $f_TargetZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCamera", "float", $f_CamX, "float", $f_CamY, "float", $f_CamZ, "float", $f_TargetX, "float", $f_TargetY, "float", $f_TargetZ)
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCamera


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddMayaCamera
; Description ...: [todo]
; Syntax.........: _IrrAddMayaCamera($h_Node, $f_Rotate, $f_Zoom, $f_Move)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: Success - Handle of the camera object
;                  Failure - False
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: _IrrAddCamera, _IrrAddFPSCamera
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddMayaCamera($h_Node, $f_Rotate, $f_Zoom, $f_Move)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddMayaCamera", "ptr", $h_Node, "float", $f_Rotate, "float", $f_Zoom, "float", $f_Move)
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddMayaCamera


; #FUNCTION# =============================================================================================================
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
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetCameraTarget


; #FUNCTION# =============================================================================================================
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
	If @error Then
		Return SetError(1, 0, False)
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
	If @error Then
		Return SetError(1, 0, False)
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
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetCameraUpDirection



; #FUNCTION# =============================================================================================================
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
	Local $v1 = DllStructCreate("float;float;float")
	Local $v2 = DllStructCreate("float;float;float")
	Local $v3 = DllStructCreate("float;float;float")

	$result = DllCall($_irrDll, "none:cdecl", "IrrGetCameraOrientation", "UINT_PTR", $h_Camera, _
			"ptr", DllStructGetPtr($v1), "ptr", DllStructGetPtr($v2), "ptr", DllStructGetPtr($v3))
	If @error Then
		Return SetError(1, 0, False)
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
		Return True
	EndIf
EndFunc   ;==>_IrrGetCameraOrientation



; #FUNCTION# =============================================================================================================
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
	DllCall($_irrDll, "none:cdecl", "IrrRevolveCamera", "UINT_PTR", $h_Camera, "float", $f_Yaw, "float", $f_Pitch, "float", $f_Roll, "float", $f_Drive, "float", $f_Strafe, "float", $f_Elevate)
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrRevolveCamera


; #FUNCTION# =============================================================================================================
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
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetCameraUpAtRightAngle


; #FUNCTION# =============================================================================================================
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
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetCameraOrthagonal


; #FUNCTION# =============================================================================================================
; Name...........: _IrrSetCameraClipDistance
; Description ...: Defines far and near distances for camera clipping
; Syntax.........: _IrrSetCameraClipDistance($h_Camera, $f_Distance, $f_NearDistance = 1.0)
; Parameters ....: $h_Camera - Handle of a camera node
;                  $f_Distance - Defines the far distance for clipping
;                  $f_NearDistance - [optional] Defines the near distance for clipping (towards the camera)
; Return values .: success - True
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: The clipping distances of a camera are the distances beyond and before which no triangles are rendered.
;                  This speeds the scene up by not showing geometry that is beyond or before the defined distances and increases rendering performance without requiring you to manage adding and deleting the objects from the view.
;                  To make the far distance clipping less abrupt you can use it in combination with _IrrSetFog.
; Related .......: _IrrAddCamera, _IrrAddFPSCamera, _IrrSetFog
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrSetCameraClipDistance($h_Camera, $f_Distance, $f_NearDistance = 1.0)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraClipDistance", "ptr", $h_Camera, "float", $f_Distance, "float", $f_NearDistance)
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetCameraClipDistance


; #FUNCTION# =============================================================================================================
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
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetActiveCamera


; #FUNCTION# =============================================================================================================
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
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetCameraFOV


; #FUNCTION# =============================================================================================================
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
	If @error Then
		Return SetError(1, 0, False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetCameraAspectRatio


; #FUNCTION# =============================================================================================================
; Name...........: __CreatePtrKeyMapArray
; Description ...: Helper function: returns pointer to a keymap for _IrrAddFPSCamera.
; Syntax.........: __CreatePtrKeyMapArray(ByRef $keyStruct, $i_kForward = $KEY_KEY_W, $i_kBackward = $KEY_KEY_S, $i_kLeft = $KEY_KEY_A, $i_kRight = $KEY_KEY_D, $i_kJump = $KEY_SPACE)
; Parameters ....: $keyStruct - Any variable which is then returned as a a keymap for _IrrAddFPSCamera.
;                  $i_kForward - Key for forward movement, default is $KEY_KEY_W
;                  $i_kBackward - Key for backward movement, default is $KEY_KEY_S
;                  $i_kLeft - Key for left movement, default is $KEY_KEY_A
;                  $i_kRight - Key for right movement, default is $KEY_KEY_D
;                  $i_kJump - Key for jumping, default is $KEY_SPACE
; Return values .: Success - Pointer to Dllstruct containing key struct useable by _IrrAddFpsCamera.
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: $keyStruct can be set to '0' after call of _IrraddFPSCamera to delete the Dllstruct. Usage with defaults creates WASD keys, e.g.:
;                  <i>_IrrAddFPSCamera (..., __CreatePtrKeyMapArray($keyStruct), 4, ...)</i>
; Related .......: _IrraddFPSCamera
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func __CreatePtrKeyMapArray(ByRef $keyStruct, $i_kForward = $KEY_KEY_W, $i_kBackward = $KEY_KEY_S, $i_kLeft = $KEY_KEY_A, $i_kRight = $KEY_KEY_D, $i_kJump = $KEY_SPACE)

	$keyStruct = DllStructCreate("int action1;int key1;int action2;int key2;int action3;int key3;int action4;int key4;int action5;int key5")
	DllStructSetData($keyStruct, "action1", 0)
	DllStructSetData($keyStruct, "key1", $i_kForward)
	DllStructSetData($keyStruct, "action2", 1)
	DllStructSetData($keyStruct, "key2", $i_kBackward)
	DllStructSetData($keyStruct, "action3", 2)
	DllStructSetData($keyStruct, "key3", $i_kLeft)
	DllStructSetData($keyStruct, "action4", 3)
	DllStructSetData($keyStruct, "key4", $i_kRight)
	DllStructSetData($keyStruct, "action5", 4)
	DllStructSetData($keyStruct, "key5", $i_kJump)
	Return DllStructGetPtr($keyStruct)
EndFunc   ;==>__CreatePtrKeyMapArray
