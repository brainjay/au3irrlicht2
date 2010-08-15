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
;_IrrGUIClear
;_IrrGUIEvents
;_IrrGUIEventAvailable
;_IrrReadGUIEvent
;_IrrGUIRemove
;_IrrGUIGetText
;_IrrGUISetText
;_IrrGUISetFont
;_IrrGUISetColor
;_IrrAddWindow
;_IrrAddStaticText
;_IrrAddButton
;_IrrAddScrollBar
;_IrrAddListBox
;_IrrAddListBoxItem
;_IrrInsertListBoxItem
;_IrrRemoveListBoxItem
;_IrrSelectListBoxItem
;_IrrAddEditBox
;_IrrAddCheckBox
;_IrrCheckCheckBox
;_IrrAddImage
;_IrrAddFileOpen
;_IrrGetLastSelectedFile
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;__getGuiEvt
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

Global enum _ ; enumeration GUI_EVENT for possible Elements readable by __getGuiEvt
	$EVT_GUI_IID = 1,	_ 	; integer "id"
	$EVT_GUI_IEVENT, _ 		; IRR_EGUI_EVENT_TYPE "event"
	$EVT_GUI_IX, _			; integer "x"
	$EVT_GUI_IY				; integer "y"


; #FUNCTION# =============================================================================================================
; Name...........: __getGuiEvt
; Description ...: Helper function: returns value of $i_Element inside a GuiEvent-structure.
; Syntax.........: __getGuiEvt($p_GUIEvent, $i_Element = $EVT_GUI_IID)
; Parameters ....: $p_GUIEvent - A pointer as returned from _IrrReadGUIEvent.
;                  $i_Element - [optional] Event type to return:
;                  |$EVT_GUI_IID - ID of GUI element as integer
;                  |$EVT_GUI_IEVENT - Event type from enum $IRR_EGUI_EVENT_TYPE
;                  |$EVT_GUI_IX - X as integer
;                  |$EVT_GUI_IY	- Y as integer
; Return values .: Success - Value of selected event type
;                  Failure - Returns False and sets @error = 1
; Author ........: linus
; Modified.......:
; Remarks .......: [todo]
; Related .......: _IrrReadGUIEvent
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
func __getGuiEvt($p_GUIEvent, $i_Element = $EVT_GUI_IID)

	local $EventStruct = DllStructCreate("int;int;int;int", $p_GUIEvent)
	$result = DllStructGetData($EventStruct, $i_Element)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result
	EndIf
