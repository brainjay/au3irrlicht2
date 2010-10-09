#include "au3Irrlicht2.au3"

_IrrStart()

local $particleSystem = _IrrAddParticleSystemToScene($IRR_NO_EMITTER, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, 6)

local $SmokeEmitter = __CreateParticleSettings( -7.0, 0, -7.0, 7.0, 1.0, 7.0, 0, 0.04, 0, 80, 100, _
												255, 255, 255, 255, 255, 255, _
												800, 2000, 15.0, 15.0, 15.0, 15.0, 15 )

_IrrAddParticleEmitter($particleSystem, $SmokeEmitter)

local $ParticleTexture = _IrrGetTexture( "./media/ParticleGrey.bmp" )
_IrrSetNodeMaterialTexture( $particleSystem, $ParticleTexture, 0 )
_IrrSetNodeMaterialFlag( $particleSystem, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType ( $particleSystem, $IRR_EMT_TRANSPARENT_ADD_COLOR )

local $nodeCamera = _IrrAddCamera( 80,0,0, 20,40,0 )

WHILE _IrrRunning()
    _IrrBeginScene( 0,0,50 )
    _IrrDrawScene()
	_IrrEndScene()
WEND

_IrrStop()
