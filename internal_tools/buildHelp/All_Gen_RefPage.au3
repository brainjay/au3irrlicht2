#include <file.au3>
;==============================================================================
; Generate the keywords.htm or functions.htm reference page from
; the specially formatted TXT files
;
; Input and output directories are read from 'txt2htm.ini'
; The directory should contain either keywords or functions; not both!
;
; 30 Jan 2004 - CyberSlug - philipgump@hotmail.com
; 18 may 2004 - JdeB - jdeb@autoitscript.com
;             - Added support for UDF files.
;             - Changed the way the link to the html file is made
; 18 Sep 2005 - jpm - jpm@autoitscript.com
;             - Added /AutoIt /UDFs command parameters
; 09 Oct 2007 - jpm - jpm@autoitscript.com
;             - Ignored $Tag... files
;==============================================================================

Opt("TrayIconDebug", 1)

$KEYWORD_IN_DIR = IniRead("txt2htm.ini", "Input", "keywords", "ERR")
$FUNCTION_IN_DIR = IniRead("txt2htm.ini", "Input", "functions", "ERR")
$UDFs_IN_DIR = IniRead("txt2htm.ini", "Input", "libfunctions", "ERR")
$OUTPUT_DIR = IniRead("txt2htm.ini", "Output", "mainHtml", "ERR")

If $KEYWORD_IN_DIR = "ERR" Or $FUNCTION_IN_DIR = "ERR" Or $UDFs_IN_DIR = "ERR" Or $OUTPUT_DIR = "ERR" Then
   MsgBox(4096, "Error", "Could not read txt2htm.ini")
   Exit
EndIf

Global $ReGen_AutoIt = StringInStr($CmdLineRaw, "/AutoIt")
Global $ReGen_UDFs = StringInStr($CmdLineRaw, "/UDFs")
If $ReGen_AutoIt = 0 AND $ReGen_UDFs = 0 Then
	$ReGen_AutoIt = 1
	$ReGen_UDFs = 1
EndIf

Global $RefType   ;is either "Function" or "Keyword"
Global $hOut      ;handle to the output file
Global $hIn       ;handle to current input file

; Prompt user to indicate if files are Function or Keyword references
$ans = 0
;~ While ($ans < 1 Or $ans > 3) and $ans <> 9
;~    $ans = InputBox("txt2htm", "1=Functions" & @LF & "2=Keywords" & @LF & "3=UDF's" & @LF & "9=ALL")
;~    If @error = 1 Then Exit
;~ Wend
;
If $ReGen_AutoIt Then
	ProgressOn("Generating Refpages", "Functions")
	ProgressSet(0, "","Functions" )
	$RefType = "Function"
	$hOut = FileOpen($OUTPUT_DIR & "functions.htm", 2)  ;overwrite mode
	$INPUT_DIR = $FUNCTION_IN_DIR
	; ### Added this to determine the link to the htm file
	$htmlDir = IniRead("txt2htm.ini", "Output", "functions", "ERR")
	genFile()
	;
	ProgressSet(0, "","Keywords")
	$RefType = "Keyword"
	$hOut = FileOpen($OUTPUT_DIR & "keywords.htm", 2)  ;overwrite mode
	$INPUT_DIR = $KEYWORD_IN_DIR
	; ### Added this to determine the link to the htm file
	$htmlDir = IniRead("txt2htm.ini", "Output", "keywords", "ERR")
	genFile()
EndIf

If $ReGen_UDFs Then
	; ### Added this section for UDFS
	;
	ProgressSet(0, "","UDF's")
	$RefType = "User Defined Function"
	$hOut = FileOpen($OUTPUT_DIR & "libfunctions.htm", 2)  ;overwrite mode
	$INPUT_DIR = $UDFs_IN_DIR
	; ### Added this to determine the link to the htm file
	$htmlDir = IniRead("txt2htm.ini", "Output", "libfunctions", "ERR")
	genFile()
EndIf
Exit

