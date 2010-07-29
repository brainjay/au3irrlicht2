; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted for JRowe's au3Irrlicht2 UDF project by Linus
; ----------------------------------------------------------------------------
; Example 84: GUI Functions
; This example demonstrates the use of a range of GUI objects
; ----------------------------------------------------------------------------

; ////////////////////////////////////////////////////////////////////////////
; Includes for extension libraries
#include "..\au3Irrlicht2.au3"
opt("MustDeclareVars", True)
HotKeySet("{ESC}", "_exit")

Func _exit()
	_IrrStop()
	Exit
EndFunc ; _exit


; ////////////////////////////////////////////////////////////////////////////
; global variables
DIM $pGUIEvent ; $IRR_GUI_EVENT PTR
dim $gui_ID, $gui_Event
DIM $guiStatic ; $IRR_GUI_OBJECT
DIM $guiEdit ; $IRR_GUI_OBJECT
DIM $guiPassword ; $IRR_GUI_OBJECT
DIM $guiWindow ; $IRR_GUI_OBJECT
DIM $guiListbox ; $IRR_GUI_OBJECT
DIM $redBackground = 150
DIM $greenBackground = 200
DIM $imageTexture ; irr_texture
DIM $fileName ; string
DIM $displayString ; wstring * 32
DIM $BitmapFont ; irr_font

global enum $MY_GUI_BUTTON_FILE = 101, _
$MY_GUI_BUTTON_WINDOW, _ ;    102
$MY_GUI_BUTTON_QUIT, _ ;      103
$MY_GUI_BUTTON_CLOSE, _ ;     104
$MY_GUI_SCROLLBAR_RED, _ ;    105
$MY_GUI_SCROLLBAR_GREEN, _ ;  106
$MY_GUI_LISTBOX, _ ;          107
$MY_GUI_CHECKBOX, _ ;         108
$MY_GUI_EDITBOX, _ ;          109
$MY_GUI_PASSWORD, _ ;         110
$MY_GUI_FILEOPEN		;        111

; ////////////////////////////////////////////////////////////////////////////


; -----------------------------------------------------------------------------
; start the irrlicht interface. The scene will be rendered using the Irrlicht,
; software renderer, the display will be a window 400 x 200 pixels in size, the
; display will not support shadows and we will not capture any keyboard and
; mouse events and finally vertical syncronisation to smoothen the display
; is switched on, by default it is off
_IrrStart( $IRR_EDT_OPENGL, 512, 256, $IRR_BITS_PER_PIXEL_32, _
          $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_CAPTURE_EVENTS, _
          $IRR_VERTICAL_SYNC_ON )

; Set the title of the display
_IrrSetWindowCaption( "Example 84: GUI Functions" )

; set the font used by the GUI
$BitmapFont = _IrrGetFont ( "../media/fonthaettenschweiler.bmp" )
_IrrGUISetFont( $BitmapFont )

; set the colors used by GUI controls
_IrrGUISetColor( $EGDC_3D_FACE, 192, 255, 255, 255 )
_IrrGUISetColor( $EGDC_BUTTON_TEXT, 0, 64, 64, 255 )

; add a static text object to the graphical user interface. The text will be
; drawn inside the defined rectangle, the box will not have a border and the
; text will not be wrapped around if it runs off the end
$guiStatic = _IrrAddStaticText( _
                   "Hello World", _     ; Text to display
                   4,0,256,16, _        ; Size
                   $IRR_GUI_NO_BORDER, _ ; no border around the text
                   $IRR_GUI_NO_WRAP )    ; text does not wrap

; add a button to the graphical user interface
_IrrAddButton( 16, 16, 112, 32, _                ; Size
                          $MY_GUI_BUTTON_FILE, _ ; ID of the button
                          "Select File", _      ; Text on the button
                          "Select a bitmap" )   ; label when over button

; add a couple of more buttons to the graphical user interface
_IrrAddButton( 128, 16, 224, 32,   $MY_GUI_BUTTON_WINDOW, "Open a window" )
_IrrAddButton( 240, 16, 336, 32,  $MY_GUI_BUTTON_QUIT, "Close the GUI" )

; add a horizontal scroll bar to the graphical user interface
_IrrAddScrollBar( $IRR_GUI_HORIZONTAL, _
                 32, 48, 320, 64, _       ; Size
                 $MY_GUI_SCROLLBAR_RED, _  ; ID of the button
                 $redBackground, _         ; The position of the scrollbar
                 255 )                    ; The maximum value of the scrollbar
; add a vertical scroll bar to the graphical user interface
_IrrAddScrollBar( $IRR_GUI_VERTICAL, _
                 16, 64, 32, 240, _         ; Size
                 $MY_GUI_SCROLLBAR_GREEN, _  ; ID of the button
                 $greenBackground, _         ; The position of the scrollbar
                 255 )                      ; The maximum value of the scrollbar


; add a listbox to the display
$guiListbox = _IrrAddListBox( 48, 64, 320, 128, _
                            $MY_GUI_LISTBOX, _
                            $IRR_GUI_DRAW_BACKGROUND )

; add three items to the listbox
_IrrAddListBoxItem( $guiListbox, "Apples" )
_IrrAddListBoxItem( $guiListbox, "Oranges" )
_IrrAddListBoxItem( $guiListbox, "Pears" )

; select item 1 oranges
_IrrSelectListBoxItem( $guiListbox, 1 )

; add a normal editbox to the display
$guiEdit = _IrrAddEditBox( "Editable text", _
                         48,128, 320,144, _
                         $MY_GUI_EDITBOX, _
                         $IRR_GUI_BORDER, $IRR_GUI_NOT_PASSWORD )

