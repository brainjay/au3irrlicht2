; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by smashly.
; ----------------------------------------------------------------------------
; Example 31 : Loading an IrrEdit Scene
; This example loads a scene created with the IrrEdit tool this allows a large
; number of meshes, textures and nodes to be loaded and created in one call.
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "..\au3Irrlicht2.au3"

Opt("MustDeclareVars", 1)

HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc   ;==>_exit

; ////////////////////////////////////////////////////////////////////////////
; global variables

Global $hCamera

; -----------------------------------------------------------------------------
; start the irrlicht interface
_IrrStart($IRR_EDT_DIRECT3D9, 800, 600, 32, $IRR_WINDOWED, _
		$IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON)

; Set the window caption.
_IrrSetWindowCaption("Example 31: Loading a scene")

; Load the files from the zip for the scene
_IrrAddZipFile( "../media/example.zip", $IRR_IGNORE_CASE, $IRR_IGNORE_PATHS)

; Load an example scene created in irrEdit.
_IrrLoadScene("example.irr")

; Add a first person perspective camera to the scene so you can look about.
$hCamera = _IrrAddFPSCamera($IRR_NO_OBJECT, 100, 0.5)
_IrrSetNodePosition($hCamera, -20, 20, -50)

; Hide the mouse pointer to see the view better.
_IrrHideMouse()

; -----------------------------------------------------------------------------
; While the irrlicht environment is still running
While _IrrRunning()
	; Begin the scene, erasing the canvas to black.
	_IrrBeginScene(0, 0, 0)

	; Draw the scene.
	_IrrDrawScene()

	; End drawing the scene and render it.
	_IrrEndScene()
WEnd
