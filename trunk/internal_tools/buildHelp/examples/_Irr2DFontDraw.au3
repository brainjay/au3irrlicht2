#include "au3Irrlicht2.au3"
_IrrStart()
local $bitmapFont = _IrrGetFont ( "./media/fonthaettenschweiler.bmp" )

WHILE _IrrRunning()
    _IrrBeginScene( 0,0,0 )
    _Irr2DFontDraw ( $BitmapFont, "@! Example Text with 'German Umlauts': ÄäÖöÜü !@", 120, 80, 250, 96 )
    _IrrEndScene()
WEND

_IrrStop()
