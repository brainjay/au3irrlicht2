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
;_IrrAddParticleEmitter
;_IrrSetMinParticleSize
;_IrrSetMaxParticleSize
;_IrrAddAnimatedMeshSceneNodeEmitter
;_IrrAddRotationAffector
;_IrrAddFadeOutParticleAffector
;_IrrAddGravityParticleAffector
;_IrrAddParticleAttractionAffector
;_IrrCreateRotationAffector
;_IrrAddStopParticleAffector
;_IrrAddParticlePushAffector
;_IrrAddColorMorphAffector
;_IrrAddSplineAffector
;_IrrRemoveAffectors
;_IrrSetParticleEmitterDirection
;_IrrSetParticleEmitterMinParticlesPerSecond
;_IrrSetParticleEmitterMaxParticlesPerSecond
;_IrrSetParticleEmitterMinStartColor
;_IrrSetParticleEmitterMaxStartColor
;_IrrSetParticleAffectorEnable
;_IrrSetFadeOutParticleAffectorTime
;_IrrSetFadeOutParticleAffectorTargetColor
;_IrrSetGravityParticleAffectorDirection
;_IrrSetGravityParticleAffectorTimeForceLost
;_IrrSetParticleAttractionAffectorAffectX
;_IrrSetParticleAttractionAffectorAffectY
;_IrrSetParticleAttractionAffectorAffectZ
;_IrrSetParticleAttractionAffectorAttract
;_IrrSetParticleAttractionAffectorPoint
;_IrrSetRotationAffectorPivotPoint
;_IrrSetFurthestDistanceOfEffect
;_IrrSetNearestDistanceOfEffect
;_IrrSetColumnDistanceOfEffect
;_IrrSetCenterOfEffect
;_IrrSetStrengthOfEffect
;__CreateIrrModel
;__CreateParticleEmitter
;xxx__CreateParticleEmitter
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

