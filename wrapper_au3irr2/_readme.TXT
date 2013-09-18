
This directory contains the sources for the au3irr2 wrapper dll.
The wrapper is a fork of the original IrrlichtWrapper from Frank Dodd (http://www.frankdodd.screaming.net/IrrlichtWrapper/IrrlichtWrapperPortal.htm) - with some cleaning. Also included: updated files for VS2012/Irrlicht 1.8:


compiling with VisualStudio Express 2012:
=========================================

- download irrlicht 1.7.1
- compiling will require DirectX SDK (2010) for directX9 support
- add include path for DX SDK to Irrlicht project (see info about dx SDK below!)
- change settins in \include\IrrCompileConfig (at least disable DX8 support!)
- copy files from irrlichtWrapper/patches/ into sources of irrlicht  (\include goes to \include of irrlicht)
- compile irrlicht ()

- compile IrrlichtWrapper.dll

That's all!




Info about DirectX SDK and Visual Studio 2012:
==============================================
The DirectX SDK is included as part of the Windows SDK, starting from Windows 8. However, D3DX is not considered the canonical API for using Direct3D in Windows 8 and therefore isn’t included in the Windows SDK shipped with Visual Studio 2012. So, when you compile an old project which depends on D3DX, you still need to get “d3dx9.h”, “d3dx10.h”, or “d3dx11.h” from the June 2010 DirectX SDK. This causes a confliction between the June 2010 DirectX SDK and the DirectX SDK included in the Windows SDK (ver 8.0). For example, you will see a bunch of warning C4005 like the following.

To prevent these warnings, make it sure that you are picking up “d3d9.h”, “d3d10.h” and “dxgi.h”, or “d3d11.h” and “dxgi.h” from the Windows SDK, not from the June 2010 DirectX SDK, whenever “d3dx9.h”, “d3dx10.h”, or “d3dx11.h” is included in your project. One easy way to achieve this is to put the path of the June 2010 DirectX SDK after that of the Windows SDK in the include directory list.
       
========================================================================

Original Howto from Frank Dodd for IrrlichtWrapper with Irrlicht 1.7.1:
==================================

To build the wrapper you will need to download Irrlicht 1.7.1 from the Irrlicht site and then copy the files from the IrrlichtWrapper_source/Irrlicht-1.7.1-updates  folder into your downloaded Irrlicht (EMaterialTypes.h and IAnimatedMeshSceneNode.h will go into the include directory the rest into source/irrlicht)

You will also the DirectX SDK as the MS Environment will also build in DirectX support.

I'm pretty sure it will be fairly simple and probably some missing component. It is also possible that I am missing some MS DLLs too their builds are very small!

It is also possible that there are some other problems when moving to vs2008 as I am using vs2003, if you post the errors you are getting here that will help. I will also include a document on building the wrapper in the next release too as it is not clear 
