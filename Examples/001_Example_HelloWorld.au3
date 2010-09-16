; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by linus
; ----------------------------------------------------------------------------
; Example 01: Hello World
; This simple example opens an Irrlicht window and displays the text
; Hello World on the screen and waits for the user to close the application
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

; ////////////////////////////////////////////////////////////////////////////
; global variables


; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface. The scene will be rendered using the Irrlicht,
; software renderer, the display will be a window 400 x 200 pixels in size, the
; display will not support shadows and we will not capture any keyboard and
; mouse events and finally vertical syncronisation to smoothen the display
; is switched on, by default it is off
_IrrStart( $IRR_EDT_OPENGL, 400, 200, $IRR_BITS_PER_PIXEL_32, _
          $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS, _
          $IRR_VERTICAL_SYNC_ON )

; Set the title of the display
_IrrSetWindowCaption( "Example 01: Hello World" )

; add a static text object to the graphical user interface. The text will be
; drawn inside the defined rectangle, the box will not have a border and the
; text will not be wrapped around if it runs off the end
_IrrAddStaticText( "Hello AU3-World ;-)", 8, 8, 200, 20, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP)

; while the scene is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas to white before rendering
    _IrrBeginScene( 255,255,255 )

    ; draw the Graphical User Interface
    _IrrDrawGUI()

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
