; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 25: Particles emitted from a node
; This example emits particles from the verticies on an animated node
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
DIM $SmokeParticles ; irr_model
DIM $SmokeEmitter ; irr_particle_emitter
DIM $ParticlesNode ; irr_node
DIM $TestNode ; irr_node
DIM $Camera ; irr_camera
DIM $MD2Mesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera
; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 25: Particles emitted from a node" )

; load a mesh this acts ; a blue print for the model
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing the scene nodes
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )

; add the mesh to the scene ; a new node, the node is an instance of the
; mesh object supplied here
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; apply a material to the node to give its surface color
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; switch off lighting effects on this model, ; there are no lights in this
; scene the model would otherwise render pule black
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; play an animation sequence embeded in the mesh. MD2 models have a group of
; preset animations for various poses and actions. this animation sequence is
; the character standing idle
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

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
; direction the particles can take - values here make your particles billow outward
$SmokeEmitter = __CreateParticleSettings( _
					0, 0, 0, _			; min_box_x / min_box_y / min_box_z
					0, 0, 0, _			; max_box_x / max_box_y / max_box_z
					0, 0.04, 0, _		; direction_x / direction_y / direction_z
					80, 100, _			; min_paritlcles_per_second / max_paritlcles_per_second
					255, 255, 255, _	; min_start_color_red / min_start_color_green / min_start_color_blue
					255, 255, 255, _	; max_start_color_red / max_start_color_green / max_start_color_blue
					800, 2000, _		; min_lifetime / max_lifetime
					5.0, 5.0, _			; min_start_sizeX / min_start_sizeY
					15.0, 15.0, _		; max_start_sizeX / max_start_sizeY
					15 )				; max_angle_degrees

; finally we add this particle emitting object to the particle system
_IrrAddAnimatedMeshSceneNodeEmitter ( $SmokeParticles, $SceneNode, true, 0.25, False, $SmokeEmitter )

; load a grey smoke like image for the particle
$ParticleTexture = _IrrGetTexture( "../media/ParticleGrey.bmp" )

; apply the texture to the particles system, this texture will now be drawn
; across each particles surface
_IrrSetNodeMaterialTexture( $SmokeParticles, $ParticleTexture, 0 )

; out particle system is not affected by lighting so we make it self
; illuminating
_IrrSetNodeMaterialFlag( $SmokeParticles, $IRR_EMF_LIGHTING, $IRR_OFF )

; an affector is a mechanism that alters the particles over time, the fade out
; affector gradually fades the particles out so they are invisible when they
; are deleted this lets them smoothly vanish instead of poping out of existence
_IrrAddFadeOutParticleAffector( $SmokeParticles, 2000, 16,8,0 )

; another affector is the attractor that can be used to attract or repel
; particles to a particular point
_IrrAddParticleAttractionAffector ( $SmokeParticles, 10.0,0.0,0.0, 20.0, $IRR_REPEL )

; ; the particle texture has black borders, each overlapping particle would
; draw this blackness ontop of one another ; a sharp egde they would look like
; a lot of solid squares instead of the transparent gas effect we are trying
; to created. so here we change the material type of the node - instead of
; drawing the node solidly onto the screen it is added onto the colour
; underneath itself so black doesnt change the color and white would build up
; top of the existing color until it completly saturates the pixel
_IrrSetNodeMaterialType ( $SmokeParticles, $IRR_EMT_TRANSPARENT_VERTEX_ALPHA )

; add a camera into the scene, the first co-ordinates represents the 3D
; location of our view point into the scene the second co-ordinates specify the
; target point that the camera is looking at
$OurCamera = _IrrAddCamera( 50,0,0, 0,0,0 )

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; clear the canvas to black to show the particles up better
    _IrrBeginScene( 0,0,25 )

    ; draw the scene
    _IrrDrawScene()

	; end drawing the scene and display it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
