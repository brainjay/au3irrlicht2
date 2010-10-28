#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1
 Author:         linus

 Script Function:
	Launcher for example scripts of the au3Irrlicht2 UDF.
	Expects examples in "..\examples" or "\examples" - all other paths are
	derived from this. So it can be run from tools dir or au3Irrlicht root dir.

 History:
 2010-10-09: 0.92: Added Setup to merge au3Irr2 help into local au3 help and add/update calltips for SciTe
 2010-10-05: 0.91b: Fixed: Examples could not be opened when running launcher from path with spaces
 2010-08-11: 0.91: Replaced launching _readme.txt with helpfile
 2010-07-28: First Version 0.9

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


Global const $SCRIPTTITLE = "au3Irr2.05dev Example Launcher V0.92 - 2010 by linus"
global const $MERGEHELPVER = "v3.3.6.1"

Global const $pathScite = RegRead("HKLM\Software\Microsoft\Windows\Currentversion\App Paths\Scite.Exe", "")
global const $pathAu3 = RegRead("HKLM\Software\Microsoft\Windows\Currentversion\App Paths\AutoIt3.Exe", "")
global const $pathAu3Dir = StringReplace($pathAu3, "AutoIt3.exe", "")
global const $pathSciteDir = StringReplace($pathScite, "Scite.exe", "")

global $pathExamples
global $pathHelp, $pathHelpDir
global $nMsg, $ret, $sText, $hIn, $hOut, $sLine, $bWrite


; allow script to work from au3irrlicht2 home dir or the tools dir
if FileExists(".\examples") Then
	$pathExamples = ".\examples"
ElseIf FileExists("..\examples") Then
	$pathExamples = "..\examples"
Else
	MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot find example directory, sorry!")
	Exit
EndIf

if FileExists(@ScriptDir & "\au3Irr2.chm") Then
	$pathHelp = @ScriptDir & "\au3Irr2.chm"
	$pathHelpDir = @ScriptDir
Else
	$pathHelp = @ScriptDir & "\..\au3Irr2.chm"
	$pathHelpDir = @ScriptDir & "\.."
EndIf


global $comboScriptList = _FileListToArray($pathExamples, "*.au3", 1)
$comboScriptList = _ArrayToString($comboScriptList, "|", 1)


#Region ### START Koda GUI section ### Form=D:\daten_proggen\au3\au3Irrlicht2Google\internal_tools\exampleLauncher.kxf
Global $Form1_1 = GUICreate("au3Irr2 Example Launcher by linus", 378, 250, 396, 156, BitOR($WS_MINIMIZEBOX,$WS_CAPTION,$WS_POPUP,$WS_GROUP,$WS_BORDER,$WS_CLIPSIBLINGS))
Global $cmbExamples = GUICtrlCreateCombo("", 16, 57, 353, 25)
Global $btnRun = GUICtrlCreateButton("Run selected example", 16, 113, 145, 41, $WS_GROUP)
Global $btnQuit = GUICtrlCreateButton("Quit Launcher", 225, 137, 143, 41, $WS_GROUP)
Global $btnScite = GUICtrlCreateButton("Open example with SciTe", 224, 89, 145, 41, $WS_GROUP)
Global $btnReadme = GUICtrlCreateButton("Help file", 296, 9, 73, 25, $WS_GROUP)
GUICtrlSetTip(-1, "Open au3Irr2 help")
Global $btnSetup = GUICtrlCreateButton("Setup", 228, 9, 41, 25, $WS_GROUP)
GUICtrlSetTip(-1, "Integrate help file and calltips for SciTE")
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
			RunWait('"' & $pathAu3 & '" "' & @ScriptDir & '\' & $pathExamples & '\' & GUICtrlRead($cmbExamples) & '"', $pathExamples)

		case $btnReadme
			if not FileExists($pathExamples & "\..\au3Irr2.chm") Then
				MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot find help file, sorry!")
			Else
				ShellExecute($pathHelp)
			EndIf

		Case $btnScite
			if not FileExists($pathScite) Then
				MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot find SciTe, sorry!")
			Else
				Run($pathScite & ' "' & @ScriptDir & '\' & $pathExamples & '\' & GUICtrlRead($cmbExamples) & '"', $pathExamples)
			EndIf


		Case $btnSetup
			; only for development: move a newly created au3Irr2.chm to where it belongs (i.e. root dir of au3Irr2):
			if FileExists($pathHelpDir & "\internal_tools\buildHelp\au3Irr2.chm") Then
				if not FileMove($pathHelpDir & "\internal_tools\buildHelp\au3Irr2.chm", $pathHelpDir, 1) Then
					MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot move au3Irr2.chm from buildDir!")
					ContinueCase
				EndIf
			EndIf

			; merging the help file:
			$ret = MsgBox(32 + 8192 + 4, $SCRIPTTITLE, "Merge au3Irr2 help into local autoIt help?" & _
					@LF & @LF & ">>> Please note: Current merged help is build for autoIt help with version: " & $MERGEHELPVER & _
					@LF & @LF & ">>> Backup of original " & $pathAu3Dir & "\AutoIt.chm will be created for later restore.")

			if $ret = 6 Then ; Yes: merge au3Help
				if NOT FileCopy($pathHelp, $pathAu3Dir, True) Then ContinueCase
					ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $pathHelp = ' & $pathHelp & @crlf & '>Error code: ' & @error & @crlf) ;### Debug Console
				if NOT FileExists($pathAu3Dir & "AutoIt_org.chm") then
					if NOT FileCopy($pathAu3Dir & "AutoIt.chm", $pathAu3Dir & "\AutoIt_org.chm") Then ContinueCase
				EndIf

				if not FileInstall('.\buildHelp\AutoIt.chm', $pathAu3Dir, True) then ContinueCase
			EndIf

			; adding/updating the user calltips:
			$ret = MsgBox(32 + 8192 + 4, $SCRIPTTITLE, "Add/Update usercalltips for SciTE?")

			if $ret = 6 Then ; Yes: merge au3Help
				if NOT FileCopy($pathSciteDir & "api\au3.user.calltips.api", $pathSciteDir & "api\au3.user.calltips.api_org", 1) Then ContinueCase
				if not FileInstall('au3Irr2.user.calltips.api', $pathSciteDir & "api\", True) then ContinueCase

				$hIn = FileOpen($pathSciteDir & "api\au3.user.calltips.api_org", 0)
				$hOut = FileOpen($pathSciteDir & "api\au3.user.calltips.api", 2)
				if $hOut = - 1 then ContinueCase

				$bWrite = True
				While True
					$sLine = FileReadLine($hIn)
					If @error = -1 Then ExitLoop
					if StringInStr($sLine, "userCallTips for au3Irr2") then $bWrite = False
					if $bWrite then FileWriteLine($hOut, $sLine)
					if StringInStr($sLine, "End of au3Irrlicht2 calltip definitions") then $bWrite = True
				Wend
				FileClose($hIn)

				if NOT $bWrite then
					MsgBox(16 + 8192, $SCRIPTTITLE, "Previous calltip definition block corrupt! Check/restore your usercalltip file!")
				Else
					$sText = FileRead($pathSciteDir & "api\au3Irr2.user.calltips.api")
					FileWrite($hOut, $sText)
					MsgBox(64 + 8192, $SCRIPTTITLE, "Done.")
				EndIf
				FileClose($hOut)

			EndIf
		Case 666 ; error during $btnSetup
			MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot complete setup (missing rights in au3 installation dir, or open files?), sorry!" & @LF & "Please restart exampleLauncher as Administrator and retry!")

		Case $btnQuit, $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
