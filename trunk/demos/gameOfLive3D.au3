
#cs ----------------------------------------------------------------------------

 Script Name:    Conway's Game of life 3D
 AutoIt Version: 3.3.6.1 + au3Irr2.05dev
 Author:         linus 10/2010

; Demo script showing some features of au3Irr2
; based on a nice and clean script of <Apzo>:
; http://www.autoitscript.com/forum/index.php?showtopic=17280&st=0&p=839261&#entry839261
; More info about Conway's game of life:
; http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

#ce ----------------------------------------------------------------------------

Opt("MustDeclareVars", True)

#include "../au3Irrlicht2.au3"

Global Const $SZTITLE = "Conway's Game of Life 3D V0.91"
Global Const $Refresh = 1500 ;delay time between 2 states, in ms
Global Const $GRIDSIZE = 25 ;Toric grid, 25x25


_IrrStart($IRR_EDT_DIRECT3D9, @DesktopWidth, @DesktopHeight, 32, True, _
			$IRR_NO_SHADOWS, $IRR_CAPTURE_EVENTS, $IRR_VERTICAL_SYNC_ON)
_IrrHideMouse()
_IrrKlangStart()

main()
close()
exit



; ============================================================================================
Func main()

	Local $Grid[$GRIDSIZE][$GRIDSIZE][3]
	Local $cells, $turns, $time
	Local $bHelpScreen = True
	Local $bTopCam = False
	local $bRestart = False
	local $bContinue = True
	local $bStaticCam = True
	local $bPauseMusic = False

	Local $skyDome = _IrrAddSkyDomeToScene(_IrrGetTexture("../media/stars_.jpg"), 16, 16, 1, 2)
	_IrrAddRotationAnimator($skyDome, 0.005, 0, 0.002)
	_IrrSetAmbientLight(0.4, 0.4, 0.4)

	initGrid($Grid, $turns, $cells)
	updateGrid($Grid, $cells, $turns)
	_IrrKlangPlay2D("../media/LA schnee.ogg", True)

	$time = _IrrGetTime()
	While _IrrRunning() AND $bContinue
		keyHandler($bTopCam, $bHelpScreen, $bRestart, $bContinue, $bStaticCam, $bPauseMusic)
		if $bRestart Then
			initGrid($Grid, $turns, $cells)
			updateGrid($Grid, $cells, $turns)
			$bRestart = False
		EndIf

		drawScene($cells, $turns, $bTopCam, $bHelpScreen, $bStaticCam)
		If _irrgettime() - $time > $Refresh Then
			updateGrid($Grid, $cells, $turns)
			$time = _IrrGetTime()
			$turns = $turns + 1
		EndIf
	WEnd
EndFunc   ;==>main



; ============================================================================================
Func close()
	_IrrKlangStop()
	_IrrStop()
	Exit
EndFunc   ;==>close



; ============================================================================================
Func keyHandler(ByRef $bTopCam, ByRef $bHelpScreen, ByRef $bRestart, ByRef $bContinue, ByRef $bStaticCam, ByRef $bPauseMusic)
	local $pKeyEvent

	while _IrrKeyEventAvailable()
		$pKeyEvent = _IrrReadKeyEvent()
		if __getKeyEvt($pKeyEvent, $EVT_KEY_IDIRECTION) = $IRR_KEY_DOWN Then
			Switch __getKeyEvt($pKeyEvent, $EVT_KEY_IKEY)
				Case $KEY_ESCAPE, $KEY_KEY_Q
					$bContinue = False
				Case $KEY_KEY_H
					$bHelpScreen = not $bHelpScreen
				Case $KEY_KEY_T
					$bTopCam = not $bTopCam
				Case $KEY_KEY_R
					$bRestart = True
				Case $KEY_KEY_C
					$bStaticCam = not $bStaticCam
				case $KEY_KEY_M
					$bPauseMusic = not $bPauseMusic
					_IrrKlangSetAllSoundsPaused($bPauseMusic)
			EndSwitch
		EndIf
	WEnd
EndFunc   ;==>keyHandler



