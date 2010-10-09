#include "au3Irrlicht2.au3"

Global $sScreenShot = @MyDocumentsDir & "\IrrScreenShot.jpg"
Global $camera, $mesh, $sceneNode, $texture

_IrrStart()

; Adding some props to the scene, so we get a screenshot of something.
$camera = _IrrAddCamera(2,2,2, 0,0,0 )
$mesh = _IrrGetMesh( ".\media\capsuleX.obj" )
$sceneNode = _IrrAddMeshToScene( $mesh )
$texture = _IrrGetTexture(".\media\default_texture.png")
_IrrSetNodeMaterialTexture( $sceneNode, $texture, 0)
_IrrSetNodeMaterialFlag( $sceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; We want the props to be drawn before we take a screenshot.
_IrrBeginScene(50, 50, 50)
_IrrDrawScene()
_IrrEndScene()

; Taking a screenshot now the props have been drawn.
_IrrSaveScreenShot($sScreenShot)

;If the screenshot was successful then we open it with the users default viewer
If FileExists($sScreenShot) Then ShellExecute($sScreenShot)

_IrrStop()
