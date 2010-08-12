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
;_IrrAddZipFile
;_IrrChangeWorkingDirectory
;_IrrGetWorkingDirectory
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

;File system functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddZipFile
; Description ...: [todo]
; Syntax.........: _IrrAddZipFile($s_Zipfile, $i_IgnoreCase, $i_IgnorePaths)
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
Func _IrrAddZipFile($s_Zipfile, $i_IgnoreCase, $i_IgnorePaths)
	DllCall($_irrDll, "none:cdecl", "IrrAddZipFile", "str", $s_Zipfile, "int", $i_IgnoreCase, "int", $i_IgnorePaths)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddZipFile


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrChangeWorkingDirectory
; Description ...: [todo]
; Syntax.........: _IrrChangeWorkingDirectory($s_WorkingDir)
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
Func _IrrChangeWorkingDirectory($s_WorkingDir)
	DllCall($_irrDll, "none:cdecl", "IrrChangeWorkingDirectory", "str", $s_WorkingDir)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrChangeWorkingDirectory


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetWorkingDirectory
; Description ...: [todo]
; Syntax.........: _IrrGetWorkingDirectory()
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
Func _IrrGetWorkingDirectory()
	$result = DllCall($_irrDll, "str:cdecl", "IrrGetWorkingDirectory")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetWorkingDirectory


