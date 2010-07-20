; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 98 : Batching Meshes
; This example demonstrates how avoiding large numbers of scene nodes by
; copying the nodes mesh into a single mesh multiple times can have a
; significant improvement of the speed of the program
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

; SET this to FALSE to add all of the nodes seperately
global const $BATCHING = True
; CHANGE this define to control how many objects are added
global const $ROWS_AND_COLUMNS = 50


; ////////////////////////////////////////////////////////////////////////////
; global variables

; irrlicht objects
DIM $MiniMesh ; irr_mesh
DIM $MeshTextureA ; irr_texture
DIM $MeshTextureB ; irr_texture
DIM $SceneNode ; irr_node
DIM $OurCamera ; irr_camera

DIM $framerate ; $IRR_GUI_OBJECT
DIM $fpsString ; wstring * 256
; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart( $IRR_EDT_OPENGL, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; add a static text field for the frame rate
$framerate = _IrrAddStaticText( "Calculating ...", 4,580, 500,600, $IRR_GUI_BORDER, $IRR_GUI_NO_WRAP )

; set the window caption
_IrrSetWindowCaption( "Example 98: Batching Meshes" )

; load a mesh this acts ; a blue print for the model
$MiniMesh = _IrrGetMesh( "./media/cylinderY.obj" )
_IrrScaleMesh( $MiniMesh, 4.0 )

; for a fair test make sure that the cylinder object is hardware accellerated
_IrrSetMeshHardwareAccelerated( $MiniMesh )


; load texture resources for texturing the scene nodes
$MeshTextureA = _IrrGetTexture( "./media/Cross.bmp" )
$MeshTextureB = _IrrGetTexture( "./media/Diagonal.bmp" )

if $BATCHING then
	; create a batching mesh that will be a collection of other meshes
	DIM $meshBatch = _IrrCreateBatchingMesh()

	; add a whole mass of meshes to the batch mesh
	DIM $i, $j
	For $i = -$ROWS_AND_COLUMNS/2 to $ROWS_AND_COLUMNS/2
		For $j = -$ROWS_AND_COLUMNS/2 to $ROWS_AND_COLUMNS/2

			; ; we are going to add this mesh ; a single node if we want to use
			; different textures with different meshes we need to apply them to the
			; mesh before we add the mesh to the batch
			if ( mod($i + ( mod($j, 2) ), 2) ) = 0 Then
				; set the texture of the mesh before you add it so that the
				; seperate meshes have their own colors
				; This one will be BLUE
				_IrrSetMeshMaterialTexture( $miniMesh, $MeshTextureA, 0 )
			Else
				; set the texture of the mesh before you add it so that the
				; seperate meshes have their own colors
				; This one will be RED
				_IrrSetMeshMaterialTexture( $miniMesh, $MeshTextureB, 0 )
			Endif

			; Add this mesh to the batch at its own unique position
			_IrrAddToBatchingMesh ( $meshBatch, $MiniMesh, $i*10.0, $j*10.0 )
		Next ; $j
	Next ; $i

	; finish adding meshes to the batch mesh and create an animated mesh from it
	$MiniMesh = _IrrFinalizeBatchingMesh ( $meshBatch )

	; get more speed by making the mesh hardware accellerated
_IrrSetMeshHardwareAccelerated( $MiniMesh )

	; add the mesh to the scene ; a new node, the node is an instance of the
	; mesh object supplied here
	$SceneNode = _IrrAddMeshToScene( $MiniMesh )

	; switch off lighting effects on this model, ; there are no lights in this
	; scene the model would otherwise render pule black
	_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )

else

	; Add rows of seperate nodes to demonstrate the speed difference
	DIM $i, $j
	For $i = -$ROWS_AND_COLUMNS/2 to $ROWS_AND_COLUMNS/2
		For $j = -$ROWS_AND_COLUMNS/2 to $ROWS_AND_COLUMNS/2
			$SceneNode = _IrrAddMeshToScene( $MiniMesh )
			_IrrSetNodePosition( $SceneNode, $i*10.0, $j*10.0, 0.0 )
			if ( mod($i + ( mod($j, 2) ), 2) ) = 0 Then
				_IrrSetNodeMaterialTexture( $SceneNode, $MeshTextureA, 0 )
			Else
				_IrrSetNodeMaterialTexture( $SceneNode, $MeshTextureB, 0 )
			Endif
			_IrrSetNodeMaterialFlag( $SceneNode, $IRR_EMF_LIGHTING, $IRR_OFF )
		Next ; $j
	Next ; $i
endif ; $BATCHING

; add a camera into the scene
$OurCamera = _IrrAddFPSCamera()
_IrrSetNodePosition( $OurCamera, 0,0, $ROWS_AND_COLUMNS*10 )
_IrrHideMouse()


; -----------------------------------------------------------------------------
; while the irrlicht environment is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene( 240, 255, 255 )

    ; draw the scene
    _IrrDrawScene()

    ; format and display the framerate
	$fpsString = "FPS: " & _IrrGetFPS() & "    Objects: " & $ROWS_AND_COLUMNS*$ROWS_AND_COLUMNS & _
	"    Polys: " & _IrrGetPrimitivesDrawn() & "    Per Object: " & _IrrGetPrimitivesDrawn() / ($ROWS_AND_COLUMNS*$ROWS_AND_COLUMNS)
    _IrrGUISetText( $framerate, $fpsString )

	; draw the GUI
    _IrrDrawGUI()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