; ============================================================================================
Func initGrid(ByRef $Grid, ByRef $turns, ByRef $cells)
	; Generate grid controls and randomly fills it

	Local $x, $y, $hChild

	$turns = 0
	$cells = 0
	For $x = 0 To $GRIDSIZE - 1
		For $y = 0 To $GRIDSIZE - 1
 			if $Grid[$x][$y][0] <> 0 then ; remove old nodes when refreshing:
				_IrrRemoveNode($Grid[$x][$y][0])
				_IrrRemoveNode($Grid[$x][$y][2])
			EndIf
			If Random(1, 3) > 2 Then
				$Grid[$x][$y][0] = bearCell($x, $y, $turns, $Grid[$x][$y][2])
				$cells = $cells + 1
			Else
				$Grid[$x][$y][0] = 0
				$Grid[$x][$y][2] = 0
			EndIf
		Next
	Next
EndFunc   ;==>initGrid



; ============================================================================================
Func updateGrid(ByRef $Grid, ByRef $cells, ByRef $turns)

	Local $neigh, $x, $y, $xm1, $xp1, $ym1, $yp1, $vPos, $fadeTime, $hChild, $hPos

	For $x = 0 To $GRIDSIZE - 1
		For $y = 0 To $GRIDSIZE - 1
;~          checks neighbours
			$neigh = 0
			$xm1 = Mod($x - 1 + $GRIDSIZE, $GRIDSIZE)
			$xp1 = Mod($x + 1, $GRIDSIZE)
			$ym1 = Mod($y - 1 + $GRIDSIZE, $GRIDSIZE)
			$yp1 = Mod($y + 1, $GRIDSIZE)
			If $Grid[$xm1][$ym1][0] <> 0 Then $neigh = $neigh + 1
			If $Grid[$xm1][$y][0] <> 0 Then $neigh = $neigh + 1
			If $Grid[$xm1][$yp1][0] <> 0 Then $neigh = $neigh + 1
			If $Grid[$x][$ym1][0] <> 0 Then $neigh = $neigh + 1
			If $Grid[$x][$yp1][0] <> 0 Then $neigh = $neigh + 1
			If $Grid[$xp1][$ym1][0] <> 0 Then $neigh = $neigh + 1
			If $Grid[$xp1][$y][0] <> 0 Then $neigh = $neigh + 1
			If $Grid[$xp1][$yp1][0] <> 0 Then $neigh = $neigh + 1

;~          Actually I use 2 grids : one represents the n+0 state, the second: state at n+1

;~          Cell dies if less than 2 neighbours, or more than 3
			$Grid[$x][$y][1] = $Grid[$x][$y][0]
			If $Grid[$x][$y][0] <> 0 And ($neigh < 2 Or $neigh > 3) Then
;~              Cell death
				$vPos = _IrrGetNodeAbsolutePosition($Grid[$x][$y][0])
				$fadeTime = $Refresh * 15
				_IrrRemoveNode($Grid[$x][$y][2])
				$Grid[$x][$y][2] = 0
				_IrrAddFadeAnimator($Grid[$x][$y][0], $fadeTime * Random(0.3, 1), -0.1)
				_IrrAddFlyStraightAnimator($Grid[$x][$y][0], $vPos[0], $vPos[1] + 0.2, $vPos[2], $vPos[0], $vPos[1] - 100, $vPos[2], $fadeTime, False)
				$Grid[$x][$y][1] = 0
				$cells = $cells - 1
			EndIf

;~          Cells comes to life if exactly 3 neighbours
			If $Grid[$x][$y][0] = 0 And $neigh = 3 Then
;~              Cell birth
				$Grid[$x][$y][1] = bearCell($x, $y, $turns, $Grid[$x][$y][2])
				; give new cells a little "grow into" movement:
				_IrrAddFlyStraightAnimator($Grid[$x][$y][1], $x * 2, -0.8, $y * 2, $x * 2, 0, $y * 2, $Refresh * 0.8, False)
				$cells = $cells + 1
			EndIf
		Next
	Next

