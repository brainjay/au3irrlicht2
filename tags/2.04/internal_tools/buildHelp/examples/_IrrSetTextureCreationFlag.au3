#include <au3Irrlicht2.au3>
Global $hTexture, $aInfo

_IrrStart()

	; Set the Texture creation flag to load textures in 16 bit without alpha (R5G6B5 format)
	_IrrSetTextureCreationFlag( BitOR($ETCF_ALWAYS_16_BIT, $ETCF_NO_ALPHA_CHANNEL), $IRR_ON )

	; Load a texture
	$hTexture = _IrrGetTexture("./media/cross.bmp")

	; query some info about the loaded texture, index 3 of the returned array is Color Reference
	$aInfo = _IrrGetTextureInformation($hTexture)

	; show the color format in a string to see the Texture creation flag was set
	MsgBox(64, "Texture color format", _TextureFormatString($aInfo[3]))

_IrrStop()


Func _TextureFormatString($iValue)
    Local $sMsg
    Switch $iValue
        Case $ECF_R5G6B5
            $sMsg &= "R5G6B5 - 16 bit without alpha channel"
        Case $ECF_A1R5G5B5
            $sMsg &= "A1R5G5B5 - 16 bit with alpha channel"
        Case $ECF_R8G8B8
            $sMsg &= "R8G8B8 - 24 bit without alpha channel"
        Case $ECF_A8R8G8B8
            $sMsg &= "A8R8G8B8 - 32 bit with alpha channel"
        Case Else
            $sMsg &= "Unknown"
    EndSwitch
    Return $sMsg
EndFunc   ;==>_TextureFormatString
