#include "au3Irrlicht2.au3"

_IrrStart()

; add particle system with default emitter to the irrlicht scene manager
local $particleSystem = _IrrAddParticleSystemToScene($IRR_DEFAULT_EMITTER)
local $ParticleTexture = _IrrGetTexture( "./media/ParticleGrey.bmp" )

; setup this affector to detract particles downwards
_IrrAddParticleAttractionAffector ( $particleSystem, 0,100.0,0.0, 80.0, $IRR_REPEL )

_IrrSetNodeMaterialTexture( $particleSystem, $ParticleTexture, 0 )
_IrrSetNodeMaterialFlag( $particleSystem, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType ( $particleSystem, $IRR_EMT_TRANSPARENT_ADD_COLOR )

local $nodeCamera = _IrrAddCamera( 80,0,0, 0,-20,0)

WHILE _IrrRunning()
    _IrrBeginScene( 0,0,50 )
    _IrrDrawScene()
	_IrrEndScene()
WEND

_IrrStop()
