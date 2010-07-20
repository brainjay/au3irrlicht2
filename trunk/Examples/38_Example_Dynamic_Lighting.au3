; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 38 : Dynamic Lighting
; This example changes the properties of the lighting dynamically ; the
; program runs
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "au3Irrlicht2.au3"
opt("MustDeclareVars", True)
HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit

; ////////////////////////////////////////////////////////////////////////////
; global variables

; irrlicht objects
DIM $SphereNode ; irr_node
DIM $NodeTexture ; irr_texture
DIM $Material ; irr_material
DIM $Light ; irr_node
DIM $LightAmbient ; irr_node
DIM $Camera ; irr_camera
DIM $attenuation = 1.0
DIM $red_diffuse = 1.0
DIM $green_diffuse = 0.0
DIM $blue_diffuse = 0.5
DIM $ambient = 0.0

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 38: Dynamic Lighting" )

; create some simple scene objects
$SphereNode = _IrrAddSphereSceneNode (30.0, 64 )

; add a simple point light
$Light = _IrrAddLight( $IRR_NO_PARENT, -100,100,100, 1.0,1.0,1.0, 600.0 )

; add a black light used to introduce ambient lighting
$LightAmbient = _IrrAddLight( $IRR_NO_PARENT, 0,0,0, 0.0,0.0,0.0, 600.0 )

; add a camera to the scene to view the objects
$Camera = _IrrAddCamera( 0,0,75, 0,0,0 )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
dim $frameTime = TimerInit()
WHILE _IrrRunning()
    ; is it time for another frame
    if  TimerDiff($frameTime) > 16.7 then
        ; calculate the time the next frame starts
        $frameTime = TimerInit()

		; begin the scene, erasing the canvas with sky-blue before rendering
		_IrrBeginScene( 0, 0, 0 )

		; increase the constant attenuation of the lighting over time making it
		; gradulally dimmer
		_IrrSetLightAttenuation ( $Light, $attenuation, 0.0, 0.0 )
		$attenuation += 0.0025

		; change the diffuse color emitted by the light over time
		_IrrSetLightDiffuseColor ( $Light, $red_diffuse, $green_diffuse, $blue_diffuse )
		if $red_diffuse > 0.0 then $red_diffuse -= 0.001
		if $green_diffuse < 1.0 then $green_diffuse += 0.001
		if $blue_diffuse < 1.0 then $blue_diffuse += 0.001

		; slowly introduce ambient light
		_IrrSetLightAmbientColor( $LightAmbient, $ambient, $ambient, $ambient )
		if $ambient < 0.1 then $ambient += 0.00001

		; draw the scene
		_IrrDrawScene()

		; end drawing the scene and render it
		_IrrEndScene()
	EndIf
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
