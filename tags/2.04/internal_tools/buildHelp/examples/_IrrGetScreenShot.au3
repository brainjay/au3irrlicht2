#include "au3Irrlicht2.au3"

Global $hTexture, $camera, $mesh, $sceneNode, $texture

_IrrStart()

; Just adding some props to the scene, so we can get a screenshot of something
$camera = _IrrAddCamera(2,2,2, 0,0,0 )
$mesh = _IrrGetMesh( ".\media\capsuleX.obj" )
$sceneNode = _IrrAddMeshToScene( $mesh )
$texture = _IrrGetTexture(".\media\default_texture.png")
_IrrSetNodeMaterialTexture( $sceneNode, $texture, 0)
_IrrSetNodeMaterialFlag( $sceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )


WHILE _IrrRunning()

	_IrrBeginScene(50, 50, 50)

	; We want the props to be drawn before we take a screenshot.
    _IrrDrawScene()

	; This will draw our screenshot scaled down to the top left of the window
	If $hTexture Then _IrrDraw2DImageElementStretch($hTexture, 0, 0, 200, 150, 0, 0, 800, 600, $IRR_IGNORE_ALPHA)

	_IrrEndScene()

	; Taking a screenshot just once now the props have been drawn.
    If Not $hTexture Then $hTexture = _IrrGetScreenShot(0, 0, 800, 600)

WEND

_IrrStop()





