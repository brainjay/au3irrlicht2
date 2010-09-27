#include <au3Irrlicht2.au3>

_IrrStart()

Local $hLogo = _IrrGetImage("./media/Cross.bmp")

Local $aInfo = _IrrGetImageInformation($hLogo)
If Not @error Then MsgBox(64, "Image Information", "Width: " & $aInfo[0] & @LF & _
						  "Height: " & $aInfo[1] & @LF & "Pitch: " & $aInfo[2] & @LF & _
						  "Color Format: " & $aInfo[3])
_IrrStop()
