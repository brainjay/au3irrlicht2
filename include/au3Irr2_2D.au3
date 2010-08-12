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
;_IrrSetTextureCreationFlag
;_IrrGetTexture
;_IrrGetImage
;_IrrCreateTexture
;_IrrCreateImage
;_IrrRemoveTexture
;_IrrRemoveImage
;_IrrLockTexture
;_IrrLockOpenGLTexture
;_IrrUnlockTexture
;_IrrLockImage
;_IrrUnlockImage
;_IrrCreateRenderTargetTexture
;_IrrMakeNormalMapTexture
;_IrrColorKeyTexture
;_IrrDraw2DImage
;_IrrDraw2DImageElement
;_IrrGetFont
;_Irr2DFontDraw
;_IrrSaveScreenShot
;_IrrGetScreenShot
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

;2D functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetTextureCreationFlag
; Description ...: [todo]
; Syntax.........: _IrrSetTextureCreationFlag($i_Flag, $i_Value)
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
Func _IrrSetTextureCreationFlag($i_Flag, $i_Value)
	DllCall($_irrDll, "none:cdecl", "IrrSetTextureCreationFlag", "int", $i_Flag, "int", $i_Value)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTextureCreationFlag


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetTexture
; Description ...: [todo]
; Syntax.........: _IrrGetTexture($s_TextureFile)
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
Func _IrrGetTexture($s_TextureFile)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetTexture", "str", $s_TextureFile)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetImage
; Description ...: [todo]
; Syntax.........: _IrrGetImage($s_ImageFile)
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
Func _IrrGetImage($s_ImageFile)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetImage", "str", $s_ImageFile)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateTexture
; Description ...: [todo]
; Syntax.........: _IrrCreateTexture($s_TextureName, $i_XSize, $i_YSize, $i_ColorFormat)
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
Func _IrrCreateTexture($s_TextureName, $i_XSize, $i_YSize, $i_ColorFormat)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateTexture", "str", $s_TextureName, "int", $i_XSize, "int", $i_YSize, "int", $i_ColorFormat)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateImage
; Description ...: [todo]
; Syntax.........: _IrrCreateImage($i_XSize, $i_YSize, $i_ColorFormat)
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
Func _IrrCreateImage($i_XSize, $i_YSize, $i_ColorFormat)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateImage", "int", $i_XSize, "int", $i_YSize, "int", $i_ColorFormat)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveTexture
; Description ...: [todo]
; Syntax.........: _IrrRemoveTexture($h_Texture)
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
Func _IrrRemoveTexture($h_Texture)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveImage
; Description ...: [todo]
; Syntax.........: _IrrRemoveImage($h_Image)
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
Func _IrrRemoveImage($h_Image)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveImage", "ptr", $h_Image)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrLockTexture
; Description ...: [todo]
; Syntax.........: _IrrLockTexture($h_Texture)
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
Func _IrrLockTexture($h_Texture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrLockTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrLockTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrLockOpenGLTexture
; Description ...: [todo]
; Syntax.........: _IrrLockOpenGLTexture($h_Texture)
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
Func _IrrLockOpenGLTexture($h_Texture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrLockOpenGLTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrLockOpenGLTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrUnlockTexture
; Description ...: [todo]
; Syntax.........: _IrrUnlockTexture($h_Texture)
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
Func _IrrUnlockTexture($h_Texture)
	DllCall($_irrDll, "none:cdecl", "IrrUnlockTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrUnlockTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrLockImage
; Description ...: [todo]
; Syntax.........: _IrrLockImage($h_Image)
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
Func _IrrLockImage($h_Image)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrLockImage", "ptr", $h_Image)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrLockImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrUnlockImage
; Description ...: [todo]
; Syntax.........: _IrrUnlockImage($h_Image)
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
Func _IrrUnlockImage($h_Image)
	DllCall($_irrDll, "none:cdecl", "IrrUnlockImage", "ptr", $h_Image)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrUnlockImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateRenderTargetTexture
; Description ...: [todo]
; Syntax.........: _IrrCreateRenderTargetTexture($i_XSize, $i_YSize)
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
Func _IrrCreateRenderTargetTexture($i_XSize, $i_YSize)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateRenderTargetTexture", "uint", $i_XSize, "uint", $i_YSize)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateRenderTargetTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMakeNormalMapTexture
; Description ...: [todo]
; Syntax.........: _IrrMakeNormalMapTexture($h_Texture, $f_Amplitude)
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
Func _IrrMakeNormalMapTexture($h_Texture, $f_Amplitude)
	DllCall($_irrDll, "none:cdecl", "IrrMakeNormalMapTexture", "ptr", $h_Texture, "float", $f_Amplitude)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMakeNormalMapTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrColorKeyTexture
; Description ...: [todo]
; Syntax.........: _IrrColorKeyTexture($h_Texture, $i_Red, $i_Green, $i_Blue)
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
Func _IrrColorKeyTexture($h_Texture, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrColorKeyTexture", "ptr", $h_Texture, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrColorKeyTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDraw2DImage
; Description ...: [todo]
; Syntax.........: _IrrDraw2DImage($h_Image, $i_XPos, $i_YPos)
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
Func _IrrDraw2DImage($h_Image, $i_XPos, $i_YPos)
	DllCall($_irrDll, "none:cdecl", "IrrDraw2DImage", "ptr", $h_Image, "int", $i_XPos, "int", $i_YPos)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw2DImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDraw2DImageElement
; Description ...: [todo]
; Syntax.........: _IrrDraw2DImageElement($h_Texture, $i_XPos, $i_YPos, $i_SourceTopX, $i_SourceTopY, $i_SourceBottomX, $i_SourceBottomY, $i_UseAlpha)
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
Func _IrrDraw2DImageElement($h_Texture, $i_XPos, $i_YPos, $i_SourceTopX, $i_SourceTopY, $i_SourceBottomX, $i_SourceBottomY, $i_UseAlpha)
	DllCall($_irrDll, "none:cdecl", "IrrDraw2DImageElement", "ptr", $h_Texture, "int", $i_XPos, "int", $i_YPos, "int", $i_SourceTopX, "int", $i_SourceTopY, "int", $i_SourceBottomX, "int", $i_SourceBottomY, "int", $i_UseAlpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw2DImageElement


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetFont
; Description ...: [todo]
; Syntax.........: _IrrGetFont($s_Font)
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
Func _IrrGetFont($s_Font)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetFont", "str", $s_Font)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetFont


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _Irr2DFontDraw
; Description ...: [todo]
; Syntax.........: _Irr2DFontDraw($h_Font, $s_Text, $i_XPos, $i_YPos, $i_BottomX, $i_BottomY)
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
Func _Irr2DFontDraw($h_Font, $s_Text, $i_XPos, $i_YPos, $i_BottomX, $i_BottomY)
	DllCall($_irrDll, "none:cdecl", "Irr2DFontDraw", "ptr", $h_Font, "wstr", $s_Text, "int", $i_XPos, "int", $i_YPos, "int", $i_BottomX, "int", $i_BottomY)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_Irr2DFontDraw


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSaveScreenShot
; Description ...: [todo]
; Syntax.........: _IrrSaveScreenShot($s_Filename)
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
Func _IrrSaveScreenShot($s_Filename)
	DllCall($_irrDll, "none:cdecl", "IrrSaveScreenShot", "str", $s_Filename)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSaveScreenShot


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetScreenShot
; Description ...: [todo]
; Syntax.........: _IrrGetScreenShot($i_XPos, $i_YPos, $i_Width, $i_Height)
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
Func _IrrGetScreenShot($i_XPos, $i_YPos, $i_Width, $i_Height)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetScreenShot", "int", $i_XPos, "int", $i_YPos, "int", $i_Width, "int", $i_Height)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetScreenShot

