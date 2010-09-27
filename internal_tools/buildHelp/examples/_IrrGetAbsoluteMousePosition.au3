#include <au3Irrlicht2.au3>

Global $aGAMP

_IrrStart()

While _IrrRunning()

    $aGAMP = _IrrGetAbsoluteMousePosition()
    _IrrSetWindowCaption("Absolute Mouse Poition - X: " & $aGAMP[0] & " Y: " & $aGAMP[1])

WEnd

_IrrStop()
