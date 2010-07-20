; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 36 : Simple materials
; This example sets simple material properties to alter surface lighting and
; then dynamically alters the properties of those materials ; the program runs
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
DIM $Camera ; irr_camera
DIM $EmittedLevel = 0
DIM $EmittedDirection = 1

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; set the window caption
_IrrSetWindowCaption( "Example 36: Simple Materials" )

; create some simple scene objects
$SphereNode = _IrrAddSphereSceneNode ( 30.0, 64 )

; add a simple point light
$Light = _IrrAddLight( $IRR_NO_PARENT, -100,100,100, 0.25,0.25,0.25, 600.0 )

; set the ambient light level across the entire scene
_IrrSetAmbientLight( 0.1,0.1,0.1 )

; get the nodes material
$Material = _IrrGetMaterial( $SphereNode, 0 )

; set the surface property effected by the vertex color. ; we want the material
; to define the color of reflected ambient, diffuse and specular light we set
; this to none. By default on a node it is ECM_DIFFUSE meaning that setting the
; diffuse color has no effect because the diffuse color is taken from the color
; of the verticies, something we do not want in this example.
_IrrMaterialVertexColorAffects( $Material, $ECM_NONE )

; make the sphere have a shiny red highlight, it will also reflect the diffuse
; lighting making it appear yellow
_IrrMaterialSetShininess ( $Material, 25.0 )
_IrrMaterialSetSpecularColor( $Material, 0,255,0,0 )

; set the diffuse color of the object to green
_IrrMaterialSetDiffuseColor ( $Material, 0,0,255,0 )

; set the color of ambient light reflected by the object to blue
_IrrMaterialSetAmbientColor ( $Material, 0,0,0,255 )

; add a camera to the scene to view the objects
$Camera = _IrrAddCamera( 0,0,60, 0,0,0 )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
local $frameTime = TimerInit()

WHILE _IrrRunning()
    ; every 6th of a second mark a frame ; being passed
 	if TimerDiff($frameTime) > 16.7 then
        ; begin the scene, erasing the canvas with sky-blue before rendering
        _IrrBeginScene( 0, 0, 0 )

        ; bring the emitted lighting from the object up and down
        _IrrMaterialSetEmissiveColor ( $Material, 0, $EmittedLevel, $EmittedLevel, $EmittedLevel )

        $EmittedLevel += $EmittedDirection
        if $EmittedLevel = 255 then
            $EmittedDirection = -1
        else
            if $EmittedLevel = 0 then
                $EmittedDirection = 1
            endif
        endif
        ; draw the scene
        _IrrDrawScene()

        ; end drawing the scene and render it
        _IrrEndScene()

        $frameTime = TimerInit()
    Endif
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
