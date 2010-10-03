; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by smashly
; ----------------------------------------------------------------------------
; Example 103: Billboard Groups
; This example demonstrated Billboard groups. While billboards are already
; very efficient large numbers of them can be made even more efficient by
; collecting them up into a single group.
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


; Global constants for setting the state of node visibility
Global Const $IRR_INVISIBLE = 0
Global Const $IRR_VISIBLE = 1

; Particle (Billboards) controls
Global $PARTICLE_COUNT = 5
Global $PARTICLE_LAYERS = 15
Global $SPACING = 75.0
Global $SCALE = 100.0
Global $CAMERA_SPEED = 0.1

; irrlicht objects
Global $hBillboardGroup ;irr_node
Global $hBillboardTexture ;irr_texture
Global $hSun ;irr_node
Global $hCamera ;irr_camera
Global $iTotalParticales = $PARTICLE_COUNT * $PARTICLE_LAYERS ; how many cloud billboards (Particles)
Global $aBillboard[$iTotalParticales + 1] ;array of handles to billboards (particles) in the billboard group
Global $hSkybox
Global $hMoon

; variables for setting up the billboard group
Global $fFactor, $fX, $fY, $fZ, $iSmall, $iBig
Global $currentTime


; Personal Note: I'm testing this on an old P4 3Ghz, w/ Intel 865 onboard graphics (that doesn't support much) in XP x86..
; $IRR_EDT_OPENGL sux on this old PC, low fps, random distant flickering textures, skybox seams have a big striped lines where they meet top an bottom... etc
; $IRR_EDT_DIRECT3D9 appears to reduce the random flickering textures and skybox seams displays nicely for me.

; start the irrlicht interface
_IrrStart($IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_SHADOWS, $IRR_IGNORE_EVENTS, $IRR_VERTICAL_SYNC_ON)

; add a skybox with a space theme to the scene as a backdrop
$hSkybox = _IrrAddSkyBoxToScene( _
        _IrrGetTexture("../media/starbox1.jpg"), _
        _IrrGetTexture("../media/starbox1.jpg"), _
        _IrrGetTexture("../media/starbox1.jpg"), _
        _IrrGetTexture("../media/starbox1.jpg"), _
        _IrrGetTexture("../media/starbox1.jpg"), _
        _IrrGetTexture("../media/starbox1.jpg"))

; Create a billboard representing the Sun
; load the texture resource for the billboard
$hBillboardTexture = _IrrGetTexture("../media/sun.tga")

; add the billboard to the scene
$hSun = _IrrAddBillBoardToScene(256.0, 256.0, 0.0, 0.0, 998.0)

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialTexture($hSun, $hBillboardTexture, 0)

