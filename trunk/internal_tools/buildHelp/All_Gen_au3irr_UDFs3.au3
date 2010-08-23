;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author: Jos van der Zande
; Email : jdeb@autoitscript.com

; Modificated for the au3Irrlicht2 UDF from linus
; 10-08-11
; 10-08-23 - added original freeBasic Wrapper documentation into toc
;
; Script Function:
; Store this script in the Helpfile directory where the project file is stored.
; It assumes that the Include directory is a subdir of directory defined in the registry key: "HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt","Installdir"
; It will read all *.au3 files in this include directory and create the \html\libfunctions.htm.
; It wil also create one description file per ???.au3 it finds. this will be stored in \html\libfunctions\????.htm.
; All descriptions which are specified in the ???.AU3 are copied into this description htm file and
; references are created to these in the \html\libfunctions.htm.
;******************************************************
;Read all Include functions and generate helpfile
;******************************************************
; remove old file that contains a list of userfunctions
; Generate the index File

;#include "OutputLib.au3"
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
Opt("TrayIconDebug", 1)

Global Enum $OUTPUT_PROGRESS, $OUTPUT_BUILD
If Not IsDeclared("WM_COPYDATA") Then Assign("WM_COPYDATA", 0x4A, 2)
Global Const $COPYDATASTRUCT = "uint;dword;ptr"
Global Const $g_sOutputWindowTitle = "AutoIt Build Script Output"
Global Const $g_sOutputWindowText = "This is hidden text"
Global $L_MSG = ""
FileChangeDir(@ScriptDir)

_OutputBuildWrite("Generate HTM files for all changed UDFs" & @CRLF)
RunWait('"' & @AUTOITEXE & '"' & ' All_txt2Htm.au3 /RegenAll')

_OutputBuildWrite("Generate Reference HTM files for UDFs" & @CRLF)
RunWait('"' & @AUTOITEXE & '"' & ' All_Gen_RefPage.au3 /UDFs')

_OutputBuildWrite("Creating the index and TOC entries for all User defined functions" & @CRLF)
Main()

_OutputBuildWrite("Generate Management HTM files for UDFs" & @CRLF)
RunWait('"' & @AUTOITEXE & '"' & ' All_Gen_MgtPages.au3 /UDFs')


Func Main()
   ;
   ; **********************************************************
   ; create the Index/TOC with all UDF functions
   ; **********************************************************
   ;

   $FO_TOC_HND = FileOpen("au3Irr2 TOC.hhc", 2)
   FileWriteLine($FO_TOC_HND, '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">')
   FileWriteLine($FO_TOC_HND, '<HTML>')
   FileWriteLine($FO_TOC_HND, '<HEAD>')
   FileWriteLine($FO_TOC_HND, '<meta name="GENERATOR" content="Microsoft&reg; HTML Help Workshop 4.1">')
   FileWriteLine($FO_TOC_HND, '<!-- Sitemap 1.0 -->')
   FileWriteLine($FO_TOC_HND, '</HEAD><BODY>')
   FileWriteLine($FO_TOC_HND, '<OBJECT type="text/site properties">')
   FileWriteLine($FO_TOC_HND, '<param name="Window Styles" value="0x800025">')
   FileWriteLine($FO_TOC_HND, '<param name="ImageType" value="Folder">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '<UL>')
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="au3Irr2 Functions Reference">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html\libfunctions.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '<UL>')
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="au3Irrlicht2 Introduction">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html_static\au3irr2.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="License">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html_static\license.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="History/Changelog">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html\history.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')

   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="Tutorials">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '<UL>')
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="Readme">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html_static\tutorials_readme.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '</UL>')


   $FO_INDEX_HND = FileOpen("au3Irr2 Index.hhk", 2)
   FileWriteLine($FO_INDEX_HND, '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">')
   FileWriteLine($FO_INDEX_HND, '<HTML>')
   FileWriteLine($FO_INDEX_HND, '<HEAD>')
   FileWriteLine($FO_INDEX_HND, '<meta name="GENERATOR" content="Microsoft&reg; HTML Help Workshop 4.1">')
   FileWriteLine($FO_INDEX_HND, '<!-- Sitemap 1.0 -->')
   FileWriteLine($FO_INDEX_HND, '</HEAD><BODY>')
   FileWriteLine($FO_INDEX_HND, '<UL>')
   FileWriteLine($FO_INDEX_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_INDEX_HND, '<param name="Name" value="au3Irr2 Functions Reference">')
   FileWriteLine($FO_INDEX_HND, '<param name="Local" value="html\libfunctions.htm">')
   FileWriteLine($FO_INDEX_HND, '</OBJECT>')

   FileDelete("Userfunctions.txt")
   FileDelete(@ScriptDir & "\genindex.log")

   $HELPFILEDIR = @ScriptDir                 ; specify the root of the helpfiles

   $FI_DIR_HND = FileOpen($HELPFILEDIR & "\txt2htm\txtlibfunctions\Categories.toc", 0)
   ; Check if file opened for reading OK
   If $FI_DIR_HND = -1 Then
      MsgBox(0, "Error", "Unable to open:" & $HELPFILEDIR & "\txt2htm\txtlibfunctions\Categories.toc")
      Exit
   EndIf

   DirCreate($HELPFILEDIR & "\html\libfunctions")

   	; Copy changelog.txt from the include directory needed to build the helpfile
	FileCopy('..\..\..\install\include\changelog.txt', $HELPFILEDIR & "\html\libfunctions\ChangeLog.txt", 1)

   ; write the top of the page of the userfunctions page
   $SAVE_CATEGORY = ""
   While 1
      ; get filename from incude subdir
      $FLINE = FileReadLine($FI_DIR_HND)
      If @error = -1 Then
         ExitLoop
      EndIf
      $FTOC = StringLeft($FLINE, StringInStr($FLINE, "|") - 1)
      $FNAME = StringTrimLeft($FLINE, StringInStr($FLINE, "|"))
      ;;ShowMenu(" *** " & $FTOC & " -> " & $FNAME, 2)
      ; close previous category
      If $SAVE_CATEGORY <> $FTOC Then
         ; close previous category
         If $SAVE_CATEGORY <> "" Then
            FileWriteLine($FO_TOC_HND, "</UL>")
         EndIf
         $SAVE_CATEGORY = $FTOC
         FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
         FileWriteLine($FO_TOC_HND, '<param name="Name" value="' & $FTOC & '">')
         FileWriteLine($FO_TOC_HND, '<param name="Local" value="html\libfunctions\' & $FTOC & '.htm">')
         FileWriteLine($FO_TOC_HND, '</OBJECT>')
         FileWriteLine($FO_TOC_HND, "<UL>")
      EndIf
      If Not FileExists('html\libfunctions\' & $FNAME & '.htm') Then
         WriteLog("File not found...skipped :" & 'html\libfunctions\' & $FNAME & '.htm')
      Else
         WriteLog("File processed:" & 'libfunctions\' & $FNAME & '.htm')
         ; write TOC entry
         FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
         FileWriteLine($FO_TOC_HND, '   <param name="Name" value="' & $FNAME & '">')
         FileWriteLine($FO_TOC_HND, '   <param name="Local" value="html\libfunctions\' & $FNAME & '.htm">')
         FileWriteLine($FO_TOC_HND, '   </OBJECT>')
         ; write index entry
         FileWriteLine($FO_INDEX_HND, '<LI> <OBJECT type="text/sitemap">')
         FileWriteLine($FO_INDEX_HND, '   <param name="Name" value="' & $FNAME & '">')
         FileWriteLine($FO_INDEX_HND, '   <param name="Local" value="html\libfunctions\' & $FNAME & '.htm">')
         FileWriteLine($FO_INDEX_HND, '   </OBJECT>')
      EndIf
      FileWriteLine("Userfunctions.txt", $FNAME)
   Wend
   ; close off the Category FileChangeDir and end the TOC UL for the last include file
   FileWriteLine($FO_TOC_HND, "</UL>")
   ; Add entry for credits.htm
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="Credits">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html_static\credits.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')

   ; add the original freeBasic Wrapper documentation:
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="freeBasic Wrapper docs">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html_static\FB_Documentation\The Irrlicht Wrapper Introduction.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '<UL>')
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="Reference">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html_static\FB_Documentation\The Irrlicht Wrapper Reference.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="Release notes">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html_static\FB_Documentation\The Irrlicht Wrapper Release Notes.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '<LI> <OBJECT type="text/sitemap">')
   FileWriteLine($FO_TOC_HND, '<param name="Name" value="Platform support">')
   FileWriteLine($FO_TOC_HND, '<param name="Local" value="html_static\FB_Documentation\The Irrlicht Wrapper Platform Support.htm">')
   FileWriteLine($FO_TOC_HND, '</OBJECT>')
   FileWriteLine($FO_TOC_HND, '</UL>')


   ;
   ; end the TOC UL for UDF's
   FileWriteLine($FO_TOC_HND, "</UL>")
   FileWriteLine($FO_TOC_HND, "</UL>")
   FileWriteLine($FO_TOC_HND, '</BODY></HTML>')
   FileClose($FO_TOC_HND)
   ;
   FileWriteLine($FO_INDEX_HND, '</UL>')
   FileWriteLine($FO_INDEX_HND, '</BODY></HTML>')
   FileClose($FO_INDEX_HND)

   FileClose($FI_DIR_HND)
   ; cleanup
   FileDelete("Userfunctions.txt")
EndFunc   ;==>Main
;
Func _FileRead2Array($SFILEPATH, ByRef $AARRAY)
   Local $HFILE
   $HFILE = FileOpen($SFILEPATH, 0)
   If $HFILE = -1 Then
      SetError(1)
      Return 0
   EndIf
   $AARRAY = StringSplit( StringStripCR( FileRead($HFILE, _
         FileGetSize($SFILEPATH))), @LF)
   FileClose($HFILE)
   Return 1
EndFunc   ;==>_FileRead2Array
;
Func Debug($MESSAGE)
   MsgBox(4096, 'debug', $MESSAGE)
EndFunc   ;==>Debug
;
Func WriteLog($LMSG)
   FileWriteLine(@ScriptDir & "\genindex.log", $LMSG)
EndFunc   ;==>WriteLog
;
Func GetUDFDesc($NFname)
   Return FileReadLine('html\libfunctions\' & $NFname & '.htm', 13)
EndFunc   ;==>GetUDFDesc


#Region _OutputBuildWrite()
; ===================================================================
; _OutputBuildWrite($sData)
;
; Writes data to the build pane.
; Parameters:
;	$sData - IN - The data to write.
; Returns:
;	True if successful, False otherwise.
; ===================================================================
Func _OutputBuildWrite($sData)
	Return __OutputWrite($OUTPUT_BUILD, $sData)
EndFunc	; _OutputBuildWrite()
#EndRegion _OutputBuildWrite()

#Region _OutputWindowSetState()


#Region __OutputWrite()
; ===================================================================
; __OutputWrite($nOutput, Const ByRef $sData)
;
; Handles writing to an output pane by taking care of the necessary communication logic.
; Parameters:
;	$nOutput - IN - An $OUTPUT_ flag.
;	$sData - IN - The data to write.
; Returns:
;	True if successful, False otherwise.
; ===================================================================
Func __OutputWrite($nOutput, Const ByRef $sData)
	; Find the target window.
	Local $nOld = Opt("WinDetectHiddenText", True)
	Local $hTarget = WinGetHandle($g_sOutputWindowTitle, $g_sOutputWindowText)
	Opt("WinDetectHiddenText", $nOld)
	If Not $hTarget Then Return False

	; Use the hidden window as the source.
	Local $hSource = WinGetHandle(AutoItWinGetTitle())

	; Create the structures
	Local $cds = DllStructCreate($COPYDATASTRUCT)
	Local $nSize = StringLen($sData) + 1
	Local $string = DllStructCreate("char[" & $nSize & "]")

	; Fill the structures
	DllStructSetData($string, 1, $sData)
	DllStructSetData($cds, 1, $nOutput)
	DllStructSetData($cds, 2, $nSize)
	DllStructSetData($cds, 3, DllStructGetPtr($string))

	; Send the message.
	Local $aRet = DllCall("user32.dll", "int", "SendMessage", "hwnd", $hTarget, "int", $WM_COPYDATA, _
		"hwnd", $hSource, "ptr", DllStructGetPtr($cds))
	If @error Then
		Return False
	Else
		Return $aRet[0] = 1
	EndIf
EndFunc	; __OutputWrite()
#EndRegion __OutputWrite()

#EndRegion Private Members