;~  Refreshing the current grid, n+1 becomes n+0
	For $x = 0 To $GRIDSIZE - 1
		For $y = 0 To $GRIDSIZE - 1
			$Grid[$x][$y][0] = $Grid[$x][$y][1]
		Next
	Next

EndFunc   ;==>updateGrid



; ============================================================================================
Func bearCell($x, $y, $turns, byRef $hPlaneCell)
	static local $texture1 = _IrrGetTexture("../media/ParticleRed.bmp")
	static local $texture2 = _IrrGetTexture("../media/ParticleBlue.bmp")
	static local $texture3 = _IrrGetTexture("../media/ParticleGreen.tga")
	static local $planeMesh = _IrrAddHillPlaneMesh("", 2, 2, 1, 1)

	Local $hNode

	$hNode = _IrrAddSphereSceneNode(1)
	_IrrSetNodePosition($hNode, $x * 2, 0, $y * 2)
	;_IrrSetNodeMaterialFlag($hNode, $IRR_EMF_LIGHTING, $IRR_OFF)
	If Mod($turns, 2) Then
		_IrrSetNodeMaterialTexture($hNode, $texture2, 0)
	Else
		_IrrSetNodeMaterialTexture($hNode, $texture1, 0)
	EndIf

	$hPlaneCell = _IrrAddMeshToScene($planeMesh)
	_IrrSetNodePosition($hPlaneCell, $x * 2, -1, $y * 2)
	;_IrrSetNodeMaterialFlag($hPlaneCell, $IRR_EMF_LIGHTING, $IRR_OFF)
	_IrrSetNodeMaterialTexture($hPlaneCell, $texture3, 0)

	Return $hNode
EndFunc   ;==>bearCell



; ============================================================================================
Func drawScene(ByRef $cells, ByRef $turns, $bTopCam, $bHelpScreen, $bStaticCam)
	Static Local $bitmapFont = _IrrGetFont("../media/fonthaettenschweiler.bmp")
	static local $logo = _IrrGetTexture( "../media/au3irr2_logo.jpg" )
	Static Local $gridMax = ($GRIDSIZE * 2) - 1
	Static Local $lastTime = _IrrGetTime()
	static local $camFly = addLightCam()
	Static Local $camStatic = _IrrAddCamera(0, 15, -10, $GRIDSIZE, -10, $GRIDSIZE)
	Static Local $camTop = _IrrAddCamera($GRIDSIZE - 1, 35, $GRIDSIZE - 1, $GRIDSIZE - 1, 0, $GRIDSIZE - 1)
	Static Local $texSize = @DesktopWidth / 4
	Static Local $texTopCam = _IrrCreateRenderTargetTexture($texSize, $texSize)
	static local $texHelpX = 256
	Static Local $texHelp = createHelpScreen($bitmapFont, $texHelpX)

	If _IrrGetTime() - $lastTime < 20 Then Return ; limit max. framerate

	_IrrSetRenderTarget($texTopCam, _IrrMakeARGB(100, 255, 255, 255), $IRR_ON, $IRR_ON)
	_IrrSetCameraAspectRatio ($camTop, 1.0)
	_IrrSetCameraClipDistance($camTop, 35.9, 33)
	_IrrSetActiveCamera($camTop)
	_IrrDrawScene()
	_IrrSetRenderTarget(0)

	if $bStaticCam then
		_IrrSetActiveCamera($camStatic)
	Else
		_IrrSetActiveCamera($camFly)
	EndIf

	_IrrBeginScene(0, 0, 25)
	_IrrDrawScene()

	Local $i
	For $i = -1 To $gridMax Step 2
		_IrrDraw3DLine($i, -1, -1, $i, -1, $gridMax, 0, 255, 0)
		_IrrDraw3DLine(-1, -1, $i, $gridMax, -1, $i, 0, 255, 0)
	Next ; $x
 	_Irr2DFontDraw($bitmapFont, $SZTITLE & ' (Press <H> for help)', 10, 10, 250, 25)
 	_Irr2DFontDraw($bitmapFont, "Cells: " & $cells, 10, 30, 250, 45)
	_Irr2DFontDraw($bitmapFont, "Turns: " & $turns, 10, 45, 250, 60)
 	_Irr2DFontDraw($bitmapFont, "FPS   : " & _IrrGetFPS(), 10, 60, 250, 75)

	_IrrDraw2DImageElementStretch($logo, @DesktopWidth-130, @DesktopHeight - 85, @DesktopWidth-10, @DesktopHeight-10, 0, 0, 372, 235, False)
	if $bTopCam then _IrrDraw2DImageElement($texTopCam, @DesktopWidth - 10 - $texSize, 10, 0, 0, $texSize, $texSize, $IRR_USE_ALPHA)
	if $bHelpScreen then _IrrDraw2DImageElementStretch($texHelp, 10, @DesktopHeight - $texHelpX*2 - 10, _
					$texHelpX * 2 + 10, @DesktopHeight - 10, 0, 0, $texHelpX, $texHelpX, $IRR_USE_ALPHA)
	_IrrEndScene()
	$lastTime = _IrrGetTime()

