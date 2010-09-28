#include-once

#include "au3Irr2_constants.au3"

; #INDEX# =======================================================================================================================
; Title .........: 2D
; AutoIt Version : v3.3.6.1
; Language ......: English
; Description ...: Support for 2D operations including the loading of bitmaps that can be used for texturing
;                  3D objects or for display on the screen as 2D sprites.
; Author(s) .....: jRowe, linus.
;                  DLL functionality by Frank Dodd and IrrlichtWrapper for FreeBasic team (IrrlichtWrapper.dll),
;                  and Nikolaus Gebhardt and Irrlicht team (Irrlicht.dll).
; Dll(s) ........: IrrlichtWrapper.dll, Irrlicht.dll, msvcp71.dll, msvcr71.dll
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Not working/documented/implemented at this time
;_IrrCreateTexture
;_IrrCreateImage
;_IrrLockTexture
;_IrrLockOpenGLTexture
;_IrrUnlockTexture
;_IrrLockImage
;_IrrUnlockImage
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;_IrrSetTextureCreationFlag
;_IrrGetTexture
;_IrrGetImage
;_IrrRemoveTexture
;_IrrRemoveImage
;_IrrCreateRenderTargetTexture
;_IrrMakeNormalMapTexture
;_IrrColorKeyTexture
;_IrrDraw2DImage
;_IrrDraw2DImageElement
;_IrrDraw2DImageElementStretch
;_IrrGetFont
;_Irr2DFontDraw
;_IrrSaveScreenShot
;_IrrGetScreenShot
;_IrrGetTextureInformation
;_IrrGetImageInformation
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

; #FUNCTION# =============================================================================================================
; Name...........: _IrrSetTextureCreationFlag
; Description ...: Sets texture creation flags controlling how textures are handled when they are created.
; Syntax.........: _IrrSetTextureCreationFlag($i_Flag, $i_Value)
; Parameters ....: $i_Value -  The following flags can be set;
;                  |$ETCF_ALWAYS_16_BIT - Forces the driver to always create 16 bit textures, independently of which format the file on disk has.
;                   When choosing this you may loose some color detail, but gain speed and save memory.
;                   16 bit textures can be transferred twice as quickly as 32 bit textures and only use half of the memory space.
;                   When using this flag, it does not make sense to use the flags ETCF_ALWAYS_32_BIT, ETCF_OPTIMIZED_FOR_QUALITY, or ETCF_OPTIMIZED_FOR_SPEED at the same time.
;                  |$ETCF_ALWAYS_32_BIT - Forces the driver to always create 32 bit textures, independently of which format the file on disk has.
;                   Note that some drivers (like the software device) will ignore this, because they are only able to create and use 16 bit textures.
;                   When using this flag, it does not make sense to use the flags ETCF_ALWAYS_16_BIT, ETCF_OPTIMIZED_FOR_QUALITY, or ETCF_OPTIMIZED_FOR_SPEED at the same time.
;                  |$ETCF_OPTIMIZED_FOR_QUALITY - Lets the driver decide in which format the textures are created and tries to make the textures look as good as possible.
;                   Usually it simply chooses the format in which the texture was stored on disk.
;                   When using this flag, it does not make sense to use the flags ETCF_ALWAYS_16_BIT, ETCF_ALWAYS_32_BIT, or ETCF_OPTIMIZED_FOR_SPEED at the same time.
;                  |$ETCF_OPTIMIZED_FOR_SPEED - Lets the driver decide in which format the textures are created and tries to create them maximizing render speed.
;                   When using this flag, it does not make sense to use the flags ETCF_ALWAYS_16_BIT, ETCF_ALWAYS_32_BIT, or ETCF_OPTIMIZED_FOR_QUALITY, at the same time.
;                  |$ETCF_CREATE_MIP_MAPS - Automatically creates mip map levels for the textures.
;                  |$ETCF_NO_ALPHA_CHANNEL - Discard any alpha layer and use non-alpha color format.
;                  $i_Flag - Turn Creation Flag Off or On ($IRR_OFF or $IRR_ON)
; Return values .: Success - True
;                  Failure - False
; Author ........: smashly
; Modified.......:
; Remarks .......:
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrSetTextureCreationFlag($i_Value, $i_Flag)
    DllCall($_irrDll, "none:cdecl", "IrrSetTextureCreationFlag", "int", $i_Value, "int", $i_Flag)
    Return SetError(@error, 0, @error = 0)
EndFunc   ;==>_IrrSetTextureCreationFlag




