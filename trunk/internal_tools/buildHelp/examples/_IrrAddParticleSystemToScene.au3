#include "au3Irrlicht2.au3"

_IrrStart()

; add particle system with default emitter to the irrlicht scene manager and scale it for more depth
local $particleSystem = _IrrAddParticleSystemToScene($IRR_DEFAULT_EMITTER, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, 6)
; load a grey smoke like image for the particle
local $ParticleTexture = _IrrGetTexture( "./media/ParticleGrey.bmp" )

; apply the texture to the particles system to be drawn across each particles surface
_IrrSetNodeMaterialTexture( $particleSystem, $ParticleTexture, 0 )
; particle system is not affected by lighting so make it self illuminating
_IrrSetNodeMaterialFlag( $particleSystem, $IRR_EMF_LIGHTING, $IRR_OFF )
; don't draw black parts of the particle texture:
_IrrSetNodeMaterialType ( $particleSystem, $IRR_EMT_TRANSPARENT_ADD_COLOR )

local $nodeCamera = _IrrAddCamera( 80,0,0, 20,40,0 )

WHILE _IrrRunning()
    _IrrBeginScene( 0,0,50 )
    _IrrDrawScene()
	_IrrEndScene()
WEND

_IrrStop()
