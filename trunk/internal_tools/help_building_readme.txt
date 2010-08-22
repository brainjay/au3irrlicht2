
==================================================================
Small howto for building the help file for the au3Irr2 project.
2010-08-08 by linus.
==================================================================

This workflow is using several tools by different people (see credits
in help file itself for more info) - thanks to them all!

Everything needed is included in the \internal_tools, except Microsoft's
HTML Help Workshop: http://msdn.microsoft.com/en-us/library/ms669985.aspx

Of course processed UDF's need some informations that can be extracted to
the help file. Naked headers and standard info blocks are added by 
the help_tool.au3.
The rest is busy handwork according the standards (see UDF_Standards.htm
and UDF_BuildTemplates.htm in the \buildHelp dir, both written by GaryFrost
if I am not wrong - thanks again!)

==================================================================

To create an up-to-date help file, do this:

- be sure \include\_au3Irr2_changelog.txt is up-to-date: infos from this file
  are used to build the history.html and also to update the introduction page
  with newest release number + date.

- run help_tool.au3
- say "YES" to CleanUp
- say "YES" to update all UDF and select the \include dir
  (all .au3 in there are overwritten without too much error handling, 
   so compare them CAREFULLY with created backups!)
- run \buildHelp\buildTemplates.exe. Select "include.txt" as
  batch file and BUILD, then close this tool.
- Run \buildHelp\All_gen_au3irr_UDFs3.au3
- Compile au3Irr2.hhp with the Microsoft's HTML Help Workhop.

- Run help_tool.au3 again to clean up unneeded things.
  Say "YES" to CleanUp, "CANCEL" to update.

- Move .chm to the root dir of au3Irr2.

==================================================================
