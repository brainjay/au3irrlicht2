#include "au3Irrlicht2.au3"

_IrrStart()
local $tVertex = __CreateVertStruct(5)

; set up five vertices to define the points of a pyramid. the vertices have
; many properties that need to be set up to properly define the structure
__SetVertStruct($tVertex, 0, $VERT_X, -20)
__SetVertStruct($tVertex, 0, $VERT_Y, 0)
__SetVertStruct($tVertex, 0, $VERT_Z, -20)
__SetVertStruct($tVertex, 1, $VERT_X, -20)
__SetVertStruct($tVertex, 1, $VERT_Y, 0)
__SetVertStruct($tVertex, 1, $VERT_Z, 20)
__SetVertStruct($tVertex, 2, $VERT_X, 20)
__SetVertStruct($tVertex, 2, $VERT_Y, 0)
__SetVertStruct($tVertex, 2, $VERT_Z, 20)
__SetVertStruct($tVertex, 3, $VERT_X, 20)
__SetVertStruct($tVertex, 3, $VERT_Y, 0)
__SetVertStruct($tVertex, 3, $VERT_Z, -20)
__SetVertStruct($tVertex, 4, $VERT_X, 0)
__SetVertStruct($tVertex, 4, $VERT_Y, 35)
__SetVertStruct($tVertex, 4, $VERT_Z, 0)

; co-ordinates across a texture run from 0 to 1 so we place each of the vertices
; on this texture plane to appear ; if the pyramid was painted from its bottom up
__SetVertStruct($tVertex, 0, $VERT_TEXTUREX, 0)
__SetVertStruct($tVertex, 0, $VERT_TEXTUREY, 0)
__SetVertStruct($tVertex, 1, $VERT_TEXTUREX, 0)
__SetVertStruct($tVertex, 1, $VERT_TEXTUREY, 1)
__SetVertStruct($tVertex, 2, $VERT_TEXTUREX, 1)
__SetVertStruct($tVertex, 2, $VERT_TEXTUREY, 1)
__SetVertStruct($tVertex, 3, $VERT_TEXTUREX, 1)
__SetVertStruct($tVertex, 3, $VERT_TEXTUREY, 0)
__SetVertStruct($tVertex, 4, $VERT_TEXTUREX, 0.5)
__SetVertStruct($tVertex, 4, $VERT_TEXTUREY, 0.5)

; each of the vertices can be assigned a colour to tint the texture:
__SetVertStruct($tVertex, 0, $VERT_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))
__SetVertStruct($tVertex, 1, $VERT_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))
__SetVertStruct($tVertex, 2, $VERT_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))
__SetVertStruct($tVertex, 3, $VERT_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))
__SetVertStruct($tVertex, 4, $VERT_VCOLOR, _IrrMakeARGB(0, 255, 255, 255))

; -----------------------------------------------------------------------------
; create the faces, this is an array of indices referencing the vectors they
; are collected into groups of three each defining a triangle in the mesh
local $aIndices[18] = [0,1,4,  1,2,4,  2,3,4,  3,0,4,  2,1,0,  0,3,2]

; create the mesh from the array of vertices and indices
local $hMesh = _IrrCreateMesh("testMesh", $tVertex, $aIndices)

; add the mesh to the scene
local $SceneNode = _IrrAddMeshToScene( $hMesh )
_IrrAddRotationAnimator($SceneNode, 0, 0.2, 0)
_IrrSetNodeMaterialTexture( $SceneNode, _IrrGetTexture( "./media/au3irr2_logo.jpg" ), 0 )
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

_IrrAddCamera(30, 30, 30, 0, 10, 0)

WHILE _IrrRunning()
    _IrrBeginScene(0, 0, 25)
	_IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
