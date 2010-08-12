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
;__getKeyEvt
;__getMouseEvt
;_IrrKeyEventAvailable
;_IrrReadKeyEvent
;_IrrMouseEventAvailable
;_IrrReadMouseEvent
;_IrrSetMousePosition
;_IrrHideMouse
;_IrrShowMouse
;_IrrDisplayMouse
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

;Mouse and Keyboard event functions


Global enum _ ; enumeration KEY_EVENT for possible Elements readable by __getKeyEvt
	$EVT_KEY_IKEY = 1,	_ 	; unsigned integer "key"
	$EVT_KEY_IDIRECTION, _ 	; unsigned integer "direction"
	$EVT_KEY_IFLAGS			; unsigned integer "flags"

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __getKeyEvt
; Description ...: [todo]
; Syntax.........: __getKeyEvt($p_KeyEvent, $i_Element = $EVT_KEY_IKEY)
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
func __getKeyEvt($p_KeyEvent, $i_Element = $EVT_KEY_IKEY)
; helper function:
; returns value of $i_Element inside a keyEvent-structure.
; $p_KeyEvent is a pointer as returned from _IrrReadKeyEvent.
	local $EventStruct = DllStructCreate("uint;uint;uint", $p_KeyEvent)
	$result = DllStructGetData($EventStruct, $i_Element)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result
	EndIf
EndFunc ;==> __getKeyEvt

Global enum _ ; enumeration MOUSE_EVENT for possible Elements readable by __getMouseEvt
	$EVT_MOUSE_IACTION = 1,	_ 	; unsigned integer "action"
	$EVT_MOUSE_FDELTA, _ 		; single "delta"
	$EVT_MOUSE_IX, _			; integer "x"
	$EVT_MOUSE_IY				; integer "y"


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __getMouseEvt
; Description ...: [todo]
; Syntax.........: __getMouseEvt($p_MouseEvent, $i_Element = $EVT_MOUSE_IACTION)
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
func __getMouseEvt($p_MouseEvent, $i_Element = $EVT_MOUSE_IACTION)
; helper function:
; returns value of $i_Element inside a MouseEvent-structure.
; $p_MouseEvent is a pointer as returned from _IrrReadMouseEvent.
	local $EventStruct = DllStructCreate("uint;float;int;int", $p_MouseEvent)
	$result = DllStructGetData($EventStruct, $i_Element)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result
	EndIf
EndFunc ;==> __getMouseEvt


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrKeyEventAvailable
; Description ...: [todo]
; Syntax.........: _IrrKeyEventAvailable()
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
Func _IrrKeyEventAvailable()
	$result = DllCall($_irrDll, "int:cdecl", "IrrKeyEventAvailable")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrKeyEventAvailable


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrReadKeyEvent
; Description ...: [todo]
; Syntax.........: _IrrReadKeyEvent()
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
Func _IrrReadKeyEvent()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrReadKeyEvent")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrReadKeyEvent


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMouseEventAvailable
; Description ...: [todo]
; Syntax.........: _IrrMouseEventAvailable()
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
Func _IrrMouseEventAvailable()
	$result = DllCall($_irrDll, "int:cdecl", "IrrMouseEventAvailable")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrMouseEventAvailable


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrReadMouseEvent
; Description ...: [todo]
; Syntax.........: _IrrReadMouseEvent()
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
Func _IrrReadMouseEvent()
	$result = DllCall($_irrDll, "int:cdecl", "IrrReadMouseEvent")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrReadMouseEvent


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMousePosition
; Description ...: [todo]
; Syntax.........: _IrrSetMousePosition(ByRef $f_XPos, ByRef $f_YPos)
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
Func _IrrSetMousePosition(ByRef $f_XPos, ByRef $f_YPos)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetMousePosition", "float*", $f_XPos, "float*", $f_YPos)
	if @error Then
		Return Seterror(1,0,False)
	Else
		$f_XPos = $result[1]
		$f_YPos = $result[2]
		Return true
	EndIf
EndFunc   ;==>_IrrSetMousePosition


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrHideMouse
; Description ...: [todo]
; Syntax.........: _IrrHideMouse()
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
Func _IrrHideMouse()
	return _IrrDisplayMouse(False)
EndFunc   ;==>_IrrHideMouse


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrShowMouse
; Description ...: [todo]
; Syntax.........: _IrrShowMouse()
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
Func _IrrShowMouse()
	return _IrrDisplayMouse(True)
EndFunc   ;==>_IrrShowMouse


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDisplayMouse
; Description ...: [todo]
; Syntax.........: _IrrDisplayMouse($i_HideShow)
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
Func _IrrDisplayMouse($i_HideShow)
	DllCall($_irrDll, "none:cdecl", "IrrDisplayMouse", "int", $i_HideShow)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDisplayMouse

