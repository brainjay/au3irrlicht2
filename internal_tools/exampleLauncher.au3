#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1
 Author:         Linus

 History:
 2010-07-28: First Version 0.9
 2010-08-11: 0.91: Replaced launching _readme.txt with helpfile

 Script Function:
	Launcher for example scripts of the au3Irrlicht2 UDF.
	Expects examples in "..\examples" or "\examples" - all other paths are
	derived from this. So it can be run from tools dir or au3Irrlicht root dir.

#ce ----------------------------------------------------------------------------


#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

#include <file.au3>
#include <array.au3>


opt("MustDeclareVars", True)


const $SCRIPTTITLE = "au3Irr2 Example Launcher V0.91 - 2010 by linus"
global $nMsg
Global $pathScite = RegRead("HKLM\Software\Microsoft\Windows\Currentversion\App Paths\Scite.Exe", "")
global $pathAu3 = RegRead("HKLM\Software\Microsoft\Windows\Currentversion\App Paths\AutoIt3.Exe", "")
global $pathExamples

; allow script to work from au3irrlicht2 home dir or the tools dir
if FileExists(".\examples") Then
	$pathExamples = ".\examples"
ElseIf FileExists("..\examples") Then
	$pathExamples = "..\examples"
Else
	MsgBox(48, $SCRIPTTITLE, "Cannot find example directory, sorry!")
	Exit
EndIf

global $comboScriptList = _FileListToArray($pathExamples, "*.au3", 1)
$comboScriptList = _ArrayToString($comboScriptList, "|", 1)


#Region ### START Koda GUI section ### Form=D:\daten_proggen\au3\IrrlichtWrapperGoogle\internal_tools\exampleLauncher.kxf
Global $Form1_1 = GUICreate("au3Irr2 Example Launcher by linus", 378, 250, 396, 156, BitOR($WS_MINIMIZEBOX,$WS_CAPTION,$WS_POPUP,$WS_GROUP,$WS_BORDER,$WS_CLIPSIBLINGS))
Global $btnRun = GUICtrlCreateButton("Run selected example", 16, 113, 145, 41, $WS_GROUP)
Global $btnQuit = GUICtrlCreateButton("Quit Launcher", 225, 137, 143, 41, $WS_GROUP)
Global $btnScite = GUICtrlCreateButton("Open example with SciTe", 224, 89, 145, 41, $WS_GROUP)
Global $btnReadme = GUICtrlCreateButton("Help file", 296, 9, 73, 25, $WS_GROUP)

Global $cmbExamples = GUICtrlCreateCombo("", 16, 57, 353, 25, BitOR($WS_VSCROLL,$ES_READONLY,$CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $picBackground = GUICtrlCreatePic("", 0, 0, 377, 249, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


WinSetTitle ( "", "", $SCRIPTTITLE )
GUICtrlSetData($cmbExamples, $comboScriptList, StringLeft($comboScriptList, StringInStr($comboScriptList, "|") - 1 ) )
GUICtrlSetImage ( $picBackground, $pathExamples & "\..\media\au3irr2_logo.jpg")


While true
	$nMsg = GUIGetMsg()
	Switch $nMsg
		case $btnRun
			; start selected example from \examples with location of .dll's as working dir:
			RunWait('"' & $pathAu3 & '" ' & @ScriptDir & '\' & $pathExamples & '\' & GUICtrlRead($cmbExamples), $pathExamples)

		case $btnReadme
			if not FileExists($pathExamples & "\..\au3Irr2.chm") Then
				MsgBox(48, $SCRIPTTITLE, "Cannot find help file, sorry!")
			Else
				ShellExecute($pathExamples & "\..\au3Irr2.chm")
			EndIf

		Case $btnScite
			if not FileExists($pathScite) Then
				MsgBox(48, $SCRIPTTITLE, "Cannot find SciTe, sorry!")
			Else
				Run($pathScite & ' ' & @ScriptDir & '\' & $pathExamples & '\' & GUICtrlRead($cmbExamples), $pathExamples)
			EndIf

		Case $btnQuit, $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
