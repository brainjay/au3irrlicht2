; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 24 : Writing a Custom Mesh to a file
; This example creates a pyramid mesh that is set up ready to be textured
; it then adds the mesh to a new node and applies a material to it. Finally
; it writes the mesh out to a file.
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
DIM $hMesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera
CONST $SCRIPTTITLE = "Example 24: Writing a custom mesh to a file"

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface with defaults
_IrrStart()

; set the window caption
_IrrSetWindowCaption( $SCRIPTTITLE )

; a mesh is created from an array of types called vertices that define a point
; in space. and an array of indices to these vertices that are grouped into
; threes to create triangles that form the mesh
local $tVertexArray = __VertexArrayCreate(5) ; $IRR_VERT

; set up five vertices to define the points of a pyramid. the vertices have
; many properties that need to be set up to properly define the structure
__VertexArraySet($tVertexArray, 0, $VERTEX_X, -20)
__VertexArraySet($tVertexArray, 0, $VERTEX_Y, 0)
__VertexArraySet($tVertexArray, 0, $VERTEX_Z, -20)
__VertexArraySet($tVertexArray, 1, $VERTEX_X, -20)
__VertexArraySet($tVertexArray, 1, $VERTEX_Y, 0)
__VertexArraySet($tVertexArray, 1, $VERTEX_Z, 20)
__VertexArraySet($tVertexArray, 2, $VERTEX_X, 20)
__VertexArraySet($tVertexArray, 2, $VERTEX_Y, 0)
__VertexArraySet($tVertexArray, 2, $VERTEX_Z, 20)
__VertexArraySet($tVertexArray, 3, $VERTEX_X, 20)
__VertexArraySet($tVertexArray, 3, $VERTEX_Y, 0)
__VertexArraySet($tVertexArray, 3, $VERTEX_Z, -20)
__VertexArraySet($tVertexArray, 4, $VERTEX_X, 0)
__VertexArraySet($tVertexArray, 4, $VERTEX_Y, 35)
__VertexArraySet($tVertexArray, 4, $VERTEX_Z, 0)

; the co-ordinates across a texture run from 0 to 1 so we place each of the
; vertices on this texture plane to appear ; if the pyramid was painted from
; its bottom up
__VertexArraySet($tVertexArray, 0, $VERTEX_TEXTUREX, 0)
__VertexArraySet($tVertexArray, 0, $VERTEX_TEXTUREY, 0)
__VertexArraySet($tVertexArray, 1, $VERTEX_TEXTUREX, 0)
__VertexArraySet($tVertexArray, 1, $VERTEX_TEXTUREY, 1)
__VertexArraySet($tVertexArray, 2, $VERTEX_TEXTUREX, 1)
__VertexArraySet($tVertexArray, 2, $VERTEX_TEXTUREY, 1)
__VertexArraySet($tVertexArray, 3, $VERTEX_TEXTUREX, 1)
__VertexArraySet($tVertexArray, 3, $VERTEX_TEXTUREY, 0)
__VertexArraySet($tVertexArray, 4, $VERTEX_TEXTUREX, 0.5)
__VertexArraySet($tVertexArray, 4, $VERTEX_TEXTUREY, 0.5)

; each of the vertices can be assigned a colour to tint the texture, in this
; case we use white

__VertexArraySet($tVertexArray, 0, $VERTEX_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))
__VertexArraySet($tVertexArray, 1, $VERTEX_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))
__VertexArraySet($tVertexArray, 2, $VERTEX_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))
__VertexArraySet($tVertexArray, 3, $VERTEX_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))
__VertexArraySet($tVertexArray, 4, $VERTEX_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))

; -----------------------------------------------------------------------------
; create the faces, this is an array of indices referencing the vectors they
; are collected into groups of three each defining a triangle in the mesh
local $aIndices[18] = [0,1,4,  1,2,4,  2,3,4,  3,0,4,  2,1,0,  0,3,2]

; create the mesh from the array of vertices and indices
$hMesh = _IrrCreateMesh("testMesh", $tVertexArray, $aIndices)

; load texture resource for texturing the nodes
$MeshTexture = _IrrGetTexture( "../media/au3irr2_logo.jpg" )

; add the mesh to the scene
$SceneNode = _IrrAddMeshToScene( $hMesh )
_IrrAddRotationAnimator($SceneNode, 0, 0.2, 0)

; apply a material to the node
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; switch off lighting effects on this node
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; write the first frame of the supplied animated mesh out to a file using
; the specified file format
_IrrWriteMesh( $hMesh, $EMWT_IRR_MESH, @DesktopDir & "\mymesh.txt" )
MsgBox(0, $SCRIPTTITLE, "Mesh written to " & @DesktopDir & "\mymesh.txt")

; add a camera into the scene and resposition it to look at the pyramid
$OurCamera = _IrrAddFPSCamera()
_IrrSetNodePosition( $OurCamera, 30,50,25)
_IrrSetCameraTarget($OurCamera, 0,0,0)

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
