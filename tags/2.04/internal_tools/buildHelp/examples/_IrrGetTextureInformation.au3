#include <au3Irrlicht2.au3>

_IrrStart()

Local $hLogo = _IrrGetTexture("./media/Cross.bmp")

Local $aInfo = _IrrGetTextureInformation($hLogo)
If Not @error Then MsgBox(64, "Texture Information", "Width: " & $aInfo[0] & @LF & _
						  "Height: " & $aInfo[1] & @LF & "Pitch: " & $aInfo[2] & @LF & _
						  "Color Format: " & $aInfo[3])
_IrrStop()
