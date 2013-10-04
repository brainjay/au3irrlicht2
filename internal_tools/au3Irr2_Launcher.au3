#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#cs
 Title: au3Irr2 Launcher
 AutoIt Version: 3.3.8.1
 Author:         linus

 Script Function:
	Launcher for example/demo scripts and help file of the au3Irr2 UDF.
	Included setup for integration of help file into au3 help and calltips into SciTe 
	Expects examples in "..\examples" or "\examples" - all other paths are
	derived from this. So it can be run from tools dir or au3Irrlicht root dir.

 History:
 2010-07-28: First Version 0.9
 2010-08-11: 0.91: Replaced launching _readme.txt with helpfile
 2010-10-05: 0.91b: Fixed: Examples could not be opened when running launcher from path with spaces
 2010-10-09: 0.92: Added Setup to merge au3Irr2 help into local au3 help and add/update calltips for SciTe
 2013-09-20: 0.93: - calltips are now saved/updated into [scite]\api\au3.api. Saving to au3.user.calltips.api caused
                     problems because not really clear where scite expects this file (depends on user config)
				   - Removed messages about strict binding of merged au3irr2 help file to a specific au3 help version.
				     In fact the replaced au3.chm is just a file merging the current help files. So merging of au3irr2 help
					 is not limited to a specific version of au3.
 2013-09-28: - Some adjustments for better support on 64bit (regread/copying files)
             - script could not add calltips to cut-down version of scite (included in au3-package): fixed.
 2013-10-03: - Available scripts in \demos are now added to top of launcher list.
             - renamed from ExampleLauncher to au3Irr2_Launcher
			 

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

Global const $SCRIPTTITLE = "au3Irr2 (2.05dev) - Launcher V0.93 - 2010-2013 by linus"

Local $Wow64 = ""
If @AutoItX64 Then $Wow64 = "\Wow6432Node"
global $pathAu3 = RegRead("HKLM\Software" & $Wow64 & "\Microsoft\Windows\Currentversion\App Paths\AutoIt3.Exe", "")
Global $pathScite = RegRead("HKLM\Software" & $Wow64 & "\Microsoft\Windows\Currentversion\App Paths\Scite.Exe", "")
global $pathAu3Dir = StringReplace($pathAu3, "AutoIt3.exe", "")
; if only cut-down version of Scite (included one of au3package) available:
if not FileExists($pathScite) then $pathScite = $pathAu3Dir & "\SciTE\Scite.exe"
global $pathSciteDir = StringReplace($pathScite, "Scite.exe", "")

global $pathExamples, $pathDemos, $pathTmp
global $pathHelp, $pathHelpDir
global $nMsg


; allow script to work from au3irrlicht2 home dir or the tools dir
if FileExists(".\examples") Then
	$pathExamples = ".\examples"
ElseIf FileExists("..\examples") Then
	$pathExamples = "..\examples"
Else
	MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot find example directory, sorry!")
	Exit
EndIf
; add demo dir if available
if FileExists(".\demos") Then
	$pathDemos = ".\demos"
Elseif FileExists("..\demos") Then
	$pathDemos = "..\demos"
EndIf
 
if FileExists(@ScriptDir & "\au3Irr2.chm") Then
	$pathHelp = @ScriptDir & "\au3Irr2.chm"
	$pathHelpDir = @ScriptDir
Else
	$pathHelp = @ScriptDir & "\..\au3Irr2.chm"
	$pathHelpDir = @ScriptDir & "\.."
EndIf


global $tmp = _FileListToArray($pathExamples, "*.au3", 1) 
global $comboScriptList = _ArrayToString($tmp, "|", 1)
; add demos if available
if FileExists($pathDemos) then 
   $tmp = _FileListToArray($pathDemos, "*.au3", 1) 
   if IsArray($tmp) Then
	  for $i = 1 to $tmp[0]
		 $tmp[$i] = "DEMO: " & $tmp[$i]
	  next ;$i
	  $tmp = _ArrayToString($tmp, "|", 1)
	  $comboScriptList = $tmp & "|==========|" & $comboScriptList	  
   endif
endif

#Region ### START Koda GUI section ### Form=D:\daten_proggen\au3\au3Irrlicht2Google\internal_tools\exampleLauncher.kxf
Global $Form1_1 = GUICreate("au3Irr2 Example Launcher by linus", 378, 250, 396, 156, BitOR($WS_MINIMIZEBOX,$WS_CAPTION,$WS_POPUP,$WS_GROUP,$WS_BORDER,$WS_CLIPSIBLINGS))
Global $cmbExamples = GUICtrlCreateCombo("", 16, 57, 353, 25)
Global $btnRun = GUICtrlCreateButton("Run selected example", 16, 113, 145, 41, $WS_GROUP)
Global $btnQuit = GUICtrlCreateButton("Quit Launcher", 200, 137, 165, 41, $WS_GROUP)
Global $btnScite = GUICtrlCreateButton("Open example with SciTe", 200, 89, 165, 41, $WS_GROUP)
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
			$pathTmp = GUICtrlRead($cmbExamples)
			if StringLeft($pathTmp, 6) = "DEMO: " Then
			   $pathTmp = @ScriptDir & '\' & $pathDemos & '\' & StringMid($pathTmp, 7)
			   RunWait('"' & $pathAu3 & '" "' & $pathTmp & '"', $pathDemos)
			Else
			   $pathTmp = @ScriptDir & '\' & $pathExamples & '\' & $pathTmp
			   ; check for file to ensure any separator in list is not 'started':
			   if FileExists($pathTmp) then RunWait('"' & $pathAu3 & '" "' & $pathTmp & '"', $pathExamples)
			EndIf

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
			   $pathTmp = GUICtrlRead($cmbExamples)
			   if StringLeft($pathTmp, 6) = "DEMO: " Then
				  $pathTmp = @ScriptDir & '\' & $pathDemos & '\' & StringMid($pathTmp, 7)
				  Run($pathScite & ' "' & $pathTmp & '"', $pathDemos)
			   Else
				  $pathTmp = @ScriptDir & '\' & $pathExamples & '\' & $pathTmp
				  ; check for file to ensure any separator in list is not 'started':
				  if FileExists($pathTmp) then Run($pathScite & ' "' & $pathTmp & '"', $pathExamples)
			   EndIf
			EndIf


		 Case $btnSetup
			if not FileInstall('.\au3Irr2_Launcher_setup.au3', @TempDir & "\", True) then 
			   MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot execute au3Irr2_Launcher_setup.au3!")
			ElseIf not FileInstall('.\buildHelp\AutoIt.chm', @TempDir & "\", True) then 
			   MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot install AutoIt.chm!")
			ElseIf not FileInstall('au3Irr2.user.calltips.api', @TempDir & "\", True) then 
			   MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot install au3Irr2.user.calltips.api!")
			Else
			   Run('"' & $pathAu3 & '" "' & @TempDir & '\au3Irr2_Launcher_setup.au3" ' & _
		               '"' & $SCRIPTTITLE & '" ' & _
					   '"' & $pathHelpDir & '" ' & _
					   '"' & $pathHelp & '" ' & _
					   '"' & $pathSciteDir & '" ' & _
					   '"' & $pathAu3Dir & '"', @ScriptDir)

			   ; the setup helper script is using #requireAdmin. This will force autoIt3.exe to re-start
			   ; the script; with result of a new process. So we need another indicator that the script
			   ; has been finished. Let's look for existence of a file, deleted at end of the setup script:
;~ 			   while FileExists(@TempDir & '\AutoIt.chm')
;~ 				  Sleep(500)
;~ 			   WEnd
;~ 			   Sleep(500)
;~ 			   FileDelete(@TempDir & '\au3Irr2_Launcher_setup.au3')
			EndIf
;~ 			; only for development: move a newly created au3Irr2.chm to where it belongs (i.e. root dir of au3Irr2):
;~ 			if FileExists($pathHelpDir & "\internal_tools\buildHelp\au3Irr2.chm") Then
;~ 				if not FileMove($pathHelpDir & "\internal_tools\buildHelp\au3Irr2.chm", $pathHelpDir, 1) Then
;~ 					MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot move au3Irr2.chm from buildDir!")
;~ 					ContinueCase
;~ 				EndIf
;~ 			EndIf

;~ 			; merging the help file:
;~ 			$ret = MsgBox(32 + 8192 + 4, $SCRIPTTITLE, "Merge au3Irr2 help into local autoIt help?" & _
;~ 					@LF & @LF & "(Backup of original " & $pathAu3Dir & "\AutoIt.chm" & _
;~ 					@LF & "will be created for later restore.)")

;~ 			if $ret = 6 Then ; Yes: merge au3Help
;~ 				if NOT FileCopy($pathHelp, $pathAu3Dir, True) Then ContinueCase
;~ 				if NOT FileExists($pathAu3Dir & "AutoIt_org.chm") then
;~ 					if NOT FileCopy($pathAu3Dir & "AutoIt.chm", $pathAu3Dir & "\AutoIt_org.chm") Then ContinueCase
;~ 				EndIf

;~ 				if not FileInstall('.\buildHelp\AutoIt.chm', $pathAu3Dir, True) then ContinueCase
;~ 			EndIf

;~ 			; adding/updating the user calltips:
;~ 			$ret = MsgBox(32 + 8192 + 4, $SCRIPTTITLE, "Add/Update calltips for SciTE?")

;~ 			if $ret = 6 Then ; Yes: merge au3Help
;~ 				if not FileInstall('au3Irr2.user.calltips.api', $pathSciteDir & "api\", True) then ContinueCase
;~ 				if NOT FileCopy($pathSciteDir & "api\au3.api", $pathSciteDir & "api\au3.api_org", 1) Then ContinueCase

;~ 			    $hIn = FileOpen($pathSciteDir & "api\au3.api_org", 0)
;~ 				$hOut = FileOpen($pathSciteDir & "api\au3.api", 2)
;~ 				if $hOut = - 1 then ContinueCase

;~ 				$bWrite = True
;~ 				While True
;~ 					$sLine = FileReadLine($hIn)
;~ 					If @error = -1 Then ExitLoop
;~ 					if StringInStr($sLine, "userCallTips for au3Irr2") then $bWrite = False
;~ 					if $bWrite then FileWriteLine($hOut, $sLine)
;~ 					if StringInStr($sLine, "End of au3Irrlicht2 calltip definitions") then $bWrite = True
;~ 				Wend
;~ 				FileClose($hIn)
;~ 				if NOT FileCopy($pathSciteDir & "api\au3.api", $pathSciteDir & "api\au3.api_org", 1) Then ContinueCase

;~ 				if NOT $bWrite then
;~ 					MsgBox(16 + 8192, $SCRIPTTITLE, "Previous calltip definition block corrupt! Check/restore your au3.api file!")
;~ 				Else
;~ 					$sText = FileRead($pathSciteDir & "api\au3Irr2.user.calltips.api")
;~ 					FileWrite($hOut, $sText)
;~ 					MsgBox(64 + 8192, $SCRIPTTITLE, "Done.")
;~ 				EndIf
;~ 				FileClose($hOut)

;~ 			EndIf
;~ 		Case 666 ; error during $btnSetup
;~ 			MsgBox(48 + 8192, $SCRIPTTITLE, "Cannot complete setup (missing rights in au3 installation dir, or open files?), sorry!" & @LF & "Please RUN exampleLauncher AS ADMINISTRATOR and retry!")

		Case $btnQuit, $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