; hide transparent areas
_IrrSetNodeMaterialFlag($hSun, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrSetNodeMaterialType($hSun, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL)

; Create a billboard representing the Moon
; load the texture resource for the billboard
$hBillboardTexture = _IrrGetTexture("../media/moon.tga")

; add the billboard to the scene
$hMoon = _IrrAddBillBoardToScene(20.0, 20.0, 0.0, 0.0, 1200.0)

; now we apply the loaded texture to the billboard using node material index 0
_IrrSetNodeMaterialFlag($hMoon, $IRR_EMF_LIGHTING, $IRR_OFF)
_IrrSetNodeMaterialTexture($hMoon, $hBillboardTexture, 0)

; hide transparent areas
_IrrSetNodeMaterialType($hMoon, $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL_REF)

; make the moon orbit the sun
_IrrAddFlyCircleAnimator($hMoon, 0.0, 0.0, 1000.0, 800.0, 0.0001)

; load the texture resource for the billboard
$hBillboardTexture = _IrrGetTexture("../media/cloudtest.bmp")

; add a billboard group to the scene
$hBillboardGroup = _IrrAddBillBoardGroupToScene()

; add billboards to the billBoard group
For $j = 1 To $PARTICLE_LAYERS
    For $i = 1 To $PARTICLE_COUNT

        ; Generate a random co-ordinate in a cube
        $fX = Random(-5.0, 5.0)
        $fY = Random(-5.0, 5.0)
        $fZ = Random(-5.0, 5.0)

        ; normalise the co-ordinate. this scales the x,y,z so they are
        ; exactly a distance of 1 * SCALE from origin and when they are
        ; all the same distance they appear as points on a sphere
        $fFactor = 1 / Sqrt($fX * $fX + $fY * $fY + $fZ * $fZ)
        $fX *= $fFactor * $SPACING * $j
        $fY *= $fFactor * $SPACING * $j
        $fZ *= $fFactor * $SPACING * $j

        ; calculate a couple of color values
        $iSmall = (255 / $PARTICLE_LAYERS) * $j / 3
        $iBig = (255 / $PARTICLE_LAYERS) * $j

        ; the particle can be one of two colors to add some tone to the cloud
        Switch Mod($i, 2)
            Case 0 ;Change this to any number other then 0 or 1 (eg: 3) if you would like to see _IrrAddBillBoardByAxisToGroup clouds only.

                ; add a billboard to the group. the parameters are as follows: -
                ; The billboard group node
                ; the X,Y scale of the billboard
                ; X,Y,Z co-ordinates for the billboard
                ; a roll for the billboard that allows each billboard to be rotated
                ; A,R,G,B color values
                $aBillboard[($i + ($j - 1) * $PARTICLE_COUNT)] = _IrrAddBillBoardToGroup($hBillboardGroup, _
                        15.0 * $SCALE - 3.0 * $SCALE * $j, 15.0 * $SCALE - 3.0 * $SCALE * $j, _
                        $fX, $fY, $fZ, _
                        0.0, _
                        255, 255 - $iBig, 255, 255 - $iSmall)
            Case 1

                ; we are adding these By Axis (just to show the _IrrAddBillBoardByAxisToGroup function works);
                ; Same as above but with 3 more parameters X,Y,Z Axis of the billboard
                ; this billboard is slightly bigger and more yellow with Y axis set to 1.0
                $aBillboard[($i + ($j - 1) * $PARTICLE_COUNT)] = _IrrAddBillBoardByAxisToGroup($hBillboardGroup, _
                        20.0 * $SCALE - 3.0 * $SCALE * $j, 20.0 * $SCALE - 3.0 * $SCALE * $j, _
                        $fX, $fY, $fZ, _
                        0.0, _
                        255, 255 - $iSmall, 255, 255 - $iBig, _
                        0.0, 1.0, 0.0)
        EndSwitch
    Next
Next

; just move the particles forward so we can have a good look at them
_IrrSetNodePosition($hBillboardGroup, 0.0, 0.0, 1000.0)

; this can be used to apply a graduated shading to billboards color.
_IrrBillBoardGroupShadows($hBillboardGroup, 1, 0, 0, 1.0, 0.2)

; apply the loaded texture to the billboard group using node material index 0
_IrrSetNodeMaterialTexture($hBillboardGroup, $hBillboardTexture, 0)

; disabling lighting
_IrrSetNodeMaterialFlag($hBillboardGroup, $IRR_EMF_LIGHTING, $IRR_OFF)

; layer the colour upon what is already there (works well for clouds)
_IrrSetNodeMaterialType($hBillboardGroup, $IRR_EMT_TRANSPARENT_ADD_COLOR)

; add a first person perspective camera into the scene so we can move around
; the billboard and see how it reacts
$hCamera = _IrrAddFPSCamera($IRR_NO_OBJECT, 100.0, $CAMERA_SPEED)
_IrrSetCameraClipDistance($hCamera, 128000)

; hide the mouse pointer
_IrrHideMouse()

; while the irrlicht environment is still running
While _IrrRunning() And Sleep(10)

    ; removing 1 billboard from the billboard group every second
    If TimerDiff($currentTime) >= 1000 And $iTotalParticales > 0 Then
        _IrrRemoveBillBoardFromGroup($hBillboardGroup, $aBillboard[$iTotalParticales])
        $iTotalParticales -= 1
        $currentTime = TimerInit()

        ; This forces the billboard group to update their orientation, in this example it's not really needed.
        ; It's only here show that it works without error.
        ; It would be more beneficial to use when you have a camera that is movining around in a scene.
        ; Force Update would make the billboards point to the camera once more.
        _IrrBillBoardForceUpdate($hBillboardGroup)
    EndIf

    ;' begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene(240, 255, 255)

    ; Change the title to show how many Cloud billboards and the frame rate
    _IrrSetWindowCaption("Example 103: Billboard groups - Clouds: " & _IrrGetBillBoardGroupCount($hBillboardGroup) & " - FPS: " & _IrrGetFPS())

    ; we are drawing in two passes first the sun, moon and sky
    _IrrSetNodeVisibility($hBillboardGroup, $IRR_INVISIBLE)
    _IrrSetNodeVisibility($hSun, $IRR_VISIBLE)
    _IrrSetNodeVisibility($hMoon, $IRR_VISIBLE)
    _IrrSetNodeVisibility($hSkybox, $IRR_VISIBLE)

    ; draw the scene
    _IrrDrawScene()

    ; on the second pass we are just drawing the clouds. by doing this we
    ; ensure that if billboards get in front of the clouds origin but are
    ; still IN the clouds they are still covered by cloud
    _IrrSetNodeVisibility($hBillboardGroup, $IRR_VISIBLE)
    _IrrSetNodeVisibility($hSun, $IRR_VISIBLE)
    _IrrSetNodeVisibility($hMoon, $IRR_VISIBLE)
    _IrrSetNodeVisibility($hSkybox, $IRR_VISIBLE)

    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()

WEnd

; Stop the irrlicht engine and release resources
_IrrStop()



