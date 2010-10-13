#include "au3Irrlicht2.au3"

Global $hSphere, $hTexture, $sGSbmp = "./media/simplesphere.bmp"

_IrrStart($IRR_EDT_OPENGL, 800, 600)

$hSphere = _IrrAddSphericalTerrain($sGSbmp, $sGSbmp, $sGSbmp, $sGSbmp, $sGSbmp, $sGSbmp, 0, 0, 0, -70)

$hTexture = _IrrGetTexture("./media/terrain-texture.jpg")
_IrrSetSphericalTerrainTexture($hSphere, $hTexture, $hTexture, $hTexture, $hTexture, $hTexture, $hTexture)

_IrrSetAmbientLight( 1, 1, 1)
_IrrAddCamera(0, 500, 0, 0, 0, 0)

While _IrrRunning()
    _IrrBeginScene(0, 0, 0)
    _IrrDrawScene()
    _IrrEndScene()
WEnd

_IrrStop()