EndFunc   ;==>drawScene



; ============================================================================================
func addLightCam()
	local $cam = _IrrAddCamera(0, 0, 0, $GRIDSIZE/2, 0, $GRIDSIZE/2)
	local $node = _IrrAddBillBoardToScene(2, 2, 0, 0, 0)
	_IrrSetNodeMaterialTexture( $node, _IrrGetTexture("..\media\beam.png"), 0 )
	_IrrSetNodeMaterialFlag( $node, $IRR_EMF_LIGHTING, $IRR_OFF )
	_IrrSetNodeMaterialType($node, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL)
	_IrrAddLight($node, 0, 0, 0, 1, 1, 1, $GRIDSIZE*3)
	_IrrAddFlyCircleAnimator($cam, $GRIDSIZE/2, 20, $GRIDSIZE/2, $GRIDSIZE*2, 0.0001)
	_IrrAddChildToParent($node, $cam)

	return $cam
EndFunc



; ============================================================================================
Func createHelpScreen(ByRef $bitmapFont, $texHelpX)

	local $texHelp = _IrrCreateRenderTargetTexture($texHelpX, $texHelpX)
	_IrrSetRenderTarget($texHelp)
	_IrrBeginSceneAdvanced(_IrrMakeARGB(150, 0, 150, 0))
	_Irr2DFontDraw($bitmapFont, $SZTITLE, 10, 10, $texHelpX, 25)
	_Irr2DFontDraw($bitmapFont, "2010 by linus for the au3Irr2 project", 62, 25, $texHelpX, 40)
	_Irr2DFontDraw($bitmapFont, "- Game of life logic adopted from", 10, 55, $texHelpX, 70)
	_Irr2DFontDraw($bitmapFont, "  a nice and clean script of <Apzo>", 10, 70, $texHelpX, 85)
	_Irr2DFontDraw($bitmapFont, "- Soundtrack 'LA schnee' by Bo!experience", 10, 85, $texHelpX, 100)
	_Irr2DFontDraw($bitmapFont, "KEYS:", 10, 140, $texHelpX, 155)
	_Irr2DFontDraw($bitmapFont, "<Q> / <ESC> - Quit", 10, 155, $texHelpX, 170)
	_Irr2DFontDraw($bitmapFont, "<H> - Toggle help screen", 10, 170, $texHelpX, 185)
	_Irr2DFontDraw($bitmapFont, "<T> - Toggle top view", 10, 185, $texHelpX, 200)
	_Irr2DFontDraw($bitmapFont, "<C> - Toggle static/flying cam", 10, 200, $texHelpX, 215)
	_Irr2DFontDraw($bitmapFont, "<M> - Toggle music", 10, 215, $texHelpX, 230)
	_Irr2DFontDraw($bitmapFont, "<R> - Restart with new cells", 10, 230, $texHelpX, 245)
	_IrrEndScene()
	_IrrSetRenderTarget(0)
	Return $texHelp
EndFunc   ;==>createHelpScreen


