
; Au3Irrlicht UDF Release 2.0.1
; (not complete) list of the fixes/changes:


; 100722 added _IrrStartAdvanced, _IrrBeginSceneAdvanced, _IrrIsFullscreen(), _IrrGet2DPositionFromScreenCoordinates
; 100722 added several window functions
; 100722 added _IrrSetNodeColorByVertex, _IrrSetNodeEmissiveColor, _IrrSetNodeSpecularColor, _IrrSetNodeDiffuseColor, _IrrSetNodeAmbientColor
; 100721 fixed _IrrGetNodeAndCollisionPointFromRay
; 100720 fixed _IrrGetNodeFirstChild, _IrrGetNodeNextChild, _IrrIsNodeLastChild
; 100718 fixed _IrrGetCollisionGroupFromMesh
; 100718 fixed _IrrGet3DPositionFromScreenCoordinates
; 100717 changed return value from BOOL to VECTOR ARRAY for _IrrGetNodePosition, _IrrGetNodeAbsolutePosition, _IrrGetNodeRotation
; 100712 a LOT of addons, fixes etc. to get the GUI-demo running.
; 100711 added helper functions __getKeyEvt, __getMouseEvt, __getGuiEvt and needed enums
; 100710 fixed _IrrSetTileColor (missing defaults)
; 100710 fixed _IrrAddTerrainTile (wrong params)
; 100710 fixed _IrrGetCameraOrientation
; 100707 fixed _IrrGetScreenCoordinatesFrom3DPosition
; 100706 added _IrrAddBeamSceneNode / _IrrSetBeamSize / _IrrSetBeamPosition
; 100706 added _IrrAddBoltSceneNode / _IrrSetBoltProperties
; 100706 added _IrrSetJointMode
; 100706 added _IrrSetBillBoardSize / _IrrSetBillBoardColor
; 100706 fixed (again) _IrrMakeARGB (not too easy to calculate 32bit unsigned int in au3 :X) Seems to be ok now
; 100706 started to add xEffects extensions (freeBasic definitions still todo kept inside this UDF in #cs / #ce block:
; done today: _IrrXEffectsStart / _IrrXEffectsSetAmbientColor / _IrrXEffectsSetShadowLightPosition / _IrrXEffectsAddShadowLight
;	/ _IrrXEffectsAddShadowToNode / _IrrXEffectsEnableDepthPass / _IrrXEffectsAddNodeToDepthPass / _IrrXEffectsAddPostProcessingFromFile
;	/ _IrrXEffectsSetClearColor / _IrrXEffectsSetPostProcessingUserTexture
; 100705 rewrote _IrrGetCameraTarget / _IrrGetCameraUpDirection / _IrrGetCameraOrientation
; 100705 fixed _IrrGetCollisionPoint / _IrrGetChildCollisionNodeFromRay
; 100704 fixed _IrrAddGrass
; 100704 added _IrrAddFadeAnimator
; 100704 fixed _IrrAddBillBoardToScene (missing defaults)
; 100704 fixed global enum (IRR_MATERIAL_TYPES) (missing values)
; 100704 fixed _IrrAddParticleSystemToScene (missing params)

; 100704 added error handlers for all functions with ONE return value (pointer, int, etc.)
;		 should set now @error and return valid value or false depending on success of their dllcall
;		 TODO: error handling for functions returning arrays

; 100704 fixed _IrrAddBillboardTextSceneNode (wrong params)
; 100704 rewrote non-working _IrrMakeARGB
; 100703 fixed _IrrAddLight + _IrrAddNodeShadow + _IrrSetAmbientLight
; 100703 fixed _IrrSetSkyDomeColorPoint (missing param)
; 100703 fixed _IrrAddFlyCircleAnimator, _IrrAddFlyStraightAnimator
; 100703 fixed _IrrGetCollisionGroupFromComplexMesh
; 100703 fixed _IrrSetNodeAnimationSpeed / _IrrSetNodeAnimationFrame
; 100703 rewrote non-working _IrrAddSplineAnimator
; 100701 fixed _IrrGUISetText, _IrrAddWindow, _IrrAddStaticText, _IrrAddButton (param "str" to "wstr")
; 100701 added several enums for examples from irrlichtwrapper.bi
; 100701 fixed _IrrAddTerrain, _IrrAddTerrainTile, _IrrAddSphericalTerrain (patch size defaults caused problems)
; 100701 added _IrrScaleMesh
; 100701 fixed _IrrSetMeshHardwareAccelerated
; 100630 added _IrrCreateBatchingMesh / _IrrAddToBatchingMesh / _IrrFinalizeBatchingMesh
; 100630 added _IrrSetMeshMaterialTexture
; 100630 added Enum EKEY_CODE (for irrlicht Key Codes)
; 100630 added helper function __CreatePtrKeyMapArray: returns pointer to a keymap for _IrrAddFPSCamera.

; 100630 added error handlers for all functions WITHOUT return value:
;		 should set now @error and return true or false depending on success of their dllcall
;		 TODO: complete error handling for functions WITH return value
; 100627 rewrote non-working _IrrGetNodePosition() + _IrrGetNodeAbsolutePosition() + _IrrGetNodeRotation()
; 100627 rewrote non-working _IrrGetNodeBoundingBox($h_Node, ByRef $a_VectorA3df, ByRef $a_VectorB3df)
; 100626 fixed _IrrHideMouse() and _IrrShowMouse()
; 100626 added missing param to _IrrSetCameraClipDistance(..., $f_NearDistance = 1.0)
; 100626 fixed param order of _IrrAddChildToParent($h_ChildNode, $h_ParentNode)
; 100624 extend _IrrAddWaterSurfaceSceneNode (added defaults from IrrlichtWrapper.bi)
; 100624 fixed _IrrAddHillPlaneMesh (""ptr", $s_Name" has to be "str", ...)
; 100620 fixed _IrrAddHillPlaneMesh (wrong params)
; 100620 fixed _IrrAddSkyDomeToScene (wrong params)


#include-once

global $result


Global Enum $IRR_EDT_NULL, $IRR_EDT_SOFTWARE, $IRR_EDT_SOFTWARE2, $IRR_EDT_OPENGL, $IRR_EDT_DIRECT3D8, $IRR_EDT_DIRECT3D9
Global Enum Step *16 $IRR_BITS_PER_PIXEL_16 , $IRR_BITS_PER_PIXEL_32
Global Enum $IRR_WINDOWED, $IRR_FULLSCREEN
Global Enum $IRR_NO_SHADOWS, $IRR_SHADOWS
Global Enum $IRR_IGNORE_EVENTS, $IRR_CAPTURE_EVENTS
Global Enum $IRR_VERTICAL_SYNC_OFF, $IRR_VERTICAL_SYNC_ON
Global Enum $IRR_IGNORE_ALPHA, $IRR_USE_ALPHA
Global Enum $IRR_OFF, $IRR_ON
Global Enum $IRR_EMF_WIREFRAME, $IRR_EMF_POINTCLOUD, $IRR_EMF_GOURAUD_SHADING, $IRR_EMF_LIGHTING, $IRR_EMF_ZBUFFER, $IRR_EMF_ZWRITE_ENABLE, $IRR_EMF_BACK_FACE_CULLING, $IRR_EMF_FRONT_FACE_CULLING, $IRR_EMF_BILINEAR_FILTER, $IRR_EMF_TRILINEAR_FILTER, $IRR_EMF_ANISOTROPIC_FILTER, $IRR_EMF_FOG_ENABLE, $IRR_EMF_NORMALIZE_NORMALS, $IRR_EMF_TEXTURE_WRAP, $IRR_EMF_ANTI_ALIASING, $IRR_EMF_COLOR_MASK, $IRR_EMF_COLOR_MATERIAL
Global Enum $IRR_EMAT_STAND, $IRR_EMAT_RUN, $IRR_EMAT_ATTACK, $IRR_EMAT_PAIN_A, $IRR_EMAT_PAIN_B, $IRR_EMAT_PAIN_C, $IRR_EMAT_JUMP, $IRR_EMAT_FLIP, $IRR_EMAT_SALUTE ,$IRR_EMAT_FALLBACK, $IRR_EMAT_WAVE, $IRR_EMAT_POINT, $IRR_EMAT_CROUCH_STAND, $IRR_EMAT_CROUCH_WALK, $IRR_EMAT_CROUCH_ATTACK, $IRR_EMAT_CROUCH_PAIN, $IRR_EMAT_CROUCH_DEATH, $IRR_EMAT_DEATH_FALLBACK, $IRR_EMAT_DEATH_FALLFORWARD, $IRR_EMAT_DEATH_FALLBACKSLOW, $IRR_EMAT_BOOM
Global Enum $IRR_USE_CASE, $IRR_IGNORE_CASE
Global Enum $IRR_USE_PATHS, $IRR_IGNORE_PATHS
Global Enum $IRR_NO_EMITTER, $IRR_DEFAULT_EMITTER
Global Enum $IRR_REPEL, $IRR_ATTRACT

global ENUM _ ; IRR_MATERIAL_TYPES: Material Types
    $IRR_EMT_SOLID           , _ ; Standard solid rendering uses one texture
    $IRR_EMT_SOLID_2_LAYER       , _ ; 2 blended textures using vertex alpha value
    $IRR_EMT_LIGHTMAP            , _ ; 2 textures: 0=color 1=lighting level and ignores vertex lighting
    $IRR_EMT_LIGHTMAP_ADD        , _ ; ... as above but adds levels instead of modulating between them
    $IRR_EMT_LIGHTMAP_M2         , _ ; ... as above but color levels are multiplied by 2 for brightening
    $IRR_EMT_LIGHTMAP_M4         , _ ; ... as above but color leels are multiplied by 4 for brightening
    $IRR_EMT_LIGHTMAP_LIGHTING   , _ ; 2 textures: 0=color 1=lighting level but supports dynamic lighting
    $IRR_EMT_LIGHTMAP_LIGHTING_M2    , _ ; ... as above but color levels are multiplied by 2 for brightening
    $IRR_EMT_LIGHTMAP_LIGHTING_M4    , _ ; ... as above but color leels are multiplied by 4 for brightening
    $IRR_EMT_DETAIL_MAP          , _ ; 2 blended textures: the first is a color map the second at a different scale adds and subtracts from the color to add detail
    $IRR_EMT_SPHERE_MAP          , _ ; makes the material appear reflective
    $IRR_EMT_REFLECTION_2_LAYER  , _ ; a reflective material blended with a color texture
    $IRR_EMT_TRANSPARENT_ADD_COLOR   , _ ; a transparency effect that simply adds a color texture to the background. the darker the color the more transparent it is.
    $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL   , _ ; a transparency effect that uses the color textures alpha as a transparency level
    $IRR_EMT_TRANSPARENT_ALPHA_CHANNEL_REF   , _ ; a transparency effect that uses the color textures alpha, the pixel is only drawn if the alpha is > 127. this is a fast effect that does not blur edges and is ideal for leaves & grass etc.
    $IRR_EMT_TRANSPARENT_VERTEX_ALPHA    , _ ; a transparency effect that uses the vertex alpha value
    $IRR_EMT_TRANSPARENT_REFLECTION_2_LAYER  , _ ; a transparent & reflecting effect. the first texture is a reflection map, the second a color map. transparency is from vertex alpha
    $IRR_EMT_NORMAL_MAP_SOLID    , _ ; A solid normal map renderer. First texture is color, second is normal map. Only use nodes added with IrrAddStaticMeshForNormalMappingToScene. Only supports nearest two lights. Requires vertex and pixel shaders 1.1
    $IRR_EMT_NORMAL_MAP_TRANSPARENT_ADD_COLOR    , _ ; ... as above only with a transparency effect that simply adds the color to the background. the darker the color the more transparent it is.
    $IRR_EMT_NORMAL_MAP_TRANSPARENT_VERTEX_ALPHA , _ ; ... as above only with a transparency effect that uses the vertex alpha value
    $IRR_EMT_PARALLAX_MAP_SOLID  , _ ; similar to the solid normal map but more realistic providing virtual displacement of the surface. Uses the alpha channel of the normal map for height field displacement. Requires vertex shader 1.1 and pixel shader 1.4.
    $IRR_EMT_PARALLAX_MAP_TRANSPARENT_ADD_COLOR  , _ ; ... as above only with a transparency effect that simply adds the color to the background. the darker the color the more transparent it is.
    $IRR_EMT_PARALLAX_MAP_TRANSPARENT_VERTEX_ALPHA   , _ ; ... as above only wiht a transparency effect that uses the vertex alpha value
    $IRR_EMT_ONE_TEXTURE_BLEND, _
    $IRR_EMT_FOUR_DETAIL_MAP  , _ ; 4 grayscale images in the channels of the first texture mixed with the vertex channels as alpha images
    $IRR_EMT_TRANSPARENT_ADD_ALPHA_CHANNEL_REF , _ ; as above only it adds the texture color rather than replacing it
    $IRR_EMT_TRANSPARENT_ADD_ALPHA_CHANNEL
    ; $IRR_EMT_FORCE_32BIT = &h7fffffff
; END ENUM IRR_MATERIAL_TYPES

global Enum _ ; IRR_EGUI_EVENT_TYPE
	$EGET_ELEMENT_FOCUS_LOST = 0, _ 	; ' A gui element has lost its focus.
    $EGET_ELEMENT_FOCUSED, _ 		; ' A gui element has got the focus.
    $EGET_ELEMENT_HOVERED, _ 		; ' The mouse cursor hovered over a gui element.
    $EGET_ELEMENT_LEFT, _ 			; ' The mouse cursor left the hovered element.
    $EGET_ELEMENT_CLOSED, _ 			; ' An element would like to close.
    $EGET_BUTTON_CLICKED, _ 			; ' A button was clicked.
    $EGET_SCROLL_BAR_CHANGED, _ 		; ' A scrollbar has changed its position.
    $EGET_CHECKBOX_CHANGED, _ 		; ' A checkbox has changed its check state.
    $EGET_LISTBOX_CHANGED, _ 		; ' A new item in a listbox was seleted.
    $EGET_LISTBOX_SELECTED_AGAIN, _ 	; ' An item in the listbox was selected, which was already selected.
    $EGET_FILE_SELECTED, _ 			; ' A file has been selected in the file dialog
    $EGET_DIRECTORY_SELECTED, _ 		; ' A directory has been selected in the file dialog
    $EGET_FILE_CHOOSE_DIALOG_CANCELLED, _ 	; ' A file open dialog has been closed without choosing a file
    $EGET_MESSAGEBOX_YES, _ 				; ' 'Yes' was clicked on a messagebox
    $EGET_MESSAGEBOX_NO, _ 				; ' 'No' was clicked on a messagebox
    $EGET_MESSAGEBOX_OK, _ 				; ' 'OK' was clicked on a messagebox
    $EGET_MESSAGEBOX_CANCEL, _ 			; ' 'Cancel' was clicked on a messagebox
    $EGET_EDITBOX_ENTER, _ 				; ' In an editbox 'ENTER' was pressed
    $EGET_EDITBOX_CHANGED, _ 			; ' The text in an editbox was changed. This does not include automatic changes in text-breaking.
    $EGET_EDITBOX_MARKING_CHANGED, _ 	; ' The marked area in an editbox was changed.
    $EGET_TAB_CHANGED, _ 				; ' The tab was changed in an tab control
    $EGET_MENU_ITEM_SELECTED, _ 			; ' A menu item was selected in a (context) menu
    $EGET_COMBO_BOX_CHANGED, _ 			; ' The selection in a combo box has been changed
    $EGET_SPINBOX_CHANGED, _ 			; ' The value of a spin box has changed
    $EGET_TABLE_CHANGED, _ 				; ' A table has changed
    $EGET_TABLE_HEADER_CHANGED, _ 		;
    $EGET_TABLE_SELECTED_AGAIN, _ 		;
    $EGET_TREEVIEW_NODE_DESELECT, _ 		; ' A tree view node lost selection. See IGUITreeView::getLastEventNode().
    $EGET_TREEVIEW_NODE_SELECT, _ 		; ' A tree view node was selected. See IGUITreeView::getLastEventNode().
    $EGET_TREEVIEW_NODE_EXPAND, _ 		; ' A tree view node was expanded. See IGUITreeView::getLastEventNode().
    $EGET_TREEVIEW_NODE_COLLAPS, _ 		; ' A tree view node was collapsed. See IGUITreeView::getLastEventNode().
    $EGET_COUNT 							; ' No real event. Just for convenience to get number of events
; End Enum IRR_EGUI_EVENT_TYPE


global Enum _ 	;IRR_GUI_COLOR_ELEMENT
    $EGDC_3D_DARK_SHADOW = 0, _ ; ' Dark shadow for three-dimensional display elements.
    $EGDC_3D_SHADOW, _ 			; Shadow color for three-dimensional display elements (for edges facing away from the light source).
    $EGDC_3D_FACE, _ 			; Face color for three-dimensional display elements and for dialog box backgrounds.
    $EGDC_3D_HIGH_LIGHT, _ 		; Highlight color for three-dimensional display elements (for edges facing the light source.).
    $EGDC_3D_LIGHT, _ 			; Light color for three-dimensional display elements (for edges facing the light source.).
    $EGDC_ACTIVE_BORDER, _ 		; Active window border.
    $EGDC_ACTIVE_CAPTION, _ 	; Active window title bar text.
    $EGDC_APP_WORKSPACE, _ 		; Background color of multiple document interface (MDI) applications.
    $EGDC_BUTTON_TEXT, _ 		; Text on a button.
    $EGDC_GRAY_TEXT, _ 			; Grayed (disabled) text.
    $EGDC_HIGH_LIGHT, _ 		; Item(s) selected in a control.
    $EGDC_HIGH_LIGHT_TEXT, _ 	; Text of item(s) selected in a control.
    $EGDC_INACTIVE_BORDER, _ 	; Inactive window border.
    $EGDC_INACTIVE_CAPTION, _ 	; Inactive window caption.
    $EGDC_TOOLTIP, _ 			; Tool tip text color.
    $EGDC_TOOLTIP_BACKGROUND, _ ; Tool tip background color.
    $EGDC_SCROLLBAR, _ 			; Scrollbar gray area.
    $EGDC_WINDOW, _ 			; Window background.
    $EGDC_WINDOW_SYMBOL, _ 		; Window symbols like on close buttons, scroll bars and check boxes.
    $EGDC_ICON, _ 				; Icons in a list or tree.
    $EGDC_ICON_HIGH_LIGHT, _ 	; Selected icons in a list or tree.
    $EGDC_COUNT			 		; this value is not used, it only specifies the amount of default colors available.
; End Enum IRR_GUI_COLOR_ELEMENT

; GUI Interface definitions
global const $IRR_GUI_NO_BORDER = 0
global const $IRR_GUI_BORDER = 1
global const $IRR_GUI_NO_WRAP = 0
global const $IRR_GUI_WRAP = 1
global const $IRR_GUI_HORIZONTAL = 1
global const $IRR_GUI_VERTICAL = 0
global const $IRR_GUI_MODAL = 1
global const $IRR_GUI_NOT_MODAL = 0
global const $IRR_GUI_DRAW_BACKGROUND = 1
global const $IRR_GUI_EMPTY_BACKGROUND = 0
global const $IRR_GUI_PASSWORD = 1
global const $IRR_GUI_NOT_PASSWORD = 0

global const $IRR_NO_PARENT = 0
global const $IRR_NO_OBJECT = 0
global enum $IRR_ONE_SHOT, $IRR_LOOP
global enum $IRR_LINEAR_FOG, $IRR_EXPONENTIAL_FOG
global Enum $ELT_POINT, $ELT_SPOT, $ELT_DIRECTIONAL ; enum E_LIGHT_TYPE: Light types

global Enum _ ; IRR_COLOR_MATERIAL
    $ECM_NONE, _            ; Dont use vertex color for lighting
    $ECM_DIFFUSE, _         ; Use vertex color for diffuse light, (default)
    $ECM_AMBIENT, _         ; Use vertex color for ambient light
    $ECM_EMISSIVE, _        ; Use vertex color for emissive light
    $ECM_SPECULAR, _        ; Use vertex color for specular light
    $ECM_DIFFUSE_AND_AMBIENT ;Use vertex color for both diffuse and ambient light

global ENUM _ ; IRR_BLEND_FACTOR: blend factors for the ONE_TEXTURE_BLEND material
    $EBF_ZERO, $EBF_ONE, $EBF_DST_COLOR, $EBF_ONE_MINUS_DST_COLOR, $EBF_SRC_COLOR, $EBF_ONE_MINUS_SRC_COLOR, _
    $EBF_SRC_ALPHA, $EBF_ONE_MINUS_SRC_ALPHA, $EBF_DST_ALPHA, $EBF_ONE_MINUS_DST_ALPHA, $EBF_SRC_ALPHA_SATURATE

global Enum _ ; IRR_COLOR_FORMAT: ' A color format specifies how color information is stored
    $ECF_A1R5G5B5 = 0, _ ; 16 bit color format used by the software driver, and thus preferred by all other irrlicht engine video drivers. There are 5 bits for every color component, and a single bit is left for alpha information.
    $ECF_R5G6B5, _		 ; Standard 16 bit color format.
    $ECF_R8G8B8, _		 ; 24 bit color, no alpha channel, but 8 bit for red, green and blue.
    $ECF_A8R8G8B8		 ; Default 32 bit color format. 8 bits are used for every component: red, green, blue and alpha.

global Enum _ ; IRR_TERRAIN_PATCH_SIZE
			$ETPS_9 = 9, _	; patch size of 9, at most, use 4 levels of detail with this patch size.
			$ETPS_17 = 17, _; patch size of 17, at most, use 5 levels of detail with this patch size.
			$ETPS_33 = 33, _; patch size of 33, at most, use 6 levels of detail with this patch size.
			$ETPS_65 = 65, _; patch size of 65, at most, use 7 levels of detail with this patch size.
			$ETPS_129 = 129 ; patch size of 129, at most, use 8 levels of detail with this patch size.

global Enum _ ; IRR_VIDEO_FEATURE_QUERY: enumeration for querying features of the video driver.
    $EVDF_RENDER_TO_TARGET, _ ; Is driver able to render to a surface?
    $EVDF_HARDWARE_TL, _ ; Is hardeware transform and lighting supported?
    $EVDF_MULTITEXTURE, _ ; Are multiple textures per material possible?
    $EVDF_BILINEAR_FILTER, _ ; Is driver able to render with a bilinear filter applied?
    $EVDF_MIP_MAP, _ ; Can the driver handle mip maps?
    $EVDF_MIP_MAP_AUTO_UPDATE, _ ; Can the driver update mip maps automatically?
    $EVDF_STENCIL_BUFFER, _ ; Are stencilbuffers switched on and does the device support stencil buffers?
    $EVDF_VERTEX_SHADER_1_1, _ ; Is Vertex Shader 1.1 supported?
    $EVDF_VERTEX_SHADER_2_0, _ ; Is Vertex Shader 2.0 supported?
    $EVDF_VERTEX_SHADER_3_0, _ ; Is Vertex Shader 3.0 supported?
    $EVDF_PIXEL_SHADER_1_1, _ ; Is Pixel Shader 1.1 supported?
    $EVDF_PIXEL_SHADER_1_2, _ ; Is Pixel Shader 1.2 supported?
    $EVDF_PIXEL_SHADER_1_3, _ ; Is Pixel Shader 1.3 supported?
    $EVDF_PIXEL_SHADER_1_4, _ ; Is Pixel Shader 1.4 supported?
    $EVDF_PIXEL_SHADER_2_0, _ ; Is Pixel Shader 2.0 supported?
    $EVDF_PIXEL_SHADER_3_0, _ ; Is Pixel Shader 3.0 supported?
    $EVDF_ARB_VERTEX_PROGRAM_1, _ ; Are ARB vertex programs v1.0 supported?
    $EVDF_ARB_FRAGMENT_PROGRAM_1, _ ; Are ARB fragment programs v1.0 supported?
    $EVDF_ARB_GLSL, _ ; Is GLSL supported?
    $EVDF_HLSL, _ ; Is HLSL supported?
    $EVDF_TEXTURE_NSQUARE, _ ; Are non-square textures supported?
    $EVDF_TEXTURE_NPOT, _ ; Are non-power-of-two textures supported?
    $EVDF_FRAMEBUFFER_OBJECT, _ ; Are framebuffer objects supported?
    $EVDF_VERTEX_BUFFER_OBJECT, _ ; Are vertex buffer objects supported?
    $EVDF_ALPHA_TO_COVERAGE, _ ; Supports Alpha To Coverage
    $EVDF_COLOR_MASK, _ ; Supports Color masks (disabling color planes in output)
    $EVDF_MULTIPLE_RENDER_TARGETS, _ ; Supports multiple render targets at once
    $EVDF_MRT_BLEND, _ ; Supports separate blend settings for multiple render targets
    $EVDF_MRT_COLOR_MASK, _ ; Supports separate color masks for multiple render targets
    $EVDF_MRT_BLEND_FUNC, _ ; Supports separate blend functions for multiple render targets
    $EVDF_GEOMETRY_SHADER ; Supports geometry shaders
; End Enum ; IRR_VIDEO_FEATURE_QUERY

global enum _ ; IRR_JOINT_MODE: Joint animation modes
    $IRR_JOINT_MODE_NONE, $IRR_JOINT_MODE_READ, $IRR_JOINT_MODE_CONTROL

global enum _ ; attach a tile onto this tile: used for _IrrAttachTile
	$TOP_EDGE, $BOTTOM_EDGE, $LEFT_EDGE, $RIGHT_EDGE

global enum $IRR_KEY_UP, $IRR_KEY_DOWN ; Input definitions

global enum _ ; IRR_MOUSE_EVENTS
	$IRR_EMIE_LMOUSE_PRESSED_DOWN, $IRR_EMIE_RMOUSE_PRESSED_DOWN, $IRR_EMIE_MMOUSE_PRESSED_DOWN, $IRR_EMIE_LMOUSE_LEFT_UP, _
    $IRR_EMIE_RMOUSE_LEFT_UP, $IRR_EMIE_MMOUSE_LEFT_UP, $IRR_EMIE_MOUSE_MOVED, $IRR_EMIE_MOUSE_WHEEL

Global enum _ ; Enum EKEY_CODE
    $KEY_LBUTTON          = 0x0001, _ ;Left mouse button
    $KEY_RBUTTON          = 0x0002, _ ;Right mouse button
    $KEY_CANCEL           = 0x0003, _ ;Control-break processing
    $KEY_MBUTTON          = 0x0004, _ ;Middle mouse button (three-button mouse)
    $KEY_XBUTTON1         = 0x0005, _ ;Windows 2000/XP: X1 mouse button
    $KEY_XBUTTON2         = 0x0006, _ ;Windows 2000/XP: X2 mouse button
    $KEY_BACK             = 0x0008, _ ;BACKSPACE key
    $KEY_TAB              = 0x0009, _ ;Tab key
    $KEY_CLEAR            = 0x000C, _ ;Clear key
    $KEY_RETURN           = 0x000D, _ ;ENTER key
    $KEY_SHIFT            = 0x0010, _ ;SHIFT key
    $KEY_CONTROL          = 0x0011, _ ;CTRL key
    $KEY_MENU             = 0x0012, _ ;ALT key
    $KEY_PAUSE            = 0x0013, _ ;PAUSE key
    $KEY_CAPITAL          = 0x0014, _ ;CAPS Lock key
    $KEY_KANA             = 0x0015, _ ;IME Kana mode
    $KEY_HANGUEL          = 0x0015, _ ;IME Hanguel mode (maintained For compatibility use KEY_HANGUL)
    $KEY_HANGUL           = 0x0015, _ ;IME Hangul mode
    $KEY_JUNJA            = 0x0017, _ ;IME Junja mode
    $KEY_FINAL            = 0x0018, _ ;IME final mode
    $KEY_HANJA            = 0x0019, _ ;IME Hanja mode
    $KEY_KANJI            = 0x0019, _ ;IME Kanji mode
    $KEY_ESCAPE           = 0x001B, _ ;ESC key
    $KEY_CONVERT          = 0x001C, _ ;IME convert
    $KEY_NONCONVERT       = 0x001D, _ ;IME nonconvert
    $KEY_ACCEPT           = 0x001E, _ ;IME accept
    $KEY_MODECHANGE       = 0x001F, _ ;IME mode change request
    $KEY_SPACE            = 0x0020, _ ;SPACEBAR
    $KEY_PRIOR            = 0x0021, _ ;PAGE UP key
    $KEY_NEXT             = 0x0022, _ ;PAGE DOWN key
    $KEY_END              = 0x0023, _ ;End key
    $KEY_HOME             = 0x0024, _ ;HOME key
    $KEY_LEFT             = 0x0025, _ ;Left ARROW key
    $KEY_UP               = 0x0026, _ ;UP ARROW key
    $KEY_RIGHT            = 0x0027, _ ;Right ARROW key
    $KEY_DOWN             = 0x0028, _ ;DOWN ARROW key
    $KEY_SELECT           = 0x0029, _ ;Select key
    $KEY_PRINT            = 0x002A, _ ;Print key
    $KEY_EXECUT           = 0x002B, _ ;EXECUTE key
    $KEY_SNAPSHOT         = 0x002C, _ ;Print Screen key
    $KEY_INSERT           = 0x002D, _ ;INS key
    $KEY_DELETE           = 0x002E, _ ;DEL key
    $KEY_HELP             = 0x002F, _ ;HELP key
    $KEY_KEY_0            = 0x0030, _ ;0 key
    $KEY_KEY_1            = 0x0031, _ ;1 key
    $KEY_KEY_2            = 0x0032, _ ;2 key
    $KEY_KEY_3            = 0x0033, _ ;3 key
    $KEY_KEY_4            = 0x0034, _ ;4 key
    $KEY_KEY_5            = 0x0035, _ ;5 key
    $KEY_KEY_6            = 0x0036, _ ;6 key
    $KEY_KEY_7            = 0x0037, _ ;7 key
    $KEY_KEY_8            = 0x0038, _ ;8 key
    $KEY_KEY_9            = 0x0039, _ ;9 key
    $KEY_KEY_A            = 0x0041, _ ;A key
    $KEY_KEY_B            = 0x0042, _ ;B key
    $KEY_KEY_C            = 0x0043, _ ;C key
    $KEY_KEY_D            = 0x0044, _ ;D key
    $KEY_KEY_E            = 0x0045, _ ;E key
    $KEY_KEY_F            = 0x0046, _ ;F key
    $KEY_KEY_G            = 0x0047, _ ;G key
    $KEY_KEY_H            = 0x0048, _ ;H key
    $KEY_KEY_I            = 0x0049, _ ;I key
    $KEY_KEY_J            = 0x004A, _ ;J key
    $KEY_KEY_K            = 0x004B, _ ;K key
    $KEY_KEY_L            = 0x004C, _ ;L key
    $KEY_KEY_M            = 0x004D, _ ;M key
    $KEY_KEY_N            = 0x004E, _ ;N key
    $KEY_KEY_O            = 0x004F, _ ;O key
    $KEY_KEY_P            = 0x0050, _ ;P key
    $KEY_KEY_Q            = 0x0051, _ ;Q key
    $KEY_KEY_R            = 0x0052, _ ;R key
    $KEY_KEY_S            = 0x0053, _ ;S key
    $KEY_KEY_T            = 0x0054, _ ;T key
    $KEY_KEY_U            = 0x0055, _ ;U key
    $KEY_KEY_V            = 0x0056, _ ;V key
    $KEY_KEY_W            = 0x0057, _ ;W key
    $KEY_KEY_X            = 0x0058, _ ;X key
    $KEY_KEY_Y            = 0x0059, _ ;Y key
    $KEY_KEY_Z            = 0x005A, _ ;Z key
    $KEY_LWIN             = 0x005B, _ ;Left Windows key (Microsoft® Natural® keyboard)
    $KEY_RWIN             = 0x005C, _ ;Right Windows key (Natural keyboard)
    $KEY_APPS             = 0x005D, _ ;Applications key (Natural keyboard)
    $KEY_SLEEP            = 0x005F, _ ;Computer Sleep key
    $KEY_NUMPAD0          = 0x0060, _ ;Numeric keypad 0 key
    $KEY_NUMPAD1          = 0x0061, _ ;Numeric keypad 1 key
    $KEY_NUMPAD2          = 0x0062, _ ;Numeric keypad 2 key
    $KEY_NUMPAD3          = 0x0063, _ ;Numeric keypad 3 key
    $KEY_NUMPAD4          = 0x0064, _ ;Numeric keypad 4 key
    $KEY_NUMPAD5          = 0x0065, _ ;Numeric keypad 5 key
    $KEY_NUMPAD6          = 0x0066, _ ;Numeric keypad 6 key
    $KEY_NUMPAD7          = 0x0067, _ ;Numeric keypad 7 key
    $KEY_NUMPAD8          = 0x0068, _ ;Numeric keypad 8 key
    $KEY_NUMPAD9          = 0x0069, _ ;Numeric keypad 9 key
    $KEY_MULTIPLY         = 0x006A, _ ;Multiply key
    $KEY_ADD              = 0x006B, _ ;Add key
    $KEY_SEPARATOR        = 0x006C, _ ;Separator key
    $KEY_SUBTRACT         = 0x006D, _ ;Subtract key
    $KEY_DECIMAL          = 0x006E, _ ;Decimal key
    $KEY_DIVIDE           = 0x006F, _ ;Divide key
    $KEY_F1               = 0x0070, _ ;F1 key
    $KEY_F2               = 0x0071, _ ;F2 key
    $KEY_F3               = 0x0072, _ ;F3 key
    $KEY_F4               = 0x0073, _ ;F4 key
    $KEY_F5               = 0x0074, _ ;F5 key
    $KEY_F6               = 0x0075, _ ;F6 key
    $KEY_F7               = 0x0076, _ ;F7 key
    $KEY_F8               = 0x0077, _ ;F8 key
    $KEY_F9               = 0x0078, _ ;F9 key
    $KEY_F10              = 0x0079, _ ;F10 key
    $KEY_F11              = 0x007A, _ ;F11 key
    $KEY_F12              = 0x007B, _ ;F12 key
    $KEY_F13              = 0x007C, _ ;F13 key
    $KEY_F14              = 0x007D, _ ;F14 key
    $KEY_F15              = 0x007E, _ ;F15 key
    $KEY_F16              = 0x007F, _ ;F16 key
    $KEY_F17              = 0x0080, _ ;F17 key
    $KEY_F18              = 0x0081, _ ;F18 key
    $KEY_F19              = 0x0082, _ ;F19 key
    $KEY_F20              = 0x0083, _ ;F20 key
    $KEY_F21              = 0x0084, _ ;F21 key
    $KEY_F22              = 0x0085, _ ;F22 key
    $KEY_F23              = 0x0086, _ ;F23 key
    $KEY_F24              = 0x0087, _ ;F24 key
    $KEY_NUMLOCK          = 0x0090, _ ;NUM Lock key
    $KEY_SCROLL           = 0x0091, _ ;SCROLL Lock key
    $KEY_LSHIFT           = 0x00A0, _ ;Left SHIFT key
    $KEY_RSHIFT           = 0x00A1, _ ;Right SHIFT key
    $KEY_LCONTROL         = 0x00A2, _ ;Left CONTROL key
    $KEY_RCONTROL         = 0x00A3, _ ;Right CONTROL key
    $KEY_LMENU            = 0x00A4, _ ;Left MENU key
    $KEY_RMENU            = 0x00A5, _ ;Right MENU key
    $KEY_PLUS             = 0x00BB, _ ;Plus Key   (+)
    $KEY_COMMA            = 0x00BC, _ ;Comma Key  (,)
    $KEY_MINUS            = 0x00BD, _ ;Minus Key  (-)
    $KEY_PERIOD           = 0x00BE, _ ;Period Key (.)
    $KEY_ATTN             = 0x00F6, _ ;Attn key
    $KEY_CRSEL            = 0x00F7, _ ;CrSel key
    $KEY_EXSEL            = 0x00F8, _ ;ExSel key
    $KEY_EREOF            = 0x00F9, _ ;Erase Eof key
    $KEY_PLAY             = 0x00FA, _ ;Play key
    $KEY_ZOOM             = 0x00FB, _ ;Zoom key
    $KEY_PA1              = 0x00FD, _ ;PA1 key
    $KEY_OEM_CLEAR        = 0x00FE, _ ;Clear key
    $KEY_KEY_CODES_COUNT  = 0x00FF   ;this Is Not a key but the amount of keycodes there are.
;End Enum EKEY_CODE

global Enum _ ; E_FILTER_TYPE: filter types, up to 16 samples PCF.
	$EFT_NONE, $EFT_4PCF, $EFT_8PCF, $EFT_12PCF, $EFT_16PCF, $EFT_COUNT

global Enum _ ; E_SHADOW_MODE shadow modes for lighting
	$ESM_RECEIVE, $ESM_CAST, $ESM_BOTH, $ESM_EXCLUDE, $ESM_COUNT

global Enum _ ; IRR_SHADER_CONSTANTS ' Pre-programmed shader constants
    $IRR_NO_PRESET, $IRR_INVERSE_WORLD, $IRR_WORLD_VIEW_PROJECTION, $IRR_CAMERA_POSITION, $IRR_TRANSPOSED_WORLD

global Enum _ ; IRR_DEBUG
	$EDS_OFF = 0, $EDS_BBOX = 1, $EDS_NORMALS = 2, $EDS_SKELETON = 4, $EDS_MESH_WIRE_OVERLAY = 8, _
	$EDS_HALF_TRANSPARENCY = 16, $EDS_BBOX_BUFFERS = 32, $EDS_FULL = 0xffffffff



Global $_irrDll = DllOpen("IrrlichtWrapper.dll")



Func _IrrStart($i_DeviceType = 3, $i_ScreenWidth = 800, $i_ScreenHeight = 600, $i_BitsPerPixel = 1, $i_FullScreen = 0, $i_Shadows = 0, $i_InputCapture = 0, $i_VSync = 0)
	DllCall($_irrDll, "none:cdecl", "IrrStart", "int", $i_DeviceType, "int", $i_ScreenWidth, "int", $i_ScreenHeight, "int", $i_BitsPerPixel, "uint", $i_FullScreen, "int", $i_Shadows, "int", $i_InputCapture, "int", $i_VSync)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrStart


Func _IrrStartAdvanced($i_DeviceType = 3, $i_ScreenWidth = 800, $i_ScreenHeight = 600, $i_BitsPerPixel = 1, $i_FullScreen = 0, $i_Shadows = 0, $i_InputCapture = 0, $i_VSync = 0, $i_TypeOfDevice = 0, $i_DoublebufferEnabled = 0, $i_AntialiasEnabled = 0, $i_HighPrecisionFpu = 0)
; an advanced method of starting the irrlicht interface
	$result = DllCall($_irrDll, "uint:cdecl", "IrrStart", "int", $i_DeviceType, "int", $i_ScreenWidth, "int", $i_ScreenHeight, _
			"int", $i_BitsPerPixel, "uint", $i_FullScreen, "uint", $i_Shadows, "uint", $i_InputCapture, "uint", $i_VSync, _
			"uint", $i_TypeOfDevice, "uint", $i_DoublebufferEnabled, "uint", $i_AntialiasEnabled, "uint", $i_HighPrecisionFpu)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrStartAdvanced


Func _IrrRunning()
	$result = DllCall($_irrDll, "int:cdecl", "IrrRunning")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrRunning

Func _IrrSetViewPort($i_TopX, $i_TopY, $i_BottomX, $i_BottomY)
	DllCall($_irrDll, "none:cdecl", "IrrSetViewPort", "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetViewPort

Func _IrrBeginScene($i_Red, $i_Green, $i_Blue)
; initialise the frame drawing cycle, erasing the canvas ready for drawing
	DllCall($_irrDll, "none:cdecl", "IrrBeginScene", "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrBeginScene


Func _IrrBeginSceneAdvanced($i_SceneBGColor, $i_ClearBackBuffer = 1, $i_ClearZBuffer = 1)
; Readies a scene for rendering, erasing the canvas and setting a background color.
	DllCall($_irrDll, "none:cdecl", "IrrBeginSceneAdvanced", "uint", $i_SceneBGColor, "byte", $i_ClearBackBuffer, "byte", $i_ClearZBuffer)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrBeginSceneAdvanced


Func _IrrDrawScene()
	DllCall($_irrDll, "none:cdecl", "IrrDrawScene")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDrawScene

Func _IrrDrawSceneToTexture($h_RenderTargetTexture)
;use IrrCreateRenderTargetTexture to get $h_RenderTargetTexture
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrDrawSceneToTexture", "ptr", $h_RenderTargetTexture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrDrawSceneToTexture

Func _IrrDrawGUI()
	DllCall($_irrDll, "none:cdecl", "IrrDrawGUI")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDrawGUI

Func _IrrEndScene()
	DllCall($_irrDll, "none:cdecl", "IrrEndScene")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrEndScene

Func _IrrStop()
	DllCall($_irrDll, "none:cdecl", "IrrStop")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrStop

Func _IrrTransparentZWrite()
	DllCall($_irrDll, "none:cdecl", "IrrTransparentZWrite")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrTransparentZWrite

Func _IrrGetFPS()
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetFPS")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetFPS

Func _IrrGetPrimitivesDrawn()
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetPrimitivesDrawn")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetPrimitivesDrawn

Func _IrrSetWindowCaption($s_Caption)
	DllCall($_irrDll, "none:cdecl", "IrrSetWindowCaption", "wstr", $s_Caption)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetWindowCaption


Func _IrrIsFullscreen()
; Checks if the Irrlicht window is running in fullscreen mode.
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsFullscreen")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsFullscreen

Func _IrrIsWindowActive()
; Returns if the window is active.
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsWindowActive")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsWindowActive

Func _IrrIsWindowFocused()
; Checks if the Irrlicht window has focus.
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsWindowFocused")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsWindowFocused

Func _IrrIsWindowMinimized()
; Checks if the Irrlicht window is minimized.
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsWindowMinimized")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsWindowMinimized

Func _IrrGetScreenSize(ByRef $i_Width, ByRef $i_Height)
; Gets the screen size.
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetScreenSize", "int*", $i_Width, "int*", $i_Height)
		if @error Then
		Return Seterror(1,0,False)
	Else
		$i_Width = $result[1]
		$i_Height = $result[2]
		Return true
	EndIf
EndFunc   ;==>_IrrGetScreenSize

Func _IrrMaximizeWindow()
; Maximizes the window if possible.
	$result = DllCall($_irrDll, "none:cdecl", "IrrMaximizeWindow")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrMaximizeWindow

Func _IrrMinimizeWindow()
; Minimizes the window if possible.
	$result = DllCall($_irrDll, "none:cdecl", "IrrMinimizeWindow")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrMinimizeWindow

Func _IrrRestoreWindow()
; Restore the window to normal size if possible.
	$result = DllCall($_irrDll, "none:cdecl", "IrrRestoreWindow")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrRestoreWindow

Func _IrrSetResizableWindow($i_Resizable)
; Make the window resizable.
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetResizableWindow")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrSetResizableWindow


Func _IrrMakeARGB($i_Alpha, $i_Red, $i_Green, $i_Blue)
; make 32 bit representation of an Alpha, Red, Green, Blue color
	return int( ( "0x" & Hex($i_Alpha, 2) & Hex($i_Red, 2) & Hex($i_Green, 2) & Hex($i_Blue, 2) ) )
EndFunc   ;==>_IrrMakeARGB

Func _IrrQueryFeature($i_Feature)
	$result = DllCall($_irrDll, "int:cdecl", "IrrQueryFeature", "int", $i_Feature)
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrQueryFeature

Func _IrrDisableFeature($i_Feature, $i_Flag)
	DllCall($_irrDll, "int:cdecl", "IrrDisableFeature", "int", $i_Feature, "int", $i_Flag)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDisableFeature

Func _IrrGetTime()
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetTime")
	Return $result[0]
EndFunc   ;==>_IrrGetTime

Func _IrrSetTime($i_Time)
	DllCall($_irrDll, "none:cdecl", "IrrSetTime", "int", $i_Time)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTime

;Mouse and Keyboard event functions
Func _IrrKeyEventAvailable()
	$result = DllCall($_irrDll, "int:cdecl", "IrrKeyEventAvailable")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrKeyEventAvailable

Func _IrrReadKeyEvent()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrReadKeyEvent")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrReadKeyEvent

Func _IrrMouseEventAvailable()
	$result = DllCall($_irrDll, "int:cdecl", "IrrMouseEventAvailable")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrMouseEventAvailable

Func _IrrReadMouseEvent()
	$result = DllCall($_irrDll, "int:cdecl", "IrrReadMouseEvent")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrReadMouseEvent

Func _IrrSetMousePosition(ByRef $f_XPos, ByRef $f_YPos)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetMousePosition", "float*", $f_XPos, "float*", $f_YPos)
	if @error Then
		Return Seterror(1,0,False)
	Else
		$f_XPos = $result[1]
		$f_YPos = $result[2]
		Return true
	EndIf
EndFunc   ;==>_IrrSetMousePosition

Func _IrrHideMouse()
	return _IrrDisplayMouse(False)
EndFunc   ;==>_IrrHideMouse

Func _IrrShowMouse()
	return _IrrDisplayMouse(True)
EndFunc   ;==>_IrrShowMouse

Func _IrrDisplayMouse($i_HideShow)
	DllCall($_irrDll, "none:cdecl", "IrrDisplayMouse", "int", $i_HideShow)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDisplayMouse

;File system functions
Func _IrrAddZipFile($s_Zipfile, $i_IgnoreCase, $i_IgnorePaths)
	DllCall($_irrDll, "none:cdecl", "IrrAddZipFile", "str", $s_Zipfile, "int", $i_IgnoreCase, "int", $i_IgnorePaths)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddZipFile

Func _IrrChangeWorkingDirectory($s_WorkingDir)
	DllCall($_irrDll, "none:cdecl", "IrrChangeWorkingDirectory", "str", $s_WorkingDir)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrChangeWorkingDirectory

Func _IrrGetWorkingDirectory()
	$result = DllCall($_irrDll, "str:cdecl", "IrrGetWorkingDirectory")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetWorkingDirectory

;2D functions
Func _IrrSetTextureCreationFlag($i_Flag, $i_Value)
	DllCall($_irrDll, "none:cdecl", "IrrSetTextureCreationFlag", "int", $i_Flag, "int", $i_Value)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTextureCreationFlag

Func _IrrGetTexture($s_TextureFile)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetTexture", "str", $s_TextureFile)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetTexture

Func _IrrGetImage($s_ImageFile)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetImage", "str", $s_ImageFile)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetImage

Func _IrrCreateTexture($s_TextureName, $i_XSize, $i_YSize, $i_ColorFormat)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateTexture", "str", $s_TextureName, "int", $i_XSize, "int", $i_YSize, "int", $i_ColorFormat)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateTexture

Func _IrrCreateImage($i_XSize, $i_YSize, $i_ColorFormat)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateImage", "int", $i_XSize, "int", $i_YSize, "int", $i_ColorFormat)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateImage

Func _IrrRemoveTexture($h_Texture)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveTexture

Func _IrrRemoveImage($h_Image)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveImage", "ptr", $h_Image)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveImage

Func _IrrLockTexture($h_Texture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrLockTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrLockTexture

Func _IrrLockOpenGLTexture($h_Texture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrLockOpenGLTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrLockOpenGLTexture

Func _IrrUnlockTexture($h_Texture)
	DllCall($_irrDll, "none:cdecl", "IrrUnlockTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrUnlockTexture

Func _IrrLockImage($h_Image)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrLockImage", "ptr", $h_Image)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrLockImage

Func _IrrUnlockImage($h_Image)
	DllCall($_irrDll, "none:cdecl", "IrrUnlockImage", "ptr", $h_Image)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrUnlockImage

Func _IrrCreateRenderTargetTexture($i_XSize, $i_YSize)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateRenderTargetTexture", "uint", $i_XSize, "uint", $i_YSize)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateRenderTargetTexture

Func _IrrMakeNormalMapTexture($h_Texture, $f_Amplitude)
	DllCall($_irrDll, "none:cdecl", "IrrMakeNormalMapTexture", "ptr", $h_Texture, "float", $f_Amplitude)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMakeNormalMapTexture

Func _IrrColorKeyTexture($h_Texture, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrColorKeyTexture", "ptr", $h_Texture, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrColorKeyTexture

Func _IrrDraw2DImage($h_Image, $i_XPos, $i_YPos)
	DllCall($_irrDll, "none:cdecl", "IrrDraw2DImage", "ptr", $h_Image, "int", $i_XPos, "int", $i_YPos)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw2DImage

Func _IrrDraw2DImageElement($h_Texture, $i_XPos, $i_YPos, $i_SourceTopX, $i_SourceTopY, $i_SourceBottomX, $i_SourceBottomY, $i_UseAlpha)
	DllCall($_irrDll, "none:cdecl", "IrrDraw2DImageElement", "ptr", $h_Texture, "int", $i_XPos, "int", $i_YPos, "int", $i_SourceTopX, "int", $i_SourceTopY, "int", $i_SourceBottomX, "int", $i_SourceBottomY, "int", $i_UseAlpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw2DImageElement

Func _IrrGetFont($s_Font)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetFont", "str", $s_Font)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetFont

Func _Irr2DFontDraw($h_Font, $s_Text, $i_XPos, $i_YPos, $i_BottomX, $i_BottomY)
	DllCall($_irrDll, "none:cdecl", "Irr2DFontDraw", "ptr", $h_Font, "wstr", $s_Text, "int", $i_XPos, "int", $i_YPos, "int", $i_BottomX, "int", $i_BottomY)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_Irr2DFontDraw

Func _IrrSaveScreenShot($s_Filename)
	DllCall($_irrDll, "none:cdecl", "IrrSaveScreenShot", "str", $s_Filename)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSaveScreenShot

Func _IrrGetScreenShot($i_XPos, $i_YPos, $i_Width, $i_Height)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetScreenShot", "int", $i_XPos, "int", $i_YPos, "int", $i_Width, "int", $i_Height)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetScreenShot

;Materials functions
Func _IrrMaterialVertexColorAffects($h_Material, $i_AffectedProperty)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialVertexColorAffects", "ptr", $h_Material, "int", $i_AffectedProperty)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialVertexColorAffects

Func _IrrSetMaterialBlend($h_Material, $i_SrcBlend, $i_DstBlend)
	DllCall($_irrDll, "none:cdecl", "IrrSetMaterialBlend", "ptr", $h_Material, "int", $i_SrcBlend, "int", $i_DstBlend)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMaterialBlend

Func _IrrMaterialSetShininess($h_Material, $f_Shininess)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetShininess", "ptr", $h_Material, "float", $f_Shininess)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetShininess

Func _IrrMaterialSetSpecularColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetSpecularColor", "ptr", $h_Material, "uint", $i_Alpha, "uint", $i_Red, "uint", $i_Green, "uint", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetSpecularColor

Func _IrrMaterialSetDiffuseColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetDiffuseColor", "ptr", $h_Material, "uint", $i_Alpha, "uint", $i_Red, "uint", $i_Green, "uint", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetDiffuseColor

Func _IrrMaterialSetAmbientColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetAmbientColor", "ptr", $h_Material, "uint", $i_Alpha, "uint", $i_Red, "uint", $i_Green, "uint", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetAmbientColor

Func _IrrMaterialSetEmissiveColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetEmissiveColor", "ptr", $h_Material, "uint", $i_Alpha, "uint", $i_Red, "uint", $i_Green, "uint", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetEmissiveColor

Func _IrrMaterialSetMaterialTypeParam($h_Material, $f_Param)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetMaterialTypeParam", "ptr", $h_Material, "float", $f_Param)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetMaterialTypeParam

Func _IrrSetMaterialLineThickness($h_Material, $f_Thickness)
	DllCall($_irrDll, "none:cdecl", "IrrSetMaterialLineThickness", "ptr", $h_Material, "float", $f_Thickness)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMaterialLineThickness

Func _IrrAddHighLevelShaderMaterial($h_VertexProgram, $s_StartFunction, $i_ProgType, $s_pixelProg, $s_PixelStartFunction, $i_PixelProgTpe, $i_MaterialType);IrrAddHighLevelShaderMaterial
	$result = DllCall($_irrDll, "int:cdecl", "IrrAddHighLevelShaderMaterial", "ptr", $h_VertexProgram, "str", $s_StartFunction, "int", $i_ProgType, "str", $s_pixelProg, "str", $s_PixelStartFunction, "int", $i_PixelProgTpe, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
	;potentially screwed up
EndFunc   ;==>_IrrAddHighLevelShaderMaterial

Func _IrrAddHighLevelShaderMaterialFromFiles($s_VertexProgram, $s_StartFunction, $i_ProgType, $s_pixelProg, $s_PixelStartFunction, $i_PixelProgTpe, $i_MaterialType);IrrAddHighLevelShaderMaterial
	$result = DllCall($_irrDll, "int:cdecl", "IrrAddHighLevelShaderMaterialFromFiles", "str", $s_VertexProgram, "str", $s_StartFunction, "int", $i_ProgType, "str", $s_pixelProg, "str", $s_PixelStartFunction, "int", $i_PixelProgTpe, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
	;potentially screwed up
EndFunc   ;==>_IrrAddHighLevelShaderMaterialFromFiles

Func _IrrAddShaderMaterial($h_VertexProgram, $h_PixelProgram, $i_MaterialType)
	$result = DllCall($_irrDll, "int:cdecl", "IrrAddShaderMaterial", "ptr", $h_VertexProgram, "ptr", $h_PixelProgram, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddShaderMaterial

Func _IrrAddShaderMaterialFromFiles($s_VertexProgram, $s_PixelProgram, $i_MaterialType)
	$result = DllCall($_irrDll, "int:cdecl", "IrrAddShaderMaterialFromFiles", "str", $s_VertexProgram, "str", $s_PixelProgram, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddShaderMaterialFromFiles

Func _IrrCreateNamedVertexShaderConstant($s_VertexProgram, $s_PixelProgram, $i_MaterialType)
	$result = DllCall($_irrDll, "int:cdecl", "IrrCreateNamedVertexShaderConstant", "str", $s_VertexProgram, "str", $s_PixelProgram, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateNamedVertexShaderConstant

Func _IrrCreateNamedPixelShaderConstant($h_Shader, $s_Name, $i_Preset, $i_Data, $i_Count)
	$result = DllCall($_irrDll, "int:cdecl", "IrrCreateNamedPixelShaderConstant", "ptr", $h_Shader, "str", $s_Name, "int", $i_Preset, "int", $i_Data, "int", $i_Count)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateNamedPixelShaderConstant

Func _IrrCreateAddressedVertexShaderConstant($h_Shader, $i_Address, $i_Preset, $i_Data, $i_Count)
	$result = DllCall($_irrDll, "int:cdecl", "IrrCreateAddressedVertexShaderConstant", "ptr", $h_Shader, "int", $i_Address, "int", $i_Preset, "int", $i_Data, "int", $i_Count)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateAddressedVertexShaderConstant

Func _IrrCreateAddressedPixelShaderConstant($h_Shader, $i_Address, $i_Preset, $i_Data, $i_Count)
	$result = DllCall($_irrDll, "int:cdecl", "IrrCreateAddressedPixelShaderConstant", "ptr", $h_Shader, "int", $i_Address, "int", $i_Preset, "int", $i_Data, "int", $i_Count)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateAddressedPixelShaderConstant

;Scene Functions
Func _IrrGetRootSceneNode()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetRootSceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetRootSceneNode

Func _IrrGetMesh($s_MeshFile)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetMesh", "str", $s_MeshFile)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMesh

Func _IrrCreateMesh($s_MeshName, $a_Vertices, $a_Indices)
	;;;;;;;;;;;;;;This will be wrong. Figure out how to fix the Indices array
	$vSize = UBound($a_Vertices)
	$iSize = UBound($a_Indices)
	$VerticesStruct = DllStructCreate("float[" & $vSize & "];float[" & $vSize & "];float[" & $vSize & "]")
	$IndicesStruct = DllStructCreate("float[" & $iSize & "];float[" & $iSize & "];float[" & $iSize & "]")
	For $i = 1 To $vSize
		DllStructSetData($VerticesStruct, 1, $a_Vertices[$i - 1][0])
		DllStructSetData($VerticesStruct, 2, $a_Vertices[$i - 1][1])
		DllStructSetData($VerticesStruct, 3, $a_Vertices[$i - 1][2])
	Next
	$arrayOfVerticesStruct = DllStructCreate("ptr[" & $vSize & "])")

	For $i = 1 To $vSize
		$VerticesListEntry = DllStructCreate("float;float;float")
		DllStructSetData($VerticesListEntry, 1, $a_Vertices[$i - 1][0])
		DllStructSetData($VerticesListEntry, 2, $a_Vertices[$i - 1][1])
		DllStructSetData($VerticesListEntry, 3, $a_Vertices[$i - 1][2])
		$VerticesListEntryPtr = DllStructGetPtr($VerticesListEntry)
		DllStructSetData($arrayOfVerticesStruct, $i, $VerticesListEntryPtr)
	Next

	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateMesh", "str", $s_MeshName, "int", $vSize, "ptr", DllStructGetPtr($VerticesStruct), "int", $iSize, "ptr", DllStructGetPtr($IndicesStruct))
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateMesh


Func _IrrAddHillPlaneMesh($s_Name, $f_TileSizeX, $f_TileSizeY, $i_TileCountX, $i_TileCountY, $h_Material = 0, $f_HillHeight = 0, $f_CountHillsX = 0, $f_CountHillsY = 0, $f_TextureRepeatCountX = 1, $f_TextureRepeatCountY = 1)
    $result = DllCall($_irrDll, "ptr:cdecl", "IrrAddHillPlaneMesh", "str", $s_Name, "float", $f_TileSizeX, "float", $f_TileSizeY, "int", $i_TileCountX, "int", $i_TileCountY, "ptr", $h_Material, "float", $f_HillHeight ,"float", $f_CountHillsX, "float", $f_CountHillsY, "float", $f_TextureRepeatCountX, "float", $f_TextureRepeatCountY)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddHillPlaneMesh


Func _IrrWriteMesh($h_Mesh, $i_FileFormat, $s_Filename)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrWriteMesh", "ptr", $h_Mesh, "int", $i_FileFormat, "str", $s_Filename)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrWriteMesh

Func _IrrRemoveMesh($h_Mesh)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrRemoveMesh", "ptr", $h_Mesh)
	Return $result[0]
EndFunc   ;==>_IrrRemoveMesh

Func _IrrClearUnusedMeshes()
	DllCall($_irrDll, "none:cdecl", "IrrClearUnusedMeshes")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrClearUnusedMeshes

Func _IrrSetMeshHardwareAccelerated($h_mesh, $i_frame = 0)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetMeshHardwareAccelerated", "ptr", $h_mesh, "int", $i_frame)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMeshHardwareAccelerated

Func _IrrGetMeshFrameCount($h_Mesh)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetMeshFrameCount", "ptr", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMeshFrameCount

Func _IrrGetMeshBufferCount($h_Mesh, $i_FrameNumber)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetMeshBufferCount", "ptr", $h_Mesh, "int", $i_FrameNumber)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMeshBufferCount

Func _IrrGetMeshIndexCount($h_Mesh, $i_FrameNumber, $i_MeshBuffer)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetMeshIndexCount", "ptr", $h_Mesh, "int", $i_FrameNumber, "int", $i_MeshBuffer)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMeshIndexCount

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;This Function to be added later.
;Func _IrrGetMeshIndices($h_Mesh, $i_FrameNumber, ByRef $h_IndicesArrayStruct, $i_MeshBuffer)
;	DllCall($_irrDll, "none:cdecl", "IrrGetMeshIndices", "ptr", $h_Mesh, "int", $i_FrameNumber, "ptr", $h_IndicesArrayStruct, "int", $i_MeshBuffer)
;EndFunc   ;==>_IrrGetMeshIndices

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;This Function to be added later.
;Func _IrrSetMeshIndices($h_Mesh, $i_FrameNumber, ByRef $h_IndicesArrayStruct, $i_MeshBuffer)
;	DllCall($_irrDll, "none:cdecl", "IrrSetMeshIndices", "ptr", $h_Mesh, "int", $i_FrameNumber, "ptr", $h_IndicesArrayStruct, "int", $i_MeshBuffer)
;EndFunc   ;==>_IrrSetMeshIndices

Func _IrrGetMeshVertexCount($h_Mesh, $i_FrameNumber, $i_MeshBuffer)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetMeshVertexCount", "ptr", $h_Mesh, "int", $i_FrameNumber, "int", $i_MeshBuffer)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMeshVertexCount

;Func _IrrGetMeshVertices($h_Mesh, $i_FrameNumber, ByRef $h_IndicesArrayStruct, $i_MeshBuffer)
;RETURN TO THIS;
;	DllCall($_irrDll, "none:cdecl", "IrrGetMeshVertices", "ptr", $h_Mesh, "int", $i_FrameNumber, "ptr", $h_IndicesArrayStruct, "int", $i_MeshBuffer)
;EndFunc   ;==>_IrrGetMeshVertices

;Func _IrrSetMeshVertices($h_Mesh, $i_FrameNumber, ByRef $h_IndicesArrayStruct, $i_MeshBuffer)
;RETURN TO THIS;
;	DllCall($_irrDll, "none:cdecl", "IrrSetMeshVertices", "ptr", $h_Mesh, "int", $i_FrameNumber, "ptr", $h_IndicesArrayStruct, "int", $i_MeshBuffer)
;EndFunc   ;==>_IrrSetMeshVertices

;Func _IrrSetMeshVertexColors($h_Mesh, $i_FrameNumber, $h_VertexColourArrayStruct, $h_VertexGroupStartIndices, $h_VertexGroupEndIndices, $i_NumberOfGroups, $i_MeshBuffer)
;RETURN TO THIS;
;	DllCall($_irrDll, "none:cdecl", "IrrSetMeshVertexColors", "ptr", $h_Mesh, "int", $i_FrameNumber, "ptr", $h_VertexColourArrayStruct, "ptr", $h_VertexGroupStartIndices, "ptr", $h_VertexGroupEndIndices, "int", $i_NumberOfGroups, "int", $i_MeshBuffer)
;EndFunc   ;==>_IrrSetMeshVertexColors

;Func _IrrSetMeshVertexCoords($h_Mesh, $i_FrameNumber, $h_VertexCoordArrayStruct, $h_VertexGroupStartIndices, $h_VertexGroupEndIndices, $i_NumberOfGroups, $i_MeshBuffer)
;RETURN TO THIS;
;DllCall($_irrDll, "none:cdecl", "IrrSetMeshVertexCoords", "ptr", $h_Mesh, "int", $i_FrameNumber, "ptr", $h_VertexCoordArrayStruct, "ptr", $h_VertexGroupStartIndices, "ptr", $h_VertexGroupEndIndices, "int", $i_NumberOfGroups, "int", $i_MeshBuffer)
;EndFunc   ;==>_IrrSetMeshVertexCoords

;Func _IrrSetMeshVertexSingleColor($h_Mesh, $i_FrameNumber, $h_VertexColourStruct, $h_VertexGroupStartIndices, $h_VertexGroupEndIndices, $i_NumberOfGroups, $i_MeshBuffer)
;RETURN TO THIS;
;	DllCall($_irrDll, "none:cdecl", "IrrSetMeshVertexSingleColor", "ptr", $h_Mesh, "int", $i_FrameNumber, "ptr", $h_VertexColourStruct, "ptr", $h_VertexGroupStartIndices, "ptr", $h_VertexGroupEndIndices, "int", $i_NumberOfGroups, "int", $i_MeshBuffer)
;EndFunc   ;==>_IrrSetMeshVertexSingleColor


Func _IrrAddMeshToScene($h_Mesh)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddMeshToScene", "UINT_PTR", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddMeshToScene

Func _IrrAddMeshToSceneAsOcttree($h_Mesh)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddMeshToSceneAsOcttree", "UINT_PTR", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddMeshToSceneAsOcttree

Func _IrrAddStaticMeshForNormalMappingToScene($h_Mesh)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddStaticMeshForNormalMappingToScene", "UINT_PTR", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddStaticMeshForNormalMappingToScene

Func _IrrLoadScene($s_Filename)
	DllCall($_irrDll, "none:cdecl", "IrrLoadScene", "str", $s_Filename)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrLoadScene

Func _IrrSaveScene($s_Filename)
	DllCall($_irrDll, "none:cdecl", "IrrSaveScene", "str", $s_Filename)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSaveScene

Func _IrrGetSceneNodeFromId($i_ID)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetSceneNodeFromId", "int", $i_ID)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetSceneNodeFromId

Func _IrrGetSceneNodeFromName($s_Name)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetSceneNodeFromName", "str", $s_Name)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetSceneNodeFromName

Func _IrrAddBillBoardToScene($f_XSize, $f_YSize, $f_XPos = 0.0, $f_YPos = 0.0, $f_ZPos = 0.0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddBillBoardToScene", "float", $f_XSize, "float", $f_YSize, "float", $f_XPos, "float", $f_YPos, "float", $f_ZPos)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddBillBoardToScene

Func _IrrAddBillboardTextSceneNode($h_Font, $s_Text, $f_XSize, $f_YSize, $f_XPos=0, $f_YPos=0, $f_ZPos=0, $h_Parent=0, $i_TopRGBA=0xFFFFFFFF, $i_BottomRGBA=0xFFFFFFFF)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddBillboardTextSceneNode", "ptr", $h_Font, "wstr", $s_Text, _
			"float", $f_XSize, "float", $f_YSize, "float", $f_XPos, "float", $f_YPos, "float", $f_ZPos, _
			"ptr", $h_Parent, "uint", $i_TopRGBA, "uint", $i_BottomRGBA)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddBillboardTextSceneNode


Func _IrrAddParticleSystemToScene($i_AddEmitter, $h_Parent = 0, $i_Id = -1, $f_PosX = 0, $f_PosY = 0, $f_PosZ = 0, $f_RotX = 0, $f_RotY = 0, $f_RotZ = 0, $f_ScaleX = 1, $f_ScaleY = 1, $f_ScaleZ = 1)
; add a particle system to the irrlicht scene manager
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddParticleSystemToScene", "int", $i_AddEmitter, "UINT_PTR", $h_Parent, "int", $i_Id, _
	"float", $f_PosX = 0, "float", $f_PosY, "float", $f_PosZ, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ, _
	"float", $f_ScaleX, "float", $f_ScaleY, "float", $f_ScaleZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticleSystemToScene

Func _IrrAddSkyBoxToScene($h_UpTexture, $h_DownTexture, $h_LeftTexture, $h_RightTexture, $h_FrontTexture, $h_BackTexture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSkyBoxToScene", "ptr", $h_UpTexture, "ptr", $h_DownTexture, "ptr", $h_LeftTexture, "ptr", $h_RightTexture, "ptr", $h_FrontTexture, "ptr", $h_BackTexture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSkyBoxToScene


Func _IrrAddSkyDomeToScene($h_Texture, $i_HorizontalRes, $i_VerticalRes, $d_TexturePercent, $d_SpherePercent, $d_SphereRadius = 1000.0)
    $result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSkyDomeToScene", "ptr", $h_Texture, "uint", $i_HorizontalRes, "uint", $i_VerticalRes, "double", $d_TexturePercent, "double", $d_SpherePercent, "double", $d_SphereRadius)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSkyDomeToScene

Func _IrrAddEmptySceneNode()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddEmptySceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddEmptySceneNode

Func _IrrAddTestSceneNode()
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddTestSceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddTestSceneNode

Func _IrrAddCubeSceneNode($f_Size)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCubeSceneNode", "float", $f_Size)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCubeSceneNode

Func _IrrAddSphereSceneNode($f_Size, $i_PolyCount)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSphereSceneNode", "float", $f_Size, "int", $i_PolyCount)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSphereSceneNode


Func _IrrAddWaterSurfaceSceneNode($h_Mesh, $f_WaveHeight = 2.0, $f_WaveSpeed = 300.0, $f_WaveLength = 10.0, $h_Parent = 0, $i_ID = -1, $f_PosX = 0, $f_PosY = 0, $f_PosZ = 0, $f_RotX = 0, $f_RotY = 0, $f_RotZ = 0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddWaterSurfaceSceneNode", "ptr", $h_Mesh, "float", $f_WaveHeight, "float", $f_WaveSpeed, "float", $f_WaveLength, "ptr", $h_Parent, "int", $i_ID, "float", $f_PosX, "float", $f_PosY, "float", $f_PosZ, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ, "float", $f_ScaleX, "float", $f_ScaleY, "float", $f_ScaleZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddWaterSurfaceSceneNode

Func _IrrAddZoneManager($f_NearDistance=0, $f_FarDistance=12000)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddZoneManager", "float", $f_NearDistance, "float", $f_FarDistance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddZoneManager

Func _IrrAddClouds($h_Texture, $i_Lod, $i_Depth, $i_Density)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddClouds", "ptr", $h_Texture, "int", $i_Lod, "int", $i_Depth, "int", $i_Density)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddClouds

Func _IrrAddLensFlare($h_Texture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddLensFlare", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddLensFlare

Func _IrrAddGrass($h_Terrain, $i_X, $i_Y, $i_PatchSize, $f_FadeDistance, $i_Crossed, $f_GrassScale, $i_MaxDensity, $i_DataPosX, $i_DataPosY, $h_HeightMap, $h_TextureMap, $h_GrassMap, $h_GrassTexture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddGrass", "ptr", $h_Terrain, "int", $i_X, "int", $i_Y, "int", $i_PatchSize, _
	"float", $f_FadeDistance, "int", $i_Crossed, "float", $f_GrassScale, "int", $i_MaxDensity, "int", $i_DataPosX, "int", $i_DataPosY, _
	"ptr", $h_HeightMap, "ptr", $h_TextureMap, "ptr", $h_GrassMap, "ptr", $h_GrassTexture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddGrass

Func _IrrSetShadowColor($i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetShadowColor", "int", $i_Alpha, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetShadowColor

Func _IrrSetFog($i_Red, $i_Green, $i_Blue, $i_FogType, $f_FogStart, $f_FogEnd, $f_Density)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetFog", "int", $i_Red, "int", $i_Green, "int", $i_Blue, "int", $i_FogType, "float", $f_FogStart, "float", $f_FogEnd, "float", $f_Density)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetFog

Func _IrrDraw3DLine($f_XStart, $f_YStart, $f_ZStart, $f_XEnd, $f_YEnd, $f_ZEnd, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrDraw3DLine", "float", $f_XStart, "float", $f_YStart, "float", $f_ZStart, "float", $f_XEnd, "float", $f_YEnd, "float", $f_ZEnd, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw3DLine

Func _IrrSetSkyDomeColor($h_Dome, $i_HorizontalRed, $i_HorizontalGreen, $i_HorizontalBlue, $i_ZenithRed, $i_ZenithGreen, $i_ZenithBlue)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetSkyDomeColor", "ptr", $h_Dome, "int", $i_HorizontalRed, "int", $i_HorizontalGreen, "int", $i_HorizontalBlue, "int", $i_ZenithRed, "int", $i_ZenithGreen, "int", $i_ZenithBlue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetSkyDomeColor

Func _IrrSetSkyDomeColorBand($h_Dome, $i_HorizontalRed, $i_HorizontalGreen, $i_HorizontalBlue, $i_BandVerticalPosition, $f_BandFade, $i_Additive)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetSkyDomeColorBand", "ptr", $h_Dome, "int", $i_HorizontalRed, "int", $i_HorizontalGreen, "int", $i_HorizontalBlue, "int", $i_BandVerticalPosition, "float", $f_BandFade, "int", $i_Additive)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetSkyDomeColorBand

Func _IrrSetSkyDomeColorPoint($h_Dome, $i_Red, $i_Green, $i_Blue, $f_PosX, $f_PosY, $f_PosZ, $f_Radius, $f_PointFade, $i_Additive)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetSkyDomeColorPoint", "ptr", $h_Dome, "int", $i_Red, "int", $i_Green, "int", $i_Blue, "float", $f_PosX, "float", $f_PosY, "float", $f_Radius, "float", $f_PointFade, "int", $i_Additive)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetSkyDomeColorPoint

Func _IrrSetZoneManagerProperties($h_ZoneManager, $f_NearDistance, $f_FarDistance, $i_AccumulateBoxes)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetZoneManagerProperties", "ptr", $h_ZoneManager, "float", $f_NearDistance, "float", $f_FarDistance, "int", $i_AccumulateBoxes)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetZoneManagerProperties

Func _IrrSetZoneManagerBoundingBox($h_ZoneManager, $f_X, $f_Y, $f_Z, $f_BoxWidth, $f_BoxHeight, $f_BoxDepth)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetZoneManagerBoundingBox", "ptr", $h_ZoneManager, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_BoxWidth, "float", $f_BoxHeight, "float", $f_BoxDepth)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetZoneManagerBoundingBox

Func _IrrSetZoneManagerAttachTerrain($h_ZoneNode, $h_Terrain, $s_StructureMapFile, $s_ColorMapFile, $s_DetailMapFile, $i_ImageX, $i_ImageY, $i_SliceSize)
	DllCall($_irrDll, "none:cdecl", "IrrSetZoneManagerAttachTerrain", "UINT_PTR", $h_ZoneNode, "UINT_PTR", $h_Terrain, _
		"str", $s_StructureMapFile, "str", $s_ColorMapFile, "str", $s_DetailMapFile, "int", $i_ImageX, "int", $i_ImageY, "int", $i_SliceSize)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetZoneManagerAttachTerrain

Func _IrrSetGrassDensity($h_Grass, $f_Density, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetGrassDensity", "ptr", $h_Grass, "float", $f_Density, "float", $f_Distance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGrassDensity

Func _IrrSetGrassWind($h_Grass, $f_Strength, $f_Resolution)
	DllCall($_irrDll, "none:cdecl", "IrrSetGrassWind", "ptr", $h_Grass, "float", $f_Strength, "float", $f_Resolution)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGrassWind

Func _IrrGetGrassDrawCount($h_Grass)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetGrassDrawCount", "ptr", $h_Grass)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetGrassDrawCount

Func _IrrSetFlareScale($h_Flare, $f_Source, $f_Optics)
	DllCall($_irrDll, "none:cdecl", "IrrSetFlareScale", "ptr", $h_Flare, "float", $f_Source, "float", $f_Optics)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetFlareScale

;Scene Node functions

Func _IrrGetNodeName($h_Node)
	$result = DllCall($_irrDll, "str:cdecl", "IrrGetNodeName", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetNodeName

Func _IrrSetNodeName($h_Node, $s_Name)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeName", "ptr", $h_Node, "str", $s_Name)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeName

Func _IrrGetMaterialCount($h_Node)
	$result = DllCall($_irrDll, "uint:cdecl", "IrrGetMaterialCount", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMaterialCount

Func _IrrGetMaterial($h_Node, $i_Material)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetMaterial", "ptr", $h_Node, "uint", $i_Material)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMaterial

Func _IrrSetNodeMaterialTexture($h_Node, $h_Texture, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeMaterialTexture", "UINT_PTR", $h_Node, "UINT_PTR", $h_Texture, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeMaterialTexture

Func _IrrSetNodeMaterialFlag($h_Node, $i_Type, $i_Flag)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeMaterialFlag", "UINT_PTR", $h_Node, "int", $i_Type, "uint", $i_Flag)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeMaterialFlag

Func _IrrSetNodeMaterialType($h_Node, $i_Type)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeMaterialType", "UINT_PTR", $h_Node, "int", $i_Type)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeMaterialType

Func _IrrSetNodePosition($h_Node, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodePosition", "UINT_PTR", $h_Node, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodePosition


Func _IrrSetNodeRotation($h_Node, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeRotation", "ptr", $h_Node, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeRotation

Func _IrrSetNodeScale($h_Node, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeScale", "UINT_PTR", $h_Node, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeScale

Func _IrrDebugDataVisible($h_Node, $i_Visible)
	DllCall($_irrDll, "none:cdecl", "IrrDebugDataVisible", "ptr", $h_Node, "int", $i_Visible)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDebugDataVisible

Func _IrrGetNodePosition($h_Node, ByRef $a_Vector3df)
	Dim $a_Vector3df[3]
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetNodePosition", "ptr", $h_Node, "float*", $a_Vector3df[0], "float*", $a_Vector3df[1], "float*", $a_Vector3df[2])
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector3df[0] = $result[2]
		$a_Vector3df[1] = $result[3]
		$a_Vector3df[2] = $result[4]
		Return $a_Vector3df
	EndIf
EndFunc   ;==>_IrrGetNodePosition


Func _IrrGetNodeAbsolutePosition($h_Node, ByRef $a_Vector3df)
	Dim $a_Vector3df[3]
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetNodeAbsolutePosition", "ptr", $h_Node, "float*", $a_Vector3df[0], "float*", $a_Vector3df[1], "float*", $a_Vector3df[2])
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector3df[0] = $result[2]
		$a_Vector3df[1] = $result[3]
		$a_Vector3df[2] = $result[4]
		Return $a_Vector3df
	EndIf
EndFunc   ;==>_IrrGetNodeAbsolutePosition


Func _IrrGetNodeRotation($h_Node, ByRef $a_Vector3df)
	Dim $a_Vector3df[3]
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetNodeRotation", "ptr", $h_Node, "float*", $a_Vector3df[0], "float*", $a_Vector3df[1], "float*", $a_Vector3df[2])
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector3df[0] = number($result[2])
		$a_Vector3df[1] = number($result[3])
		$a_Vector3df[2] = number($result[4])
		Return $a_Vector3df
	EndIf
EndFunc   ;==>_IrrGetNodeRotation

Func _IrrGetJointNode($h_Node, $s_Joint)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetJointNode", "ptr", $h_Node, "str", $s_Joint)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrGetJointNode

Func _IrrSetJointMode($h_Node, $i_Mode)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetJointMode", "ptr", $h_Node, "int", $i_Mode)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetJointMode

Func _IrrAddChildToParent($h_ChildNode, $h_ParentNode)
	DllCall($_irrDll, "none:cdecl", "IrrAddChildToParent", "ptr", $h_ChildNode, "ptr", $h_ParentNode)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddChildToParent


Func _IrrGetNodeFirstChild($h_Node, ByRef $h_Position)
; get the first child node of this node, returns 0 if there is no child
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetNodeFirstChild", "UINT_PTR", $h_Node, "UINT_PTR*", $h_Position)
	if @error Then
		Return Seterror(1,0,False)
	Else
		$h_Position = $result[2]
		return $result[0]
	EndIf
EndFunc   ;==>_IrrGetNodeFirstChild


Func _IrrGetNodeNextChild($h_Node, ByRef $h_Position)
; get the next child node of this node, returns 0 if there is no child
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetNodeNextChild", "UINT_PTR", $h_Node, "UINT_PTR*", $h_Position)
	if @error Then
		Return Seterror(1,0,False)
	Else
		$h_Position = $result[2]
		return $result[0]
	EndIf
EndFunc   ;==>_IrrGetNodeNextChild


Func _IrrIsNodeLastChild($h_Node, ByRef $h_Position)
; returns true if this is the last child of the parent
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrIsNodeLastChild", "UINT_PTR", $h_Node, "ptr*", $h_Position)
	if @error Then
		Return Seterror(1,0,False)
	Else
		$h_Position = $result[2]
		return $result[0]
	EndIf
EndFunc   ;==>_IrrIsNodeLastChild


Func _IrrAddNodeShadow($h_Node, $h_mesh = 0)
	DllCall($_irrDll, "none:cdecl", "IrrAddNodeShadow", "ptr", $h_Node, "ptr", $h_mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddNodeShadow

Func _IrrSetNodeVisibility($h_Node, $i_Visible)
	DllCall($_irrDll, "none:cdecl", "IrrAddNodeShadow", "ptr", $h_Node, "int", $i_Visible)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeVisibility

Func _IrrRemoveNode($h_Node)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveNode", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveNode

Func _IrrRemoveAllNodes()
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAllNodes")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAllNodes

Func _IrrSetNodeParent($h_Node, $h_Parent)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeParent", "ptr", $h_Node, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeParent

Func _IrrGetNodeID($h_Node)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetNodeID", "ptr", $h_Node)
	Return $result[0]
EndFunc   ;==>_IrrGetNodeID

Func _IrrSetNodeID($h_Node, $i_ID)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeID", "ptr", $h_Node, "int", $i_ID)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeID

Func _IrrGetNodeBoundingBox($h_Node, ByRef $a_VectorA3df, ByRef $a_VectorB3df)
	Dim $a_VectorA3df[3]
	Dim $a_VectorB3df[3]
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetNodeBoundingBox", "ptr", $h_Node, "float*", $a_VectorA3df[0], "float*", $a_VectorA3df[1], "float*", $a_VectorA3df[2], "float*", $a_VectorB3df[0], "float*", $a_VectorB3df[1], "float*", $a_VectorB3df[2])
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_VectorA3df[0] = $result[2]
		$a_VectorA3df[1] = $result[3]
		$a_VectorA3df[2] = $result[4]
		$a_VectorB3df[0] = $result[5]
		$a_VectorB3df[1] = $result[6]
		$a_VectorB3df[2] = $result[7]
		Return True
	EndIf
EndFunc   ;==>_IrrGetNodeBoundingBox


; ////////////////////////////////////////////////////////////////////////////
; Material and GPU Programming Functions

Func _IrrSetNodeAmbientColor($h_Node, $i_Color)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAmbientColor", "ptr", $h_Node, "uint", $i_Color)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAmbientColor

Func _IrrSetNodeDiffuseColor($h_Node, $i_Color)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeDiffuseColor", "ptr", $h_Node, "uint", $i_Color)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeDiffuseColor

Func _IrrSetNodeSpecularColor($h_Node, $i_Color)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeSpecularColor", "ptr", $h_Node, "uint", $i_Color)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeSpecularColor

Func _IrrSetNodeEmissiveColor($h_Node, $i_Color)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeEmissiveColor", "ptr", $h_Node, "uint", $i_Color)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeEmissiveColor


Func _IrrSetNodeColorByVertex($h_Node, $i_ColorMaterial)
; Set whether vertex color or material color is used to shade the surface of a node
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeColorByVertex", "ptr", $h_Node, "uint", $i_ColorMaterial)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeColorByVertex


; ////////////////////////////////////////////////////////////////////////////
;Animation functions
Func _IrrSetNodeAnimationRange($h_Node, $i_Start, $i_End)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAnimationRange", "ptr", $h_Node, "int", $i_Start, "int", $i_End)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAnimationRange

Func _IrrPlayNodeMD2Animation($h_Node, $i_Animation)
	DllCall($_irrDll, "none:cdecl", "IrrPlayNodeMD2Animation", "ptr", $h_Node, "int", $i_Animation)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrPlayNodeMD2Animation

Func _IrrSetNodeAnimationSpeed($h_Node, $f_Speed)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAnimationSpeed", "ptr", $h_Node, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAnimationSpeed

Func _IrrGetNodeAnimationFrame($h_Node)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetNodeAnimationFrame", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetNodeAnimationFrame

Func _IrrSetNodeAnimationFrame($h_Node, $f_Frame)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAnimationFrame", "ptr", $h_Node, "float", $f_Frame)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAnimationFrame

Func _IrrSetTransitionTime($h_Node, $f_Speed)
	DllCall($_irrDll, "none:cdecl", "IrrSetTransitionTime", "ptr", $h_Node, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTransitionTime

Func _IrrAnimateJoints($h_Node)
	DllCall($_irrDll, "int:cdecl", "IrrAnimateJoints", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAnimateJoints

Func IrrSetJointMode($h_Node, $i_Mode)
	DllCall($_irrDll, "none:cdecl", "IrrSetJointMode", "ptr", $h_Node, "int", $i_Mode)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>IrrSetJointMode

Func _IrrAddCollisionAnimator($h_IrrSelector, $h_Node, $f_RadiusX, $f_RadiusY, $f_RadiusZ, $f_GravityX, $f_GravityY, $f_GravityZ, $f_OffsetX, $f_OffsetY, $f_OffsetZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCollisionAnimator", "ptr", $h_IrrSelector, "ptr", $h_Node, "float", $f_RadiusX, "float", $f_RadiusY, "float", $f_RadiusZ, "float", $f_GravityX, "float", $f_GravityY, "float", $f_GravityZ, "float", $f_OffsetX, "float", $f_OffsetY, "float", $f_OffsetZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCollisionAnimator

Func _IrrAddDeleteAnimator($h_Node, $i_Time)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddDeleteAnimator", "ptr", $h_Node, "int", $i_Time)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddDeleteAnimator

Func _IrrAddFlyCircleAnimator($h_Node, $f_CenterX, $f_CenterY, $f_CenterZ, $f_Radius, $f_Speed)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFlyCircleAnimator", "ptr", $h_Node, "float", $f_CenterX, "float", $f_CenterY, "float", $f_CenterZ, "float", $f_Radius, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFlyCircleAnimator

Func _IrrAddFlyStraightAnimator($h_Node, $f_StartX, $f_StartY, $f_StartZ, $f_EndX, $f_EndY, $f_EndZ, $i_Time, $i_DoLoop)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFlyStraightAnimator", "ptr", $h_Node, "float", $f_StartX, "float", $f_StartY, "float", $f_StartZ, "float", $f_EndX, "float", $f_EndY, "float", $f_EndZ, "uint", $i_Time, "int", $i_DoLoop)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFlyStraightAnimator

Func _IrrAddRotationAnimator($h_Node, $f_RotX, $f_RotY, $f_RotZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddRotationAnimator", "ptr", $h_Node, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddRotationAnimator


Func _IrrAddSplineAnimator($h_Node, $i_ArraySize, $a_ArrayFloatsX, $a_ArrayFloatsY, $a_ArrayFloatsZ, $i_Start, $f_Speed, $f_Tightness)

	if UBound($a_ArrayFloatsX) <> $i_arraySize OR _
	    UBound($a_ArrayFloatsY) <> $i_arraySize OR _
		UBound($a_ArrayFloatsZ) <> $i_arraySize Then
		return SetError(2, 0, False)
	EndIf

	Local $XArrayStruct = DllStructCreate("float[" & $i_arraySize & "]")
	Local $YArrayStruct = DllStructCreate("float[" & $i_arraySize & "]")
	Local $ZArrayStruct = DllStructCreate("float[" & $i_arraySize & "]")

	For $i = 1 To $i_arraySize
		DllStructSetData($XArrayStruct, 1, $a_ArrayFloatsX[$i - 1], $i)
		DllStructSetData($YArrayStruct, 1, $a_ArrayFloatsY[$i - 1], $i)
		DllStructSetData($ZArrayStruct, 1, $a_ArrayFloatsZ[$i - 1], $i)
	Next

	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSplineAnimator", "ptr", $h_Node, "int", $i_arraySize, _
	"ptr", DllStructGetPtr($XArrayStruct,1), "ptr", DllStructGetPtr($YArrayStruct,1), "ptr", DllStructGetPtr($ZArrayStruct,1), _
	"int", $i_Start, "float", $f_Speed, "float", $f_Tightness)

	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSplineAnimator

Func _IrrAddFadeAnimator($h_Node, $i_DeleteAfterMiliseconds, $f_Scale = 1.0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFadeAnimator", "ptr", $h_Node, "int", $i_DeleteAfterMiliseconds, "float", $f_Scale)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFadeAnimator

Func _IrrRemoveAnimator($h_Node, $h_Animator)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAnimator", "ptr", $h_Node, "ptr", $h_Animator)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAnimator



;Collision Functions

Func _IrrGetCollisionGroupFromMesh($h_Mesh, $h_Node, $i_Frame = 0)
; gets a collision object from an animated mesh
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetCollisionGroupFromMesh", "UINT_PTR", $h_Mesh, "UINT_PTR", $h_Node, "int", $i_Frame)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionGroupFromMesh


Func _IrrGetCollisionGroupFromComplexMesh($h_Mesh, $h_Node, $i_Frame = 0)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetCollisionGroupFromComplexMesh", "UINT_PTR", $h_Mesh, "UINT_PTR", $h_Node, "int", $i_Frame)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionGroupFromComplexMesh

Func _IrrGetCollisionGroupFromBox($h_Node)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetCollisionGroupFromBox", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionGroupFromBox

Func _IrrGetCollisionGroupFromTerrain($h_Node, $i_Lod)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetCollisionGroupFromTerrain", "ptr", $h_Node, "int", $i_Lod)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionGroupFromTerrain

Func _IrrRemoveCollisionGroup($h_CollisionGroup, $h_Node)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveCollisionGroup", "ptr", $h_CollisionGroup, "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveCollisionGroup

Func _IrrCreateCombinedCollisionGroup()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateCombinedCollisionGroup")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateCombinedCollisionGroup

Func _IrrAddCollisionGroupToCombination($h_CombinedCollisionGroup, $h_CollisionGroup)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCollisionGroupToCombination", "ptr", $h_CombinedCollisionGroup, "ptr", $h_CollisionGroup)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCollisionGroupToCombination

Func _IrrRemoveAllCollisionGroupsFromCombination($h_CombinedCollisionGroup)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAllCollisionGroupsFromCombination", "ptr", $h_CombinedCollisionGroup)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAllCollisionGroupsFromCombination

Func _IrrRemoveCollisionGroupFromCombination($h_CombinedCollisionGroup, $h_CollisionGroup)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveCollisionGroupFromCombination", "ptr", $h_CombinedCollisionGroup, "ptr", $h_CollisionGroup)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveCollisionGroupFromCombination


Func _IrrGetCollisionPoint($a_StartVector, $a_EndVector, $h_CollisionGroup, byRef $a_CollisionVector)

	Local $StartVectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($StartVectorStruct, 1, $a_StartVector[0])
	DllStructSetData($StartVectorStruct, 2, $a_StartVector[1])
	DllStructSetData($StartVectorStruct, 3, $a_StartVector[2])
	Local $EndVectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($EndVectorStruct, 1, $a_EndVector[0])
	DllStructSetData($EndVectorStruct, 2, $a_EndVector[1])
	DllStructSetData($EndVectorStruct, 3, $a_EndVector[2])

	Local $CollisionVectorStruct = DllStructCreate("float;float;float")
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetCollisionPoint", "ptr", DllStructGetPtr($StartVectorStruct), _
				"ptr", DllStructGetPtr($EndVectorStruct), "ptr", $h_CollisionGroup, "ptr", DllStructGetPtr($CollisionVectorStruct))
	if @error Then
		Return Seterror(1,0,False)
	Else
		dim $a_CollisionVector[3] = [DllStructGetData($CollisionVectorStruct, 1), DllStructGetData($CollisionVectorStruct, 2), DllStructGetData($CollisionVectorStruct, 3)]
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionPoint


Func _IrrGetRayFromScreenCoordinates($i_X, $i_Y, $h_Camera)
	Local $StartVectorStruct = DllStructCreate("float;float;float")
	Local $EndVectorStruct = DllStructCreate("float;float;float")
	DllCall($_irrDll, "none:cdecl", "IrrGetRayFromScreenCoordinates", "int", $i_X, "int", $i_Y, "ptr", $h_Camera, "ptr", DllStructGetPtr($StartVectorStruct), "ptr", DllStructGetPtr($EndVectorStruct))
	Local $result[2][3] = [[DllStructGetData($StartVectorStruct, 1), DllStructGetData($StartVectorStruct, 2), DllStructGetData($StartVectorStruct, 3)],[DllStructGetData($EndVectorStruct, 1), DllStructGetData($EndVectorStruct, 2), DllStructGetData($EndVectorStruct, 3)]]
	Return $result
EndFunc   ;==>_IrrGetRayFromScreenCoordinates

Func _IrrGetCollisionNodeFromCamera($h_Camera)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetCollisionNodeFromCamera", "ptr", $h_Camera)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionNodeFromCamera

Func _IrrGetCollisionNodeFromRay($h_StartVector, $h_EndVector)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetCollisionNodeFromRay", "ptr", $h_StartVector, "ptr", $h_EndVector)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionNodeFromRay


Func _IrrGetCollisionNodeFromScreenCoordinates($i_X, $i_Y)
; a ray is cast through the screen at the specified co-ordinates and the nearest
; node that is hit by the ray is returned. if no node is hit zero is returned
; for the object
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetCollisionNodeFromScreenCoordinates", "int", $i_X, "int", $i_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionNodeFromScreenCoordinates


Func _IrrGetScreenCoordinatesFrom3DPosition(ByRef $i_ScreenX, ByRef $i_ScreenY, $a_3DPositionVector)
	Local $PositionVectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($PositionVectorStruct, 1, $a_3DPositionVector[0])
	DllStructSetData($PositionVectorStruct, 2, $a_3DPositionVector[1])
	DllStructSetData($PositionVectorStruct, 3, $a_3DPositionVector[2])

	$result = DllCall($_irrDll, "none:cdecl", "IrrGetScreenCoordinatesFrom3DPosition", "int*", $i_ScreenX, "int*", $i_ScreenY, "ptr", DllStructGetPtr($PositionVectorStruct))
	if @error Then
		Return Seterror(1,0,False)
	Else
		$i_ScreenX = $result[1]
		$i_ScreenY = $result[2]
		Return true
	EndIf
EndFunc   ;==>_IrrGetScreenCoordinatesFrom3DPosition


Func _IrrGet3DPositionFromScreenCoordinates($i_X, $i_Y, ByRef $a_Vector3df, $h_Camera, $f_NormalX=0.0, $f_NormalY=0.0, $f_NormalZ=1.0, $f_DistanceFromOrigin=0.0)
; Calculates the intersection between a ray projected through the specified
; screen co-ordinates and a plane defined a normal and distance from the
; world origin (contributed by agamemnus)
	$result = DllCall($_irrDll, "none:cdecl", "IrrGet3DPositionFromScreenCoordinates", "int", $i_X, "int", $i_Y, _
				"float*", $a_Vector3df[0], "float*", $a_Vector3df[1], "float*", $a_Vector3df[2], _
				"ptr", $h_Camera, "float", $f_NormalX, "float", $f_NormalY, "float", $f_NormalZ, "float", $f_DistanceFromOrigin)

	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector3df[0] = $result[3]
		$a_Vector3df[1] = $result[4]
		$a_Vector3df[2] = $result[5]
		Return $a_Vector3df
	EndIf
EndFunc   ;==>_IrrGet3DPositionFromScreenCoordinates


Func _IrrGet2DPositionFromScreenCoordinates($i_X, $i_Y, ByRef $f_X, ByRef $f_Y, $h_Camera)
; Calculates the intersection between a ray projected through the specified
; screen co-ordinates and a flat surface plane (contributed by agamemnus)
	$result = DllCall($_irrDll, "none:cdecl", "IrrGet2DPositionFromScreenCoordinates", "int", $i_X, "int", $i_Y, _
				"float*", $f_X, "float*", $f_Y, "ptr", $h_Camera)

	if @error Then
		Return Seterror(1,0,False)
	Else
		$f_X = $result[3]
		$f_Y = $result[4]
		Return true
	EndIf
EndFunc   ;==>_IrrGet2DPositionFromScreenCoordinates


Func _IrrGetChildCollisionNodeFromRay($h_Node, $i_Mask, $i_Recurse, $a_StartVector, $a_EndVector)
	Local $StartVectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($StartVectorStruct, 1, $a_StartVector[0])
	DllStructSetData($StartVectorStruct, 2, $a_StartVector[1])
	DllStructSetData($StartVectorStruct, 3, $a_StartVector[2])
	Local $EndVectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($EndVectorStruct, 1, $a_EndVector[0])
	DllStructSetData($EndVectorStruct, 2, $a_EndVector[1])
	DllStructSetData($EndVectorStruct, 3, $a_EndVector[2])
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetChildCollisionNodeFromRay", "ptr", $h_Node, "int", $i_Mask, "int", $i_Recurse, "ptr", DllStructGetPtr($StartVectorStruct), "ptr", DllStructGetPtr($EndVectorStruct) )
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetChildCollisionNodeFromRay

Func _IrrGetChildCollisionNodeFromPoint($h_Node, $i_Mask, $i_Recurse, $a_PointVector)
	Local $PointVectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($PointVectorStruct, 1, $a_PointVector[0])
	DllStructSetData($PointVectorStruct, 2, $a_PointVector[1])
	DllStructSetData($PointVectorStruct, 3, $a_PointVector[2])
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetChildCollisionNodeFromPoint", "ptr", $h_Node, "int", $i_Mask, "int", $i_Recurse, "ptr", DllStructGetPtr($PointVectorStruct))
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetChildCollisionNodeFromPoint


Func _IrrGetNodeAndCollisionPointFromRay($a_StartVector, $a_EndVector, ByRef $h_Node, ByRef $f_PosX, ByRef $f_PosY, ByRef $f_PosZ, ByRef $f_NormalX, ByRef $f_NormalY, ByRef $f_NormalZ, $i_ID = 0, $h_RootNode = $IRR_NO_OBJECT)
; a ray is cast through the specified co-ordinates and the nearest node that has
; a collision selector object that is hit by the ray is returned along with the
; coordinate of the collision and the normal of the triangle that is hit. if no
; node is hit zero is returned for the object
	Local $StartVectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($StartVectorStruct, 1, $a_StartVector[0])
	DllStructSetData($StartVectorStruct, 2, $a_StartVector[1])
	DllStructSetData($StartVectorStruct, 3, $a_StartVector[2])
	Local $EndVectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($EndVectorStruct, 1, $a_EndVector[0])
	DllStructSetData($EndVectorStruct, 2, $a_EndVector[1])
	DllStructSetData($EndVectorStruct, 3, $a_EndVector[2])
 	$h_Node = DllStructCreate("UINT_PTR")
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetNodeAndCollisionPointFromRay", _
			"ptr", DllStructGetPtr($StartVectorStruct), "ptr", DllStructGetPtr($EndVectorStruct), "ptr*", $h_Node, _
			"float*", $f_PosX, "float*", $f_PosY, "float*", $f_PosZ, _
			"float*", $f_NormalX, "float*", $f_NormalY, "float*", $f_NormalZ, _
			"int", $i_ID, "ptr", $h_Node)

	if @error Then
		Return Seterror(1,0,False)
	Elseif $result[3] = 0 Then
		return 0
	Else
		$h_Node = $result[3]
		$f_PosX = $result[4]
		$f_PosY = $result[5]
		$f_PosZ = $result[6]
		$f_NormalX = $result[7]
		$f_NormalY = $result[8]
		$f_NormalZ = $result[9]
		Return $h_Node
	EndIf

EndFunc   ;==>_IrrGetNodeAndCollisionPointFromRay


Func _IrrGetDistanceBetweenNodes($h_NodeA, $h_NodeB)
	$result = DllCall($_irrDll, "float:cdecl", "IrrGetDistanceBetweenNodes", "ptr", $h_NodeA, "ptr", $h_NodeB)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetDistanceBetweenNodes

Func _IrrAreNodesIntersecting($h_NodeA, $h_NodeB)
	$result = DllCall($_irrDll, "int:cdecl", "IrrAreNodesIntersecting", "ptr", $h_NodeA, "ptr", $h_NodeB)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAreNodesIntersecting

Func _IrrIsPointInsideNode($h_NodeA, $f_X, $f_Y, $f_Z)
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsPointInsideNode", "ptr", $h_NodeA, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsPointInsideNode

Func _IrrGetCollisionResultPosition($h_CollisionGroup, $a_VectorPosition, $a_VectorRadius, $a_VectorVelocity, $a_VectorGravity, $f_SlidingSpeed, $i_AreFalling)
	Local $VectorPositionStruct = DllStructCreate("float;float;float")
	DllStructSetData($VectorPositionStruct, 1, $a_VectorPosition[0])
	DllStructSetData($VectorPositionStruct, 2, $a_VectorPosition[1])
	DllStructSetData($VectorPositionStruct, 3, $a_VectorPosition[2])
	Local $VectorRadiusStruct = DllStructCreate("float;float;float")
	DllStructSetData($VectorRadiusStruct, 1, $a_VectorRadius[0])
	DllStructSetData($VectorRadiusStruct, 2, $a_VectorRadius[1])
	DllStructSetData($VectorRadiusStruct, 3, $a_VectorRadius[2])
	Local $VectorVelocityStruct = DllStructCreate("float;float;float")
	DllStructSetData($VectorVelocityStruct, 1, $a_VectorVelocity[0])
	DllStructSetData($VectorVelocityStruct, 2, $a_VectorVelocity[1])
	DllStructSetData($VectorVelocityStruct, 3, $a_VectorVelocity[2])
	Local $VectorGravityStruct = DllStructCreate("float;float;float")
	DllStructSetData($VectorGravityStruct, 1, $a_VectorGravity[0])
	DllStructSetData($VectorGravityStruct, 2, $a_VectorGravity[1])
	DllStructSetData($VectorGravityStruct, 3, $a_VectorGravity[2])
	Local $VectorResultPositionStruct = DllStructCreate("float;float;float")
	Local $VectorHitPositionStruct = DllStructCreate("float;float;float")
	DllCall($_irrDll, "none:cdecl", "IrrGetCollisionResultPosition", "ptr", $h_CollisionGroup, "ptr", DllStructGetPtr($VectorPositionStruct), "ptr", DllStructGetPtr($VectorRadiusStruct), "ptr", DllStructGetPtr($VectorVelocityStruct), "ptr", DllStructGetPtr($VectorGravityStruct), "float", $f_SlidingSpeed, "ptr*", DllStructGetPtr($VectorResultPositionStruct), "ptr*", DllStructGetPtr($VectorHitPositionStruct), "int", $i_AreFalling)
	Local $result[2][3] = [[DllStructGetData($VectorHitPositionStruct, 1), DllStructGetData($VectorHitPositionStruct, 2), DllStructGetData($VectorHitPositionStruct, 3)],[DllStructGetData($VectorResultPositionStruct, 1), DllStructGetData($VectorResultPositionStruct, 2), DllStructGetData($VectorResultPositionStruct, 3)]]
	Return $result
EndFunc   ;==>_IrrGetCollisionResultPosition

;Camera functions
Func _IrrAddFPSCamera($h_ParentNode = 0, $f_RotateSpeed = 100.0, $f_MoveSpeed = 0.5, $i_ID = -1, $h_KeyMapArray = 0, $i_KeyMapSize = 0, $i_NoVerticalMovement = 0, $f_JumpSpeed = 0.0)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddFPSCamera", "UINT_PTR", $h_ParentNode, "float", $f_RotateSpeed, "float", $f_MoveSpeed, "int", $i_ID, "ptr", $h_KeyMapArray, "int", $i_KeyMapSize, "int", $i_NoVerticalMovement, "float", $f_JumpSpeed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFPSCamera

Func _IrrAddCamera($f_CamX, $f_CamY, $f_CamZ, $f_TargetX, $f_TargetY, $f_TargetZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCamera", "float", $f_CamX, "float", $f_CamY, "float", $f_CamZ, "float", $f_TargetX, "float", $f_TargetY, "float", $f_TargetZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCamera

Func _IrrAddMayaCamera($h_Node, $f_Rotate, $f_Zoom, $f_Move)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddMayaCamera", "ptr", $h_Node, "float", $f_Rotate, "float", $f_Zoom, "float", $f_Move)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddMayaCamera

Func _IrrSetCameraTarget($h_Camera, $f_CamX, $f_CamY, $f_CamZ)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraTarget", "ptr", $h_Camera, "float", $f_CamX, "float", $f_CamY, "float", $f_CamZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraTarget

Func _IrrGetCameraTarget($h_Camera, ByRef $a_Vector3df)
	Dim $a_Vector3df[3]
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetCameraTarget", "ptr", $h_Camera, "float*", $a_Vector3df[0], "float*", $a_Vector3df[1], "float*", $a_Vector3df[2])
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector3df[0] = $result[2]
		$a_Vector3df[1] = $result[3]
		$a_Vector3df[2] = $result[4]
		Return True
	EndIf
EndFunc   ;==>_IrrGetCameraTarget

Func _IrrGetCameraUpDirection($h_Camera, ByRef $a_Vector3df)
	Dim $a_Vector3df[3]
	$result = DllCall($_irrDll, "none:cdecl", "IrrGetCameraUpDirection", "ptr", $h_Camera, "float*", $a_Vector3df[0], "float*", $a_Vector3df[1], "float*", $a_Vector3df[2])
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector3df[0] = $result[2]
		$a_Vector3df[1] = $result[3]
		$a_Vector3df[2] = $result[4]
		Return True
	EndIf
EndFunc   ;==>_IrrGetCameraUpDirection

Func _IrrSetCameraUpDirection($h_Camera, $f_CamX, $f_CamY, $f_CamZ)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraUpDirection", "UINT_PTR", $h_Camera, "float", $f_CamX, "float", $f_CamY, "float", $f_CamZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraUpDirection


Func _IrrGetCameraOrientation($h_Camera, ByRef $a_Vector1, ByRef $a_Vector2, ByRef $a_Vector3)
	Dim $a_Vector1[3], $a_Vector2[3], $a_Vector3[3]
	local $v1 = DllStructCreate("float;float;float")
	local $v2 = DllStructCreate("float;float;float")
	local $v3 = DllStructCreate("float;float;float")

	$result = DllCall($_irrDll, "none:cdecl", "IrrGetCameraOrientation", "UINT_PTR", $h_Camera, _
		"ptr", DllStructGetPtr($v1), "ptr", DllStructGetPtr($v2), "ptr", DllStructGetPtr($v3))
	if @error Then
		Return Seterror(1,0,False)
	Else
		$a_Vector1[0] = DllStructGetData($v1, 1)
		$a_Vector1[1] = DllStructGetData($v1, 2)
		$a_Vector1[2] = DllStructGetData($v1, 3)
		$a_Vector2[0] = DllStructGetData($v2, 1)
		$a_Vector2[1] = DllStructGetData($v2, 2)
		$a_Vector2[2] = DllStructGetData($v2, 3)
		$a_Vector3[0] = DllStructGetData($v3, 1)
		$a_Vector3[1] = DllStructGetData($v3, 2)
		$a_Vector3[2] = DllStructGetData($v3, 3)
		return true
	EndIf
EndFunc   ;==>_IrrGetCameraOrientation


Func _IrrRevolveCamera($h_Camera, $f_Yaw, $f_Pitch, $f_Roll, $f_Drive, $f_Strafe, $f_Elevate)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraUpDirection", "UINT_PTR", $h_Camera, "float", $f_Yaw, "float", $f_Pitch, "float", $f_Roll, "float", $f_Drive, "float", $f_Strafe, "float", $f_Elevate)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRevolveCamera

Func _IrrSetCameraUpAtRightAngle($h_Camera)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraUpAtRightAngle", "UINT_PTR", $h_Camera)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraUpAtRightAngle

Func _IrrSetCameraOrthagonal($h_Camera, $f_DistanceX, $f_DistanceY, $f_DistanceZ)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraOrthagonal", "UINT_PTR", $h_Camera, "float", $f_DistanceX, "float", $f_DistanceY, "float", $f_DistanceZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraOrthagonal

Func _IrrSetCameraClipDistance($h_Camera, $f_Distance, $f_NearDistance = 1.0)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraClipDistance", "ptr", $h_Camera, "float", $f_Distance, "float", $f_NearDistance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraClipDistance

Func _IrrSetActiveCamera($h_Camera)
	DllCall($_irrDll, "none:cdecl", "IrrSetActiveCamera", "UINT_PTR", $h_Camera)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetActiveCamera

Func _IrrSetCameraFOV($h_Camera, $f_FOV)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraFOV", "ptr", $h_Camera, "float", $f_FOV)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraFOV

Func _IrrSetCameraAspectRatio($h_Camera, $f_AspectRatio)
	DllCall($_irrDll, "none:cdecl", "IrrSetCameraAspectRatio", "ptr", $h_Camera, "float", $f_AspectRatio)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCameraAspectRatio


;Lighting functions
Func _IrrAddLight($h_parentNode, $f_X, $f_Y, $f_Z, $f_Red, $f_Green, $f_Blue, $f_Size)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddLight", "UINT_PTR", $h_parentNode, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_Red, "float", $f_Green, "float", $f_Blue, "float", $f_Size)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddLight

Func _IrrSetAmbientLight($f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetAmbientLight", "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetAmbientLight

Func _IrrSetLightAmbientColor($h_Light, $f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightAmbientColor", "ptr", $h_Light, "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightAmbientColor

Func _IrrSetLightAttenuation($h_Light, $f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightAttenuation", "ptr", $h_Light, "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightAttenuation

Func _IrrSetLightCastShadows($h_Light, $i_Shadows)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightAttenuation", "ptr", $h_Light, "int", $i_Shadows)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightCastShadows

Func _IrrSetLightDiffuseColor($h_Light, $f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightDiffuseColor", "ptr", $h_Light, "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightDiffuseColor

Func _IrrSetLightFalloff($h_Light, $f_Falloff)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightFalloff", "ptr", $h_Light, "float", $f_Falloff)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightFalloff

Func _IrrSetLightInnerCone($h_Light, $f_InnerCone)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightInnerCone", "ptr", $h_Light, "float", $f_InnerCone)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightInnerCone

Func _IrrSetLightOuterCone($h_Light, $f_OuterCone)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightOuterCone", "ptr", $h_Light, "float", $f_OuterCone)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightOuterCone

Func _IrrSetLightRadius($h_Light, $f_Radius)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightOuterCone", "ptr", $h_Light, "float", $f_Radius)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightRadius

Func _IrrSetLightSpecularColor($h_Light, $f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightSpecularColor", "ptr", $h_Light, "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightSpecularColor

Func _IrrSetLightType($h_Light, $i_Type)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightType", "ptr", $h_Light, "int", $i_Type)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightType

;Terrain functions
Func _IrrAddTerrain($s_Path, $f_PosX = 0.0, $f_PosY = 0.0, $f_PosZ = 0.0, $f_RotX = 0.0, $f_RotY = 0.0, $f_RotZ = 0.0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0, $i_VertexAlpha = 255, $i_VertexRed = 255, $i_VertexGreen = 255, $i_VertexBlue = 255, $i_Smoothing = 0, $i_MaxLOD = 5, $i_PatchSize = $ETPS_17)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddTerrain", "str", $s_Path, "float", $f_PosX, "float", $f_PosY, "float", $f_PosZ, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ, "float", $f_ScaleX, "float", $f_ScaleY, "float", $f_ScaleZ, "int", $i_VertexAlpha, "int", $i_VertexRed, "int", $i_VertexGreen, "int", $i_VertexBlue, "int", $i_Smoothing, "int", $i_MaxLOD, "int", $i_PatchSize)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddTerrain

Func _IrrAddTerrainTile($h_Image, $i_TileSize = 256, $i_DataX = 0, $i_DataY = 0, $f_PosX = 0.0, $f_PosY = 0.0, $f_PosZ = 0.0, $f_RotX = 0.0, $f_RotY = 0.0, $f_RotZ = 0.0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0, $i_Smoothing = 1, $i_MaxLOD = 5, $i_PatchSize = $ETPS_17)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddTerrainTile", "UINT_PTR", $h_Image, "int", $i_TileSize, _
				"int", $i_DataX, "int", $i_DataY, "float", $f_PosX, "float", $f_PosY, "float", $f_PosZ, _
				"float", $f_RotX, "float", $f_RotY, "float", $f_RotZ, "float", _
				$f_ScaleX, "float", $f_ScaleY, "float", $f_ScaleZ, "int", $i_Smoothing, "int", $i_MaxLOD, "int", $i_PatchSize)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddTerrainTile


Func _IrrAddSphericalTerrain($s_TopPath, $s_FrontPath, $s_BackPath, $s_LeftPath, $RightPath, $s_BottomPath, $f_PosX = 0.0, $f_PosY = 0.0, $f_PosZ = 0.0, $f_RotX = 0.0, $f_RotY = 0.0, $f_RotZ = 0.0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0, $i_VertexAlpha = 255, $i_VertexRed = 255, $i_VertexGreen = 255, $i_VertexBlue = 255, $i_Smoothing = 0, $i_Spherical = 0, $i_MaxLOD = 5, $i_PatchSize = $ETPS_17)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddSphericalTerrain", _
		"str", $s_TopPath, "str", $s_FrontPath, "str", $s_BackPath, "str", $s_LeftPath, "str", $RightPath, "str", $s_BottomPath, _
		"float", $f_PosX, "float", $f_PosY, "float", $f_PosZ, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ, _
		"float", $f_ScaleX, "float", $f_ScaleY, "float", $f_ScaleZ, _
		"int", $i_VertexAlpha, "int", $i_VertexRed, "int", $i_VertexGreen, "int", $i_VertexBlue, _
		"int", $i_Smoothing, "int", $i_Spherical, "int", $i_MaxLOD, "int", $i_PatchSize)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSphericalTerrain

Func _IrrGetTerrainHeight($h_Terrain, $f_X, $f_Y)
	$result = DllCall($_irrDll, "float:cdecl", "IrrGetTerrainHeight", "ptr", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetTerrainHeight

Func _IrrScaleTexture($h_Terrain, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrScaleTexture", "ptr", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrScaleTexture

Func _IrrGetTerrainTileHeight($h_Terrain, $f_X, $f_Y)
	$result = DllCall($_irrDll, "float:cdecl", "IrrGetTerrainTileHeight", "ptr", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetTerrainTileHeight

Func _IrrScaleTileTexture($h_Terrain, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrScaleTileTexture", "UINT_PTR", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrScaleTileTexture

Func _IrrAttachTile($h_Terrain, $h_Neighbor, $i_Edge)
	DllCall($_irrDll, "none:cdecl", "IrrAttachTile", "UINT_PTR", $h_Terrain, "UINT_PTR", $h_Neighbor, "uint", $i_Edge)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAttachTile

Func _IrrSetTileStructure($h_Terrain, $h_Image, $i_X, $i_Y)
	DllCall($_irrDll, "none:cdecl", "IrrSetTileStructure", "UINT_PTR", $h_Terrain, "UINT_PTR", $h_Image, "int", $i_X, "int", $i_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTileStructure


Func _IrrSetTileColor($h_Terrain, $h_Image, $i_X=0, $i_Y=0)
	DllCall($_irrDll, "none:cdecl", "IrrSetTileColor", "UINT_PTR", $h_Terrain, "UINT_PTR", $h_Image, "int", $i_X, "int", $i_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTileColor

Func _IrrScaleSphericalTexture($h_Terrain, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrScaleSphericalTexture", "UINT_PTR", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrScaleSphericalTexture

Func _IrrSetSphericalTerrainTexture($h_Terrain, $s_Top, $s_Front, $s_Back, $s_Left, $s_Right, $s_Bottom, $i_MaterialIndex)
	DllCall($_irrDll, "none:cdecl", "IrrSetSphericalTerrainTexture", "UINT_PTR", $h_Terrain, "str", $s_Top, "str", $s_Front, "str", $s_Back, "str", $s_Left, "str", $s_Right, "str", $s_Bottom, "int", $i_MaterialIndex)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetSphericalTerrainTexture

Func _IrrLoadSphericalTerrainVertexColor($h_Terrain, $s_Top, $s_Front, $s_Back, $s_Left, $s_Right, $s_Bottom)
	DllCall($_irrDll, "none:cdecl", "IrrLoadSphericalTerrainVertexColor", "ptr", $h_Terrain, "str", $s_Top, "str", $s_Front, "str", $s_Back, "str", $s_Left, "str", $s_Right, "str", $s_Bottom)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrLoadSphericalTerrainVertexColor

Func _IrrGetSphericalTerrainSurfacePosition($h_Terrain, $i_Face, $f_LogicalX, $f_LogicalY, $f_LogicalZ)
	Local $X = DllStructCreate("float")
	Local $Y = DllStructCreate("float")
	Local $Z = DllStructCreate("float")
	DllCall($_irrDll, "none:cdecl", "IrrGetSphericalTerrainSurfacePosition", "ptr", $h_Terrain, "int", $i_Face, "float", $f_LogicalX, "float", $f_LogicalY, "float", $f_LogicalZ, "float*", DllStructGetPtr($X), "float*", DllStructGetPtr($Y), "float*", DllStructGetPtr($Z))
	Local $result[3] = [DllStructGetData($X, 1), DllStructGetData($Y, 1), DllStructGetData($Z, 1)]
EndFunc   ;==>_IrrGetSphericalTerrainSurfacePosition

Func _IrrGetSphericalTerrainSurfacePositionAndAngle($h_Terrain, $i_Face, $f_LogicalX, $f_LogicalY, $f_LogicalZ)
	Local $X = DllStructCreate("float")
	Local $Y = DllStructCreate("float")
	Local $Z = DllStructCreate("float")
	Local $RotX = DllStructCreate("float")
	Local $RotY = DllStructCreate("float")
	Local $RotZ = DllStructCreate("float")
	DllCall($_irrDll, "none:cdecl", "IrrGetSphericalTerrainSurfacePositionAndAngle", "ptr", $h_Terrain, "int", $i_Face, "float", $f_LogicalX, "float", $f_LogicalY, "float", $f_LogicalZ, "float*", DllStructGetPtr($X), "float*", DllStructGetPtr($Y), "float*", DllStructGetPtr($Z), "float*", DllStructGetPtr($RotX), "float*", DllStructGetPtr($RotY), "float*", DllStructGetPtr($RotZ))
	Local $result[2][3] = [[DllStructGetData($X, 1), DllStructGetData($Y, 1), DllStructGetData($Z, 1)],[DllStructGetData($RotX, 1), DllStructGetData($RotY, 1), DllStructGetData($RotZ, 1)]]
EndFunc   ;==>_IrrGetSphericalTerrainSurfacePositionAndAngle

Func _IrrGetSphericalTerrainLogicalSurfacePosition($h_Terrain, $i_Face, $f_LogicalX, $f_LogicalY, $f_LogicalZ)
	Local $X = DllStructCreate("float")
	Local $Y = DllStructCreate("float")
	Local $Z = DllStructCreate("float")
	DllCall($_irrDll, "none:cdecl", "IrrGetSphericalTerrainLogicalSurfacePosition", "ptr", $h_Terrain, "int", $i_Face, "float", $f_LogicalX, "float", $f_LogicalY, "float", $f_LogicalZ, "float*", DllStructGetPtr($X), "float*", DllStructGetPtr($Y), "float*", DllStructGetPtr($Z))
	Local $result[3] = [DllStructGetData($X, 1), DllStructGetData($Y, 1), DllStructGetData($Z, 1)]
EndFunc   ;==>_IrrGetSphericalTerrainLogicalSurfacePosition

;Particle functions
Func _IrrSetMinParticleSize($h_Emitter, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrSetMinParticleSize", "ptr", $h_Emitter, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMinParticleSize

Func _IrrSetMaxParticleSize($h_Emitter, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrSetMaxParticleSize", "ptr", $h_Emitter, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMaxParticleSize


Func _IrrAddAnimatedMeshSceneNodeEmitter($h_ParticleSystem, $h_Node, $i_UseNormals, $f_NormalModifier, $i_AllVertices, $h_SettingsStruct)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddAnimatedMeshSceneNodeEmitter", "ptr", $h_ParticleSystem, "ptr", $h_Node, "int", $i_UseNormals, "float", $f_NormalModifier, "int", $i_AllVertices, "ptr", $h_SettingsStruct)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddAnimatedMeshSceneNodeEmitter


Func _IrrAddRotationAffector($h_ParticleSystem, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_PivotX, $f_pivotY, $f_pivotZ)
; Creates a rotation affector. This affector modifies the positions of the
; particles and attracts them to a specified point at a specified speed per second.
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddRotationAffector", "UINT_PTR", $h_ParticleSystem, _
			"float", $f_SpeedX, "float", $f_SpeedY, "float", $f_SpeedZ, "float", $f_PivotX, "float", $f_PivotY, "float", $f_PivotZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddRotationAffector


Func _IrrAddFadeOutParticleAffector($h_ParticleSystem, $i_FadeFactor, $i_Red, $i_Green, $i_Blue)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFadeOutParticleAffector", "ptr", $h_ParticleSystem, "int", $i_FadeFactor, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFadeOutParticleAffector

Func _IrrAddGravityParticleAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z)
	$result = DllCall($_irrDll, "ptr:cdecl", "_IrrAddGravityParticleAffector", "ptr", $h_ParticleSystem, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddGravityParticleAffector

Func _IrrAddParticleAttractionAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_Speed = 1, $i_Attract = 1, $i_AffectX = 1, $i_AffectY = 1, $i_AffectZ = 1)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddParticleAttractionAffector", "ptr", $h_ParticleSystem, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_Speed, "int", $i_Attract, "int", $i_AffectX, "int", $i_AffectY, "int", $i_AffectZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticleAttractionAffector

Func _IrrCreateRotationAffector($h_ParticleSystem, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_RotX, $f_RotY, $f_RotZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateRotationAffector", "ptr", $h_ParticleSystem, "float", $f_SpeedX, "float", $f_SpeedY, "float", $f_SpeedZ, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateRotationAffector

Func _IrrAddStopParticleAffector($h_ParticleSystem, $i_Time, $h_Emitter)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddStopParticleAffector", "ptr", $h_ParticleSystem, "int", $i_Time, "ptr", $h_Emitter)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddStopParticleAffector

Func _IrrAddParticlePushAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_Far, $f_Near, $f_Column, $i_Distant)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddParticlePushAffector", "ptr", $h_ParticleSystem, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_SpeedX, "float", $f_SpeedY, "float", $f_SpeedZ, "float", $f_Far, "float", $f_Near, "float", $f_Column, "int", $i_Distant)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticlePushAffector

Func _IrrAddColorMorphAffector($h_ParticleSystem, $i_NumberOfParticles, $a_ParticleColors, $a_ParticleTimes, $i_Smooth)
	$timeSize = UBound($a_ParticleTimes)
	$colorSize = UBound($a_ParticleColors)
	$ParticlesStruct = DllStructCreate("float[" & $colorSize & "];float[" & $colorSize & "];float[" & $colorSize & "]")

	For $i = 1 To $colorSize
		DllStructSetData($ParticlesStruct, 1, $a_ParticleColors[$i - 1][0])
		DllStructSetData($ParticlesStruct, 2, $a_ParticleColors[$i - 1][1])
		DllStructSetData($ParticlesStruct, 3, $a_ParticleColors[$i - 1][2])
	Next

	$TimeStruct = DllStructCreate("float[" & $colorSize & "];float[" & $colorSize & "];float[" & $colorSize & "]")

	For $i = 1 To $timeSize
		DllStructSetData($TimeStruct, 1, $a_ParticleTimes[$i - 1])
	Next

	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddColorMorphAffector", "ptr", $h_ParticleSystem, "int", $i_NumberOfParticles, "ptr", DllStructGetPtr($ParticlesStruct), "ptr", DllStructGetPtr($TimeStruct), "int", $i_Smooth)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddColorMorphAffector

Func _IrrAddSplineAffector($h_ParticleSystem, $a_ParticleSpline, $f_Speed, $f_Tightness, $f_Attraction, $i_DeleteAtEnd)
	$splineSize = UBound($a_ParticleSpline)
	Local $SplineStruct = DllStructCreate("float[" & $splineSize & "];float[" & $splineSize & "];float[" & $splineSize & "]")

	For $i = 1 To $splineSize
		DllStructSetData($SplineStruct, 1, $a_ParticleSpline[$i - 1][0])
		DllStructSetData($SplineStruct, 2, $a_ParticleSpline[$i - 1][1])
		DllStructSetData($SplineStruct, 3, $a_ParticleSpline[$i - 1][2])
	Next

	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSplineAffector", "ptr", $h_ParticleSystem, "ptr", DllStructGetPtr($SplineStruct), "float", $f_Speed, "float", $f_Tightness, "float", $f_Attraction, "int", $i_DeleteAtEnd)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSplineAffector

Func _IrrRemoveAffectors($h_ParticleSystem)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAffectors", "ptr", $h_ParticleSystem)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAffectors

Func _IrrSetParticleEmitterDirection($h_ParticleEmitter, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterDirection", "ptr", $h_ParticleEmitter, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterDirection

Func _IrrSetParticleEmitterMinParticlesPerSecond($h_ParticleEmitter, $i_Min)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMinParticlesPerSecond", "ptr", $h_ParticleEmitter, "int", $i_Min)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMinParticlesPerSecond

Func _IrrSetParticleEmitterMaxParticlesPerSecond($h_ParticleEmitter, $i_Max)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMaxParticlesPerSecond", "ptr", $h_ParticleEmitter, "int", $i_Max)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMaxParticlesPerSecond

Func _IrrSetParticleEmitterMinStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMinStartColor", "ptr", $h_ParticleEmitter, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMinStartColor

Func _IrrSetParticleEmitterMaxStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMaxStartColor", "ptr", $h_ParticleEmitter, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMaxStartColor

Func _IrrSetParticleAffectorEnable($h_ParticleAffector, $i_Enabled)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAffectorEnable", "ptr", $h_ParticleAffector, "int", $i_Enabled)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAffectorEnable

Func _IrrSetFadeOutParticleAffectorTime($h_ParticleAffector, $f_Time)
	DllCall($_irrDll, "none:cdecl", "IrrSetFadeOutParticleAffectorTime", "ptr", $h_ParticleAffector, "float", $f_Time)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetFadeOutParticleAffectorTime

Func _IrrSetFadeOutParticleAffectorTargetColor($h_ParticleAffector, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetFadeOutParticleAffectorTargetColor", "ptr", $h_ParticleAffector, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetFadeOutParticleAffectorTargetColor

Func _IrrSetGravityParticleAffectorDirection($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetGravityParticleAffectorDirection", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGravityParticleAffectorDirection

Func _IrrSetGravityParticleAffectorTimeForceLost($h_ParticleAffector, $f_TimeForceLost)
	DllCall($_irrDll, "none:cdecl", "IrrSetGravityParticleAffectorTimeForceLost", "ptr", $h_ParticleAffector, "float", $f_TimeForceLost)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGravityParticleAffectorTimeForceLost

Func _IrrSetParticleAttractionAffectorAffectX($h_ParticleAffector, $i_Affect)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAffectX", "ptr", $h_ParticleAffector, "int", $i_Affect)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAffectX

Func _IrrSetParticleAttractionAffectorAffectY($h_ParticleAffector, $i_Affect)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAffectY", "ptr", $h_ParticleAffector, "int", $i_Affect)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAffectY

Func _IrrSetParticleAttractionAffectorAffectZ($h_ParticleAffector, $i_Affect)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAffectZ", "ptr", $h_ParticleAffector, "int", $i_Affect)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAffectZ

Func _IrrSetParticleAttractionAffectorAttract($h_ParticleAffector, $i_Attract)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAttract", "ptr", $h_ParticleAffector, "int", $i_Attract)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAttract

Func _IrrSetParticleAttractionAffectorPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorPoint", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorPoint

Func _IrrSetRotationAffectorPivotPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetRotationAffectorPivotPoint", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetRotationAffectorPivotPoint

Func _IrrSetFurthestDistanceOfEffect($h_ParticleAffector, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetFurthestDistanceOfEffect", "ptr", $h_ParticleAffector, "float", $f_Distance)
EndFunc   ;==>_IrrSetFurthestDistanceOfEffect

Func _IrrSetNearestDistanceOfEffect($h_ParticleAffector, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetNearestDistanceOfEffect", "ptr", $h_ParticleAffector, "float", $f_Distance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNearestDistanceOfEffect

Func _IrrSetColumnDistanceOfEffect($h_ParticleAffector, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetColumnDistanceOfEffect", "ptr", $h_ParticleAffector, "float", $f_Distance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetColumnDistanceOfEffect

Func _IrrSetCenterOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetCenterOfEffect", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCenterOfEffect

Func _IrrSetStrengthOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetStrengthOfEffect", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetStrengthOfEffect

;Irrlicht GUI functions
Func _IrrGUIClear()
	DllCall($_irrDll, "none:cdecl", "IrrGUIClear")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUIClear


Func _IrrGUIEvents($i_EventsForGUI)
; whether keyboard and mouse events should be used by the GUI
	$result = DllCall($_irrDll, "int:cdecl", "IrrGUIEvents", "int", $i_EventsForGUI)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrGUIEvents


Func _IrrGUIEventAvailable()
; find out if there is a GUI event ready to be read. returns 1 if there is an
; event available (the event receiver must have been started when the system
; was initialised)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGUIEventAvailable")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrGUIEventAvailable


Func _IrrReadGUIEvent()
; read a GUI event out
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrReadGUIEvent")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrReadGUIEvent


Func _IrrGUIRemove($h_Widget)
	DllCall($_irrDll, "none:cdecl", "IrrGUIRemove", "ptr", $h_Widget)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUIRemove

Func _IrrGUIGetText($h_Widget)
	$result = DllCall($_irrDll, "wstr:cdecl", "IrrGUIGetText", "ptr", $h_Widget)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGUIGetText

Func _IrrGUISetText($h_Widget, $s_Text)
	DllCall($_irrDll, "none:cdecl", "IrrGUISetText", "ptr", $h_Widget, "wstr", $s_Text)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUISetText


Func _IrrGUISetFont($h_Font)
	DllCall($_irrDll, "none:cdecl", "IrrGUISetFont", "UINT_PTR", $h_Font)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUISetFont


Func _IrrGUISetColor($i_Element, $i_Red, $i_Green, $i_Blue, $i_Alpha)
; set the color of an element used by the gui
	DllCall($_irrDll, "none:cdecl", "IrrGUISetColor", "int", $i_Element, "int", $i_Red, "int", $i_Green, "int", $i_Blue, "int", $i_Alpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUISetColor


Func _IrrAddWindow($s_Title, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Modal, $h_Parent = 0)
; add a static text object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddWindow", "wstr", $s_Title, "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "uint", $i_Modal, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddWindow


Func _IrrAddStaticText($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Border, $i_WordWrap, $h_Parent = 0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddStaticText", "wstr", $s_Text, "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "uint", $i_Border, "uint", $i_WordWrap, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddStaticText


Func _IrrAddButton($i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $s_Text = "", $s_TextTip = "", $h_Parent = 0)
; add a clickable button object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddButton", "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, _
				"int", $i_ID, "wstr", $s_Text, "wstr", $s_TextTip, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddButton


Func _IrrAddScrollBar($i_Horizontal, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_CurrentValue, $i_MaxValue, $h_Parent = 0)
; add a scrollbar object to the gui display
$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddScrollBar", "int", $i_Horizontal, "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_CurrentValue, "int", $i_MaxValue, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddScrollBar


Func _IrrAddListBox($i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Background, $h_Parent=0)
; add a listbox object containing a list of items to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddListBox", "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_Background, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddListBox

Func _IrrAddListBoxItem($h_ListBox, $s_Text)
	DllCall($_irrDll, "none:cdecl", "IrrAddListBoxItem", "ptr", $h_ListBox, "wstr", $s_Text)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddListBoxItem

Func _IrrInsertListBoxItem($h_ListBox, $s_Text, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrInsertListBoxItem", "ptr", $h_ListBox, "str", $s_Text, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrInsertListBoxItem

Func _IrrRemoveListBoxItem($h_ListBox, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveListBoxItem", "ptr", $h_ListBox, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveListBoxItem

Func _IrrSelectListBoxItem($h_ListBox, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrSelectListBoxItem", "ptr", $h_ListBox, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSelectListBoxItem


Func _IrrAddEditBox($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Border, $i_Password = $IRR_GUI_NOT_PASSWORD, $h_Parent = 0)
; add an editbox object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddEditBox", "wstr", $s_Text, "int", $i_TopX, "int", $i_TopY, _
				"int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_Border, "int", $i_Password, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddEditBox


Func _IrrAddCheckBox($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Checked, $h_Parent = 0)
; add a checkbox object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCheckBox", "wstr", $s_Text, "int", $i_TopX, "int", $i_TopY, _
				"int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_Checked, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCheckBox

Func _IrrCheckCheckBox($h_CheckBox, $i_Checked)
	DllCall($_irrDll, "none:cdecl", "IrrCheckCheckBox", "ptr", $h_CheckBox, "int", $i_Checked)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrCheckCheckBox


Func _IrrAddImage($h_Texture, $i_X, $i_Y, $i_UseAlpha, $i_ID, $h_Parent = 0)
; add an image object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddImage", "UINT_PTR", $h_Texture, "int", $i_X, "int", $i_Y, "int", $i_UseAlpha, "int", $i_ID, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddImage


Func _IrrAddFileOpen($s_Title, $i_ID, $i_Modal, $h_Parent = 0)
; open a modal file open dialog
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFileOpen", "wstr", $s_Title, "int", $i_ID, "int", $i_Modal, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFileOpen


Func _IrrGetLastSelectedFile()
; get the last file name selected from a file selection dialog
	$result = DllCall($_irrDll, "wstr:cdecl", "IrrGetLastSelectedFile")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetLastSelectedFile

Func _IrrCreateBatchingMesh()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateBatchingMesh")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateBatchingMesh

Func _IrrAddToBatchingMesh($h_meshBatch, $h_mesh, $f_posX = 0.0, $f_posY = 0.0, $f_posZ = 0.0, $f_rotX = 0.0, $f_rotY = 0.0, $f_rotZ = 0.0, $f_scaleX = 1.0, $f_scaleY = 1.0, $f_scaleZ = 1.0)
	$result = DllCall($_irrDll, "none:cdecl", "IrrAddToBatchingMesh", "ptr", $h_meshBatch, "ptr", $h_mesh, _
						"float", $f_posX, "float", $f_posY, "float", $f_posZ, _
						"float", $f_rotX, "float", $f_rotY, "float", $f_rotZ, _
						"float", $f_scaleX, "float", $f_scaleY, "float", $f_scaleZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddToBatchingMesh

Func _IrrFinalizeBatchingMesh($h_meshBatch)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrFinalizeBatchingMesh", "ptr", $h_meshBatch)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrFinalizeBatchingMesh

Func _IrrSetMeshMaterialTexture($h_mesh, $h_texture, $i_index, $i_buffer = 0)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetMeshMaterialTexture", "ptr", $h_mesh, "ptr", $h_texture, "int", $i_index, "int", $i_buffer)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrSetMeshMaterialTexture

Func _IrrScaleMesh($h_mesh, $f_scale, $i_frame = 0, $i_meshBuffer = 0, $h_sourceMesh = 0)
	$result = DllCall($_irrDll, "none:cdecl", "IrrScaleMesh", "ptr", $h_mesh, "float", $f_scale, "int", $i_frame, "int", $i_meshBuffer, "ptr", $h_sourceMesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrScaleMesh

Func _IrrAddBeamSceneNode()
; add a beam node to the scene
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddBeamSceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddBeamSceneNode

Func _IrrSetBeamSize($h_BeamNode, $f_Size)
; set the size of a beam
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetBeamSize", "ptr", $h_BeamNode, "float", $f_Size)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetBeamSize

Func _IrrSetBeamPosition($h_BeamNode, $f_SX, $f_SY, $f_SZ, $f_EX, $f_EY, $f_EZ)
; set the position of a beam
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetBeamPosition", "ptr", $h_BeamNode, _
						"float", $f_SX, "float", $f_SY, "float", $f_SZ, "float", $f_EX, "float", $f_EY, "float", $f_EZ )
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetBeamPosition

Func _IrrAddBoltSceneNode()
; add a bolt node to the scene
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddBoltSceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddBoltSceneNode

Func _IrrSetBoltProperties($h_BoltNode, $f_SX, $f_SY, $f_SZ, $f_EX, $f_EY, $f_EZ, $i_UpdateTime=50, $i_Height=10, $f_Thickness=5.0, $i_Parts=10, $i_Bolts=6, $i_Steadyend=$IRR_OFF, $i_Color=0x0000FFFF)
; aset the properties of the bolt node
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetBoltProperties", "ptr", $h_BoltNode, _
						"float", $f_SX, "float", $f_SY, "float", $f_SZ, "float", $f_EX, "float", $f_EY, "float", $f_EZ, _
						"int", $i_UpdateTime, "int", $i_Height, "float", $f_Thickness, "int", $i_Parts, _
						"int", $i_Bolts, "int", $i_Steadyend, "UINT", $i_Color)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetBoltProperties

Func _IrrSetBillBoardSize($h_Node, $f_Width, $f_Height)
; sets the size of a billboard node
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetBillBoardSize", "ptr", $h_Node, "float", $f_Width, "float", $f_Height)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetBillBoardSize

Func _IrrSetBillBoardColor($h_Node, $i_TopColor, $i_BottomColor)
; sets the color of a billboard node
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetBillBoardColor", "ptr", $h_Node, "UINT", $i_TopColor, "UINT", $i_BottomColor)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetBillBoardColor


; ////////////////////////////////////////////////////////////////////////////
; Bitplanes XEffect Extension

Func _IrrXEffectsStart($i_Vsm=$IRR_OFF, $i_SoftShadows=$IRR_OFF, $iBitdepth32=$IRR_OFF)
; start the XEffects system
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsStart", "int", $i_Vsm, "int", $i_SoftShadows, "int", $iBitdepth32)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsStart

Func _IrrXEffectsAddShadowToNode($h_Node, $i_FilterType=$EFT_NONE, $i_shadowType=$ESM_BOTH)
; start the XEffects system
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrXEffectsAddShadowToNode", "ptr", $h_Node, "int", $i_FilterType, "int", $i_shadowType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrXEffectsAddShadowToNode

Func _IrrXEffectsAddShadowLight($i_ShadowDimen, $f_PosX, $f_PosY, $f_PosZ, $f_TargetX, $f_TargetY, $f_TargetZ, $f_R, $f_G, $f_B, $f_Alpha, $f_LightNearDist, $f_LightFarDist, $f_AngleDegrees )
; Add a special dynamic shadow casting light
; The first parameter specifies the shadow map resolution for the shadow light.
; The shadow map is always square, so you need only pass 1 dimension, preferably
; a power of two between 512 and 2048, maybe larger depending on your quality
; requirements and target hardware.
; The second parameter is the light position, the third parameter is the (look at)
; target, the next is the light color, and the next two are very important
; values, the nearValue and farValue, be sure to set them appropriate to the current
; scene. The last parameter is the FOV (Field of view), since the light is similar to
; a spot light, the field of view will determine its area of influence. Anything that
; is outside of a lights frustum (Too close, too far, or outside of it's field of view)
; will be unlit by this particular light, similar to how a spot light works.
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsAddShadowLight", "int", $i_ShadowDimen, _
					"float", $f_PosX, "float", $f_PosY, "float", $f_PosZ, _
					"float", $f_TargetX, "float", $f_TargetY, "float", $f_TargetZ, _
					"float", $f_R, "float", $f_G, "float", $f_B, "float", $f_Alpha, _
					"float", $f_LightNearDist, "float", $f_LightFarDist, "float", $f_AngleDegrees )
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsAddShadowLight

Func _IrrXEffectsSetAmbientColor($i_R, $i_G, $i_B, $i_Alpha)
; sets the ambient lighting procuded in the scene by the XEffects system
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsSetAmbientColor", "uint", $i_R, "uint", $i_G, "uint", $i_B, "uint", $i_Alpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsSetAmbientColor

Func _IrrXEffectsSetClearColor($i_R, $i_G, $i_B, $i_Alpha)
; the XEffects system uses a different background color to the one specified in
; the IrrBeginScene call use this call to set this default background color
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsSetClearColor", "float", $i_R, "uint", $i_G, "uint", $i_B, "uint", $i_Alpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsSetClearColor

Func _IrrXEffectsSetShadowLightPosition($i_Index, $f_PosX, $f_PosY, $f_PosZ)
; Set the position of a shadow light. the index refers to the numerical order
; in which the lights were added.
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsSetShadowLightPosition", "int", $i_Index, _
				"float", $f_PosX, "float", $f_PosY, "float", $f_PosZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsSetShadowLightPosition

Func _IrrXEffectsEnableDepthPass($i_Enable)
; enable XEffects depth pass
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsEnableDepthPass", "int", $i_Enable)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsEnableDepthPass

Func _IrrXEffectsAddPostProcessingFromFile($s_Name, $i_Enable=0)
; enable XEffects depth pass
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsAddPostProcessingFromFile", "str", $s_Name, "int", $i_Enable)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsAddPostProcessingFromFile

Func _IrrXEffectsAddNodeToDepthPass($h_Node)
; adds a node to the list of nodes used for calculating the depth pass
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsAddNodeToDepthPass", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsAddNodeToDepthPass

Func _IrrXEffectsSetPostProcessingUserTexture($h_Texture)
; Sets the user defined post processing texture. This is used internally for
; the SSAO shader but is used primarily for the water shader where it defines
; the specular surface pattern of the water.
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsSetPostProcessingUserTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsSetPostProcessingUserTexture


#cs - TODO of bitplanes XEffect Extension:
'' ////////////////////////////////////////////////////////////////////////////
'' Bitplanes XEffect Extension

' remove a shadowing effect from a node
declare sub IrrXEffectsRemoveShadowFromNode alias "IrrXEffectsRemoveShadowFromNode" ( _
        byval node as irr_node )

' exclude a node from being calculated in shadowing equations
declare sub IrrXEffectsExcludeNodeFromLightingCalculations alias "IrrXEffectsExcludeNodeFromLightingCalculations" ( _
        byval node as irr_node )

' Get the position of a shadow light. the index refers to the numerical order
' in which the lights were added.
declare sub IrrXEffectsGetShadowLightPosition alias "IrrXEffectsGetShadowLightPosition" ( _
	byval index as uinteger, byref posX as single, byref posY as single, byref posZ as single )

' Set the target location of a shadow light. the index refers to the numerical
' order in which the lights were added.
declare sub IrrXEffectsSetShadowLightTarget alias "IrrXEffectsSetShadowLightTarget" ( _
	byval index as uinteger, byVal posX as single, byVal posY as single, byVal posZ as single )

' Get the target location of a shadow light. the index refers to the numerical
' order in which the lights were added.
declare sub IrrXEffectsGetShadowLightTarget alias "IrrXEffectsGetShadowLightTarget" ( _
	byval index as uinteger, byref posX as single, byref posY as single, byref posZ as single )

' Set the target location of a shadow light. the index refers to the numerical
' order in which the lights were added.
declare sub IrrXEffectsSetShadowLightColor alias "IrrXEffectsSetShadowLightColor" ( _
	byval index as uinteger, byval R as single, byval G as single, byval B as single, _
    byval Alpha as single )

' Get the target location of a shadow light. the index refers to the numerical
' order in which the lights were added.
declare sub IrrXEffectsGetShadowLightColor alias "IrrXEffectsGetShadowLightColor" ( _
	byval index as uinteger, byref R as single, byref G as single, byref B as single, _
    byref Alpha as single )
#ce
; end of definitions: Bitplanes XEffect Extension
; ////////////////////////////////////////////////////////////////////////////


Func xxx__CreateParticleEmitter($f_MinBoxX, $f_MinBoxY, $f_MinBoxZ, $f_MaxBoxX, $f_MaxBoxY, $f_MaxBoxZ, $f_DirectionX, $f_DirectionY, $f_DirectionZ, $i_MinParticlesPerSecond, $i_MaxParticlesPerSecond, $i_MinStartRed, $i_MinStartGreen, $i_MinStartBlue, $i_MaxStartRed, $i_MaxStartGreen, $i_MaxStartBlue, $i_MinLifetime, $i_MaxLifetime, $f_MinStartSizeX, $f_MinStartSizeY, $f_MaxStartSizeX, $f_MaxStartSizeY, $i_MaxAngle)
	local $EmitterStruct = DllStructCreate("float min_box_x;float min_box_y;float min_box_z;float max_box_x;float max_box_y;float max_box_z;float direction_x;float direction_y;float direction_z;" & _
											"UINT min_paritlcles_per_second;UINT max_paritlcles_per_second;int min_start_color_red;int min_start_color_green;int min_start_color_blue;" & _
											"int max_start_color_red;int max_start_color_green;int max_start_color_blue;UINT min_lifetime;UINT max_lifetime;float min_start_sizeX;float min_start_sizeY;" & _
											"float max_start_sizeX;float max_start_sizeY;int max_angle_degrees")
	DllStructSetData($EmitterStruct, 1, $f_MinBoxX)
	DllStructSetData($EmitterStruct, 2, $f_MinBoxY)
	DllStructSetData($EmitterStruct, 3, $f_MinBoxZ)
	DllStructSetData($EmitterStruct, 4, $f_MaxBoxX)
	DllStructSetData($EmitterStruct, 5, $f_MaxBoxY)
	DllStructSetData($EmitterStruct, 6, $f_MaxBoxZ)
	DllStructSetData($EmitterStruct, 7, $f_DirectionX)
	DllStructSetData($EmitterStruct, 8, $f_DirectionY)
	DllStructSetData($EmitterStruct, 9, $f_DirectionZ)
	DllStructSetData($EmitterStruct, 10, $i_MinParticlesPerSecond)
	DllStructSetData($EmitterStruct, 11, $i_MaxParticlesPerSecond)
	DllStructSetData($EmitterStruct, 12, $i_MinStartRed)
	DllStructSetData($EmitterStruct, 13, $i_MinStartGreen)
	DllStructSetData($EmitterStruct, 14, $i_MinStartBlue)
	DllStructSetData($EmitterStruct, 15, $i_MaxStartRed)
	DllStructSetData($EmitterStruct, 16, $i_MaxStartGreen)
	DllStructSetData($EmitterStruct, 17, $i_MaxStartBlue)
	DllStructSetData($EmitterStruct, 18, $i_MinLifetime)
	DllStructSetData($EmitterStruct, 19, $i_MaxLifetime)
	DllStructSetData($EmitterStruct, 20, $f_MinStartSizeX)
	DllStructSetData($EmitterStruct, 21, $f_MinStartSizeY)
	DllStructSetData($EmitterStruct, 22, $f_MaxStartSizeX)
	DllStructSetData($EmitterStruct, 23, $f_MaxStartSizeY)
	DllStructSetData($EmitterStruct, 24, $i_MaxAngle)
	Return $EmitterStruct
EndFunc   ;==>___CreateParticleEmitter

Func __CreateVertex($f_X, $f_Y, $f_Z, $f_NormalX, $f_NormalY, $f_NormalZ, $i_ARGB, $f_TextureX, $f_TextureY)
	Local $VertexStruct = DllStructCreate("float;float;float;float;float;float;int;float;float")
	DllStructSetData($VertexStruct, 1, $f_X)
	DllStructSetData($VertexStruct, 2, $f_Y)
	DllStructSetData($VertexStruct, 3, $f_Z)
	DllStructSetData($VertexStruct, 4, $f_NormalX)
	DllStructSetData($VertexStruct, 5, $f_NormalY)
	DllStructSetData($VertexStruct, 6, $f_NormalZ)
	DllStructSetData($VertexStruct, 7, $i_ARGB)
	DllStructSetData($VertexStruct, 8, $f_TextureX)
	DllStructSetData($VertexStruct, 9, $f_TextureY)
	Return $VertexStruct
EndFunc   ;==>___CreateVertex

Func __CreateVector($f_X, $f_Y, $f_Z)
	Local $VectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($VectorStruct, 1, $f_X)
	DllStructSetData($VectorStruct, 2, $f_Y)
	DllStructSetData($VectorStruct, 3, $f_Z)
	Return $VectorStruct
EndFunc   ;==>___CreateVector

Func __CreatePtrKeyMapArray(ByRef $keyStruct, $i_kForward = $KEY_KEY_W, $i_kBackward = $KEY_KEY_S, $i_kLeft = $KEY_KEY_A, $i_kRight = $KEY_KEY_D, $i_kJump = $KEY_SPACE)
; Helper function: returns pointer to a keymap for _IrrAddFPSCamera.
; Keymap itself is created into any (empty) var which can be set to '0' after call of _IrraddFPSCamera.
; Usage with defaults creates WASD keys:
; usage e.g. _IrrAddFPSCamera (..., __CreatePtrKeyMapArray($keyStruct), [numberOfKeysToPassFromMapArray - max. 5], ...)

	$keyStruct = DllStructCreate("int action1;int key1;int action2;int key2;int action3;int key3;int action4;int key4;int action5;int key5")
	dllstructsetdata($keyStruct, "action1", 0)
	dllstructsetdata($keyStruct, "key1", $i_kForward)
	dllstructsetdata($keyStruct, "action2", 1)
	dllstructsetdata($keyStruct, "key2", $i_kBackward)
	dllstructsetdata($keyStruct, "action3", 2)
	dllstructsetdata($keyStruct, "key3", $i_kLeft)
	dllstructsetdata($keyStruct, "action4", 3)
	dllstructsetdata($keyStruct, "key4", $i_kRight)
	dllstructsetdata($keyStruct, "action5", 4)
	dllstructsetdata($keyStruct, "key5", $i_kJump)
	return DllStructGetPtr($keyStruct)
EndFunc   ;==>__CreatePtrKeyMapArray


Global enum _ ; enumeration KEY_EVENT for possible Elements readable by __getKeyEvt
	$EVT_KEY_IKEY = 1,	_ 	; unsigned integer "key"
	$EVT_KEY_IDIRECTION, _ 	; unsigned integer "direction"
	$EVT_KEY_IFLAGS			; unsigned integer "flags"

func __getKeyEvt($p_KeyEvent, $i_Element = $EVT_KEY_IKEY)
; helper function:
; returns value of $i_Element inside a keyEvent-structure.
; $p_KeyEvent is a pointer as returned from _IrrReadKeyEvent.
	local $EventStruct = DllStructCreate("uint;uint;uint", $p_KeyEvent)
	$result = DllStructGetData($EventStruct, $i_Element)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result
	EndIf
EndFunc ;==> __getKeyEvt

Global enum _ ; enumeration MOUSE_EVENT for possible Elements readable by __getMouseEvt
	$EVT_MOUSE_IACTION = 1,	_ 	; unsigned integer "action"
	$EVT_MOUSE_FDELTA, _ 		; single "delta"
	$EVT_MOUSE_IX, _			; integer "x"
	$EVT_MOUSE_IY				; integer "y"

func __getMouseEvt($p_MouseEvent, $i_Element = $EVT_MOUSE_IACTION)
; helper function:
; returns value of $i_Element inside a MouseEvent-structure.
; $p_MouseEvent is a pointer as returned from _IrrReadMouseEvent.
	local $EventStruct = DllStructCreate("uint;float;int;int", $p_MouseEvent)
	$result = DllStructGetData($EventStruct, $i_Element)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result
	EndIf
EndFunc ;==> __getMouseEvt

Global enum _ ; enumeration GUI_EVENT for possible Elements readable by __getGuiEvt
	$EVT_GUI_IID = 1,	_ 	; integer "id"
	$EVT_GUI_IEVENT, _ 		; IRR_EGUI_EVENT_TYPE "event"
	$EVT_GUI_IX, _			; integer "x"
	$EVT_GUI_IY				; integer "y"

func __getGuiEvt($p_GUIEvent, $i_Element = $EVT_GUI_IID)
; helper function:
; returns value of $i_Element inside a GuiEvent-structure.
; $p_GUIEvent is a pointer as returned from _IrrReadGUIEvent
	local $EventStruct = DllStructCreate("int;int;int;int", $p_GUIEvent)
	$result = DllStructGetData($EventStruct, $i_Element)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result
	EndIf
EndFunc ;==> __getGuiEvt

; xxxx obsolete?!
Func __CreateIrrModel()
	Local $irrModel = DllStructCreate("UINT_PTR node;UINT_PTR camera;UINT_PTR terrain;UINT_PTR particles")
	DllStructSetData($irrModel, "node", 0)
	DllStructSetData($irrModel, "camera", 0)
	DllStructSetData($irrModel, "terrain", 0)
	DllStructSetData($irrModel, "particles", 0)
	return $irrModel
EndFunc ;==> __CreateIrrModel



Func __CreateParticleEmitter($f_MinBoxX, $f_MinBoxY, $f_MinBoxZ, $f_MaxBoxX, $f_MaxBoxY, $f_MaxBoxZ, $f_DirectionX, $f_DirectionY, $f_DirectionZ, $i_MinParticlesPerSecond, $i_MaxParticlesPerSecond, $i_MinStartRed, $i_MinStartGreen, $i_MinStartBlue, $i_MaxStartRed, $i_MaxStartGreen, $i_MaxStartBlue, $i_MinLifetime, $i_MaxLifetime, $f_MinStartSizeX, $f_MinStartSizeY, $f_MaxStartSizeX, $f_MaxStartSizeY, $i_MaxAngle)

local $struct = "float min_box_x;float min_box_y;float min_box_z;float max_box_x;float max_box_y;float max_box_z;" & _
							"float direction_x;float direction_y;float direction_z;uint min_paritlcles_per_second;uint max_paritlcles_per_second;" & _
							"int min_start_color_red;int min_start_color_green;int min_start_color_blue;" & _
							"int max_start_color_red;int max_start_color_green;int max_start_color_blue;" & _
							"uint min_lifetime;uint max_lifetime;" & _
							"float min_start_sizeX;float min_start_sizeY;float max_start_sizeX;float max_start_sizeY;int max_angle_degrees"
local $EmitterStruct = DllStructCreate($struct)
	DllStructSetData($EmitterStruct, "min_box_x", $f_MinBoxX)
	DllStructSetData($EmitterStruct, "min_box_y", $f_MinBoxY)
	DllStructSetData($EmitterStruct, "min_box_z", $f_MinBoxZ)
	DllStructSetData($EmitterStruct, "max_box_x", $f_MaxBoxX)
	DllStructSetData($EmitterStruct, "max_box_y", $f_MaxBoxY)
	DllStructSetData($EmitterStruct, "max_box_z", $f_MaxBoxZ)
	DllStructSetData($EmitterStruct, "direction_x", $f_DirectionX)
	DllStructSetData($EmitterStruct, "direction_y", $f_DirectionY)
	DllStructSetData($EmitterStruct, "direction_z", $f_DirectionZ)
	DllStructSetData($EmitterStruct, "min_paritlcles_per_second", $i_MinParticlesPerSecond)
	DllStructSetData($EmitterStruct, "max_paritlcles_per_second", $i_MaxParticlesPerSecond)
	DllStructSetData($EmitterStruct, "min_start_color_red", $i_MinStartRed)
	DllStructSetData($EmitterStruct, "min_start_color_green", $i_MinStartGreen)
	DllStructSetData($EmitterStruct, "min_start_color_blue", $i_MinStartBlue)
	DllStructSetData($EmitterStruct, "max_start_color_red", $i_MaxStartRed)
	DllStructSetData($EmitterStruct, "max_start_color_green", $i_MaxStartGreen)
	DllStructSetData($EmitterStruct, "max_start_color_blue", $i_MaxStartBlue)
	DllStructSetData($EmitterStruct, "min_lifetime", $i_MinLifetime)
	DllStructSetData($EmitterStruct, "max_lifetime", $i_MaxLifetime)
	DllStructSetData($EmitterStruct, "max_angle_degrees", $i_MaxAngle)
	DllStructSetData($EmitterStruct, "min_start_sizeX", $f_MinStartSizeX)
	DllStructSetData($EmitterStruct, "min_start_sizeY", $f_MinStartSizeY)
	DllStructSetData($EmitterStruct, "max_start_sizeX", $f_MaxStartSizeX)
	DllStructSetData($EmitterStruct, "max_start_sizeY", $f_MaxStartSizeY)

	Return $EmitterStruct
EndFunc   ;==>___CreateParticleEmitter



Func _IrrAddParticleEmitter($h_ParticleSystem, $h_SettingsStruct)
; create an emitter that can be added to a particle system

	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddParticleEmitter", "UINT_PTR", $h_ParticleSystem, "UINT_PTR", $h_SettingsStruct)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticleEmitter
