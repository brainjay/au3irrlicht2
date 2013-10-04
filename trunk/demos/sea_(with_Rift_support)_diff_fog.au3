
#cs ----------------------------------------------------------------------------

 Script Name:    Sea Demo (with Rift Support)
 AutoIt Version: 3.3.6.1 + au3Irr2.05dev
 Author:         linus 09/2013

; Demo script showing some features of au3Irr2
; based on a nice and clean script of A. Percy :

#ce ----------------------------------------------------------------------------

Opt("MustDeclareVars", True)

#include "../au3Irrlicht2.au3"

Global Const $SZTITLE = "Sea Demo (with Rift Support) V0.9"
global $riftMode = false;
Global $Gravity = -1.0

HotKeySet( "{F1}", "_ChangeCamera" )
HotKeySet( "{F2}", "_toggleRift" )
HotKeySet("{ESC}", "_close")

_IrrStart($IRR_EDT_OPENGL, @DesktopWidth, @DesktopHeight, 16, true, _
			$IRR_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_OFF)
;~ _IrrStart($IRR_EDT_OPENGL, 800, 600, 16, false, _
;~ 			$IRR_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON)
_IrrHideMouse()
_IrrKlangStart()
_IrrRiftInit()

main()
_close()
exit


; ============================================================================================
Func _close()
	_IrrRiftStop()
	_IrrKlangStop()
	_IrrStop()
	Exit
EndFunc   ;==>_close


; ============================================================================================
Func main()

	#cs ----------------------------------------------------------------------------

	 AutoIt Version: 3.2.4.9
	 Author:         A. Percy

	 Script Function:
		Template AutoIt IrllLicht script.

	#ce ----------------------------------------------------------------------------


	;creating the device

	;setting window caption
;	SetWindowCaption( "Sea - press ""C"" to change view" )

;	$Static = AddStaticText( "This is a demonstration.", 10, 10, 200, 20, 0 )

	;*************************************
	; Setting light
	;*************************************
	dim $Light = _IrrAddLight( 0, 2000, 2000, 2000, 0.5, 0.5, 0.5, 10000 )
	$Light = _IrrAddLight( 0, -2000, 2000, -2000, 0.2, 0.2, 0.2, 10000 )

	;*************************************
	; Setting cameras
	;*************************************
	local $keyStruct
	global $Camera1 = _IrrAddFPSCamera(0, 50, 0.03, -1, __CreatePtrKeyMapArray($keyStruct), 5, 0,0.8)
	_IrrSetNodePosition( $Camera1, -125, 49, -87 ) ;setting position
	_IrrSetCameraTarget( $Camera1, 0, 25, 1000 ) ;setting target

	global $Camera2 = _IrrAddFPSCamera(0, 50, 0.05, -1, __CreatePtrKeyMapArray($keyStruct), 4, 1, 0.08)

	_IrrSetNodePosition( $Camera2, 0, 50, 520 ) ;setting position
	_IrrSetCameraTarget( $Camera2, -10, 20, -4 ) ;setting target
	$keyStruct = 0
	global $Camera3 = _IrrAddCamera( 0, 170, -34, 0, 0, -34 )

	;*************************************
	; Setting terrain
	;*************************************
	dim $TerrainNode = _IrrAddTerrain("../media/terrain-heightmap.bmp", -1200, -60, -1200, _
	               0, 0, 0, 10.0, 0.4, 10.0, 255, 255, 255, 255, 4, 5, $ETPS_17)
	_IrrSetNodeMaterialTexture( $TerrainNode, _IrrGetTexture( "../media/terrain-texture.jpg" ), 0 )
	_IrrSetNodeMaterialTexture( $TerrainNode, _IrrGetTexture( "../media/sea_sand.jpg" ), 1 )
	_IrrScaleTexture( $TerrainNode, 1, 100 )
	_IrrSetNodeMaterialFlag( $TerrainNode, $IRR_EMF_FOG_ENABLE, $IRR_ON )
	_IrrSetNodeMaterialType ( $TerrainNode, $IRR_EMT_DETAIL_MAP )

	dim $TerrainMaterial = _IrrGetMaterial( $TerrainNode, 0 )
	_IrrMaterialSetAmbientColor( $TerrainMaterial, 0, 255, 255, 50 )
	_IrrMaterialSetEmissiveColor( $TerrainMaterial, 0, 100, 100, 50 )

	dim $MapSelector = _IrrGetCollisionGroupFromTerrain( $TerrainNode, 0 )
;	SetTriangleSelector( $TerrainNode, $MapSelector )
	_IrrSetNodeTriangleSelector($TerrainNode, $MapSelector)

