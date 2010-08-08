#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1
 Author:         Linus

 History:
 2010-07-31: Init
 2010-08-01: Fixed header blocks so GuiTemplateBuilder.exe accepts them
 2010-08-08: Added handling of several .au3 (for \include), cleanup of files + dirs,
             building of Categories.toc + includes.txt

 Script Function:
	Helper tool for documentation of the au3Irrlicht2 UDF.
	Cleans buildHelp dir before/after help file creation.
	Scans given UDF or complete dir and (re-) creates needed blocks according to
	UDF conventions.
	Not too much error handling - so final file should be compared with original.
	UDF files are replaced, so should be compared CAREFULLY with their backup files!

	TODO: creation of usercalltips file.

#ce ----------------------------------------------------------------------------


Opt("MustDeclareVars", True)

const $SCRIPTTITLE = "Help tool V0.2 - 2010 by linus"
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
		$sBody &= $sLine & @LF

	WEnd


	FileClose($h_File)
	Return True
EndFunc   ;==>parseFile
