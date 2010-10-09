
==================================================================
Small howto for building the help file for the au3Irr2 project.
2010-09-05 by linus.
==================================================================

This workflow is using several tools by different people from the au3 community - thanks to them all!

Everything needed is included in the \internal_tools, except Microsoft's
HTML Help Workshop: http://msdn.microsoft.com/en-us/library/ms669985.aspx

Of course processed UDF's need some informations that can be extracted to
the help file. Naked headers and standard info blocks are added automatically by 
the >> help_tool.au3 <<  where needed.
The rest is busy handwork according the standards (see >> UDF_Standards.htm <<
and >> UDF_BuildTemplates.htm << in the \buildHelp dir, both written by GaryFrost
if I am not wrong - thanks again!)

Info: help_tool.au3 builds also 
 - merged help (AutoIt.chm) so au3Irr2 help and au3 help can be used together 
 - a fresh usercalltip file,
 - a history page for the help from the \include\_au3Irr2_changelog.txt
 - updates the release number (taken from changelog) into the introduction page
   (\internal_tools\buildHelp\html_static\au3irr2.htm)
 - some files needed for help file creation (categories.toc, include.txt)

==================================================================

To create an up-to-date help file, do this:

- be sure \include\_au3Irr2_changelog.txt is up-to-date.
- everything fine in \buildHelp\html_static (e.g. the credits.htm, 
  introduction.htm for merged help matching to current autoIt3 version)?

- run help_tool.au3
- say "YES" to CleanUp
- say "YES" to update all UDF and select the \include dir
  (all .au3 in there are overwritten without too much error handling, 
   so compare them CAREFULLY with created backups!)
- wait until "Done" is shown.
- Now run \buildHelp\buildTemplates.exe. Select "include.txt" as
  batch file and BUILD, then close this tool.
- Run \buildHelp\All_gen_au3irr_UDFs3.au3
- Compile the \buildHelp\au3Irr2.hhp with Microsoft's HTML Help Workhop 
  to build the au3Irr2.chm.
- Compile the \buildHelp\AutoItM.hhp with Microsoft's HTML Help Workhop
  to build the merged help file AutoIt.chm)

- Run help_tool.au3 again to clean up unneeded things:
  Say "YES" to CleanUp, "CANCEL" to update.

- Move .chm's + usercalltips.au3 to the root dir of au3Irr2. Next release
  ready to be provided ;)

==================================================================
