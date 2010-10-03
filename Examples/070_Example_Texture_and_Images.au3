; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by smashly
; ----------------------------------------------------------------------------
; Example 70: Copying between Texture and Images
; This example loading in a couple of texture and then uses the IrrlichtWrapper
; blending function to blend the images together onto one texture surface.
; It also uses the texture locking functions to get a texture surface and to
; write color to its surface
; ----------------------------------------------------------------------------

#include "../au3Irrlicht2.au3"

Opt("MustDeclareVars", 1)

HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit


Global $hCreatedTexture ;irr_texture
Global $hCreatedImage ;irr_image
Global $hLoadedImage ;irr_image
Global $pPixelsDestination ; ptr
Global $pPixelsSource ;ptr to pixels
Global $tPixelsDestination ;AutoIt DllStruct so we can edit our destination pixels
Global $tPixelsSource ;AutoIt DllStruct so we can access our source pixels

Global $iTextureWidth = 256 ;Texture width
Global $iTextureHeight = 256 ;Texture height
Global $iPixelsAmount = $iTextureWidth * $iTextureHeight ; total ammount of pixels


; Start the irrlicht interface
_IrrStart()

; Set the title of the display
_IrrSetWindowCaption("Example 70: Copying between Textures and Images")

; Create two new blank texture surface and load two pattern images from file
$hLoadedImage = _IrrGetImage("../media/splatter.tga")
$hCreatedImage = _IrrCreateImage($iTextureWidth, $iTextureHeight, $ECF_A8R8G8B8)
$hCreatedTexture = _IrrCreateTexture("NewTexture", 256, 256, $ECF_A8R8G8B8)

; First copy the loaded image into the created image.
; Lock the two images gaining pointers that access their pixels.
$pPixelsSource = _IrrLockImage($hLoadedImage)
$pPixelsDestination = _IrrLockImage($hCreatedImage)

; We can access the locked pixels in these Dll structs
$tPixelsSource = DllStructCreate("uint[" & $iPixelsAmount & "]", $pPixelsSource)
$tPixelsDestination = DllStructCreate("uint[" & $iPixelsAmount & "]", $pPixelsDestination)

; copy the data between the two, in ECF_A8R8G8B8 format there are 4 bytes per
; pixel a byte for alpha red, green and blue our unsigned integer pointers can
; copy a pixel in one operation, in a 256 x 256 image there are 65,536 pixels
; so we repeat the operation that number of times copying all the pixels from
; one image to another
For $i = 1 To $iPixelsAmount

    ;Set each pixel in the $tPixelsDestination struct with the corresponding pixel from the $tPixelsSource struct
    DllStructSetData($tPixelsDestination, 1, DllStructGetData($tPixelsSource, 1, $i), $i)

    ;Move to the next pixel in the $pPixelsSource and $pPixelsDestination pointers
    $pPixelsSource += 1
    $pPixelsDestination += 1
Next

;unlock $hCreatedImage and $hLoadedImage now we have copied the pixels.
_IrrUnlockImage($hCreatedImage)
_IrrUnlockImage($hLoadedImage)

; Source and Desination Pixel Structs no longer needed
$tPixelsDestination = 0
$tPixelsSource = 0

; secondly copy the created image into the created texture
$pPixelsSource = _IrrLockImage($hCreatedImage)
$pPixelsDestination = _IrrLockTexture($hCreatedTexture)

;once again we create source and destination stuct for the final copy to the texture
$tPixelsSource = DllStructCreate("uint[" & $iPixelsAmount & "]", $pPixelsSource)
$tPixelsDestination = DllStructCreate("uint[" & $iPixelsAmount & "]", $pPixelsDestination)

For $i = 1 To $iPixelsAmount

    ;Set each pixel in the $tPixelsDestination struct with the corresponding pixel from the $tPixelsSource struct
    DllStructSetData($tPixelsDestination, 1, DllStructGetData($tPixelsSource, 1, $i), $i)

    ;Move to the next pixel in the $pPixelsSource and $pPixelsDestination pointers
    $pPixelsSource += 1
    $pPixelsDestination += 1
Next

; Unlock the $hCreatedTexture and $hCreatedImage.
_IrrUnlockTexture($hCreatedTexture)
_IrrUnlockImage($hCreatedImage)

; For the last time clear the no longer needed Pixel Structs
$tPixelsDestination = 0
$tPixelsSource = 0


; while the scene is still running
While _IrrRunning() And Sleep(10)
    ; begin the scene, erasing the canvas to Yellow before rendering
    _IrrBeginScene(255, 255, 0)

    ; draw the newly created texture to the display
    _IrrDraw2DImage($hCreatedTexture, 0, 0)

    ; end drawing the scene and render it
    _IrrEndScene()
WEnd

; Stop the irrlicht engine and release resources
_IrrStop()
