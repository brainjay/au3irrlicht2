; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 27: Dynamic Particle System Effects
; This example displays a particle system and then dynamically changes
; properties of the effect the animation plays
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "../au3Irrlicht2.au3"
opt("MustDeclareVars", True)
HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit


; ////////////////////////////////////////////////////////////////////////////
; global variables

; irrlicht objects
DIM $ParticleTexture ; irr_texture
DIM $MeshTexture
DIM $SmokeParticles ; irr_model
DIM $SmokeEmitter ; irr_particle_emitter
DIM $ParticlesNode ; irr_node
DIM $TestNode ; irr_node
DIM $Camera ; irr_camera
DIM $Affector ; irr_affector
DIM $GravityAffector ; irr_affector
DIM $fade ; single
DIM $frame ; integer
DIM $min_red ; uinteger
DIM $min_blue ; uinteger
DIM $max_red ; uinteger
DIM $max_blue ; uinteger
DIM $emitter ; irr_emitter
DIM $burn ; integer
DIM $gravity ; single

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 27: Dynamic Particle System Effects" )

; this adds a small test node to the scene, a test node is a simple cube, that
; you can move and texture like any other object however there is another
; reason for adding this node. the particle system needs another node rendered
; onto the display to allow it to display material effects. this may be an issue
; with the wrapper that needs investigation
$TestNode = _IrrAddTestSceneNode()
$MeshTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )
_IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )


; add a particle system to the irrlicht scene manager, a default emitter is not
; created ; we will define out own. the particle system is blank at the moment
$SmokeParticles = _IrrAddParticleSystemToScene( $IRR_NO_EMITTER )

; here we define the particle emitter, a particle emitter is a mechanism that
; creates the particles over time and destroys them when their lifetime runs
; out. The parameters include: a box that defines the volume in which particles
; are created - the larger the box the more diffuse the particle cloud, a
; direction that determines where the particles drift off too, a range that
; defines hoe many particles will be generated each second, a colour range that
; determines a random tint that is applied to the particles, a range that
; determines the lifespan of the particles - the large the values the longer
; and larger (and slower) your particle cloud will be and finally an angle that
; defines a cone around your direction that is the maximum deviation from the
; direction the particles can take - values here make your particles billow
; outward
$SmokeEmitter = __CreateParticleSettings( _
					-7.0, 0, -7.0, _	; min_box_x / min_box_y / min_box_z
					7.0, 1.0, 7.0, _	; max_box_x / max_box_y / max_box_z
					0, 0.06, 0, _		; direction_x / direction_y / direction_z
					80, 100, _			; min_paritlcles_per_second / max_paritlcles_per_second
					255, 192, 128, _	; min_start_color_red / min_start_color_green / min_start_color_blue
					255, 192, 192, _	; max_start_color_red / max_start_color_green / max_start_color_blue
					800, 2000, _		; min_lifetime / max_lifetime
					15.0, 15.0, _		; min_start_sizeX / min_start_sizeY
					15.0, 15.0, _		; max_start_sizeX / max_start_sizeY
					15 )				; max_angle_degrees

; finally we add this particle emitting object to the particle system
$emitter = _IrrAddParticleEmitter( $SmokeParticles, $SmokeEmitter )

; an affector is a mechanism that alters the particles over time, the fade out
; affector gradually fades the particles out so they are invisible when they
; are deleted this lets them smoothly vanish instead of poping out of existence
$Affector = _IrrAddFadeOutParticleAffector( $SmokeParticles, 1000, 16,8,0 )

; another affector is the gravity affector, this adds a small amount of velocity
; to the particles each frame, although its called a gravity affector it can
; be used to push the particles in any direction so you can have drifting smoke
; bubbling fountains, etc ...
$GravityAffector = _IrrAddGravityParticleAffector ( $SmokeParticles, 0.0, 0.1, 0.0 )

; load a grey smoke like image for the particle
$ParticleTexture = _IrrGetTexture( "../media/ParticleGrey.bmp" )

; apply the texture to the particles system, this texture will now be drawn
; across each particles surface
_IrrSetNodeMaterialTexture( $SmokeParticles, $ParticleTexture, 0 )

; out particle system is not affected by lighting so we make it self
; illuminating
_IrrSetNodeMaterialFlag( $SmokeParticles, $IRR_EMF_LIGHTING, $IRR_OFF )

; ; the particle texture has black borders, each overlapping particle would
; draw this blackness ontop of one another ; a sharp egde they would look like
; a lot of solid squares instead of the transparent gas effect we are trying
; to created. so here we change the material type of the node - instead of
; drawing the node solidly onto the screen it is added onto the colour
; underneath itself so black doesnt change the color and white would build up
; top of the existing color until it completly saturates the pixel
_IrrSetNodeMaterialType ( $SmokeParticles, $IRR_EMT_TRANSPARENT_VERTEX_ALPHA  )

; add a fixed position camera to the scene so we can view the particle system.
; the first three parameters are the cameras location, the second three
; parameters are where the camera is looking at
$Camera = _IrrAddCamera( 80,40,0, 0,40,0 )

; Initalise properties controlling the dynamic effects
$fade = 1000.0
$frame = 0
$min_red = 255
$min_blue = 0
$max_red = 255
$max_blue = 192
$burn = 1
$gravity = 0.02

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
dim $timer = TimerInit()
WHILE _IrrRunning()
    ; every 60th of a second mark a frame being passed
    if TimerDiff($timer) > 16.7 then
		$timer = TimerInit()
        ; clear the canvas to black to show the particles up better
        _IrrBeginScene( 0,0,25 )

        ; count the frames
        $frame += 1

        ; only perform this operation once every ten frames
        if $frame = 10 then
            ; reset our frame counter
            $frame = 0

            ; if we are burning
            if $burn = 1 then
                ; make the flame more intense and blue
                $min_red -= 1
                $min_blue += 1
                $max_red -= 1
                $max_blue += 1
                $fade += 100.0
                $gravity += 0.001

                ; change the color range
                _IrrSetParticleEmitterMinStartColor ( $emitter, $min_red, 192, $min_blue )
                _IrrSetParticleEmitterMaxStartColor ( $emitter, $max_red, 192, $max_blue )

                ; change the time over which the particles fade out
                _IrrSetFadeOutParticleAffectorTime( $Affector, $fade )

                ; change the strength of the gravity effect
                _IrrSetGravityParticleAffectorDirection ( $GravityAffector, 0.0, 0.1, $gravity )

                ; if we are at maxiumum values then stop burning
                if $max_blue > 254 then $burn = 0
            else
                ; we are not burning, make the flame smaller and more red
                $min_red += 1
                $min_blue -= 1
                $max_red += 1
                $max_blue -= 1
                $fade -= 100.0
                $gravity -= 0.001

                ; change the time over which the particles fade out
                _IrrSetParticleEmitterMinStartColor ( $emitter, $min_red, 192, $min_blue )
                _IrrSetParticleEmitterMaxStartColor ( $emitter, $max_red, 192, $max_blue )

                ; change the strength of the gravity effect
                _IrrSetFadeOutParticleAffectorTime( $Affector, $fade )

                ; change the strength of the gravity effect
                _IrrSetGravityParticleAffectorDirection ( $GravityAffector, 0.0, 0.1, $gravity )

                ; if we are at minimum values then start burning again
                if $max_blue < 193 then $burn = 1
            endif
        endif


        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and display it
        _IrrEndScene()

    endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
