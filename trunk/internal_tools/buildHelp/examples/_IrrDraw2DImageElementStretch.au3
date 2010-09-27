#include <au3Irrlicht2.au3>

_IrrStart()

Local $hLogo = _IrrGetTexture("./media/Cross.bmp")

; Use White as Alpha color
_IrrColorKeyTexture($hLogo, 255, 255, 255)

While _IrrRunning()

    _IrrBeginScene(255, 255, 0)

    ; Draw Original texture just to see what the unchanged texture looks like.
    _IrrDraw2DImage($hLogo, 0, 0)

    ;Draw texture smaller using Alpha beside the original.
    _IrrDraw2DImageElementStretch($hLogo, 128, 0, 192, 64, 0, 0, 128, 128, $IRR_USE_ALPHA)

    ;Draw texture Larger using Alpha beside the previous smaller texture.
    _IrrDraw2DImageElementStretch($hLogo, 192, 0, 448, 256, 0, 0, 128, 128, $IRR_USE_ALPHA)

    ;Draw beside Larger texture quarter of source texture to new larger destination not using Alpha.
    _IrrDraw2DImageElementStretch($hLogo, 448, 0, 800, 352, 0, 0, 64, 64, $IRR_IGNORE_ALPHA)

    _IrrEndScene()
WEnd

_IrrStop()
