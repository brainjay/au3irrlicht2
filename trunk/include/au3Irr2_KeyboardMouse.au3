#include-once

#include "au3Irr2_constants.au3"

; #INDEX# =======================================================================================================================
; Title .........: Keyboard and Mouse
; AutoIt Version : v3.3.6.1
; Language ......: English
; Description ...: These calls allow you recover keyboard events and mouse actions that the user creates.
; Author(s) .....: jRowe, linus.
;                  DLL functionality by Frank Dodd (IrrlichtWrapper), Nikolaus Gebhardt and Irrlicht team (Irrlicht).
; Dll(s) ........: IrrlichtWrapper.dll, Irrlicht.dll, msvcp71.dll
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Not working/documented/implemented at this time
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
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

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

;Mouse and Keyboard event functions


Global enum _ ; enumeration KEY_EVENT for possible Elements readable by __getKeyEvt
	$EVT_KEY_IKEY = 1,	_ 	; unsigned integer "key"
	$EVT_KEY_IDIRECTION, _ 	; unsigned integer "direction"
	$EVT_KEY_IFLAGS			; unsigned integer "flags"

; #FUNCTION# =============================================================================================================
; Name...........: __getKeyEvt
; Description ...: helper function: returns value of $i_Element inside a keyEvent-structure.
; Syntax.........: __getKeyEvt($p_KeyEvent, $i_Element = $EVT_KEY_IKEY)
; Parameters ....: $p_KeyEvent - A pointer as returned from _IrrReadKeyEvent.
;                  $i_Element - [optional] Event type to return:
;                  |$EVT_KEY_IKEY - ID of pressed key.
;                  |$EVT_KEY_IDIRECTION - Direction value.
;                  |$EVT_KEY_IFLAGS - Key flags value
; Return values .: Success - Value of selected event element.
; Author ........: linus
; Modified.......:
; Remarks .......: $p_KeyEvent is a pointer as returned from _IrrReadKeyEvent.
; Related .......: _IrrReadKeyEvent
; Link ..........:
; Example .......: No
; ===============================================================================================================================
func __getKeyEvt($p_KeyEvent, $i_Element = $EVT_KEY_IKEY)
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


; #FUNCTION# =============================================================================================================
; Name...........: __getMouseEvt
; Description ...: helper function: returns value of $i_Element inside a MouseEvent-structure.
; Syntax.........: __getMouseEvt($p_MouseEvent, $i_Element = $EVT_MOUSE_IACTION)
; Parameters ....: $p_MouseEvent - A pointer as returned from _IrrReadMouseEvent.
;                  $i_Element - [optional] Event type to return:
;                  |$EVT_MOUSE_IACTION - ID of mouse action
;                  |$EVT_MOUSE_FDELTA - Delta value
;                  |$EVT_MOUSE_IX - Mouse X value
;                  |$EVT_MOUSE_IY - Mouse Y value
; Return values .: Success - Value of selected event element.
; Author ........: linus
; Modified.......:
; Remarks .......: $p_MouseEvent is a pointer as returned from _IrrReadMouseEvent.
; Related .......: _IrrReadMouseEvent
; Link ..........:
; Example .......: No
; ===============================================================================================================================
func __getMouseEvt($p_MouseEvent, $i_Element = $EVT_MOUSE_IACTION)
	local $EventStruct = DllStructCreate("uint;float;int;int", $p_MouseEvent)
	$result = DllStructGetData($EventStruct, $i_Element)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result
	EndIf
EndFunc ;==> __getMouseEvt


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrHideMouse
; Description ...: Hides the mouse pointer
; Syntax.........: _IrrHideMouse()
; Parameters ....: None
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrShowMouse, _IrrDisplayMouse
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrHideMouse()
	return _IrrDisplayMouse(False)
EndFunc   ;==>_IrrHideMouse


; #FUNCTION# =============================================================================================================
; Name...........: _IrrShowMouse
; Description ...: Shows the mouse pointer
; Syntax.........: _IrrShowMouse()
; Parameters ....: None
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrHideMouse, _IrrDisplayMouse
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrShowMouse()
	return _IrrDisplayMouse(True)
EndFunc   ;==>_IrrShowMouse


; #FUNCTION# =============================================================================================================
; Name...........: _IrrDisplayMouse
; Description ...: Hide or show the mouse pointer while it is within the Irrlicht display.
; Syntax.........: _IrrDisplayMouse($i_HideShow)
; Parameters ....: $i_HideShow - True shows and False hides the mouse pointer.
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: There are two functions available to simply hide or show the mouse: IrrHideMouse and IrrShowMouse.
; Related .......: _IrrShowMouse, _IrrHideMouse
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrDisplayMouse($i_HideShow)
	DllCall($_irrDll, "none:cdecl", "IrrDisplayMouse", "int", $i_HideShow)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDisplayMouse
