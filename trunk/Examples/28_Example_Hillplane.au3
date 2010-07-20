; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 28 : Hillplane
; This example creates a terrain from a hillplane object that is a generated
; mesh grid with an irregular surface.
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
DIM $Terrain ; irr_terrain
DIM $TerrainNode ; irr_node
DIM $TerrainTexture0 ; irr_texture
DIM $TerrainTexture1 ; irr_texture
DIM $Camera ; irr_camera
DIM $CameraNode ; irr_node
DIM $Hillmesh ; irr_mesh
DIM $HillNode ; irr_node


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 28: Hill Planes" )


; add a hill plane mesh to the mesh pool
$HillMesh = _IrrAddHillPlaneMesh( _
        "HillPlane", _                  ; Mesh name
        8.0, 8.0, _                     ; tile size X, Y
        32, 32,  _                      ; tile count X, Y
        0, _                ; pointer to a materials
        6.0, _                          ; Height of the hills
        4, 3, _                         ; number of hills X, Y
        1, 1 )                          ; texture repeat count X, Y

; create an object from the mesh that has been generated
$HillNode = _IrrAddMeshToScene( $HillMesh )

; we load two textures in to apply to the hillplane node
$TerrainTexture0 = _IrrGetTexture( "./media/terrain-texture.jpg" )
$TerrainTexture1 = _IrrGetTexture( "./media/detailmap3.jpg" )

; the first texture is a color texture that is applied across the entire
; surface of the map. this needs to be a fairly high resoloution ; the map is
; very large now
_IrrSetNodeMaterialTexture( $HillNode, $TerrainTexture0, 0 )

; the second texture is tiled many times across the map this adds fine detail
; and structure to the first enlarged terain color
_IrrSetNodeMaterialTexture( $HillNode, $TerrainTexture1, 1 )

; finally we apply some material texuring effects to the node
; the terrain is self illuminating
_IrrSetNodeMaterialFlag( $HillNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; the material type is detail type. this type applies the first texture across
; the entire node and then scales and applies the second texture across the node
; there are many different material types you can set, these can be found in the
; .bi definition file, experiment with them
_IrrSetNodeMaterialType ( $HillNode, $IRR_EMT_DETAIL_MAP )

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
