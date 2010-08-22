#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1
 Author:         linus

 History:
 2010-07-31: Init
 2010-08-01: Fixed header blocks so GuiTemplateBuilder.exe accepts them
 2010-08-08: Added handling of several .au3 (for \include), cleanup of files + dirs,
             building of Categories.toc + includes.txt
 2010-08-08: Fixed handling of #INTERNAL_USE_ONLY# and #NO_DOC_FUNCTION# blocks
 2010-08-11: Deletes now also *.bck in \include when cleaning
 2010-08-19: Added buildHistoryHTML for automatic update of au3irr2's history info
 2010-08-21: Added updateIntroductionHTML and some fixes on buildHistoryHTML.

 Script Function:
	Helper tool for documentation of the au3Irrlicht2 UDF.
	Cleans buildHelp dir before/after help file creation.
	Builds history.html from \include _au3Irr2_changelog.txt
	Updates \internal_tools\buildHelp\html_static\au3irr2.htm with first release header from the
	changelog.txt.
	Scans given UDF or complete dir and (re-) creates needed blocks according to
	UDF conventions.
	Not too much error handling when updating the UDF's - so final files should be compared
	with originals (as backuped in \include)!

 TODO:
 - automatic creation of the usercalltips file.
 - remove all the empty lines from updated UDF's
#ce ----------------------------------------------------------------------------


Opt("MustDeclareVars", True)

const $SCRIPTTITLE = "Help tool V0.3 - 2010 by linus"
global $sLastMsg = ""


global const $TAG_PRE_INCLONCE = "#include-once"
global const $TAG_PRE_INCLUDE = "#include"
global const $TAG_INDEX = "; #INDEX#"
global const $TAG_NODOCFUNC = "; #NO_DOC_FUNCTION#"
global const $TAG_CURRENT = "; #CURRENT#"
global const $TAG_INTERNALUSE = "; #INTERNAL_USE_ONLY#"
global const $TAG_FUNCTION = "; #FUNCTION#"
global const $TAG_DEF_ENUM = "global enum"
global const $TAG_DEF_FUNC = "func "
global const $TAG_DEF_ENDFUNC = "endfunc"
global const $TAG_SKIP = "SKIP"
global const $TAG_ENDBLOCK = "; ========================================================================================="

global const $TEMPLATE_SEPLINE = "; ===============================================================================================================================" & @LF

Global const $TEMPLATE_NEWFUNC = @LF & _
"; #NO_DOC_FUNCTION# =============================================================================================================" & @lf & _
"; Name...........: [functionName]" & @LF & _
"; Description ...: [todo]" & @LF & _
"; Syntax.........: [functionSyntax]" & @LF & _
"; Parameters ....: [param1] - [explanation]" & @LF & _
";                  |[moreTextForParam1]" & @LF & _
";                  [param2] - [explanation]" & @LF & _
"; Return values .: [success] - [explanation]" & @LF & _
";                  [failure] - [explanation]" & @LF & _
";                  |[moreExplanationIndented]" & @LF & _
"; Author ........: [todo]" & @LF & _
"; Modified.......:" & @LF & _
"; Remarks .......: [todo]" & @LF & _
"; Related .......: [todo: functionName, functionName]" & @LF & _
"; Link ..........:" & @LF & _
"; Example .......: [todo: Yes, No]" & @LF & $TEMPLATE_SEPLINE

Global const $TEMPLATE_INDEX = _
	"; #INDEX# =======================================================================================================================" & @LF & _
	"; Title .........: [todo]" & @LF & _
	"; AutoIt Version : [todo]" & @LF & _
	"; Language ......: English" & @LF & _
	"; Description ...: [todo]" & @LF & _
	";                  [todo]" & @LF & _
	";                  [todo]" & @LF & _
	"; Author(s) .....: [todo]" & @LF & _
	"; Dll(s) ........: [todo]" & @LF & $TEMPLATE_SEPLINE

Global const $template_NODOC = _
	"; #NO_DOC_FUNCTION# =============================================================================================================" & @LF & _
	"; Not working/documented/implemented at this time" & @LF

global const $template_INTERNAL = "; #INTERNAL_USE_ONLY# ===========================================================================================================" & _
									@LF
global const $template_CURRENT = "; #CURRENT# =====================================================================================================================" & _
									@LF



; ====================================================================================================================
if not main() Then
	if $sLastMsg = "" then $sLastMsg = "Unspecified problem!"
	MsgBox(16, $SCRIPTTITLE, $sLastMsg)
	Exit 1
Else
	if $sLastMsg = "" then $sLastMsg = "Done."
	MsgBox(64, $SCRIPTTITLE, $sLastMsg)
	exit 0
EndIf


; ====================================================================================================================
func main()
	$sLastMsg = ""
	local $ret
	local $pathDir, $sUDF, $hFile
	local $sCurrent, $sCategories, $sIncludes
	local $pathBuild = @ScriptDir & "\buildHelp\"

; clean the build directory
	$ret = MsgBox(4 + 32, $SCRIPTTITLE, "Clean buildHelp dir?")
	if $ret = 6 then ; YES, clean it
		FileDelete($pathBuild & "*.hhc")
		FileDelete($pathBuild & "*.toc")
		FileDelete($pathBuild & "*.hhk")
		FileDelete($pathBuild & "*.tmp")
		FileDelete($pathBuild & "..\..\include\*.bck")
		FileDelete($pathBuild & "*.log")
		FileDelete($pathBuild & "includes.txt")
		DirRemove($pathBuild & "txt2htm\", 1)
		DirRemove($pathBuild & "html\", 1)
	EndIf


; update one or several UDF's for help file creation
	$ret = MsgBox(3 + 32, $SCRIPTTITLE, "Update all .au3 in a dir (NO for single file, CANCEL to skip this)?")

	If $ret = 7 then ; NO: update single file
		$sUDF = FileOpenDialog($SCRIPTTITLE, @ScriptDir & "\..\include", "(*.au3)", 1 + 2)
		if not FileExists($sUDF) Then
			$sLastMsg = "Canceled."
			Return True
		Else
			if not updateUDF($sUDF, $sCurrent) then return False
		EndIf

	ElseIf $ret = 6 then ; YES: update all .au3 in a dir

; Create/update additional files needed for help file:
	DirCreate($pathBuild & "html")
	local $sRelInfo = buildHistoryHTML(@ScriptDir & "\..\include\_au3Irr2_changelog.txt", $pathBuild & "html\history.htm")
	if $sRelInfo = "" then return false ; error in buildHistoryHTML or missing release info
	if NOT updateIntroductionHTML($pathBuild & "html_static\au3irr2.htm", $sRelInfo) then Return False

		$pathDir = FileSelectFolder("Include dir", "", 0, @ScriptDir)
		$hFile = FileFindFirstFile($pathDir & "\*.au3")
		if $hFile = -1 then
			$sLastMsg = "No .au3 in dir!"
			Return False
		EndIf

		while True
			$sUDF = FileFindNextFile($hFile)
			if @error then ExitLoop
			if not updateUDF($pathDir & "\" & $sUDF, $sCurrent) then
				FileClose($hFile)
				return False
			EndIf
			; prepare includes.txt and categories.toc
			$sIncludes &= $sUDF & @LF
			$sUDF = StringRegExpReplace($sUDF, ".*_(.*).au3", "\1")
			$sCurrent = StringReplace($sCurrent, ";", $sUDF & " Management|")
			$sCategories &= $sCurrent
		WEnd
		FileClose($hFile)

		; write includes.txt and categories.toc
		$hFile = FileOpen($pathBuild & "txt2htm\txtLibFunctions\Categories.toc", 2 + 8)
		if @error then
			$sLastMsg = "Cannot write Categories.toc!"
			Return False
		EndIf
		FileWrite($hFile, $sCategories)
		FileClose($hFile)
		$hFile = FileOpen($pathBuild & "includes.txt", 2 + 8)
		if @error then
			$sLastMsg = "Cannot write includes.txt!"
			Return False
		EndIf
		FileWrite($hFile, $sIncludes)
		FileClose($hFile)

	EndIf


	Return True
EndFunc   ;==>main


; ====================================================================================================================
func updateUDF($pathInFile, ByRef $sCategories)

	$sLastMsg = ""
	local $pathOutFile
	Local $h_outFile
	Local $sHeader, $sIndex, $sNoDoc, $sCurrent, $sInternal, $sBody


	;$pathInFile = FileOpenDialog($SCRIPTTITLE, @ScriptDir, "(*.au3)", 1 + 2)
	$pathOutFile = StringReplace($pathInFile, ".au3", "_bck.au3")

	$pathOutFile = $pathInFile
	$pathInFile = StringReplace($pathInFile, ".au3", ".bck")
	if not FileCopy($pathOutFile, $pathInFile, 1) then ; create backup and use it as inFile
		$sLastMsg = "Cannot copy " & $pathOutFile & " to " & $pathInFile
		Return False
	EndIf

	; parse UDF and finish returned blocks:
	if not parseUDF($pathInFile, $sHeader, $sIndex, $sNoDoc, $sCurrent, $sInternal, $sBody) Then Return False
	$sCategories = $sCurrent
	if $sIndex = "" then $sIndex = $TEMPLATE_INDEX
	$sNoDoc = $template_NODOC & $sNoDoc & $TEMPLATE_SEPLINE
	$sCurrent = $template_CURRENT & $sCurrent & $TEMPLATE_SEPLINE
	$sInternal = $template_INTERNAL & $sInternal & $TEMPLATE_SEPLINE


	$h_outFile = FileOpen($pathOutFile, 2) ; (over) write
	if $h_outFile = -1 then
		$sLastMsg = "Cannot open " & $pathOutFile
		Return False
	Else
		FileWrite($h_outFile, $sHeader & @LF & $sIndex & @LF & $sNoDoc & @LF & $sCurrent & @LF & $sInternal & @LF & $sBody & @LF )
		FileClose($h_outFile)
	EndIf

	Return True
EndFunc   ;==>updateUDF



; ====================================================================================================================
func parseUDF($pathFile, ByRef $sHeader, byRef $sIndex, ByRef $sNoDoc, ByRef $sCurrent, ByRef $sInternal, byRef $sBody)
; helper function for updateUDF

	$sLastMsg = ""
	local $i, $parseFlag = "", $boolFuncHeader = False
	local $sLine, $sCheckLine, $sTmp
	local $aTags[8] = [ $TAG_INDEX, $TAG_NODOCFUNC, $TAG_CURRENT, $TAG_INTERNALUSE, _
						$TAG_FUNCTION, $TAG_DEF_ENUM, $TAG_DEF_FUNC, $TAG_DEF_ENDFUNC ]


	Local $h_File = FileOpen($pathFile, 0) ; reading
	if $h_File = -1 then
		$sLastMsg = "Cannot open " & $pathFile
		Return False
	EndIf

	$sHeader = $TAG_PRE_INCLONCE & @LF & @LF ; be sure it's in UDF and on top

	while True
		$sLine = FileReadLine($h_File)
		If @error = -1 Then ExitLoop ; EOF

		$sCheckLine = StringStripWS($sLine, 1 + 2) ; remove leading + trailing spaces for checks

		; skip #include-once - already in header
		if StringLeft($sCheckLine, StringLen($TAG_PRE_INCLONCE)) = $TAG_PRE_INCLONCE then ContinueLoop

		; set all includes to header
		if StringLeft($sCheckLine, StringLen($TAG_PRE_INCLUDE)) = $TAG_PRE_INCLUDE then
			$sHeader &= $sLine & @LF
			ContinueLoop
		EndIf


		for $i = 0 to UBound($aTags) - 1 ; check if parseFlag needs to be updated to current region:
			if StringLeft($sCheckLine, StringLen($aTags[$i])) = $aTags[$i] then $parseFlag = $aTags[$i]
		next ; $i


		Switch $parseFlag

			; we are inside a block to be ignored
			case $TAG_SKIP
				ContinueLoop

			; build #INDEX#
			Case $TAG_INDEX
				$sIndex &= $sLine & @LF
				if StringLeft($sCheckLine, StringLen($TAG_ENDBLOCK)) = $TAG_ENDBLOCK then $parseFlag = ""
				ContinueLoop

			; skip #CURRENT# - it's rebuild
			Case $TAG_CURRENT
				if StringLeft($sCheckLine, StringLen($TAG_ENDBLOCK)) = $TAG_ENDBLOCK then $parseFlag = ""
				ContinueLoop

			; handle #INTERNAL_USE_ONLY# and #NO_DOC_FUNCTION#
			Case $TAG_NODOCFUNC, $TAG_INTERNALUSE
				$sTmp = $sLine ; maybe needed later
				$sLine = FileReadLine($h_File)
				If @error = -1 Then ExitLoop ; EOF

				; both can introduce informational block OR header before function - check this:
				$sLine = StringStripWS($sLine, 1 + 2) ; remove leading + trailing spaces

				if NOT ( StringLeft($sLine, 18) = "; Name...........:" ) then ; function indicator?
					$parseFlag = $TAG_CURRENT ; info blocks are rebuild, so ignore same way as for #current#
					; ... but be sure we have not already reached the end line of the block:
					if StringLeft($sLine, StringLen($TAG_ENDBLOCK)) = $TAG_ENDBLOCK then $parseFlag = ""
					ContinueLoop
				Else ; it's for a function
					$boolFuncHeader = True ; keep info it's there
					$sBody &= $sTmp & @LF
					; update info blocks:
					$sTmp = StringStripWS( StringReplace($sLine, "; Name...........:", ""), 1)
					if $parseFlag = $TAG_NODOCFUNC Then
						$sNoDoc &= ';' & $sTmp & @LF
					Else
						$sInternal &= ';' & $sTmp & @LF
					EndIf
					$parseFlag = "" ; let this and following lines pass until next tag

				EndIf

			; handle #FUNCTION#
			Case $TAG_FUNCTION
				$boolFuncHeader = True ; keep info it's there
				$sBody &= $sLine & @LF

				$sLine = FileReadLine($h_File) ; get func name
				If @error = -1 Then ExitLoop ; EOF
				$sLine = StringStripWS($sLine, 1 + 2) ; remove leading + trailing spaces

				; update info block:
				$sTmp = StringStripWS( StringReplace($sLine, "; Name...........:", ""), 1)
				$sCurrent &= ';' & $sTmp & @LF
				$parseFlag = "" ; let this and following lines pass until next tag

			; handle func
			Case $TAG_DEF_FUNC
				$parseFlag = "" ; let this and following lines pass until next tag
				if NOT $boolFuncHeader then ; oops - seems it has no documentation header yet:
					$sTmp = StringRegExpReplace($sLine, ".*? (.*?)\(.*", "\1")
					$sNoDoc &= ';' & $sTmp & @LF
					$sTmp = StringReplace($TEMPLATE_NEWFUNC, "[functionName]", $sTmp )
					$sTmp = StringReplace($sTmp, "[functionSyntax]", StringRegExpReplace($sLine, ".*? (.*?\)).*", "\1") )
					$sBody &= $sTmp
				EndIf

		EndSwitch ; $parseFlag

		; all special cases should be filtered out now and "continueLooped" if needed - so store current line:
		if NOT ( $sBody = "" AND $sLine = "" ) then $sBody &= $sLine & @LF
	WEnd


	FileClose($h_File)
	Return True
EndFunc   ;==>parseFile



; ====================================================================================================================
func buildHistoryHTML($sPathSrc, $sPathOut)
; creates history .html $sPathOut from given history .txt file $sPathSrc
; Returns version text from first found release info (for updating the introduction .html)

; FORMATING COMMENTS from the history file:
; this file is used to create history of help file. So it need to be well formated:
; empty lines or lines with leading ';' are ignored
; '=' in row1 defines header for release information (all '=' are removed for .html):
; = [release number] ([date info]) ===========
; First found release info is also used to update the static introduction .html
; lines starting in row 1 become headers
; lines with '>' in row start a header
; lines with '+' in row start a list point in .html (with a bullet)
; lines with '-' in row start an ignored list point (history details not interesting for normal users)
; all following indented lines (starting in row >= 3) belong to the current .html or ignored list point
; '[' and ']' can be used to set text to bold in .html

	$sLastMsg = ""
	local $currentVersionText = ""

	local $hIn = FileOpen($sPathSrc)
	if $hIn = -1 Then
		$sLastMsg = "Cannot open " & $sPathSrc & " for building history .html!"
		Return False
	EndIf

	local $hOut = FileOpen($sPathOut, 2)
	if $hOut = -1 Then
		$sLastMsg = "Cannot open " & $sPathOut & " for building history .html!"
		Return False
	EndIf

; write .html header:
	FileWriteLine($hOut, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>')
	FileWriteLine($hOut, '<title>au3Irr2 History/Changelog</title>')
	FileWriteLine($hOut, '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">')
	FileWriteLine($hOut, '<link href="./../html_static/css/default.css" rel="stylesheet" type="text/css">')
	FileWriteLine($hOut, '</head><body>')
	FileWriteLine($hOut, '<h1>au3Irr2 History/Changelog</h1>')
	FileWriteLine($hOut, '<p>This file was created automatically as a subset. See <b>\include\_au3Irr2_changelog.txt</b> for complete list of changes.</p>')

; parse the changelog .txt file:
	local $sIn, $sInStripped, $sListPoint
	local $bConsiderLastLine = False

	while True
		if NOT $bConsiderLastLine then ; use pre-read line from inside the loop if there
			$sIn = FileReadLine($hIn)
			If @error = -1 Then ExitLoop ; EOF
		Else
			$bConsiderLastLine = False
		EndIf

		$sInStripped = StringStripWS($sIn, 1 + 2)
		; skip empty and comment lines:
		if $sInStripped = "" or StringLeft($sInStripped, 1) = ';' then ContinueLoop
		$sInStripped = StringReplace($sInStripped, '[', '<b>')
		$sInStripped = StringReplace($sInStripped, ']', '</b>')

		; check for Header2 (release info)
		if StringLeft($sInStripped, 1) = '=' Then
			$sInStripped = StringStripWS( StringReplace($sInStripped, '=', ""), 1 + 2 )
			FileWriteLine($hOut, '<p>&nbsp;</p><h1>Release ' & $sInStripped & '</h1>')
			if $currentVersionText = "" Then $currentVersionText = $sInStripped

		; check for list points
		Elseif StringLeft($sInStripped, 1) = '+' OR StringLeft($sInStripped, 1) = '-' Then
			$sListPoint = $sInStripped

			$bConsiderLastLine = True ; last pre-read line has to be considered
			while True ; now get the rest ...
				$sIn = FileReadLine($hIn)
				if @error = - 1 OR stringleft($sIn, 2) <> '  ' then ExitLoop
				$sListPoint &= ' ' & StringStripWS($sIn, 1 + 2)
			WEnd

			; if list point relevant for .html then write it:
			if StringLeft($sListPoint, 1) = '+' Then
				$sListPoint = '<ul><li>' & StringMid($sListPoint, 2) & '</li></ul>'
				$sInStripped = StringReplace($sInStripped, '[', '<b>')
				$sInStripped = StringReplace($sInStripped, ']', '</b>')
				FileWriteLine($hOut, $sListPoint)
			EndIf

		; check for header3 (e.g. release categories):
		Elseif StringLeft($sIn, 1) = '>' then
			FileWriteLine($hOut, '<h3>' & StringMid($sInStripped, 2) & '</h3>')

		; all what now may remain into an paragraph:
		Else
			FileWriteLine($hOut, '<p>' & $sInStripped & '</p>')
		EndIf

	WEnd


; finish the .html file:
	FileWriteLine($hOut, '</body></html>')
	FileClose($hOut)
	if $currentVersionText = "" then $sLastMsg = "No release info found in changelog.txt!"
	Return $currentVersionText
EndFunc   ;==>parseFile


; ====================================================================================================================
Func updateIntroductionHTML($sPathIntroPage, $sRelInfo)
; sets new release info text into the au3Irr2 introduction page by simply searching or first occurence of:
; <p align="center"><strong>v2.02a</strong></p>

	$sLastMsg = ""
	local $sContent = FileRead($sPathIntroPage)
	if @error then
		$sLastMsg = "Cannot read " & $sPathIntroPage
		Return False
	EndIf

	$sContent = StringRegExpReplace($sContent, '(<p align="center"><strong>).*?(</strong></p>)', '\1 ' & $sRelInfo & ' \2', 1)
	if NOT @Extended = 2 then
		$sLastMsg = "Cannot replace release info in " & $sRelInfo
		Return False
	EndIf

	local $hOut = FileOpen($sPathIntroPage, 2)
	if $hOut = -1 then
		$sLastMsg = "Cannot overwrite old " & $sRelInfo
		Return False
	EndIf

	FileWrite($hOut, $sContent)
	FileClose($hOut)

	Return True
EndFunc   ;==>updateIntroductionHTML