; #FUNCTION# =============================================================================================================
; Name...........: _IrrGetTexture
; Description ...: Loads 2D texture from bitmap file into video memory that can then be used to texture a model or to draw onto the screen.
; Syntax.........: _IrrGetTexture($s_ImageFile)
; Parameters ....: $s_ImageFile - Full path to the bitmap file.
; Return values .: Success - Handle of the device dependend irrlicht texture object
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: Irrlicht engine supports currently this image file formats:
;                  @@StandardTable@@
;                  JPEG File Interchange Format (.jpg, r/w)	Portable Network Graphics (.png, r/w)
;                  Truevision Targa (.tga, r/w)	Windows Bitmap (.bmp, r/w)
;                  Zsoft Paintbrush (.pcx, r/w)	Portable Pixmaps (.ppm, r/w)
;                  Adobe Photoshop (.psd, r)	Quake 2 textures (.wal, r)
;                  SGI truecolor textures (.rgb, r)
;                  @@End@@
; Related .......: _IrrRemoveTexture, _IrrGetImage
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrGetTexture($s_TextureFile)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetTexture", "str", $s_TextureFile)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetTexture


; #FUNCTION# =============================================================================================================
; Name...........: _IrrGetImage
; Description ...: Loads 2D texture from bitmap file into main memory for CPU based operations.
; Syntax.........: _IrrGetImage($s_ImageFile)
; Parameters ....: $s_ImageFile - Full path to the bitmap file.
; Return values .: Success - Handle of the irrlicht memory texture object
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: <b>This images can not be used to texture 3D objects!</b> Instead, they can be used to supply a heightmap to a terrain or other similar CPU based operations.
;+
;                  Irrlicht engine supports currently this image file formats:
;                  @@StandardTable@@
;                  JPEG File Interchange Format (.jpg, r/w)	Portable Network Graphics (.png, r/w)
;                  Truevision Targa (.tga, r/w)	Windows Bitmap (.bmp, r/w)
;                  Zsoft Paintbrush (.pcx, r/w)	Portable Pixmaps (.ppm, r/w)
;                  Adobe Photoshop (.psd, r)	Quake 2 textures (.wal, r)
;                  SGI truecolor textures (.rgb, r)
;                  @@End@@
; Related .......: _IrrRemoveImage, _IrrGetTexture
; Link ..........:
; Example .......: No
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveTexture
; Description ...: Removes the texture from memory freeing up the space it occupied.
; Syntax.........: _IrrRemoveTexture($h_Texture)
; Parameters ....: $h_Texture - Handle of an device dependend irrlicht texture object
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: You should ensure that the texture is not in use by materials assigned to nodes.
; Related .......: _IrrGetTexture, _IrrGetImage
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrRemoveTexture($h_Texture)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveTexture


