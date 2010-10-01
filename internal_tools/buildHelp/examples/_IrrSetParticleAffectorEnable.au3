#include "au3Irrlicht2.au3"

_IrrStart()

; add particle system with default emitter to the irrlicht scene manager
local $particleSystem = _IrrAddParticleSystemToScene($IRR_DEFAULT_EMITTER)
local $ParticleTexture = _IrrGetTexture( "./media/ParticleGrey.bmp" )

local $affector = _IrrAddRotationAffector ( $particleSystem, 50.0, -120.0, 50.0, 30.0,0.0,0.0 )

_IrrSetNodeMaterialTexture( $particleSystem, $ParticleTexture, 0 )
_IrrSetNodeMaterialFlag( $particleSystem, $IRR_EMF_LIGHTING, $IRR_OFF )
_IrrSetNodeMaterialType ( $particleSystem, $IRR_EMT_TRANSPARENT_ADD_COLOR )

local $nodeCamera = _IrrAddCamera( 80,0,0, 0,50,50)

local $time = TimerInit()
local $enabled = true
WHILE _IrrRunning()

	; enable/disable affector every 2 seconds:
	if TimerDiff($time) > 2000 then
		$enabled = NOT $enabled
		_IrrSetParticleAffectorEnable($affector, $enabled)
		$time = TimerInit()
	EndIf

    _IrrBeginScene( 0,0,50 )
    _IrrDrawScene()
	_IrrEndScene()

WEND

_IrrStop()
