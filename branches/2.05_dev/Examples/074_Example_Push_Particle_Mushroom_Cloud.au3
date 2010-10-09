; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 74: Push Particle Mushroom Cloud
; This example demonstrates the use of the push particle affector to create a
; mushroom cloud like effect.
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
DIM $fade ; single
DIM $smoke_emitter ; irr_emitter
DIM $FadeOut ; irr_affector
DIM $affectorA ; irr_affector
DIM $affectorB ; irr_affector
DIM $CenterY ; single
DIM $TimeSecs ; integer = 0
DIM $TimeMs ; integer

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 74: Mushroom cloud with the Push Affector" )

; this adds a small test node to the scene, a test node is a simple cube, that
; you can move and texture like any other object however there is another
; reason for adding this node. the particle system needs another node rendered
; onto the display to allow it to display material effects. this may be an issue
; with the wrapper that needs investigation
$TestNode = _IrrAddTestSceneNode()
$MeshTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )
_IrrSetNodeMaterialTexture( $TestNode, $MeshTexture, 0 )
_IrrSetNodeMaterialFlag( $TestNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; set up a particle system that generates a stream of smoke please see example
; Seven for detailed information
$SmokeParticles = _IrrAddParticleSystemToScene( $IRR_NO_EMITTER )
$SmokeEmitter = __CreateParticleSettings( _
					-7.0, 0, -7.0, _	; min_box_x / min_box_y / min_box_z
					7.0, 7.0, 7.0, _	; max_box_x / max_box_y / max_box_z
					0, 0, 0, _		; direction_x / direction_y / direction_z
					10, 10, _			; min_paritlcles_per_second / max_paritlcles_per_second
					255, 255, 255, _	; min_start_color_red / min_start_color_green / min_start_color_blue
					255, 255, 255, _	; max_start_color_red / max_start_color_green / max_start_color_blue
					25000, 25000, _		; min_lifetime / max_lifetime
					15.0, 15.0, _		; min_start_sizeX / min_start_sizeY
					15.0, 15.0, _		; max_start_sizeX / max_start_sizeY
					15 )				; max_angle_degrees

; finally we add this particle emitting object to the particle system, usually
; it would be a good idea to add a fade out affector here but ; the smoke
; particles are going to be pushed back into the column of smoke when they
; die we wont be able to see them anyway and ; we have a lot of particles the
; less affectors we can get away with the more CPU we will have left
$smoke_emitter = _IrrAddParticleEmitter( $SmokeParticles, $SmokeEmitter )

; push the particles upward for 100 units above the affector. the push is
; strongest at the center of the effect and diminishes to zero when its 100
; units away, the radial effect is OFF so all particles are pushed in the same
; direction with the same force ; if they were affected by gravity.
; this affector also has a column width, this limits the effect into a vertical
; column, effectivly making this push affector like a cylinder 100 units high
; and 20 units in radius, similar to a fountain
_IrrAddParticlePushAffector ( _
		$SmokeParticles, _
        0, 0, 0, _
        0, 20, 0, _
        100.0, 0.0, 20.0, _
        $IRR_OFF )

; this affector pushes from above the particles it has a weaker downward force,
; only 8 units, but it also pushes the particles outwards, the radial effect is
; ON so the particles will be pushed away from the center of the effect, so as
; the particles get higher they will get closer to this effect and will be
; pushed outwards more and more.
; ; the affector above is a column the particles will get shoved out of the
; effect of the column and the small downward force will begin to take over and
;  slowly push the particles down
$affectorA = _IrrAddParticlePushAffector ( _
		$SmokeParticles, _
        0, 100, 0, _
        60, 8, 60, _
        75, 0.0, 0.0, _
        $IRR_ON )

; this final affector simulates the suction of the vaccum left by the rising
; smoke pushing the particles back into the column, it has a small inward force,
; it is a radial effect so it draws particles in towards its center.
; unlike the other affectors this has a near distance, the near distance acts
; just like the far distance, ; particles get closer to the near distance the
; effect gets weaker so in this example the force is zero at 50.0 and 15.0 units
; and strongest in the middle of the numbers at 32.5 units.
; this 'ring; like affector will push the particles back into the column but
; wont squash them to a point at its center and they will also have very little
; effect on the column of particles that rise through its center at the start
$affectorB = _IrrAddParticlePushAffector ( _
		$SmokeParticles, _
        0, 50, 0, _
        -8, 0, -8, _
        50.0, 15.0, 0.0, _
        $IRR_ON )

; load a grey smoke like image for the particle
$ParticleTexture = _IrrGetTexture( "../media/ParticleGrey.tga" )

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
_IrrSetNodeMaterialType ( $SmokeParticles, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL )

; add a fixed position camera to the scene so we can view the particle system.
; the first three parameters are the cameras location, the second three
; parameters are where the camera is looking at
$Camera = _IrrAddCamera( 80,40,0, 0,40,0 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running and less than 30 seconds has
; elapsed
WHILE _IrrRunning() AND $TimeSecs < 30
    ; clear the canvas to black to show the particles up better
    _IrrBeginScene( 0,0,25 )

    ; calculate some values based on the time in milliseconds (1/1000th second)
    $TimeMs = _IrrGetTime()

    ; this is the height of the base of the mushroom cloud, it is based on the
    ; center of the suction effect. it is 25 units plus 0.003 units for every
    ; milisecond that passes
    $CenterY = 25.0 + 0.003 * $TimeMs

    ; this is the number of seconds that have elapsed
    $TimeSecs = $TimeMs / 1000

    ; if the number of elapsed seconds is less than 21
    if $TimeSecs < 21 then
        ; slowly reduce the rate that the smoke particles are emitted, we start
        ; at the maxium rate of 20 a second and ; time passes and the number
        ; of elapsed seconds passes less and less particles are emitted
        _IrrSetParticleEmitterMinParticlesPerSecond( $smoke_emitter, 20 - $TimeSecs )
        _IrrSetParticleEmitterMaxParticlesPerSecond( $smoke_emitter, 20 - $TimeSecs )
    endif

    ; here we set the center of the suction effect and the center of the push
    ; outwards effect, the center rises slowly over time and this makes the
    ; top of the mushroom effect rise slowly too, 50 units is kept between the
    ; two effects this is basically the height of the mushrooms 'cap'
    _IrrSetCenterOfEffect( $affectorA, 0, $CenterY + 50.0, 0 )
    _IrrSetCenterOfEffect( $affectorB, 0, $CenterY, 0 )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and display it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