local $SkyDome = _IrrAddSkyDomeToScene( _
        _IrrGetTexture("../media/skydome2.jpg"), _
        16, 8, 1.0, 1.2)
_IrrAddRotationAnimator($SkyDome, 0, 0.003, 0)

	;*************************************
	; Setting ship
	;*************************************
	dim $ShipMesh = _IrrGetMesh( "../media/mayflower.3ds" )
	dim $ShipNode = _IrrAddMeshToScene( $ShipMesh )
	_IrrSetNodeMaterialFlag( $ShipNode, $IRR_EMF_BACK_FACE_CULLING, $IRR_OFF )
	_IrrSetNodeMaterialFlag( $ShipNode, $IRR_EMF_FOG_ENABLE, $IRR_ON )
	_IrrSetNodeMaterialFlag( $ShipNode, $IRR_EMF_GOURAUD_SHADING, $IRR_ON )
	_IrrSetNodeMaterialFlag( $ShipNode, $IRR_EMF_NORMALIZE_NORMALS, $IRR_ON )
	_IrrSetNodeRotation( $ShipNode, 0, 140, 0 )
	_IrrAddChildToParent ( $Camera3, $ShipNode )
	_IrrSetNodePosition ( $ShipNode, 0, 0, 500 ) ;setting position

	dim $ShipSelector = _IrrGetCollisionGroupFromComplexMesh( $ShipMesh, $ShipNode )
;	SetTriangleSelector( $ShipNode, $ShipSelector )
	_IrrSetNodeTriangleSelector($ShipNode, $ShipSelector)

;	_IrrAddNodeShadow($ShipNode)

	;*************************************
	; Setting water
	;*************************************
	dim $WaterMesh = _IrrAddHillPlaneMesh("Water", 21, 17, 140, 140, 0, 0.0, 0, 0, 10, 10 )
	;~ SetVertexColorAlpha( $WaterMesh, 1 )
	;AddWaterSurfaceSceneNode( Mesh, WaveHeight, WaveSpeed, WaveLength, Parent )
	dim $WaterNode = _IrrAddWaterSurfaceSceneNode( $WaterMesh, 0.5, 1000, 10.001, 0 )
	_IrrSetNodeMaterialFlag( $WaterNode, $IRR_EMF_BACK_FACE_CULLING, $IRR_OFF )
	_IrrSetNodeMaterialFlag( $WaterNode, $IRR_EMF_FOG_ENABLE, $IRR_ON )
	_IrrSetNodeMaterialTexture( $WaterNode, _IrrGetTexture( "../media/sea_water.jpg" ), 0 )
	_IrrSetNodeMaterialTexture( $WaterNode, _IrrGetTexture( "../media/sea_water2.jpg" ), 1 )
	_IrrSetNodeMaterialType( $WaterNode, $IRR_EMT_REFLECTION_2_LAYER )
	dim $WaterMaterial = _IrrGetMaterial( $WaterNode, 0 )
	_IrrMaterialSetEmissiveColor( $WaterMaterial, 0, 50, 50, 80 )

	;$WaterSelector = CreateOctTreeTriangleSelector( $WaterMesh, $WaterNode )
	dim $WaterSelector = _IrrGetCollisionGroupFromComplexMesh( $WaterMesh, $WaterNode )
	;SetTriangleSelector( $Camera1, $WaterSelector )
; next line required ??????????????????????????????
_IrrSetNodeTriangleSelector($Camera1, $WaterSelector)

	;*************************************
	; Setting camera collision
	;*************************************
	dim $MapCam1Animator = _IrrAddCollisionAnimator( $MapSelector, $Camera1, 6, 10, 6, 0.0, $Gravity, 0.0, 0, 5, 0 ) ;character can collide it
	;dim $WaterCam1Animator = _IrrAddCollisionAnimator( $WaterSelector, $Camera1, 2, 10, 2, 0, 0, 0, 0, -8, 0 ) ;character can collide it
	dim $ShipCam1Animator = _IrrAddCollisionAnimator( $ShipSelector, $Camera1, 2, 10, 2, 0, 0, 0, 0, 0, 0 ) ;character can collide it
	dim $Cam2Animator = _IrrAddCollisionAnimator( $ShipSelector, $Camera2, 1.5, 10, 1.5, 0, -0.1, 0, 0, 0, 0 ) ;character can collide it

	global $h_ActiceCam = $Camera1
	_IrrSetActiveCamera ( $h_ActiceCam )


