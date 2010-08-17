#include-once

#include "au3Irr2_constants.au3"

; #INDEX# =======================================================================================================================
; Title .........: Animation
; AutoIt Version : v3.3.6.1
; Language ......: English
; Description ...: Calls that control the animation of nodes in the scene either by playing animation that is embedded
;                  in the mesh or applying animator controls to automatically effect the nodes.
; Author(s) .....: jRowe, linus.
;                  DLL functionality by Frank Dodd (IrrlichtWrapper), Nikolaus Gebhardt and Irrlicht team (Irrlicht).
; Dll(s) ........: IrrlichtWrapper.dll, Irrlicht.dll, msvcp71.dll
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Not working/documented/implemented at this time
;_IrrSetNodeAnimationRange
;_IrrSetNodeAnimationSpeed
;_IrrGetNodeAnimationFrame
;_IrrSetNodeAnimationFrame
;_IrrSetTransitionTime
;_IrrAnimateJoints
;_IrrAddCollisionAnimator
;_IrrAddDeleteAnimator
;_IrrAddFlyCircleAnimator
;_IrrAddFlyStraightAnimator
;_IrrAddRotationAnimator
;_IrrAddSplineAnimator
;_IrrAddFadeAnimator
;_IrrRemoveAnimator
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;_IrrPlayNodeMD2Animation
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeAnimationRange
; Description ...: [todo]
; Syntax.........: _IrrSetNodeAnimationRange($h_Node, $i_Start, $i_End)
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
Func _IrrSetNodeAnimationRange($h_Node, $i_Start, $i_End)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAnimationRange", "ptr", $h_Node, "int", $i_Start, "int", $i_End)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAnimationRange


; #FUNCTION# =============================================================================================================
; Name...........: _IrrPlayNodeMD2Animation
; Description ...: Selects the animation sequence of MD2 to be played.
; Syntax.........: _IrrPlayNodeMD2Animation($h_Node, $i_Animation)
; Parameters ....: $h_Node -
;                  $i_Animation - sequence should be one of the following values:
;                  |$IRR_EMAT_STAND
;                  |$IRR_EMAT_RUN
;                  |$IRR_EMAT_ATTACK
;                  |$IRR_EMAT_PAIN_A
;                  |$IRR_EMAT_PAIN_B
;                  |$IRR_EMAT_PAIN_C
;                  |$IRR_EMAT_JUMP
;                  |$IRR_EMAT_FLIP
;                  |$IRR_EMAT_SALUTE
;                  |$IRR_EMAT_FALLBACK
;                  |$IRR_EMAT_WAVE
;                  |$IRR_EMAT_POINT
;                  |$IRR_EMAT_CROUCH_STAND
;                  |$IRR_EMAT_CROUCH_WALK
;                  |$IRR_EMAT_CROUCH_ATTACK
;                  |$IRR_EMAT_CROUCH_PAIN
;                  |$IRR_EMAT_CROUCH_DEATH
;                  |$IRR_EMAT_DEATH_FALLBACK
;                  |$IRR_EMAT_DEATH_FALLFORWARD
;                  |$IRR_EMAT_DEATH_FALLBACKSLOW
;                  |$IRR_EMAT_BOOM
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: MD2 format models have specific animation sequences contained within them that can be played back with a simple call.
; Related .......: None
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _IrrPlayNodeMD2Animation($h_Node, $i_Animation)
	DllCall($_irrDll, "none:cdecl", "IrrPlayNodeMD2Animation", "ptr", $h_Node, "int", $i_Animation)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrPlayNodeMD2Animation


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeAnimationSpeed
; Description ...: [todo]
; Syntax.........: _IrrSetNodeAnimationSpeed($h_Node, $f_Speed)
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
Func _IrrSetNodeAnimationSpeed($h_Node, $f_Speed)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAnimationSpeed", "ptr", $h_Node, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAnimationSpeed


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeAnimationFrame
; Description ...: [todo]
; Syntax.........: _IrrGetNodeAnimationFrame($h_Node)
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
Func _IrrGetNodeAnimationFrame($h_Node)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetNodeAnimationFrame", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetNodeAnimationFrame


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeAnimationFrame
; Description ...: [todo]
; Syntax.........: _IrrSetNodeAnimationFrame($h_Node, $f_Frame)
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
Func _IrrSetNodeAnimationFrame($h_Node, $f_Frame)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAnimationFrame", "ptr", $h_Node, "float", $f_Frame)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAnimationFrame


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetTransitionTime
; Description ...: [todo]
; Syntax.........: _IrrSetTransitionTime($h_Node, $f_Speed)
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
Func _IrrSetTransitionTime($h_Node, $f_Speed)
	DllCall($_irrDll, "none:cdecl", "IrrSetTransitionTime", "ptr", $h_Node, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTransitionTime


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAnimateJoints
; Description ...: [todo]
; Syntax.........: _IrrAnimateJoints($h_Node)
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
Func _IrrAnimateJoints($h_Node)
	DllCall($_irrDll, "int:cdecl", "IrrAnimateJoints", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAnimateJoints



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddCollisionAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddCollisionAnimator($h_IrrSelector, $h_Node, $f_RadiusX, $f_RadiusY, $f_RadiusZ, $f_GravityX, $f_GravityY, $f_GravityZ, $f_OffsetX, $f_OffsetY, $f_OffsetZ)
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
Func _IrrAddCollisionAnimator($h_IrrSelector, $h_Node, $f_RadiusX, $f_RadiusY, $f_RadiusZ, $f_GravityX, $f_GravityY, $f_GravityZ, $f_OffsetX, $f_OffsetY, $f_OffsetZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCollisionAnimator", "ptr", $h_IrrSelector, "ptr", $h_Node, "float", $f_RadiusX, "float", $f_RadiusY, "float", $f_RadiusZ, "float", $f_GravityX, "float", $f_GravityY, "float", $f_GravityZ, "float", $f_OffsetX, "float", $f_OffsetY, "float", $f_OffsetZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCollisionAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddDeleteAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddDeleteAnimator($h_Node, $i_Time)
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
Func _IrrAddDeleteAnimator($h_Node, $i_Time)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddDeleteAnimator", "ptr", $h_Node, "int", $i_Time)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddDeleteAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFlyCircleAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddFlyCircleAnimator($h_Node, $f_CenterX, $f_CenterY, $f_CenterZ, $f_Radius, $f_Speed)
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
Func _IrrAddFlyCircleAnimator($h_Node, $f_CenterX, $f_CenterY, $f_CenterZ, $f_Radius, $f_Speed)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFlyCircleAnimator", "ptr", $h_Node, "float", $f_CenterX, "float", $f_CenterY, "float", $f_CenterZ, "float", $f_Radius, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFlyCircleAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFlyStraightAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddFlyStraightAnimator($h_Node, $f_StartX, $f_StartY, $f_StartZ, $f_EndX, $f_EndY, $f_EndZ, $i_Time, $i_DoLoop)
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
Func _IrrAddFlyStraightAnimator($h_Node, $f_StartX, $f_StartY, $f_StartZ, $f_EndX, $f_EndY, $f_EndZ, $i_Time, $i_DoLoop)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFlyStraightAnimator", "ptr", $h_Node, "float", $f_StartX, "float", $f_StartY, "float", $f_StartZ, "float", $f_EndX, "float", $f_EndY, "float", $f_EndZ, "uint", $i_Time, "int", $i_DoLoop)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFlyStraightAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddRotationAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddRotationAnimator($h_Node, $f_RotX, $f_RotY, $f_RotZ)
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
Func _IrrAddRotationAnimator($h_Node, $f_RotX, $f_RotY, $f_RotZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddRotationAnimator", "ptr", $h_Node, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddRotationAnimator



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddSplineAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddSplineAnimator($h_Node, $i_ArraySize, $a_ArrayFloatsX, $a_ArrayFloatsY, $a_ArrayFloatsZ, $i_Start, $f_Speed, $f_Tightness)
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
Func _IrrAddSplineAnimator($h_Node, $i_ArraySize, $a_ArrayFloatsX, $a_ArrayFloatsY, $a_ArrayFloatsZ, $i_Start, $f_Speed, $f_Tightness)

	if UBound($a_ArrayFloatsX) <> $i_arraySize OR _
	    UBound($a_ArrayFloatsY) <> $i_arraySize OR _
		UBound($a_ArrayFloatsZ) <> $i_arraySize Then
		return SetError(2, 0, False)
	EndIf

	Local $XArrayStruct = DllStructCreate("float[" & $i_arraySize & "]")
	Local $YArrayStruct = DllStructCreate("float[" & $i_arraySize & "]")
	Local $ZArrayStruct = DllStructCreate("float[" & $i_arraySize & "]")

	For $i = 1 To $i_arraySize
		DllStructSetData($XArrayStruct, 1, $a_ArrayFloatsX[$i - 1], $i)
		DllStructSetData($YArrayStruct, 1, $a_ArrayFloatsY[$i - 1], $i)
		DllStructSetData($ZArrayStruct, 1, $a_ArrayFloatsZ[$i - 1], $i)
	Next

	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSplineAnimator", "ptr", $h_Node, "int", $i_arraySize, _
	"ptr", DllStructGetPtr($XArrayStruct,1), "ptr", DllStructGetPtr($YArrayStruct,1), "ptr", DllStructGetPtr($ZArrayStruct,1), _
	"int", $i_Start, "float", $f_Speed, "float", $f_Tightness)

	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSplineAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFadeAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddFadeAnimator($h_Node, $i_DeleteAfterMiliseconds, $f_Scale = 1.0)
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
Func _IrrAddFadeAnimator($h_Node, $i_DeleteAfterMiliseconds, $f_Scale = 1.0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFadeAnimator", "ptr", $h_Node, "int", $i_DeleteAfterMiliseconds, "float", $f_Scale)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFadeAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveAnimator
; Description ...: [todo]
; Syntax.........: _IrrRemoveAnimator($h_Node, $h_Animator)
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
Func _IrrRemoveAnimator($h_Node, $h_Animator)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAnimator", "ptr", $h_Node, "ptr", $h_Animator)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAnimator








