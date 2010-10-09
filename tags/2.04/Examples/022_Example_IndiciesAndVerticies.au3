; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 22 : Indices and Vertices
; This example loads a simple mesh from a static direct x object it then
; gets the list of indices and vertices for the object and manipulates them
; before writing them back to the mesh. This can be used for getting mesh data
; for use with other libraries like 'Newton; or for directly manipulating the
; object
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
DIM $DirectXMesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $i ; integer
CONST $SCRIPTTITLE = "Example 22: Indices and Vertices"

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart()

; send the window caption
_IrrSetWindowCaption($SCRIPTTITLE)

; load a mesh
$DirectXMesh = _IrrGetMesh( "../media/cube.x" )

; copy the vertex information into the array struct
local $tVertex; will be set to an vertex struct from _IrrGetMeshVertices:
local $vertex_count = _IrrGetMeshVertices( $DirectXMesh, 0, $tVertex)

; display metric information on the mesh, the number of indices and vertices
local $index_count = _IrrGetMeshIndexCount( $DirectXMesh, 0 )
MsgBox(0, $SCRIPTTITLE, "Index count: " & $index_count & @LF & "Vertex count: " & $vertex_count)

; itterate through all of the vertices
for $i = 0 to $vertex_count - 1
    ; shrink the vertex X location by half its size
	__SetVertStruct($tVertex, $i, $VERT_X, __GetVertStruct($tVertex, $i, $VERT_X) * 0.5 )
    ; change the color of the vertex to a random value
	__SetVertStruct($tVertex, $i, $VERT_VCOLOR, _IrrMakeARGB(0, Random(0,255), Random(0,255), Random(0,255) ) )
next ; $i

; copy the altered vertex infomation back to the mesh
_IrrSetMeshVertices( $DirectXMesh, 0, $tVertex )

; add the mesh to the scene
$SceneNode = _IrrAddMeshToScene( $DirectXMesh )

; scale the node size up - the origonal mesh is very small
_IrrSetNodeScale( $SceneNode, 20,20,20 )

; switch on debugging information so that you can see the bounding box around the node
_IrrDebugDataVisible ( $SceneNode, $IRR_ON )

; switch off lighting effects on this model
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; add a controllable camera into the scene looking at the object
$OurCamera = _IrrAddFPSCamera($IRR_NO_OBJECT, 100.0, 0.1 )
_IrrSetNodePosition($OurCamera, 50,0,0)
_IrrSetCameraTarget($OurCamera,0,0,0)

_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 0, 0, 50 )

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