local $info = _IrrAddBillboardTextSceneNode( 0, $SZTITLE, 200, 15, 0.0, 30.0, 20.0, 0, _
                                _IrrMakeARGB(0, 255, 0, 0), _IrrMakeARGB(0, 255, 0, 0) )

	;*************************************
	; Main loopping
	;*************************************
	dim $Red = 20
	dim $Green = 170
	dim $Blue = 255
	dim $Start = 400
	dim $End = 2000
	_IrrSetFog( $Red , $Green , $Blue , $IRR_LINEAR_FOG, $Start, $End )

	dim $Y = 0
local $font = _IrrGetFont( "../media/fonthaettenschweiler.bmp" )
local $bOverWater = true;

	While _IrrRunning()
		;$Y = GetPosition( GetActiveCamera( ), "Y" )
		$Y = _IrrGetNodePosition($h_ActiceCam)


_IrrRemoveNode($info)
$info = _IrrAddBillboardTextSceneNode( 0, "x/y/z: " & int($Y[0]) & "/" & int($Y[1]) & "/" & int($Y[2]), 1, 0.1, 0.0, 0, 1, $h_ActiceCam, _
                                _IrrMakeARGB(0, 255, 255, 255), _IrrMakeARGB(0, 255, 255, 255) )
;_IrrSetWindowCaption( "x/y/z: " & int($Y[0]) & "/" & int($Y[1]) & "/" & int($Y[2]) )
		$Y = $Y[1]

;		If $Y > $LastY + 0.05 or $Y < $LastY - 0.05 Then
;			If $Y > 5 Then
		if $Y > 0 and $bOverWater = false then
			$bOverWater = True
  				_IrrRemoveAnimator($Camera1, $MapCam1Animator)
				$MapCam1Animator = _IrrAddCollisionAnimator( $MapSelector, $Camera1, 6, 10, 6, 0.0, $Gravity, 0, 0, 5, 0 )
;~ ;				SetGravity( $MapCam1Animator, 0, $Gravity, 0 )
		ElseIf $y < 0 and $bOverWater = true then
				$bOverWater = False
 				_IrrRemoveAnimator($Camera1, $MapCam1Animator)
 				$MapCam1Animator = _IrrAddCollisionAnimator( $MapSelector, $Camera1, 6, 10, 6, 0.0, -0.1, 0.0, 0, 5, 0 )
;				SetGravity( $MapCam1Animator, 0, 0, 0 )
		EndIf

			If $Y > 0.5 Then
				$Red = 20
				$Green = 170
				$Blue = 255
				$Start = 400
				$End = 2000
			Else
				Select
					Case $Y < 0.5 and $Y >= 0
						$Red = 25
						$Green = 128
						$Blue = 189
						$Start = 20
						$End = 100
					Case $Y < 0 and $Y >= -0.5
						$Red = 22
						$Green = 100
						$Blue = 170
						$Start = 10
						$End = 80
					Case $Y < -0.5
						$Red = 30
						$Green = 85
						$Blue = 126
						$Start = 1
						$End = 60
				EndSelect
			EndIf
			_IrrSetFog( $Red , $Green , $Blue , $IRR_LINEAR_FOG, $Start, $End )
			;$LastY = $Y
;		EndIf

		_IrrBeginScene( $Red, $Green, $Blue )

			if($riftMode) Then
				_IrrRiftDrawScene()
			Else
				_IrrDrawScene()
			EndIf
;	_IrrDrawGUI()


;	_Irr2DFontDraw($font, $SZTITLE & ' (Press <H> for help)', 300, 300, 250, 50)
; 	_Irr2DFontDraw($bitmapFont, "Cells: " & $cells, 10, 30, 250, 45)
;	_Irr2DFontDraw($bitmapFont, "Turns: " & $turns, 10, 45, 250, 60)
; 	_Irr2DFontDraw($bitmapFont, "FPS   : " & _IrrGetFPS(), 10, 60, 250, 75)
		_IrrEndScene()
		sleep( 20 )
	Wend
EndFunc   ;==>main


; ============================================================================================
Func _ChangeCamera()
	Switch $h_ActiceCam
		Case $Camera1
			$h_ActiceCam = $Camera2
			_IrrSetActiveCamera( $Camera2 )
			;SetText( $Static, "Camera 2" )
		Case $Camera2
			$h_ActiceCam = $Camera3
			_IrrSetActiveCamera( $Camera3 )
			;SetText( $Static, "Camera 3" )
		Case Else
			$h_ActiceCam = $Camera1
			_IrrSetActiveCamera( $Camera1 )
			;SetText( $Static, "Camera 1" )
	EndSwitch
EndFunc ;==>_ChangeCamera


; ============================================================================================
Func _toggleRift()
	$riftMode = not($riftMode)
EndFunc ;==>_toggleRift




