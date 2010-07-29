; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 16 : 2D Text at a 3D location
; This example draws 2D text at a location on the screen that is directly over
; specific 3D point in the scene. That point is set to hover over a models
; head making it appear like the model has a text label
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
DIM $MD2Mesh ; irr_mesh
DIM $MeshTexture ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera
DIM $BitmapFont ; irr_font
DIM $x ; integer
DIM $y ; integer
DIM $vect[3] ; $IRR_VECTOR


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; send the window caption
_IrrSetWindowCaption( "Example 16: 2D Text at a 3D Location" )

; load the bitmap font ; a texture
$BitmapFont = _IrrGetFont ( "../media/bitmapfont.bmp" )

; load a mesh
$MD2Mesh = _IrrGetMesh( "../media/zumlin.md2" )

; load texture resources for texturing models
$MeshTexture = _IrrGetTexture( "../media/zumlin.pcx" )

; add the mesh to the scene a couple of times
$SceneNode = _IrrAddMeshToScene( $MD2Mesh )

; the node is still at the origin move the vector to just over the nodes
; head
$vect[1] = 35

; apply a material to the object
_IrrSetNodeMaterialTexture( $SceneNode, $MeshTexture, 0 )

; switch off lighting effects on this model
_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

; play specific animation sequences
_IrrPlayNodeMD2Animation( $SceneNode, $IRR_EMAT_STAND )

; add a camera into the scene and move it into position
$OurCamera = _IrrAddFPSCamera( $IRR_NO_OBJECT, 100.0, 0.1 )
_IrrSetNodePosition( $OurCamera, 80,0,0 )
_IrrSetCameraTarget( $OurCamera, 0,0,0 )

; hide the mouse from the screen
_IrrHideMouse()

; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with grey before rendering
    _IrrBeginScene( 128,128,128 )

    ; draw the scene
    _IrrDrawScene()

    ; using the 3D coordinate get the X and Y position of this coordinate ; it
    ; appears on the screen
    _IrrGetScreenCoordinatesFrom3DPosition( $x, $y, $vect )
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $x = ' & $x & @crlf & '>Error code: ' & @error & @crlf) ;### Debug Console
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $y = ' & $y & @crlf & '>Error code: ' & @error & @crlf) ;### Debug Console

    ; draw the name of the model over the head of the model
    _Irr2DFontDraw ( $BitmapFont, "ZUMLIN", $x-15, $y-8, $x+35, $y )

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