EndFunc ;==> __getGuiEvt


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIClear
; Description ...: [todo]
; Syntax.........: _IrrGUIClear()
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
Func _IrrGUIClear()
	DllCall($_irrDll, "none:cdecl", "IrrGUIClear")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUIClear



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIEvents
; Description ...: [todo]
; Syntax.........: _IrrGUIEvents($i_EventsForGUI)
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
Func _IrrGUIEvents($i_EventsForGUI)
; whether keyboard and mouse events should be used by the GUI
	$result = DllCall($_irrDll, "int:cdecl", "IrrGUIEvents", "int", $i_EventsForGUI)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrGUIEvents



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIEventAvailable
; Description ...: [todo]
; Syntax.........: _IrrGUIEventAvailable()
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
Func _IrrGUIEventAvailable()
; find out if there is a GUI event ready to be read. returns 1 if there is an
; event available (the event receiver must have been started when the system
; was initialised)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGUIEventAvailable")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrGUIEventAvailable



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrReadGUIEvent
; Description ...: [todo]
; Syntax.........: _IrrReadGUIEvent()
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
Func _IrrReadGUIEvent()
; read a GUI event out
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrReadGUIEvent")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrReadGUIEvent



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIRemove
; Description ...: [todo]
; Syntax.........: _IrrGUIRemove($h_Widget)
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
Func _IrrGUIRemove($h_Widget)
	DllCall($_irrDll, "none:cdecl", "IrrGUIRemove", "ptr", $h_Widget)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUIRemove


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIGetText
; Description ...: [todo]
; Syntax.........: _IrrGUIGetText($h_Widget)
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
Func _IrrGUIGetText($h_Widget)
	$result = DllCall($_irrDll, "wstr:cdecl", "IrrGUIGetText", "ptr", $h_Widget)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGUIGetText


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUISetText
; Description ...: [todo]
; Syntax.........: _IrrGUISetText($h_Widget, $s_Text)
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
Func _IrrGUISetText($h_Widget, $s_Text)
	DllCall($_irrDll, "none:cdecl", "IrrGUISetText", "ptr", $h_Widget, "wstr", $s_Text)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUISetText



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUISetFont
; Description ...: [todo]
; Syntax.........: _IrrGUISetFont($h_Font)
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
Func _IrrGUISetFont($h_Font)
	DllCall($_irrDll, "none:cdecl", "IrrGUISetFont", "UINT_PTR", $h_Font)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUISetFont



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUISetColor
; Description ...: [todo]
; Syntax.........: _IrrGUISetColor($i_Element, $i_Red, $i_Green, $i_Blue, $i_Alpha)
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
Func _IrrGUISetColor($i_Element, $i_Red, $i_Green, $i_Blue, $i_Alpha)
; set the color of an element used by the gui
	DllCall($_irrDll, "none:cdecl", "IrrGUISetColor", "int", $i_Element, "int", $i_Red, "int", $i_Green, "int", $i_Blue, "int", $i_Alpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUISetColor



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddWindow
; Description ...: [todo]
; Syntax.........: _IrrAddWindow($s_Title, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Modal, $h_Parent = 0)
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
Func _IrrAddWindow($s_Title, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Modal, $h_Parent = 0)
; add a static text object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddWindow", "wstr", $s_Title, "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "uint", $i_Modal, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddWindow



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddStaticText
; Description ...: [todo]
; Syntax.........: _IrrAddStaticText($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Border, $i_WordWrap, $h_Parent = 0)
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
Func _IrrAddStaticText($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Border, $i_WordWrap, $h_Parent = 0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddStaticText", "wstr", $s_Text, "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "uint", $i_Border, "uint", $i_WordWrap, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddStaticText



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddButton
; Description ...: [todo]
; Syntax.........: _IrrAddButton($i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $s_Text = "", $s_TextTip = "", $h_Parent = 0)
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
Func _IrrAddButton($i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $s_Text = "", $s_TextTip = "", $h_Parent = 0)
; add a clickable button object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddButton", "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, _
				"int", $i_ID, "wstr", $s_Text, "wstr", $s_TextTip, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddButton



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddScrollBar
; Description ...: [todo]
; Syntax.........: _IrrAddScrollBar($i_Horizontal, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_CurrentValue, $i_MaxValue, $h_Parent = 0)
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
Func _IrrAddScrollBar($i_Horizontal, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_CurrentValue, $i_MaxValue, $h_Parent = 0)
; add a scrollbar object to the gui display
$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddScrollBar", "int", $i_Horizontal, "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_CurrentValue, "int", $i_MaxValue, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddScrollBar



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddListBox
; Description ...: [todo]
; Syntax.........: _IrrAddListBox($i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Background, $h_Parent=0)
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
Func _IrrAddListBox($i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Background, $h_Parent=0)
; add a listbox object containing a list of items to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddListBox", "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_Background, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddListBox


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddListBoxItem
; Description ...: [todo]
; Syntax.........: _IrrAddListBoxItem($h_ListBox, $s_Text)
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
Func _IrrAddListBoxItem($h_ListBox, $s_Text)
	DllCall($_irrDll, "none:cdecl", "IrrAddListBoxItem", "ptr", $h_ListBox, "wstr", $s_Text)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddListBoxItem


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrInsertListBoxItem
; Description ...: [todo]
; Syntax.........: _IrrInsertListBoxItem($h_ListBox, $s_Text, $i_Index)
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
Func _IrrInsertListBoxItem($h_ListBox, $s_Text, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrInsertListBoxItem", "ptr", $h_ListBox, "str", $s_Text, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrInsertListBoxItem


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveListBoxItem
; Description ...: [todo]
; Syntax.........: _IrrRemoveListBoxItem($h_ListBox, $i_Index)
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
Func _IrrRemoveListBoxItem($h_ListBox, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveListBoxItem", "ptr", $h_ListBox, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveListBoxItem


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSelectListBoxItem
; Description ...: [todo]
; Syntax.........: _IrrSelectListBoxItem($h_ListBox, $i_Index)
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
Func _IrrSelectListBoxItem($h_ListBox, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrSelectListBoxItem", "ptr", $h_ListBox, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSelectListBoxItem



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddEditBox
; Description ...: [todo]
; Syntax.........: _IrrAddEditBox($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Border, $i_Password = $IRR_GUI_NOT_PASSWORD, $h_Parent = 0)
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
Func _IrrAddEditBox($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Border, $i_Password = $IRR_GUI_NOT_PASSWORD, $h_Parent = 0)
; add an editbox object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddEditBox", "wstr", $s_Text, "int", $i_TopX, "int", $i_TopY, _
				"int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_Border, "int", $i_Password, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddEditBox



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddCheckBox
; Description ...: [todo]
; Syntax.........: _IrrAddCheckBox($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Checked, $h_Parent = 0)
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
Func _IrrAddCheckBox($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Checked, $h_Parent = 0)
; add a checkbox object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCheckBox", "wstr", $s_Text, "int", $i_TopX, "int", $i_TopY, _
				"int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_Checked, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCheckBox


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCheckCheckBox
; Description ...: [todo]
; Syntax.........: _IrrCheckCheckBox($h_CheckBox, $i_Checked)
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
Func _IrrCheckCheckBox($h_CheckBox, $i_Checked)
	DllCall($_irrDll, "none:cdecl", "IrrCheckCheckBox", "ptr", $h_CheckBox, "int", $i_Checked)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrCheckCheckBox



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddImage
; Description ...: [todo]
; Syntax.........: _IrrAddImage($h_Texture, $i_X, $i_Y, $i_UseAlpha, $i_ID, $h_Parent = 0)
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
Func _IrrAddImage($h_Texture, $i_X, $i_Y, $i_UseAlpha, $i_ID, $h_Parent = 0)
; add an image object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddImage", "UINT_PTR", $h_Texture, "int", $i_X, "int", $i_Y, "int", $i_UseAlpha, "int", $i_ID, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddImage



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFileOpen
; Description ...: [todo]
; Syntax.........: _IrrAddFileOpen($s_Title, $i_ID, $i_Modal, $h_Parent = 0)
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
Func _IrrAddFileOpen($s_Title, $i_ID, $i_Modal, $h_Parent = 0)
; open a modal file open dialog
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFileOpen", "wstr", $s_Title, "int", $i_ID, "int", $i_Modal, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFileOpen



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetLastSelectedFile
; Description ...: [todo]
; Syntax.........: _IrrGetLastSelectedFile()
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
Func _IrrGetLastSelectedFile()
; get the last file name selected from a file selection dialog
	$result = DllCall($_irrDll, "wstr:cdecl", "IrrGetLastSelectedFile")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetLastSelectedFile




