; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by smashly
; ----------------------------------------------------------------------------
; Example 39: Texture Blending
; This example loading in a couple of texture and then uses the IrrlichtWrapper
; blending function to blend the images together onto one texture surface.
; It also uses the texture locking functions to get a texture surface and to
; write color to its surface
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "../au3Irrlicht2.au3"
opt("MustDeclareVars", True)
HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit



Global $hTextureA ;irr_texture
Global $hTextureB ;irr_texture
Global $hTextureC ;irr_texture
Global $hTextureD ;irr_texture
Global $pPixels ;ptr to pixels

Global $iTextureWidth = 128 ;Texture width
Global $iTextureHeight = 128 ;Texture height
Global $iPixelsAmount = $iTextureWidth * $iTextureHeight ; total ammount of pixels
Global $tPixels ;AutoIt DllStruct so we can edit our pixels

; Creating an Array of 4 Colors Red, Green, Blue, Black to use on one of our Created Textures
; The color format can be also be AARRGGBB eg: 0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFF000000
; Either way seems to work
Global $aColor[4] = [16711680, 65280, 255, 0]
Global $iColorCount = 0

; Start the irrlicht interface
_IrrStart()

; Set the title of the display
_IrrSetWindowCaption("Example 39: Texture Blending")

; Create two new blank texture surface and load two pattern images from file
$hTextureA = _IrrCreateTexture("stripes", $iTextureWidth, $iTextureHeight, $ECF_A8R8G8B8)
$hTextureB = _IrrGetTexture("../media/Diagonal.bmp")
$hTextureC = _IrrGetTexture("../media/Cross.bmp")
$hTextureD = _IrrCreateTexture("merged", $iTextureWidth, $iTextureHeight, $ECF_A8R8G8B8)

; Get the pixels of one of the textures and write blocks of color into the image
$pPixels = _IrrLockTexture($hTextureA)

; We can access the locked pixels in this Dll struct
$tPixels = DllStructCreate("uint[" & $iPixelsAmount & "]", $pPixels)

; We go from the first pixel to the last pixel and set the colors as we go.
For $i = 1 To $iPixelsAmount

    ;We set each pixel in the $tPixels struct
    DllStructSetData($tPixels, 1, $aColor[$iColorCount], $i)

    ;Move to the next pixel in the $pPixels pointer
    $pPixels += 1

    ;We're creating 4 different colored horizontal stipes so when we hit 4096 (128 x 128 / 4 = 4096) we change the color.
    If Not Mod($i, $iPixelsAmount / 4) Then $iColorCount += 1
Next

;unlock $hTextureA now we have set the pixels to the color we want.
_IrrUnlockTexture($hTextureA)

; Pixel Struct no longer needed
$tPixels = 0

; Blend the two loaded textures onto the created surface
_IrrBlendTextures($hTextureD, $hTextureB, 0, 0, $BLEND_ADD)
_IrrBlendTextures($hTextureD, $hTextureC, 0, 0, $BLEND_SCREEN)

; while the scene is still running
While _IrrRunning()
    ; begin the scene, erasing the canvas to Yellow before rendering
    _IrrBeginScene(255, 255, 0)

    ; draw all of the images to the display
    _IrrDraw2DImage($hTextureA, 0, 0)
    _IrrDraw2DImage($hTextureB, $iTextureWidth, 0)
    _IrrDraw2DImage($hTextureC, 0, $iTextureHeight)
    _IrrDraw2DImage($hTextureD, $iTextureWidth, $iTextureHeight)

    ; end drawing the scene and render it
    _IrrEndScene()
WEnd

; Stop the irrlicht engine and release resources
_IrrStop()