Func genFile()
   put('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">')
   put('<head>')
   put('  <title>' & $RefType & "s" & '</title>')
   put('  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">')
   put('  <link href="css/default.css" rel="stylesheet" type="text/css">')
   put('</head>')
   put('')
   put('<body>')
   put('<h1>' & $RefType & ' Reference</h1>')
   put('<p>Below is a complete list of the ' & StringLower($RefType) & 's available in AutoIt.&nbsp;')
   put('Click on a ' & StringLower($RefType) & ' name for a detailed description.</p>')
   put('<p>&nbsp;</p>')
   put('')
   put('<table bordercolor="#c0c0c0" cellpadding="3" cellspacing="0" width="100%" border="1">')
   put('<tr>')
   put('  <td height="16" bgcolor="#000099" width="25%"><font color="#ffffff"><b>' & $RefType & '</b></font></td>')
   put('  <td height="16" bgcolor="#000099" width="75%"><font color="#ffffff"><b>Description</b></font></td>')
   put('</tr>')


   $TEMP_LIST = @ScriptDir & "\fileList.tmp"

   ; ### moved to previous If
   ;If $RefType = "Function" Then
   ;    $INPUT_DIR = $FUNCTION_IN_DIR
   ;Else
   ;    $INPUT_DIR = $KEYWORD_IN_DIR
   ;EndIf

   ;FileChangeDir($INPUT_DIR)
   ;pipe the list of sorted file names to fileList.tmp:
   _RunCmd('dir ' & $INPUT_DIR & '*.txt /b | SORT > "' & $TEMP_LIST & '"')
   $iTRecs = _FileCountLines($TEMP_LIST)
   $ICRecs = 0

   $hList = FileOpen($TEMP_LIST, 0)  ;readmode
   If $hList = -1 Then
      MsgBox(4096, "Error", $TEMP_LIST & " cannot be read")
      Exit
   EndIf


   Dim $filename
   ;Loop thru each line of fileList.tmp to get the next file
   ;### Added this to determine the link to the htm file
   $htmlDir = StringReplace($htmlDir, '\', '/')

   While $hIn <> - 1
      $filename = FileReadLine($hList)
      If @error Then ExitLoop
      If $filename = "CVS" Then ContinueLoop
      If StringInStr($filename, "$Tag") Then ContinueLoop
      $ICRecs = $ICRecs + 1
      ProgressSet($ICRecs/$iTRecs*100, $filename)
      $path = $INPUT_DIR & $filename
      $hIn = FileOpen($path, 0)  ;read mode

      put('<tr>')

      ; Loop thru each line in the current input file
      $line = FileReadLine($hIn)
      While Not @error
         If StringInStr($line, "###" & $RefType & "###") Then
            $line = StringStripWS( FileReadLine($hIn), 3)
            ;Get 1st non-blank line; (assume it's the keyword/function name)
            While $line = ""
               $line = StringStripWS( FileReadLine($hIn), 3)
            Wend
            $filename = StringReplace($filename, ".txt", ".htm")
            ; ### Change 2 line to determine the link to the htm file
            ;$filename = StringLower($RefType) & 's\' & $filename
            ;$filename = @ScriptDir & '\' & $htmlDir & $filename
            $filename = StringTrimLeft($htmlDir,Stringlen($OUTPUT_DIR)) & $filename
            put('  <td><a href="' & $filename & '">' & $line & '</a></td>')
         EndIf
         If StringInStr($line, "###Description###") Then
            $line = StringStripWS( FileReadLine($hIn), 3)
            ;Get 1st non-blank line; (assume it's the description)
            While $line = ""
               $line = StringStripWS( FileReadLine($hIn), 3)
            Wend
            put('  <td>' & $line & '</td>')
         EndIf
         $line = FileReadLine($hIn)
      Wend

      put('</tr>')
      FileClose($hIn)
   Wend



   put('</table>')
   put('')
   put('</body>')
   put('</html>')

	FileClose($hList)
   FileClose($hOut)
   Return
EndFunc   ;==>genFile


;------------------------------------------------------------------------------
; Write a new line to the output file
;------------------------------------------------------------------------------
Func put($lineToWrite)
   FileWriteLine($hOut, $lineToWrite)
EndFunc   ;==>put

;------------------------------------------------------------------------------
; Run DOS/console commands ... works also in win9x
;------------------------------------------------------------------------------
Func _RunCmd($command)
   FileWriteLine("brun.bat", $command)
   RunWait(@ComSpec & " /c brun.bat", "", @SW_HIDE)
   FileDelete("brun.bat")
   Return
EndFunc   ;==>_RunCmd

;------------------------------------------------------------------------------
; Run DOS/console commands doesn't work in win9x
;------------------------------------------------------------------------------
Func _oRunCmd($command)
   Return RunWait(@ComSpec & " /c " & $command, "", @SW_HIDE)
EndFunc   ;==>_oRunCmd
