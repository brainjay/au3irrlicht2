;==============================================================================
; Generate the "xxx Management.htm" pages
; from the "xxx TOC.hhc"

; Input and output directories are read from 'txt2htm.ini'
; The directory should contain either keywords or functions; not both!
;
; 19 Jan 2009 - jpm - jpm@autoitscript.com

; Modificated for the au3Irrlicht2 UDF from linus
; 10-08-11

;==============================================================================

Opt("TrayIconDebug", 1)
FileChangeDir(@ScriptDir)

Global $FUNCTION_OUT_DIR = IniRead("txt2htm.ini", "Output", "functions", "ERR")
Global $UDFs_OUT_DIR = IniRead("txt2htm.ini", "Output", "libfunctions", "ERR")

If $FUNCTION_OUT_DIR = "ERR" Or $UDFs_OUT_DIR = "ERR" Then
	MsgBox(4096, "Error", "Could not read txt2htm.ini")
	Exit
EndIf

Global $ReGen_AutoIt = StringInStr($CmdLineRaw, "/AutoIt")
Global $ReGen_UDFs = StringInStr($CmdLineRaw, "/UDFs")
If $ReGen_AutoIt = 0 And $ReGen_UDFs = 0 Then
	$ReGen_AutoIt = 0
	$ReGen_UDFs = 1
EndIf

Global $hOut ;handle to the output file
Global $hIn ;handle to current input file
Global $OUTPUT_DIR
Global $RefType, $RefTypeS
Global $FTOC, $FNAME, $NAME, $NestedMgt, $ahOut[3]
$ahOut[0] = -1

If $ReGen_AutoIt Then
	$OUTPUT_DIR = $FUNCTION_OUT_DIR
	$FTOC = ""
	$NestedMgt = 0

	$RefType = "Function"
	$RefTypeS = "Function"
	$hIn = FileOpen("AutoIt3 TOC.hhc", 0) ;input mode
	GetFirstManagement()
	genFiles()
	FileClose($hIn)
EndIf

If $ReGen_UDFs Then
	$OUTPUT_DIR = $UDFs_OUT_DIR
	$FTOC = ""
	$NestedMgt = 0

	$RefType = "au3Irr2 Function"
	$RefTypeS = "au3Irr2 Functions"
	$hIn = FileOpen("au3Irr2 TOC.hhc", 0) ;input mode
	GetFirstManagement()
	genFiles()
	FileClose($hIn)
EndIf
Exit

Func putHeader()
	put('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">')
	put('<head>')
	put('  <title>' & $RefType & "s" & '</title>')
	put('  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">')
	put('  <link href="../../html_static/css/default.css" rel="stylesheet" type="text/css">')
	put('</head>')
	put('')
	put('<body>')
	put('<h1>au3Irr2 ' & $NAME & ' functions Reference</h1>')
	put('<p>Below is a complete list of the au3Irr2 ' & $NAME & ' functions.&nbsp;')
	put('Click on a function name for a detailed description.</p>')
	If $RefType = "au3Irr2 Function" Then
		put('<p>When using them you need to add a<br><b>#include &lt;au3Irrlicht2.au3&gt;</b> or <b>#include &lt;.&#x05c;include&#x05c;au3Irr2_' & $NAME & '.au3&gt;</b>.</p>')
	Else
		If StringInStr($NAME, "GUI") = 1 Then
			put('<p>See <a href="..\guiref\GUIConstants.htm">Gui Constants include files</a> if you need to use the related controls Constants .</p>')
		EndIf
	EndIf
	put('<p>&nbsp;</p>')
	put('')
	put('<table bordercolor="#c0c0c0" cellpadding="5" cellspacing="0" width="100%" border="1">')
	put('<tr>')
	put('  <td height="16" bgcolor="#000099" width="25%"><font color="#ffffff"><b>' & $RefType & '</b></font></td>')
	put('  <td height="16" bgcolor="#000099" width="75%"><font color="#ffffff"><b>Description</b></font></td>')
	put('</tr>')
EndFunc   ;==>putHeader

Func putEntry()
	; write CatEntries
	Local $Funcname = GetFuncName($FNAME)
	If $Funcname = "" Then Return
	put('<tr>')
	put('<td><a href="' & $FNAME & '">' & $Funcname & '</a></td>')
	put('<td>' & GetFuncDesc($FNAME) & '</td>')
	put('</tr>')
EndFunc   ;==>putEntry

Func GetFuncDesc($NFname)
	Local $funcdesc = FileReadLine($OUTPUT_DIR & $NFname, 13)
	$funcdesc = StringReplace($funcdesc, '<p>', '')
	$funcdesc = StringReplace($funcdesc, '</p>', '')
	Return $funcdesc
EndFunc   ;==>GetFuncDesc

Func GetFuncName($NFname)
	Local $Funcname = FileReadLine($OUTPUT_DIR & $NFname, 4)
	If StringInStr($Funcname, "Function", 1) Then
		$Funcname = StringReplace($Funcname, '<title>Function ', '')
	Else
		$Funcname = StringReplace($Funcname, '<title>Keyword ', '')
	EndIf
	$Funcname = StringReplace($Funcname, '</title>', '')
	$Funcname = StringStripWS($Funcname, 3)
	Return $Funcname
EndFunc   ;==>GetFuncName

Func GetFileName()
	Local $line
	$FNAME = ""
	While 1
		$line = FileReadLine($hIn)
		If @error Then Return SetError(@error, 0, 0) ; invalid TOC.hhc
		If StringInStr($line, '<param name=') Then
			; a StringRegExpReplace would be better ...
			If StringInStr($line, '"Local"') Then
				$FNAME = StringReplace($line, '<param name="Local" value="' & $OUTPUT_DIR, '', 1)
				$FNAME = StringReplace($FNAME, '">', '', 1)
				$FNAME = StringStripWS($FNAME, 3)
			Else
				$NAME = StringReplace($line, '<param name="Name" value="', '', 1)
				$NAME = StringReplace($NAME, '">', '', 1)
				$NAME = StringReplace($NAME, ' Management', '', 1)
				$NAME = StringStripWS($NAME, 3)
			EndIf

		Else
			; skip until end  object
			If StringInStr($line, '</OBJECT>') Then Return 1
			If StringInStr($line, '</UL>') Then
				$FNAME = "</UL>"
				Return 1
			EndIf
		EndIf
	WEnd
EndFunc   ;==>GetFileName

Func GetFirstManagement()
	Local $line

	; position on the top level as "Function Reference" or "User Defined Functions"
	While 1
		$line = FileReadLine($hIn)
		If @error Then Return SetError(@error, 0, 0) ; invalid TOC.hhc
		If StringInStr($line, '<param name="Name" value="' & $RefTypeS & " Reference") Then ExitLoop
	WEnd

	While @error = 0 And StringInStr($FNAME, " Management") = 0
		GetFileName()
	WEnd

	If @error Then Return SetError(@error, 0, 0)
	$FTOC = $FNAME
	Return 1
EndFunc   ;==>GetFirstManagement

Func GetNextManagement()
	Local $line
	If StringInStr($FNAME, " Management") = 0 Then GetFileName()
	$FTOC = $FNAME
	Return StringInStr($FNAME, " Management")
EndFunc   ;==>GetNextManagement

Func GetNextEntry()

	Local $ret = GetFileName()

	If StringInStr($FNAME, " Management") Then
		; ignore previous entry as it is a sublevel has been defined
		$FTOC = $FNAME
		genFiles()
		Return 1
	EndIf

	If StringInStr($FNAME, "</UL>") Then
		Return 0
	EndIf

	Return 1
EndFunc   ;==>GetNextEntry

Func genFiles()
	Do
		$hOut = FileOpen($OUTPUT_DIR & $FTOC, 2)
		$NestedMgt += 1
		$ahOut[$NestedMgt] = $hOut
		PutHeader()
		While GetNextEntry()
			PutEntry()
		WEnd
		put('</table>')
		put('')
		put('</body>')
		FileClose($hOut)
		$NestedMgt -= 1
		$hOut = $ahOut[$NestedMgt]
	Until GetNextManagement() = 0

	Return
EndFunc   ;==>genFiles


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