#include "au3Irrlicht2.au3"

HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc

Global $hFlare, $hTexture

_IrrStart()

$hTexture = _IrrGetTexture( "./media/flares.jpg" )
$hFlare = _IrrAddLensFlare($hTexture)
_IrrSetNodePosition($hFlare, 300,100,1000 )
_IrrSetFlareScale($hFlare, 4.0, 1.5)

_IrrAddFPSCamera()
_IrrHideMouse()

While _IrrRunning()
    _IrrBeginScene( 180, 225, 255 )
    _IrrDrawScene()
    _IrrEndScene()
WEnd

_IrrStop()