; add a password editbox to the display
$guiPassword = _IrrAddEditBox( "Hidden Password", _
               48,144, 320,160, _
               $MY_GUI_PASSWORD, _
               $IRR_GUI_BORDER, _
               $IRR_GUI_PASSWORD )

; add a checkbox to the display
_IrrAddCheckBox( "Clickable Option", _
                48,160, 320,176, _
                $MY_GUI_CHECKBOX, _
                1 )

; Let the GUI system handle the events
_IrrGUIEvents( 1 )

; while the scene is still running
WHILE _IrrRunning()
    ; begin the scene, erasing the canvas to white before rendering
    _IrrBeginScene( $redBackground, $greenBackground, 0 )

    ; draw the Graphical User Interface
    _IrrDrawGUI()

    ; if there are GUI events available
    If _IrrGUIEventAvailable() then

        ; read the GUI event out
        $pGUIEvent = _IrrReadGUIEvent()

        ; process the particular control
		$gui_ID = __getGuiEvt($pGUIEvent, $EVT_GUI_IID)
		$gui_Event = __getGuiEvt($pGUIEvent, $EVT_GUI_IEVENT)

		select
        case $gui_ID = $MY_GUI_BUTTON_FILE
            ; if the button has been pressed
            If $gui_Event = $EGET_BUTTON_CLICKED then
                ; open a file open dialog
                _IrrAddFileOpen( "Select an IMAGE file!!", $MY_GUI_FILEOPEN, $IRR_GUI_MODAL  )
            EndIf

        case $gui_ID = $MY_GUI_BUTTON_WINDOW
            ; if the button has been pressed
            If $gui_Event = $EGET_BUTTON_CLICKED then
                ; open a small modal window
                $guiWindow = _IrrAddWindow( "Window", 80, 80, 160, 144, $IRR_GUI_MODAL )
                ; with a button that can close the window
                _IrrAddButton( 16, 32, 64, 48, 104, "Close me", "", $guiWindow )
            EndIf

        case $gui_ID = $MY_GUI_BUTTON_QUIT
            ; if the button has been pressed
            If $gui_Event = $EGET_BUTTON_CLICKED then
                ; all GUI elements from the display
                _IrrGUIClear()
                ; let the system handle mouse and key events now
                _IrrGUIEvents( 0 )
            EndIf

        case $gui_ID = $MY_GUI_BUTTON_CLOSE
            ; if the button has been pressed
            If $gui_Event = $EGET_BUTTON_CLICKED then
                ; remove the window and its child button from the display
                _IrrGUIRemove( $guiWindow )
            EndIf

        case $gui_ID = $MY_GUI_SCROLLBAR_RED
            ; if the position of the scrollbar has been changed
            If $gui_Event = $EGET_SCROLL_BAR_CHANGED then
                ; set the red value of the background color
                $redBackground = __getGuiEvt($pGUIEvent, $EVT_GUI_IX)
            EndIf

        case $gui_ID = $MY_GUI_SCROLLBAR_GREEN
            ; if the position of the scrollbar has been changed
            If $gui_Event = $EGET_SCROLL_BAR_CHANGED then
                ; set the red value of the background color
                $greenBackground = __getGuiEvt($pGUIEvent, $EVT_GUI_IX)
            EndIf

        case $gui_ID = $MY_GUI_LISTBOX
            ; if the listbox selection has changed
            If $gui_Event = $EGET_LISTBOX_CHANGED then
                ; change the text to show which item is selected
                if __getGuiEvt($pGUIEvent, $EVT_GUI_IX) = 0 then _IrrGUISetText( $guiStatic, "Selected apples" )
                if __getGuiEvt($pGUIEvent, $EVT_GUI_IX) = 1 then _IrrGUISetText( $guiStatic, "Selected oranges" )
                if __getGuiEvt($pGUIEvent, $EVT_GUI_IX) = 2 then _IrrGUISetText( $guiStatic, "Selected pears" )
            EndIf

        case $gui_ID = $MY_GUI_EDITBOX
            ; if the editbox contents have changed
            If $gui_Event = $EGET_EDITBOX_CHANGED then
                ; set the static text object to the contents of the edit box
                _IrrGUISetText( $guiStatic, _IrrGUIGetText( $guiEdit ))
            EndIf

        case $gui_ID = $MY_GUI_PASSWORD
            ; if the password editbox contents have changed
            If $gui_Event = $EGET_EDITBOX_CHANGED then
                ; set the static text object to the contents of the edit box
                _IrrGUISetText( $guiStatic, _IrrGUIGetText( $guiPassword ))
            EndIf

        case $gui_ID = $MY_GUI_CHECKBOX
            ; if the checkbox state has changed
            If $gui_Event = $EGET_CHECKBOX_CHANGED then
                ; set the static text object to represent the checkbox state
                if __getGuiEvt($pGUIEvent, $EVT_GUI_IX) = 0 then
                    _IrrGUISetText( $guiStatic, "Checkbox is Cleared" )
                else
                    _IrrGUISetText( $guiStatic, "Checkbox is Checked" )
                Endif
            EndIf

        case $gui_ID = $MY_GUI_FILEOPEN
            ; if the event was from a file being selected
            If $gui_Event = $EGET_FILE_SELECTED then
                $imageTexture = _IrrGetTexture( string(_IrrGetLastSelectedFile()) ) ; convert wstr to string
                if NOT $imageTexture = 0 then
                    _IrrAddImage( $imageTexture, 352, 16, $IRR_USE_ALPHA, 140 )
                endif
            EndIf

        EndSelect
    Endif

    ; end drawing the scene and render it
    _IrrEndScene()
WEND

; -----------------------------------------------------------------------------
; Stop the irrlicht engine and release resources
_IrrStop()
