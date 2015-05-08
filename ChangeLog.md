# au3Irrlicht2 ChangeLog #


---


## 2.04 (2010-10-09) ##


#### Script breaking changes: ####

  * IrrAddSplineAnimator: Parameters changed to simplify usage (see examples)
  * IrrGetNodePosition, IrrGetNodeRotation, IrrGetNodeAbsolutePosition, IrrGetCameraTarget: Removed required byRef array parameter (see help file/adjusted examples for syntax)


#### UDF: ####
  * Fixed/Added: Some more working functions (mainly around added examples)
  * Added: Some missing 2D functions and documentation (contributions from smashly)
  * Fixed: IrrSetFog (linear and exponential fog were interchanged)
  * Fixed: IrrCreateMesh ($s`_`MeshName not being passed in the DLL call)
  * Fixed: IrrGetScreenCoordinatesFrom3DPosition (did not return anything useable because of wrong dllCall)


#### Examples: ####
  * Added: 015 (CustomMesh), 022 (Indices+Vertices), 024 (Mesh to file), 062 (6D0F\_Camera)
  * Added: (contribution from smashly): 039 (Texture blending), 070 (Texture\_and\_Images), 103 (Billboard Groups), 104 (LOD)
  * Added: 007/025/027/066/067/068/069/074/075 (ParticleSystem)
  * Reworked: 011 (Animators) shows usage of changed IrrAddSplineAnimator
  * Fixed: 010 (TerrainAndFog) / 029/054 (Skydomes)


#### Help file: ####
  * Added: Completed documentation including example code for some more functions. Current status: Topics completed along examples 1-16 + several more. At least naked reference w/o detailed informations for all functions inside other examples.
  * Added: 'Copy to clipboard'-button for included examples (using VBS code from GEOSoft)

#### Internal tools: ####
  * Fixed: Examples could not be opened when running launcher from path with spaces
  * Added: Setup feature to example launcher to merge au3Irr2 help into local au3 help and add/update calltips for SciTe
  * Excluded \internal\_tools because not too interesting for 99.9% (for the 0.1%: available via the sources from project page)


#### Other: ####
  * Changed: global $result used in UDF files switched to local variables (WIP, finished for 2D, Scene, Camera, Animation, Node)





---




## 2.03 (2010-09-05) ##

#### UDF: ####

  * Changed: Splitted UDF per category into \include. Main UDF (and the only one which is needed to be included) is still au3Irrlicht2.au3

  * Changed: All used dll files are moved to \bin to clean up the root dir. `_IrrStart` is modified to find them anyway.

  * Fixed: `_IrrSetNodeVisibility`

#### Examples: ####

  * Added: 089 (Orthogonal Camera), 106 (Advanced start)

  * Changed: 029 (Skydome)

  * Fixed: 049 (Loaded\_Scene\_Collision), 051 (Clouds)

#### Help file: ####

  * Added: First version as reference of all working + proven functions.<br>Current status: Topics completed including example code along examples 1 to 6. Naked reference w/o detailed informations for other examples.</li></ul>

<ul><li>Changed: Moved original freeBasic Wrapper docs from \FB_documentation to \internal_tools\buildHelp\html_static. It's now included into help file.</li></ul>

<ul><li>Added: Merged help to use the au3Irr2 help inside the au3 help.</li></ul>

<h4>Internal tools: ####

  * Added: helper scripts and files for building help file and au3.user.calltips.api (see **\internal tools\help\_building\_readme.txt**)


#### Other: ####

  * Fixed: \media\fonthaettenschweiler.bmp (**bogQ**)

  * Added: msvcr71.dll - possibly missing on some machines (**jl**)



---



## 2.02 (2010-07-29) ##

First release in one package (UDF + all needed .dll's, examples, ExampleLauncher)



---



## 2.0 (2010-05-03) ##

First release of jRowe



---