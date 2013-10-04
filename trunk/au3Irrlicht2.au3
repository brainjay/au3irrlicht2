
#include-once

; #INDEX# =======================================================================================================================
; Title .........: au3Irrlicht2
; AutoIt Version : v3.3.8.1
; Language ......: English
; Description ...: Main UDF for au3Irrlicht2 which includes all other irrLicht category specific UDF's.
; Author(s) .....: jRowe, linus.
;                  DLL functionality by Frank Dodd (original IrrlichtWrapper), Nikolaus Gebhardt and Irrlicht team (Irrlicht).
; ===============================================================================================================================

if @AutoItX64 then
   MsgBox(0 + 16 + 4096, "au3Irr2 system info", "Sorry, au3Irr2 cannot be used with x64 version of autoIt." & @LF & _
                  "Please re-run by right-clicking the script and selecting" & @LF & _
				  "'Run Script (x86)'."  & @LF & _
				  "If this message is from an .exe, re-compile the source script" & @LF & _
				  "for x86 systems (see 'Using AutoIt' in AutoIt help if any" & @LF & _
				  "questions left).")
   exit(false)
EndIf

#include ".\include\au3Irr2_Constants.au3"
#include ".\include\au3Irr2_System.au3"
#include ".\include\au3Irr2_KeyboardMouse.au3"
#include ".\include\au3Irr2_FilingSystem.au3"
#include ".\include\au3Irr2_2D.au3"
#include ".\include\au3Irr2_Materials.au3"
#include ".\include\au3Irr2_Scene.au3"
#include ".\include\au3Irr2_Node.au3"
#include ".\include\au3Irr2_Animation.au3"
#include ".\include\au3Irr2_Collision.au3"
#include ".\include\au3Irr2_Camera.au3"
#include ".\include\au3Irr2_Lighting.au3"
#include ".\include\au3Irr2_Terrain.au3"
#include ".\include\au3Irr2_Particles.au3"
#include ".\include\au3Irr2_GUI.au3"
#include ".\include\au3Irr2_Sound.au3"