; #FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveImage
; Description ...: Removes the image from memory freeing up the space it occupied.
; Syntax.........: _IrrRemoveImage($h_Image)
; Parameters ....: $h_Image - Handle of the irrlicht memory image object.
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: You should ensure that the image is not in use by other functions.
; Related .......: _IrrGetImage, _IrrGetTexture
; Link ..........:
; Example .......: No
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrColorKeyTexture
; Description ...: Copies any parts of the texture that are the same as the specified color into the textures alpha channel.
; Syntax.........: _IrrColorKeyTexture($h_Texture, $i_Red, $i_Green, $i_Blue)
; Parameters ....: $h_Texture - Handle of the texture object
;                  $i_Red -  Red value from 0 to 255
;                  $i_Green - Green value from 0 to 255
;                  $i_Blue - Blue value from 0 to 255
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: This can be used for special effects or to make these regions transparent.
; Related .......: None
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrColorKeyTexture($h_Texture, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrColorKeyTexture", "ptr", $h_Texture, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrColorKeyTexture


; #FUNCTION# =============================================================================================================
; Name...........: _IrrDraw2DImage
; Description ...: Draws the texture to the display at the supplied coordinates.
; Syntax.........: _IrrDraw2DImage($h_Image, $i_XPos, $i_YPos)
; Parameters ....: $h_Image - Handle to an irrlicht image object
;                  $i_XPos - X position on display from where drawing starts
;                  $i_YPos - Y position on display from where drawing starts
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......:
; Related .......: _IrrGetTexture, _IrrDraw2DImageElement
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrDraw2DImage($h_Image, $i_XPos, $i_YPos)
	DllCall($_irrDll, "none:cdecl", "IrrDraw2DImage", "ptr", $h_Image, "int", $i_XPos, "int", $i_YPos)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw2DImage


; #FUNCTION# =============================================================================================================
; Name...........: _IrrDraw2DImageElement
; Description ...: Draws given rectangular section from a texture to the display at the supplied coordinates
; Syntax.........: _IrrDraw2DImageElement($h_Texture, $i_XPos, $i_YPos, $i_SourceTopX, $i_SourceTopY, $i_SourceBottomX, $i_SourceBottomY, $i_UseAlpha)
; Parameters ....: $h_Image - Handle to an irrlicht image object
;                  $i_XPos - X position on display from where drawing starts
;                  $i_YPos - Y position on display from where drawing starts
;                  $i_SourceTopX - X top position of rectangle in the source texture
;                  $i_SourceTopY - Y top position of rectangle in the source texture
;                  $i_SourceBottomX - X bottom position of rectangle in the source texture
;                  $i_SourceBottomY - Y bottom position of rectangle in the source texture
;                  $i_UseAlpha - Whether or not to use the alpha channel should be one of the following values:
;                  |$IRR_IGNORE_ALPHA
;                  |$IRR_USE_ALPHA
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: Draws the texture to the display at the supplied co-ordinates, the image is copied from the specified rectangle in the source texture, this enables you to put many images onto a single texture.
;                  This function also supports the alpha channel when drawing the image to the display and can draw the image transparently.
; Related .......: _IrrGetTexture, _IrrColorKeyTexture, _IrrDraw2DImage, _IrrDraw2DImageElementStretch
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrDraw2DImageElement($h_Texture, $i_XPos, $i_YPos, $i_SourceTopX, $i_SourceTopY, $i_SourceBottomX, $i_SourceBottomY, $i_UseAlpha)
	DllCall($_irrDll, "none:cdecl", "IrrDraw2DImageElement", "ptr", $h_Texture, "int", $i_XPos, "int", $i_YPos, "int", $i_SourceTopX, "int", $i_SourceTopY, "int", $i_SourceBottomX, "int", $i_SourceBottomY, "int", $i_UseAlpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw2DImageElement

; #FUNCTION# =============================================================================================================
; Name...........: _IrrDraw2DImageElementStretch
; Description ...: Draws specified rectangle from Source texture sizing it to fit the specified Desination rectangle.
; Syntax.........: _IrrDraw2DImageElementStretch($h_Texture, $i_DestTopX, $i_DestTopY, $i_DestBottomX, $i_DestBottomY, $i_SourceTopX, $i_SourceTopY, $i_SourceBottomX, $i_SourceBottomY, $i_UseAlpha)
; Parameters ....: $h_Texture - Handle to an irrlicht image object
;                  $i_DestTopX - Top X Destination where the drawing will start.
;                  $i_DestTopY - Top Y Destination where the drawing will start.
;                  $i_DestBottomX - Bottom X Destination where the drawing will end.
;                  $i_DestBottomY - Bottom Y Destination where the drawing will end.
;                  $i_SourceTopX - X top position of rectangle in the source texture
;                  $i_SourceTopY - Y top position of rectangle in the source texture
;                  $i_SourceBottomX - X bottom position of rectangle in the source texture
;                  $i_SourceBottomY - Y bottom position of rectangle in the source texture
;                  $i_UseAlpha - Whether or not to use the alpha channel should be one of the following values:
;                  |$IRR_IGNORE_ALPHA
;                  |$IRR_USE_ALPHA
; Return values .: Success - True
;                  Failure - False
; Author ........: smashly
; Modified.......:
; Remarks .......: The image is copied from the specified rectangle in the source texture, this enables you to put many images onto a single texture.
;                  If the rectangles are different sizes this function will scale the images appropriately.
;                  This function also supports the alpha channel when drawing the image to the display and can draw the image transparently.
; Related .......: _IrrGetTexture, _IrrColorKeyTexture, _IrrDraw2DImageElement
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrDraw2DImageElementStretch($h_Texture, $i_DestTopX, $i_DestTopY, $i_DestBottomX, $i_DestBottomY, $i_SourceTopX, $i_SourceTopY, $i_SourceBottomX, $i_SourceBottomY, $i_UseAlpha)
    DllCall($_irrDll, "none:cdecl", "IrrDraw2DImageElementStretch", "ptr", $h_Texture, "int", $i_DestTopX, "int", $i_DestTopY, "int", $i_DestBottomX, "int", $i_DestBottomY, "int", $i_SourceTopX, "int", $i_SourceTopY, "int", $i_SourceBottomX, "int", $i_SourceBottomY, "int", $i_UseAlpha)
    Return SetError(@error, 0, @error = 0)
EndFunc   ;==>_IrrDraw2DImageElementStretch

; #FUNCTION# =============================================================================================================
; Name...........: _IrrGetFont
; Description ...: Loads a bitmap containing a bitmap font.
; Syntax.........: _IrrGetFont($s_Font)
; Parameters ....: $s_Font - Filename of the bitmap font file
; Return values .: Success - Handle of the irrlicht font texture object
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _Irr2DFontDraw
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrGetFont($s_Font)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetFont", "str", $s_Font)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetFont


; #FUNCTION# =============================================================================================================
; Name...........: _Irr2DFontDraw
; Description ...: Draws the text into the supplied rectangular area using the supplied font object.
; Syntax.........: _Irr2DFontDraw($h_Font, $s_Text, $i_XPos, $i_YPos, $i_BottomX, $i_BottomY)
; Parameters ....: $h_Font - Handle of an irrlicht font texture object
;                  $s_Text - Text string to display
;                  $i_XPos - X top position of rectangle for the text
;                  $i_YPos - Y top position of rectangle for the text
;                  $i_BottomX - X bottom position of rectangle for the text
;                  $i_BottomY - Y bottom position of rectangle for the text
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrGetFont
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Irr2DFontDraw($h_Font, $s_Text, $i_XPos, $i_YPos, $i_BottomX, $i_BottomY)
	DllCall($_irrDll, "none:cdecl", "Irr2DFontDraw", "ptr", $h_Font, "wstr", $s_Text, "int", $i_XPos, "int", $i_YPos, "int", $i_BottomX, "int", $i_BottomY)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_Irr2DFontDraw


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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

; #FUNCTION# =============================================================================================================
; Name...........: _IrrGetTextureInformation
; Description ...: Get information on a texture. The width, height, pitch and color format is returned in an array.
; Syntax.........: _IrrGetTextureInformation($h_Texture)
; Parameters ....: $h_Texture - Handle to an irrlicht texture object
; Return values .: Success - 1D Array with the information
;                  |$Array[0] = Width of the texture
;                  |$Array[1] = Height of the texture
;                  |$Array[2] = Pitch of the texture
;                  |$Array[3] = Color Reference of the texture (e.g.: $ECF_A1R5G5B5, $ECF_R5G6B5, $ECF_R8G8B8, $ECF_A8R8G8B8)
;                  Failure - Empty Array and Sets @error to 1
; Author ........: smashly
; Modified.......:
; Remarks .......: This function cannot be used for image objects. For this, use _IrrGetImageInformation instead.
; Related .......: _IrrGetTexture, _IrrGetImageInformation
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrGetTextureInformation($h_Texture)
    Local $aResult, $aReturn[4]
    $aResult = DllCall($_irrDll, "none:cdecl", "IrrGetTextureInformation", "ptr", $h_Texture, "uint*", 0, "uint*", 0, "uint*", 0, "int*", 0)
    If @error Or UBound($aResult) <> 6 Then Return SetError(1, 0, $aReturn)
    For $i = 2 To 5
        $aReturn[$i - 2] = $aResult[$i]
    Next
    Return SetError(0, 0, $aReturn)
EndFunc   ;==>_IrrGetTextureInformation


; #FUNCTION# =============================================================================================================
; Name...........: _IrrGetImageInformation
; Description ...: Get information on an image. The width, height, pitch and color format is returned in an array.
; Syntax.........: _IrrGetImageInformation($h_Image)
; Parameters ....: $h_Texture - Handle to an irrlicht image object
; Return values .: Success - 1D Array with the information
;                  |$Array[0] = Width of the image
;                  |$Array[1] = Height of the image
;                  |$Array[2] = Pitch of the image
;                  |$Array[3] = Color Reference of the image (e.g.: $ECF_A1R5G5B5, $ECF_R5G6B5, $ECF_R8G8B8, $ECF_A8R8G8B8)
;                  Failure - Empty Array and Sets @error to 1
; Author ........: smashly
; Modified.......:
; Remarks .......: This function cannot be used for texture objects. For this, use _IrrGetTextureInformation instead.
; Related .......: _IrrGetImage, _IrrGetTextureInformation
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrGetImageInformation($h_Image)
    Local $aResult, $aReturn[4]
    $aResult = DllCall($_irrDll, "none:cdecl", "IrrGetImageInformation", "ptr", $h_Image, "uint*", 0, "uint*", 0, "uint*", 0, "int*", 0)
    If @error Or UBound($aResult) <> 6 Then Return SetError(1, 0, $aReturn)
    For $i = 2 To 5
        $aReturn[$i - 2] = $aResult[$i]
    Next
    Return SetError(0, 0, $aReturn)
EndFunc   ;==>_IrrGetImageInformation