;Particle functions



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddParticleEmitter
; Description ...: [todo]
; Syntax.........: _IrrAddParticleEmitter($h_ParticleSystem, $h_SettingsStruct)
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
Func _IrrAddParticleEmitter($h_ParticleSystem, $h_SettingsStruct)
; create an emitter that can be added to a particle system

	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddParticleEmitter", "UINT_PTR", $h_ParticleSystem, "UINT_PTR", $h_SettingsStruct)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticleEmitter



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMinParticleSize
; Description ...: [todo]
; Syntax.........: _IrrSetMinParticleSize($h_Emitter, $f_X, $f_Y)
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
Func _IrrSetMinParticleSize($h_Emitter, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrSetMinParticleSize", "ptr", $h_Emitter, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMinParticleSize


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMaxParticleSize
; Description ...: [todo]
; Syntax.........: _IrrSetMaxParticleSize($h_Emitter, $f_X, $f_Y)
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
Func _IrrSetMaxParticleSize($h_Emitter, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrSetMaxParticleSize", "ptr", $h_Emitter, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMaxParticleSize



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddAnimatedMeshSceneNodeEmitter
; Description ...: [todo]
; Syntax.........: _IrrAddAnimatedMeshSceneNodeEmitter($h_ParticleSystem, $h_Node, $i_UseNormals, $f_NormalModifier, $i_AllVertices, $h_SettingsStruct)
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
Func _IrrAddAnimatedMeshSceneNodeEmitter($h_ParticleSystem, $h_Node, $i_UseNormals, $f_NormalModifier, $i_AllVertices, $h_SettingsStruct)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddAnimatedMeshSceneNodeEmitter", "ptr", $h_ParticleSystem, "ptr", $h_Node, "int", $i_UseNormals, "float", $f_NormalModifier, "int", $i_AllVertices, "ptr", $h_SettingsStruct)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddAnimatedMeshSceneNodeEmitter



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddRotationAffector
; Description ...: [todo]
; Syntax.........: _IrrAddRotationAffector($h_ParticleSystem, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_PivotX, $f_pivotY, $f_pivotZ)
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
Func _IrrAddRotationAffector($h_ParticleSystem, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_PivotX, $f_pivotY, $f_pivotZ)
; Creates a rotation affector. This affector modifies the positions of the
; particles and attracts them to a specified point at a specified speed per second.
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddRotationAffector", "UINT_PTR", $h_ParticleSystem, _
			"float", $f_SpeedX, "float", $f_SpeedY, "float", $f_SpeedZ, "float", $f_PivotX, "float", $f_PivotY, "float", $f_PivotZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddRotationAffector



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFadeOutParticleAffector
; Description ...: [todo]
; Syntax.........: _IrrAddFadeOutParticleAffector($h_ParticleSystem, $i_FadeFactor, $i_Red, $i_Green, $i_Blue)
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
Func _IrrAddFadeOutParticleAffector($h_ParticleSystem, $i_FadeFactor, $i_Red, $i_Green, $i_Blue)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFadeOutParticleAffector", "ptr", $h_ParticleSystem, "int", $i_FadeFactor, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFadeOutParticleAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddGravityParticleAffector
; Description ...: [todo]
; Syntax.........: _IrrAddGravityParticleAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z)
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
Func _IrrAddGravityParticleAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z)
	$result = DllCall($_irrDll, "ptr:cdecl", "_IrrAddGravityParticleAffector", "ptr", $h_ParticleSystem, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddGravityParticleAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddParticleAttractionAffector
; Description ...: [todo]
; Syntax.........: _IrrAddParticleAttractionAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_Speed = 1, $i_Attract = 1, $i_AffectX = 1, $i_AffectY = 1, $i_AffectZ = 1)
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
Func _IrrAddParticleAttractionAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_Speed = 1, $i_Attract = 1, $i_AffectX = 1, $i_AffectY = 1, $i_AffectZ = 1)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddParticleAttractionAffector", "ptr", $h_ParticleSystem, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_Speed, "int", $i_Attract, "int", $i_AffectX, "int", $i_AffectY, "int", $i_AffectZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticleAttractionAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateRotationAffector
; Description ...: [todo]
; Syntax.........: _IrrCreateRotationAffector($h_ParticleSystem, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_RotX, $f_RotY, $f_RotZ)
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
Func _IrrCreateRotationAffector($h_ParticleSystem, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_RotX, $f_RotY, $f_RotZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateRotationAffector", "ptr", $h_ParticleSystem, "float", $f_SpeedX, "float", $f_SpeedY, "float", $f_SpeedZ, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateRotationAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddStopParticleAffector
; Description ...: [todo]
; Syntax.........: _IrrAddStopParticleAffector($h_ParticleSystem, $i_Time, $h_Emitter)
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
Func _IrrAddStopParticleAffector($h_ParticleSystem, $i_Time, $h_Emitter)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddStopParticleAffector", "ptr", $h_ParticleSystem, "int", $i_Time, "ptr", $h_Emitter)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddStopParticleAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddParticlePushAffector
; Description ...: [todo]
; Syntax.........: _IrrAddParticlePushAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_Far, $f_Near, $f_Column, $i_Distant)
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
Func _IrrAddParticlePushAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_Far, $f_Near, $f_Column, $i_Distant)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddParticlePushAffector", "ptr", $h_ParticleSystem, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_SpeedX, "float", $f_SpeedY, "float", $f_SpeedZ, "float", $f_Far, "float", $f_Near, "float", $f_Column, "int", $i_Distant)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticlePushAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddColorMorphAffector
; Description ...: [todo]
; Syntax.........: _IrrAddColorMorphAffector($h_ParticleSystem, $i_NumberOfParticles, $a_ParticleColors, $a_ParticleTimes, $i_Smooth)
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
Func _IrrAddColorMorphAffector($h_ParticleSystem, $i_NumberOfParticles, $a_ParticleColors, $a_ParticleTimes, $i_Smooth)
	$timeSize = UBound($a_ParticleTimes)
	$colorSize = UBound($a_ParticleColors)
	$ParticlesStruct = DllStructCreate("float[" & $colorSize & "];float[" & $colorSize & "];float[" & $colorSize & "]")

	For $i = 1 To $colorSize
		DllStructSetData($ParticlesStruct, 1, $a_ParticleColors[$i - 1][0])
		DllStructSetData($ParticlesStruct, 2, $a_ParticleColors[$i - 1][1])
		DllStructSetData($ParticlesStruct, 3, $a_ParticleColors[$i - 1][2])
	Next

	$TimeStruct = DllStructCreate("float[" & $colorSize & "];float[" & $colorSize & "];float[" & $colorSize & "]")

	For $i = 1 To $timeSize
		DllStructSetData($TimeStruct, 1, $a_ParticleTimes[$i - 1])
	Next

	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddColorMorphAffector", "ptr", $h_ParticleSystem, "int", $i_NumberOfParticles, "ptr", DllStructGetPtr($ParticlesStruct), "ptr", DllStructGetPtr($TimeStruct), "int", $i_Smooth)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddColorMorphAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddSplineAffector
; Description ...: [todo]
; Syntax.........: _IrrAddSplineAffector($h_ParticleSystem, $a_ParticleSpline, $f_Speed, $f_Tightness, $f_Attraction, $i_DeleteAtEnd)
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
Func _IrrAddSplineAffector($h_ParticleSystem, $a_ParticleSpline, $f_Speed, $f_Tightness, $f_Attraction, $i_DeleteAtEnd)
	$splineSize = UBound($a_ParticleSpline)
	Local $SplineStruct = DllStructCreate("float[" & $splineSize & "];float[" & $splineSize & "];float[" & $splineSize & "]")

	For $i = 1 To $splineSize
		DllStructSetData($SplineStruct, 1, $a_ParticleSpline[$i - 1][0])
		DllStructSetData($SplineStruct, 2, $a_ParticleSpline[$i - 1][1])
		DllStructSetData($SplineStruct, 3, $a_ParticleSpline[$i - 1][2])
	Next

	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSplineAffector", "ptr", $h_ParticleSystem, "ptr", DllStructGetPtr($SplineStruct), "float", $f_Speed, "float", $f_Tightness, "float", $f_Attraction, "int", $i_DeleteAtEnd)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSplineAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveAffectors
; Description ...: [todo]
; Syntax.........: _IrrRemoveAffectors($h_ParticleSystem)
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
Func _IrrRemoveAffectors($h_ParticleSystem)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAffectors", "ptr", $h_ParticleSystem)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAffectors


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterDirection
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterDirection($h_ParticleEmitter, $f_X, $f_Y, $f_Z)
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
Func _IrrSetParticleEmitterDirection($h_ParticleEmitter, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterDirection", "ptr", $h_ParticleEmitter, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterDirection


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterMinParticlesPerSecond
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterMinParticlesPerSecond($h_ParticleEmitter, $i_Min)
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
Func _IrrSetParticleEmitterMinParticlesPerSecond($h_ParticleEmitter, $i_Min)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMinParticlesPerSecond", "ptr", $h_ParticleEmitter, "int", $i_Min)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMinParticlesPerSecond


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterMaxParticlesPerSecond
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterMaxParticlesPerSecond($h_ParticleEmitter, $i_Max)
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
Func _IrrSetParticleEmitterMaxParticlesPerSecond($h_ParticleEmitter, $i_Max)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMaxParticlesPerSecond", "ptr", $h_ParticleEmitter, "int", $i_Max)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMaxParticlesPerSecond


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterMinStartColor
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterMinStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
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
Func _IrrSetParticleEmitterMinStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMinStartColor", "ptr", $h_ParticleEmitter, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMinStartColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterMaxStartColor
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterMaxStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
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
Func _IrrSetParticleEmitterMaxStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMaxStartColor", "ptr", $h_ParticleEmitter, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMaxStartColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAffectorEnable
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAffectorEnable($h_ParticleAffector, $i_Enabled)
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
Func _IrrSetParticleAffectorEnable($h_ParticleAffector, $i_Enabled)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAffectorEnable", "ptr", $h_ParticleAffector, "int", $i_Enabled)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAffectorEnable


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetFadeOutParticleAffectorTime
; Description ...: [todo]
; Syntax.........: _IrrSetFadeOutParticleAffectorTime($h_ParticleAffector, $f_Time)
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
Func _IrrSetFadeOutParticleAffectorTime($h_ParticleAffector, $f_Time)
	DllCall($_irrDll, "none:cdecl", "IrrSetFadeOutParticleAffectorTime", "ptr", $h_ParticleAffector, "float", $f_Time)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetFadeOutParticleAffectorTime


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetFadeOutParticleAffectorTargetColor
; Description ...: [todo]
; Syntax.........: _IrrSetFadeOutParticleAffectorTargetColor($h_ParticleAffector, $i_Red, $i_Green, $i_Blue)
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
Func _IrrSetFadeOutParticleAffectorTargetColor($h_ParticleAffector, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetFadeOutParticleAffectorTargetColor", "ptr", $h_ParticleAffector, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetFadeOutParticleAffectorTargetColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetGravityParticleAffectorDirection
; Description ...: [todo]
; Syntax.........: _IrrSetGravityParticleAffectorDirection($h_ParticleAffector, $f_X, $f_Y, $f_Z)
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
Func _IrrSetGravityParticleAffectorDirection($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetGravityParticleAffectorDirection", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGravityParticleAffectorDirection


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetGravityParticleAffectorTimeForceLost
; Description ...: [todo]
; Syntax.........: _IrrSetGravityParticleAffectorTimeForceLost($h_ParticleAffector, $f_TimeForceLost)
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
Func _IrrSetGravityParticleAffectorTimeForceLost($h_ParticleAffector, $f_TimeForceLost)
	DllCall($_irrDll, "none:cdecl", "IrrSetGravityParticleAffectorTimeForceLost", "ptr", $h_ParticleAffector, "float", $f_TimeForceLost)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGravityParticleAffectorTimeForceLost


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorAffectX
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorAffectX($h_ParticleAffector, $i_Affect)
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
Func _IrrSetParticleAttractionAffectorAffectX($h_ParticleAffector, $i_Affect)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAffectX", "ptr", $h_ParticleAffector, "int", $i_Affect)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAffectX


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorAffectY
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorAffectY($h_ParticleAffector, $i_Affect)
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
Func _IrrSetParticleAttractionAffectorAffectY($h_ParticleAffector, $i_Affect)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAffectY", "ptr", $h_ParticleAffector, "int", $i_Affect)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAffectY


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorAffectZ
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorAffectZ($h_ParticleAffector, $i_Affect)
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
Func _IrrSetParticleAttractionAffectorAffectZ($h_ParticleAffector, $i_Affect)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAffectZ", "ptr", $h_ParticleAffector, "int", $i_Affect)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAffectZ


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorAttract
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorAttract($h_ParticleAffector, $i_Attract)
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
Func _IrrSetParticleAttractionAffectorAttract($h_ParticleAffector, $i_Attract)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAttract", "ptr", $h_ParticleAffector, "int", $i_Attract)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAttract


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorPoint
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
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
Func _IrrSetParticleAttractionAffectorPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorPoint", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorPoint


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetRotationAffectorPivotPoint
; Description ...: [todo]
; Syntax.........: _IrrSetRotationAffectorPivotPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
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
Func _IrrSetRotationAffectorPivotPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetRotationAffectorPivotPoint", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetRotationAffectorPivotPoint


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetFurthestDistanceOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetFurthestDistanceOfEffect($h_ParticleAffector, $f_Distance)
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
Func _IrrSetFurthestDistanceOfEffect($h_ParticleAffector, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetFurthestDistanceOfEffect", "ptr", $h_ParticleAffector, "float", $f_Distance)
EndFunc   ;==>_IrrSetFurthestDistanceOfEffect


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNearestDistanceOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetNearestDistanceOfEffect($h_ParticleAffector, $f_Distance)
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
Func _IrrSetNearestDistanceOfEffect($h_ParticleAffector, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetNearestDistanceOfEffect", "ptr", $h_ParticleAffector, "float", $f_Distance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNearestDistanceOfEffect


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetColumnDistanceOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetColumnDistanceOfEffect($h_ParticleAffector, $f_Distance)
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
Func _IrrSetColumnDistanceOfEffect($h_ParticleAffector, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetColumnDistanceOfEffect", "ptr", $h_ParticleAffector, "float", $f_Distance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetColumnDistanceOfEffect


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetCenterOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetCenterOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
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
Func _IrrSetCenterOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetCenterOfEffect", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCenterOfEffect


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetStrengthOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetStrengthOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
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
Func _IrrSetStrengthOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetStrengthOfEffect", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetStrengthOfEffect


; xxxx obsolete?!

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __CreateIrrModel
; Description ...: [todo]
; Syntax.........: __CreateIrrModel()
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
Func __CreateIrrModel()
	Local $irrModel = DllStructCreate("UINT_PTR node;UINT_PTR camera;UINT_PTR terrain;UINT_PTR particles")
	DllStructSetData($irrModel, "node", 0)
	DllStructSetData($irrModel, "camera", 0)
	DllStructSetData($irrModel, "terrain", 0)
	DllStructSetData($irrModel, "particles", 0)
	return $irrModel
EndFunc ;==> __CreateIrrModel




; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __CreateParticleEmitter
; Description ...: [todo]
; Syntax.........: __CreateParticleEmitter($f_MinBoxX, $f_MinBoxY, $f_MinBoxZ, $f_MaxBoxX, $f_MaxBoxY, $f_MaxBoxZ, $f_DirectionX, $f_DirectionY, $f_DirectionZ, $i_MinParticlesPerSecond, $i_MaxParticlesPerSecond, $i_MinStartRed, $i_MinStartGreen, $i_MinStartBlue, $i_MaxStartRed, $i_MaxStartGreen, $i_MaxStartBlue, $i_MinLifetime, $i_MaxLifetime, $f_MinStartSizeX, $f_MinStartSizeY, $f_MaxStartSizeX, $f_MaxStartSizeY, $i_MaxAngle)
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
Func __CreateParticleEmitter($f_MinBoxX, $f_MinBoxY, $f_MinBoxZ, $f_MaxBoxX, $f_MaxBoxY, $f_MaxBoxZ, $f_DirectionX, $f_DirectionY, $f_DirectionZ, $i_MinParticlesPerSecond, $i_MaxParticlesPerSecond, $i_MinStartRed, $i_MinStartGreen, $i_MinStartBlue, $i_MaxStartRed, $i_MaxStartGreen, $i_MaxStartBlue, $i_MinLifetime, $i_MaxLifetime, $f_MinStartSizeX, $f_MinStartSizeY, $f_MaxStartSizeX, $f_MaxStartSizeY, $i_MaxAngle)

local $struct = "float min_box_x;float min_box_y;float min_box_z;float max_box_x;float max_box_y;float max_box_z;" & _
							"float direction_x;float direction_y;float direction_z;uint min_paritlcles_per_second;uint max_paritlcles_per_second;" & _
							"int min_start_color_red;int min_start_color_green;int min_start_color_blue;" & _
							"int max_start_color_red;int max_start_color_green;int max_start_color_blue;" & _
							"uint min_lifetime;uint max_lifetime;" & _
							"float min_start_sizeX;float min_start_sizeY;float max_start_sizeX;float max_start_sizeY;int max_angle_degrees"
local $EmitterStruct = DllStructCreate($struct)
	DllStructSetData($EmitterStruct, "min_box_x", $f_MinBoxX)
	DllStructSetData($EmitterStruct, "min_box_y", $f_MinBoxY)
	DllStructSetData($EmitterStruct, "min_box_z", $f_MinBoxZ)
	DllStructSetData($EmitterStruct, "max_box_x", $f_MaxBoxX)
	DllStructSetData($EmitterStruct, "max_box_y", $f_MaxBoxY)
	DllStructSetData($EmitterStruct, "max_box_z", $f_MaxBoxZ)
	DllStructSetData($EmitterStruct, "direction_x", $f_DirectionX)
	DllStructSetData($EmitterStruct, "direction_y", $f_DirectionY)
	DllStructSetData($EmitterStruct, "direction_z", $f_DirectionZ)
	DllStructSetData($EmitterStruct, "min_paritlcles_per_second", $i_MinParticlesPerSecond)
	DllStructSetData($EmitterStruct, "max_paritlcles_per_second", $i_MaxParticlesPerSecond)
	DllStructSetData($EmitterStruct, "min_start_color_red", $i_MinStartRed)
	DllStructSetData($EmitterStruct, "min_start_color_green", $i_MinStartGreen)
	DllStructSetData($EmitterStruct, "min_start_color_blue", $i_MinStartBlue)
	DllStructSetData($EmitterStruct, "max_start_color_red", $i_MaxStartRed)
	DllStructSetData($EmitterStruct, "max_start_color_green", $i_MaxStartGreen)
	DllStructSetData($EmitterStruct, "max_start_color_blue", $i_MaxStartBlue)
	DllStructSetData($EmitterStruct, "min_lifetime", $i_MinLifetime)
	DllStructSetData($EmitterStruct, "max_lifetime", $i_MaxLifetime)
	DllStructSetData($EmitterStruct, "max_angle_degrees", $i_MaxAngle)
	DllStructSetData($EmitterStruct, "min_start_sizeX", $f_MinStartSizeX)
	DllStructSetData($EmitterStruct, "min_start_sizeY", $f_MinStartSizeY)
	DllStructSetData($EmitterStruct, "max_start_sizeX", $f_MaxStartSizeX)
	DllStructSetData($EmitterStruct, "max_start_sizeY", $f_MaxStartSizeY)

	Return $EmitterStruct
EndFunc   ;==>___CreateParticleEmitter



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: xxx__CreateParticleEmitter
; Description ...: [todo]
; Syntax.........: xxx__CreateParticleEmitter($f_MinBoxX, $f_MinBoxY, $f_MinBoxZ, $f_MaxBoxX, $f_MaxBoxY, $f_MaxBoxZ, $f_DirectionX, $f_DirectionY, $f_DirectionZ, $i_MinParticlesPerSecond, $i_MaxParticlesPerSecond, $i_MinStartRed, $i_MinStartGreen, $i_MinStartBlue, $i_MaxStartRed, $i_MaxStartGreen, $i_MaxStartBlue, $i_MinLifetime, $i_MaxLifetime, $f_MinStartSizeX, $f_MinStartSizeY, $f_MaxStartSizeX, $f_MaxStartSizeY, $i_MaxAngle)
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
Func xxx__CreateParticleEmitter($f_MinBoxX, $f_MinBoxY, $f_MinBoxZ, $f_MaxBoxX, $f_MaxBoxY, $f_MaxBoxZ, $f_DirectionX, $f_DirectionY, $f_DirectionZ, $i_MinParticlesPerSecond, $i_MaxParticlesPerSecond, $i_MinStartRed, $i_MinStartGreen, $i_MinStartBlue, $i_MaxStartRed, $i_MaxStartGreen, $i_MaxStartBlue, $i_MinLifetime, $i_MaxLifetime, $f_MinStartSizeX, $f_MinStartSizeY, $f_MaxStartSizeX, $f_MaxStartSizeY, $i_MaxAngle)
	local $EmitterStruct = DllStructCreate("float min_box_x;float min_box_y;float min_box_z;float max_box_x;float max_box_y;float max_box_z;float direction_x;float direction_y;float direction_z;" & _
											"UINT min_paritlcles_per_second;UINT max_paritlcles_per_second;int min_start_color_red;int min_start_color_green;int min_start_color_blue;" & _
											"int max_start_color_red;int max_start_color_green;int max_start_color_blue;UINT min_lifetime;UINT max_lifetime;float min_start_sizeX;float min_start_sizeY;" & _
											"float max_start_sizeX;float max_start_sizeY;int max_angle_degrees")
	DllStructSetData($EmitterStruct, 1, $f_MinBoxX)
	DllStructSetData($EmitterStruct, 2, $f_MinBoxY)
	DllStructSetData($EmitterStruct, 3, $f_MinBoxZ)
	DllStructSetData($EmitterStruct, 4, $f_MaxBoxX)
	DllStructSetData($EmitterStruct, 5, $f_MaxBoxY)
	DllStructSetData($EmitterStruct, 6, $f_MaxBoxZ)
	DllStructSetData($EmitterStruct, 7, $f_DirectionX)
	DllStructSetData($EmitterStruct, 8, $f_DirectionY)
	DllStructSetData($EmitterStruct, 9, $f_DirectionZ)
	DllStructSetData($EmitterStruct, 10, $i_MinParticlesPerSecond)
	DllStructSetData($EmitterStruct, 11, $i_MaxParticlesPerSecond)
	DllStructSetData($EmitterStruct, 12, $i_MinStartRed)
	DllStructSetData($EmitterStruct, 13, $i_MinStartGreen)
	DllStructSetData($EmitterStruct, 14, $i_MinStartBlue)
	DllStructSetData($EmitterStruct, 15, $i_MaxStartRed)
	DllStructSetData($EmitterStruct, 16, $i_MaxStartGreen)
	DllStructSetData($EmitterStruct, 17, $i_MaxStartBlue)
	DllStructSetData($EmitterStruct, 18, $i_MinLifetime)
	DllStructSetData($EmitterStruct, 19, $i_MaxLifetime)
	DllStructSetData($EmitterStruct, 20, $f_MinStartSizeX)
	DllStructSetData($EmitterStruct, 21, $f_MinStartSizeY)
	DllStructSetData($EmitterStruct, 22, $f_MaxStartSizeX)
	DllStructSetData($EmitterStruct, 23, $f_MaxStartSizeY)
	DllStructSetData($EmitterStruct, 24, $i_MaxAngle)
	Return $EmitterStruct
EndFunc   ;==>___CreateParticleEmitter








