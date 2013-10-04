
#cs
 Title: au3Irr2 Launcher Setup
 AutoIt Version: 3.3.8.1
 Author:         linus

 Script Function:
	Helper script for setup function of main script "au3Irr2 Launcher"

 History:
 2013-10-03: First Version (took out functionality of main Launcher to allow separate #requireAdmin)			
#ce ----------------------------------------------------------------------------


#requireAdmin

;#include <ButtonConstants.au3>
;#include <ComboConstants.au3>
;#include <GUIConstantsEx.au3>
;#include <StaticConstants.au3>
;#include <WindowsConstants.au3>
;#include <EditConstants.au3>

#include <file.au3>
#include <array.au3>


opt("MustDeclareVars", True)
global $ret, $sText, $hIn, $hOut, $sLine, $bWrite

if $CmdLine[0] <> 5 then
   MsgBox(16 + 4096 + 0, "au3Irr2 Launcher Setup", "This script is used by the au3Irr2 Launcher and cannot be run directly!")
   exit(1)
EndIf

global $SCRIPTTITLE = $CmdLine[1]
global $pathHelpDir = $CmdLine[2]
global $pathHelp = $CmdLine[3]
global $pathSciteDir = $CmdLine[4]
global $pathAu3Dir = $CmdLine[5]


; only for development: move a newly created au3Irr2.chm to where it belongs (i.e. root dir of au3Irr2):
   if FileExists($pathHelpDir & "\internal_tools\buildHelp\au3Irr2.chm") Then
	   if not FileMove($pathHelpDir & "\internal_tools\buildHelp\au3Irr2.chm", $pathHelpDir, 1) Then
		   MsgBox(48 + 4096, $SCRIPTTITLE, "Cannot move au3Irr2.chm from buildDir!")
		   exitWithError()
	   EndIf
   EndIf

   ; merging the help file:
   $ret = MsgBox(32 + 4096 + 4, $SCRIPTTITLE, "Merge au3Irr2 help into local autoIt help?" & _
		   @LF & @LF & "(Backup of original " & $pathAu3Dir & "\AutoIt.chm" & _
		   @LF & "will be created for later restore.)")

   if $ret = 6 Then ; Yes: merge au3Help
	   if NOT FileCopy($pathHelp, $pathAu3Dir, True) Then exitWithError(1)
	   if NOT FileExists($pathAu3Dir & "AutoIt_org.chm") then
		   if NOT FileCopy($pathAu3Dir & "AutoIt.chm", $pathAu3Dir & "\AutoIt_org.chm") Then exitWithError(2)
	   EndIf

	   if not FileCopy(@TempDir & '\AutoIt.chm', $pathAu3Dir, True) then exitWithError(3)
	   FileDelete(@TempDir & '\AutoIt.chm')
   EndIf

   ; adding/updating the user calltips:
   $ret = MsgBox(32 + 4096 + 4, $SCRIPTTITLE, "Add/Update calltips for SciTE?")

   if $ret = 6 Then ; Yes: merge au3Help
	   if not FileCopy(@TempDir & '\au3Irr2.user.calltips.api', $pathSciteDir & "api\", True) then exitWithError(4)
	   FileDelete(@TempDir & '\au3Irr2.user.calltips.api')
	   if NOT FileCopy($pathSciteDir & "api\au3.api", $pathSciteDir & "api\au3.api_org", 1) Then exitWithError(5)

	   $hIn = FileOpen($pathSciteDir & "api\au3.api_org", 0)
	   $hOut = FileOpen($pathSciteDir & "api\au3.api", 2)
	   if $hOut = - 1 then exitWithError(6)

	   $bWrite = True
	   While True
		   $sLine = FileReadLine($hIn)
		   If @error = -1 Then ExitLoop
		   if StringInStr($sLine, "userCallTips for au3Irr2") then $bWrite = False
		   if $bWrite then FileWriteLine($hOut, $sLine)
		   if StringInStr($sLine, "End of au3Irrlicht2 calltip definitions") then $bWrite = True
	   Wend
	   FileClose($hIn)
	   if NOT FileCopy($pathSciteDir & "api\au3.api", $pathSciteDir & "api\au3.api_org", 1) Then exitWithError(7)

	   if NOT $bWrite then
		   MsgBox(16 + 4096, $SCRIPTTITLE, "Previous calltip definition block corrupt! Check/restore your au3.api file!")
	   Else
		   $sText = FileRead($pathSciteDir & "api\au3Irr2.user.calltips.api")
		   FileWrite($hOut, $sText)
		   MsgBox(64 + 4096, $SCRIPTTITLE, "Done.")
	   EndIf
	   FileClose($hOut)

   EndIf
   
exit(0)
   
; ========================================================================================================================
func exitWithError($where)
; error during $btnSetup
   MsgBox(48 + 4096, $SCRIPTTITLE, "(" & $where & ") Cannot complete setup (missing rights in au3 installation dir, or open files?), sorry!")
   exit(1)
EndFunc ; exitWithError() ================================================================================================
