
================================
au3Irrlicht2 
(Version 2.02 - 2010-07-29)
================================

au3Irrlicht2 is a "wrapper for a wrapper" - jRowe started the au3Irrlicht2 UDF 
project on top of Frank Dodd's great FreeBasic Irrlicht Wrapper. 

It is still not complete, but definetly useable for starting, learning, 
doing some nice 3D apps/games.

This release of au3Irrlicht2 includes everything to use the Irrlicht 3D engine
together with autoIt3. This includes .dll's, ressources and documentation
from the original freeBasic wrapper (0.7.7). 
Thanks a lot to Frank Dodd and all the other authors for this! 

jRowe's au3Irrlicht2 topic on autoitscript.com:
http://www.autoitscript.com/forum/index.php?showtopic=113881
Don't be shy, post there your feedback and questions.

The project page with latest releases + source:
http://code.google.com/p/au3irrlicht2/

Frank Dodd's FreeBasic Irrlicht Wrapper can be found here:
http://www.frankdodd.screaming.net/IrrlichtWrapper/IrrlichtWrapperPortal.htm
and discussion about it in the freeBasic forum:
http://www.freebasic.net/forum/viewtopic.php?t=3584

Of course also the "mother" of it all is worth a look:
http://irrlicht.sourceforge.net/ 


This release includes:
======================
- 81 examples (converted to au3 from original freeBasic examples)
- Example launcher
- up-to-date UDF au3Irrlicht2.au3
  see comments at top of UDF what has changed. 
- updated au3.user.calltips.api including all constants for UDF.
- all required .dll's
- original documentation. Also for freeBasic, a good start (besides the
  examples) to au3Irrlicht2, until there is some documentation for 
  this project ...


How to use:
===========
- Extract .zip.
- Run & enjoy the examples.

- When you feel (hopefully) inspired to do some 3D on your own, you may also 
  want to use (or update) your usercalltips in scite, e.g. via 
  Tools > UserCallTipEntries and there add content of attached included 
  au3.user.calltips.api

================================





Found & known problems:
================================
strange effect of round() while running irrlicht (means: after _irrstart() ): 
round(1.666666,1) does NOT return 1.6 but long floating value?!
Only occures with $IRR_EDT_DIRECT3D9 / $IRR_EDT_DIRECT3D8, with
$IRR_EDT_OPENGL round() works as expected ... 

================================
scripts terminate after calling _irrstop() - all code after _irrstop() is 
not executed?!

================================
_IrrCreateRenderTargetTexture (Example 33 : Rendering to a texture):
very slow and destroyed texts from _IrrAddStaticText() when using openGL.
Direct3D modes are ok. 
Seems to depend on used graphics hardware (128MB Intel onboard graphic has 
problems with DirectX, GeForce9800GT seems to be completely ok) 

================================

