; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 30 : Animated Water Effect
; This example creates an animated water effect that is applied to a flat
; hillplane object. The effect alters the surface of the mesh in a manner that
; simulates waves on water
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "..\au3Irrlicht2.au3"
opt("MustDeclareVars", True)
HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit

; ////////////////////////////////////////////////////////////////////////////
; global variables

; irrlicht objects
DIM $Terrain ; irr_terrain
DIM $TerrainNode ; irr_node
DIM $TerrainTexture ; irr_texture
DIM $Camera ; irr_camera
DIM $CameraNode ; irr_node
DIM $WaterMesh ; irr_mesh
DIM $WaterNode ; irr_node


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 30: Animated Water Effect" )


; add a hill plane mesh to the mesh pool
$WaterMesh = _IrrAddHillPlaneMesh( "HillPlane", 8.0, 8.0, 32, 32,  0,  0.0, 4, 3, 8, 8 )

; add a scene node for rendering an animated water surface mesh
$WaterNode = _IrrAddWaterSurfaceSceneNode( $WaterMesh )

; we load two textures in to apply to the terrain node
$TerrainTexture = _IrrGetTexture( "../media/water.png" )

; the first texture is a color texture that is applied across the entire
; surface of the map. this needs to be a fairly high resoloution ; the map is
; very large now
_IrrSetNodeMaterialTexture( $WaterNode, $TerrainTexture, 0 )

; finally we apply some material texuring effects to the node
; the water is self illuminating
_IrrSetNodeMaterialFlag( $WaterNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; the sphere map material type gives a shiny effect appropriate for a
; water surface
_IrrSetNodeMaterialType ( $WaterNode, $IRR_EMT_SPHERE_MAP )

; we add a first person perspective camera to the scene so you can look about
; and move it into the center of the map
$Camera = _IrrAddFPSCamera()
$CameraNode = $Camera
_IrrSetNodePosition( $CameraNode, 0, 25, 0 )

; we also hide the mouse pointer to see the view better
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running

WHILE _IrrRunning()
	; begin the scene, erasing the canvas with sky-blue before rendering
	_IrrBeginScene( 240, 255, 255 )

	; draw the scene
	_IrrDrawScene()

	; end drawing the scene and render it
	_IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
