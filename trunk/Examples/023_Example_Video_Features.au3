; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2008)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 23: Testing for Video Features
; This example performs each of the available tests on the video capabilities
; of the graphics card. It is often useful to know which features the card
; will support so that you can apply the appropriate materials to your objects
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "..\au3Irrlicht2.au3"
opt("MustDeclareVars", True)
;HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit

; ////////////////////////////////////////////////////////////////////////////
; global variables
global $s_out

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface.
_IrrStart( $IRR_EDT_OPENGL, 400, 200, $IRR_BITS_PER_PIXEL_32, _
          $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON )

; Set the title of the display
_IrrSetWindowCaption( "Example 23: Video Feature Test" )

; Query each of the video features and display whether they are available

if _IrrQueryFeature( $EVDF_RENDER_TO_TARGET ) = 1 then
    $s_out = "The driver is able to render to a surface"
Else
    $s_out = "!! The driver is NOT able to render to a surface"
endif

if _IrrQueryFeature( $EVDF_HARDWARE_TL ) = 1 then
    $s_out &= @LF & "Hardeware transform and lighting is supported"
Else
    $s_out &= @LF & "!! Hardeware transform and lighting is NOT supported"
endif

if _IrrQueryFeature( $EVDF_MULTITEXTURE ) = 1 then
    $s_out &= @LF & "Multiple textures per material are possible"
Else
    $s_out &= @LF & "!! Multiple textures per material are NOT possible"
endif

if _IrrQueryFeature( $EVDF_BILINEAR_FILTER ) = 1 then
    $s_out &= @LF & "The driver is able to render with a bilinear filter applied"
Else
    $s_out &= @LF & "!! The driver is NOT able to render with a bilinear filter applied"
endif

if _IrrQueryFeature( $EVDF_MIP_MAP ) = 1 then
    $s_out &= @LF & "The driver can handle mip maps"
Else
    $s_out &= @LF & "!! The driver can NOT handle mip maps"
endif

if _IrrQueryFeature( $EVDF_MIP_MAP_AUTO_UPDATE ) = 1 then
    $s_out &= @LF & "The driver can update mip maps automatically"
Else
    $s_out &= @LF & "!! The driver can NOT update mip maps automatically"
endif

if _IrrQueryFeature( $EVDF_STENCIL_BUFFER ) = 1 then
    $s_out &= @LF & "Stencilbuffers are switched on and the device does support stencil buffers"
Else
    $s_out &= @LF & "!! Stencilbuffers are NOT switched on or are unsupported"
endif

if _IrrQueryFeature( $EVDF_VERTEX_SHADER_1_1 ) = 1 then
    $s_out &= @LF & "Vertex Shader 1.1 is supported"
Else
    $s_out &= @LF & "!! Vertex Shader 1.1 is NOT supported"
endif

if _IrrQueryFeature( $EVDF_VERTEX_SHADER_2_0 ) = 1 then
    $s_out &= @LF & "Vertex Shader 2.0 is supported"
Else
   $s_out &= @LF & "!! Vertex Shader 2.0 is NOT supported"
endif

if _IrrQueryFeature( $EVDF_VERTEX_SHADER_3_0 ) = 1 then
    $s_out &= @LF & "Vertex Shader 3.0 is supported"
Else
    $s_out &= @LF & "!! Vertex Shader 3.0 is NOT supported"
endif

if _IrrQueryFeature( $EVDF_PIXEL_SHADER_1_1 ) = 1 then
    $s_out &= @LF & "Pixel Shader 1.1 is supported"
Else
    $s_out &= @LF & "!! Pixel Shader 1.1 is NOT supported"
endif

if _IrrQueryFeature( $EVDF_PIXEL_SHADER_1_2 ) = 1 then
    $s_out &= @LF & "Pixel Shader 1.2 is supported"
Else
    $s_out &= @LF & "!! Pixel Shader 1.2 is NOT supported"
endif

if _IrrQueryFeature( $EVDF_PIXEL_SHADER_1_3 ) = 1 then
    $s_out &= @LF & "Pixel Shader 1.3 is supported"
Else
    $s_out &= @LF & "!! Pixel Shader 1.3 is NOT supported"
endif

if _IrrQueryFeature( $EVDF_PIXEL_SHADER_1_4 ) = 1 then
    $s_out &= @LF & "Pixel Shader 1.4 is supported"
Else
    $s_out &= @LF & "!! Pixel Shader 1.4 is NOT supported"
endif

if _IrrQueryFeature( $EVDF_PIXEL_SHADER_2_0 ) = 1 then
    $s_out &= @LF & "Pixel Shader 2.0 is supported"
Else
    $s_out &= @LF & "!! Pixel Shader 2.0 is NOT supported"
endif

if _IrrQueryFeature( $EVDF_PIXEL_SHADER_3_0 ) = 1 then
    $s_out &= @LF & "Pixel Shader 3.0 is supported"
Else
    $s_out &= @LF & "!! Pixel Shader 3.0 is NOT supported"
endif

if _IrrQueryFeature( $EVDF_ARB_VERTEX_PROGRAM_1 ) = 1 then
    $s_out &= @LF & "ARB vertex programs v1.0 are supported"
Else
    $s_out &= @LF & "!! ARB vertex programs v1.0 are NOT supported"
endif

if _IrrQueryFeature( $EVDF_ARB_FRAGMENT_PROGRAM_1 ) = 1 then
    $s_out &= @LF & "ARB fragment programs v1.0 are supported"
Else
    $s_out &= @LF & "!! ARB fragment programs v1.0 are NOT supported"
endif

if _IrrQueryFeature( $EVDF_ARB_GLSL ) = 1 then
    $s_out &= @LF & "GLSL is supported"
Else
    $s_out &= @LF & "!! GLSL is NOT supported"
endif

if _IrrQueryFeature( $EVDF_HLSL ) = 1 then
    $s_out &= @LF & "HLSL is supported"
Else
    $s_out &= @LF & "!! HLSL is NOT supported"
endif

if _IrrQueryFeature( $EVDF_TEXTURE_NPOT ) = 1 then
    $s_out &= @LF & "non-power-of-two textures are supported"
Else
    $s_out &= @LF & "!! non-power-of-two textures are NOT supported"
endif

if _IrrQueryFeature( $EVDF_FRAMEBUFFER_OBJECT ) = 1 then
    $s_out &= @LF & "framebuffer objects are supported"
Else
    $s_out &= @LF & "!! framebuffer objects are NOT supported"
endif


if _IrrQueryFeature( $EVDF_VERTEX_BUFFER_OBJECT ) = 1 then
    $s_out &= @LF & "vertex buffer objects are supported"
Else
    $s_out &= @LF & "!! vertex buffer objects are NOT supported"
endif


if _IrrQueryFeature( $EVDF_ALPHA_TO_COVERAGE ) = 1 then
    $s_out &= @LF & "alpha to coverage is supported"
Else
    $s_out &= @LF & "!! alpha to coverage is NOT supported"
endif


if _IrrQueryFeature( $EVDF_COLOR_MASK ) = 1 then
    $s_out &= @LF & "color masks are supported"
Else
    $s_out &= @LF & "!! color masks are NOT supported"
endif


if _IrrQueryFeature( $EVDF_MULTIPLE_RENDER_TARGETS ) = 1 then
    $s_out &= @LF & "multiple render targets are supported"
Else
    $s_out &= @LF & "!! multiple render targets are NOT supported"
endif


if _IrrQueryFeature( $EVDF_MRT_BLEND ) = 1 then
    $s_out &= @LF & "seperate blend settings for render targets are supported"
Else
    $s_out &= @LF & "!! seperate blend settings for render targets are NOT supported"
endif


if _IrrQueryFeature( $EVDF_MRT_COLOR_MASK ) = 1 then
    $s_out &= @LF & "seperate color masks for render targets are supported"
Else
    $s_out &= @LF & "!! seperate color masks for render targets are NOT supported"
endif


if _IrrQueryFeature( $EVDF_MRT_BLEND_FUNC ) = 1 then
    $s_out &= @LF & "seperate blend functions for render targets are supported"
Else
    $s_out &= @LF & "!!  seperate blend functions for render targets are NOT supported"
endif


if _IrrQueryFeature( $EVDF_GEOMETRY_SHADER ) = 1 then
    $s_out &= @LF & "geometry shaders are supported"
Else
    $s_out &= @LF & "!! geometry shaders are NOT supported"
endif


; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
MsgBox(0, "Example 23: Video Feature Test", $s_out)
_IrrStop()
