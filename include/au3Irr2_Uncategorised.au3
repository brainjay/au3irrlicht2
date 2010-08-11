#include-once

#include "au3Irr2_constants.au3"

; #INDEX# =======================================================================================================================
; Title .........: [todo]
; AutoIt Version : [todo]
; Language ......: English
; Description ...: [todo]
;                  [todo]
;                  [todo]
; Author(s) .....: [todo]
; Dll(s) ........: [todo]
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Not working/documented/implemented at this time
;_IrrTransparentZWrite
;_IrrGetFPS
;_IrrGetPrimitivesDrawn
;_IrrSetWindowCaption
;_IrrIsFullscreen
;_IrrIsWindowActive
;_IrrIsWindowFocused
;_IrrIsWindowMinimized
;_IrrGetScreenSize
;_IrrMaximizeWindow
;_IrrMinimizeWindow
;_IrrRestoreWindow
;_IrrSetResizableWindow
;_IrrMakeARGB
;_IrrQueryFeature
;_IrrDisableFeature
;_IrrGetTime
;_IrrSetTime
;_IrrKeyEventAvailable
;_IrrReadKeyEvent
;_IrrMouseEventAvailable
;_IrrReadMouseEvent
;_IrrSetMousePosition
;_IrrHideMouse
;_IrrShowMouse
;_IrrDisplayMouse
;_IrrAddZipFile
;_IrrChangeWorkingDirectory
;_IrrGetWorkingDirectory
;_IrrSetTextureCreationFlag
;_IrrGetTexture
;_IrrGetImage
;_IrrCreateTexture
;_IrrCreateImage
;_IrrRemoveTexture
;_IrrRemoveImage
;_IrrLockTexture
;_IrrLockOpenGLTexture
;_IrrUnlockTexture
;_IrrLockImage
;_IrrUnlockImage
;_IrrCreateRenderTargetTexture
;_IrrMakeNormalMapTexture
;_IrrColorKeyTexture
;_IrrDraw2DImage
;_IrrDraw2DImageElement
;_IrrGetFont
;_Irr2DFontDraw
;_IrrSaveScreenShot
;_IrrGetScreenShot
;_IrrMaterialVertexColorAffects
;_IrrSetMaterialBlend
;_IrrMaterialSetShininess
;_IrrMaterialSetSpecularColor
;_IrrMaterialSetDiffuseColor
;_IrrMaterialSetAmbientColor
;_IrrMaterialSetEmissiveColor
;_IrrMaterialSetMaterialTypeParam
;_IrrSetMaterialLineThickness
;_IrrAddHighLevelShaderMaterial
;_IrrAddHighLevelShaderMaterialFromFiles
;_IrrAddShaderMaterial
;_IrrAddShaderMaterialFromFiles
;_IrrCreateNamedVertexShaderConstant
;_IrrCreateNamedPixelShaderConstant
;_IrrCreateAddressedVertexShaderConstant
;_IrrCreateAddressedPixelShaderConstant
;_IrrGetRootSceneNode
;_IrrGetMesh
;_IrrCreateMesh
;_IrrAddHillPlaneMesh
;_IrrWriteMesh
;_IrrRemoveMesh
;_IrrClearUnusedMeshes
;_IrrSetMeshHardwareAccelerated
;_IrrGetMeshFrameCount
;_IrrGetMeshBufferCount
;_IrrGetMeshIndexCount
;_IrrGetMeshVertexCount
;_IrrAddMeshToScene
;_IrrAddMeshToSceneAsOcttree
;_IrrAddStaticMeshForNormalMappingToScene
;_IrrLoadScene
;_IrrSaveScene
;_IrrGetSceneNodeFromId
;_IrrGetSceneNodeFromName
;_IrrAddBillBoardToScene
;_IrrAddBillboardTextSceneNode
;_IrrAddParticleSystemToScene
;_IrrAddSkyBoxToScene
;_IrrAddSkyDomeToScene
;_IrrAddEmptySceneNode
;_IrrAddTestSceneNode
;_IrrAddCubeSceneNode
;_IrrAddSphereSceneNode
;_IrrAddWaterSurfaceSceneNode
;_IrrAddZoneManager
;_IrrAddClouds
;_IrrAddLensFlare
;_IrrAddGrass
;_IrrSetShadowColor
;_IrrSetFog
;_IrrDraw3DLine
;_IrrSetSkyDomeColor
;_IrrSetSkyDomeColorBand
;_IrrSetSkyDomeColorPoint
;_IrrSetZoneManagerProperties
;_IrrSetZoneManagerBoundingBox
;_IrrSetZoneManagerAttachTerrain
;_IrrSetGrassDensity
;_IrrSetGrassWind
;_IrrGetGrassDrawCount
;_IrrSetFlareScale
;_IrrGetNodeName
;_IrrSetNodeName
;_IrrGetMaterialCount
;_IrrGetMaterial
;_IrrSetNodeMaterialTexture
;_IrrSetNodeMaterialFlag
;_IrrSetNodeMaterialType
;_IrrSetNodePosition
;_IrrSetNodeRotation
;_IrrSetNodeScale
;_IrrDebugDataVisible
;_IrrGetNodePosition
;_IrrGetNodeAbsolutePosition
;_IrrGetNodeRotation
;_IrrGetJointNode
;_IrrSetJointMode
;_IrrAddChildToParent
;_IrrGetNodeFirstChild
;_IrrGetNodeNextChild
;_IrrIsNodeLastChild
;_IrrAddNodeShadow
;_IrrSetNodeVisibility
;_IrrRemoveNode
;_IrrRemoveAllNodes
;_IrrSetNodeParent
;_IrrGetNodeID
;_IrrSetNodeID
;_IrrGetNodeBoundingBox
;_IrrSetNodeAmbientColor
;_IrrSetNodeDiffuseColor
;_IrrSetNodeSpecularColor
;_IrrSetNodeEmissiveColor
;_IrrSetNodeColorByVertex
;_IrrSetNodeAnimationRange
;_IrrPlayNodeMD2Animation
;_IrrSetNodeAnimationSpeed
;_IrrGetNodeAnimationFrame
;_IrrSetNodeAnimationFrame
;_IrrSetTransitionTime
;_IrrAnimateJoints
;_IrrAddCollisionAnimator
;_IrrAddDeleteAnimator
;_IrrAddFlyCircleAnimator
;_IrrAddFlyStraightAnimator
;_IrrAddRotationAnimator
;_IrrAddSplineAnimator
;_IrrAddFadeAnimator
;_IrrRemoveAnimator
;_IrrGetCollisionGroupFromMesh
;_IrrGetCollisionGroupFromComplexMesh
;_IrrGetCollisionGroupFromBox
;_IrrGetCollisionGroupFromTerrain
;_IrrRemoveCollisionGroup
;_IrrCreateCombinedCollisionGroup
;_IrrAddCollisionGroupToCombination
;_IrrRemoveAllCollisionGroupsFromCombination
;_IrrRemoveCollisionGroupFromCombination
;_IrrGetCollisionPoint
;_IrrGetRayFromScreenCoordinates
;_IrrGetCollisionNodeFromCamera
;_IrrGetCollisionNodeFromRay
;_IrrGetCollisionNodeFromScreenCoordinates
;_IrrGetScreenCoordinatesFrom3DPosition
;_IrrGet3DPositionFromScreenCoordinates
;_IrrGet2DPositionFromScreenCoordinates
;_IrrGetChildCollisionNodeFromRay
;_IrrGetChildCollisionNodeFromPoint
;_IrrGetNodeAndCollisionPointFromRay
;_IrrGetDistanceBetweenNodes
;_IrrAreNodesIntersecting
;_IrrIsPointInsideNode
;_IrrGetCollisionResultPosition
;_IrrAddLight
;_IrrSetAmbientLight
;_IrrSetLightAmbientColor
;_IrrSetLightAttenuation
;_IrrSetLightCastShadows
;_IrrSetLightDiffuseColor
;_IrrSetLightFalloff
;_IrrSetLightInnerCone
;_IrrSetLightOuterCone
;_IrrSetLightRadius
;_IrrSetLightSpecularColor
;_IrrSetLightType
;_IrrAddTerrain
;_IrrAddTerrainTile
;_IrrAddSphericalTerrain
;_IrrGetTerrainHeight
;_IrrScaleTexture
;_IrrGetTerrainTileHeight
;_IrrScaleTileTexture
;_IrrAttachTile
;_IrrSetTileStructure
;_IrrSetTileColor
;_IrrScaleSphericalTexture
;_IrrSetSphericalTerrainTexture
;_IrrLoadSphericalTerrainVertexColor
;_IrrGetSphericalTerrainSurfacePosition
;_IrrGetSphericalTerrainSurfacePositionAndAngle
;_IrrGetSphericalTerrainLogicalSurfacePosition
;_IrrSetMinParticleSize
;_IrrSetMaxParticleSize
;_IrrAddAnimatedMeshSceneNodeEmitter
;_IrrAddRotationAffector
;_IrrAddFadeOutParticleAffector
;_IrrAddGravityParticleAffector
;_IrrAddParticleAttractionAffector
;_IrrCreateRotationAffector
;_IrrAddStopParticleAffector
;_IrrAddParticlePushAffector
;_IrrAddColorMorphAffector
;_IrrAddSplineAffector
;_IrrRemoveAffectors
;_IrrSetParticleEmitterDirection
;_IrrSetParticleEmitterMinParticlesPerSecond
;_IrrSetParticleEmitterMaxParticlesPerSecond
;_IrrSetParticleEmitterMinStartColor
;_IrrSetParticleEmitterMaxStartColor
;_IrrSetParticleAffectorEnable
;_IrrSetFadeOutParticleAffectorTime
;_IrrSetFadeOutParticleAffectorTargetColor
;_IrrSetGravityParticleAffectorDirection
;_IrrSetGravityParticleAffectorTimeForceLost
;_IrrSetParticleAttractionAffectorAffectX
;_IrrSetParticleAttractionAffectorAffectY
;_IrrSetParticleAttractionAffectorAffectZ
;_IrrSetParticleAttractionAffectorAttract
;_IrrSetParticleAttractionAffectorPoint
;_IrrSetRotationAffectorPivotPoint
;_IrrSetFurthestDistanceOfEffect
;_IrrSetNearestDistanceOfEffect
;_IrrSetColumnDistanceOfEffect
;_IrrSetCenterOfEffect
;_IrrSetStrengthOfEffect
;_IrrGUIClear
;_IrrGUIEvents
;_IrrGUIEventAvailable
;_IrrReadGUIEvent
;_IrrGUIRemove
;_IrrGUIGetText
;_IrrGUISetText
;_IrrGUISetFont
;_IrrGUISetColor
;_IrrAddWindow
;_IrrAddStaticText
;_IrrAddButton
;_IrrAddScrollBar
;_IrrAddListBox
;_IrrAddListBoxItem
;_IrrInsertListBoxItem
;_IrrRemoveListBoxItem
;_IrrSelectListBoxItem
;_IrrAddEditBox
;_IrrAddCheckBox
;_IrrCheckCheckBox
;_IrrAddImage
;_IrrAddFileOpen
;_IrrGetLastSelectedFile
;_IrrCreateBatchingMesh
;_IrrAddToBatchingMesh
;_IrrFinalizeBatchingMesh
;_IrrSetMeshMaterialTexture
;_IrrScaleMesh
;_IrrAddBeamSceneNode
;_IrrSetBeamSize
;_IrrSetBeamPosition
;_IrrAddBoltSceneNode
;_IrrSetBoltProperties
;_IrrSetBillBoardSize
;_IrrSetBillBoardColor
;_IrrXEffectsStart
;_IrrXEffectsAddShadowToNode
;_IrrXEffectsAddShadowLight
;_IrrXEffectsSetAmbientColor
;_IrrXEffectsSetClearColor
;_IrrXEffectsSetShadowLightPosition
;_IrrXEffectsEnableDepthPass
;_IrrXEffectsAddPostProcessingFromFile
;_IrrXEffectsAddNodeToDepthPass
;_IrrXEffectsSetPostProcessingUserTexture
;xxx__CreateParticleEmitter
;__CreateVertex
;__CreateVector
;__getKeyEvt
;__getMouseEvt
;__getGuiEvt
;__CreateIrrModel
;__CreateParticleEmitter
;_IrrAddParticleEmitter
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrTransparentZWrite
; Description ...: [todo]
; Syntax.........: _IrrTransparentZWrite()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrTransparentZWrite()
	DllCall($_irrDll, "none:cdecl", "IrrTransparentZWrite")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrTransparentZWrite


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetFPS
; Description ...: [todo]
; Syntax.........: _IrrGetFPS()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetFPS()
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetFPS")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetFPS


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetPrimitivesDrawn
; Description ...: [todo]
; Syntax.........: _IrrGetPrimitivesDrawn()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetPrimitivesDrawn()
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetPrimitivesDrawn")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetPrimitivesDrawn


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetWindowCaption
; Description ...: [todo]
; Syntax.........: _IrrSetWindowCaption($s_Caption)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetWindowCaption($s_Caption)
	DllCall($_irrDll, "none:cdecl", "IrrSetWindowCaption", "wstr", $s_Caption)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetWindowCaption



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrIsFullscreen
; Description ...: [todo]
; Syntax.........: _IrrIsFullscreen()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrIsFullscreen()
; Checks if the Irrlicht window is running in fullscreen mode.
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsFullscreen")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsFullscreen


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrIsWindowActive
; Description ...: [todo]
; Syntax.........: _IrrIsWindowActive()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrIsWindowActive()
; Returns if the window is active.
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsWindowActive")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsWindowActive


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrIsWindowFocused
; Description ...: [todo]
; Syntax.........: _IrrIsWindowFocused()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrIsWindowFocused()
; Checks if the Irrlicht window has focus.
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsWindowFocused")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsWindowFocused


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrIsWindowMinimized
; Description ...: [todo]
; Syntax.........: _IrrIsWindowMinimized()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrIsWindowMinimized()
; Checks if the Irrlicht window is minimized.
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsWindowMinimized")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsWindowMinimized


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetScreenSize
; Description ...: [todo]
; Syntax.........: _IrrGetScreenSize(ByRef $i_Width, ByRef $i_Height)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMaximizeWindow
; Description ...: [todo]
; Syntax.........: _IrrMaximizeWindow()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMaximizeWindow()
; Maximizes the window if possible.
	$result = DllCall($_irrDll, "none:cdecl", "IrrMaximizeWindow")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrMaximizeWindow


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMinimizeWindow
; Description ...: [todo]
; Syntax.........: _IrrMinimizeWindow()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMinimizeWindow()
; Minimizes the window if possible.
	$result = DllCall($_irrDll, "none:cdecl", "IrrMinimizeWindow")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrMinimizeWindow


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRestoreWindow
; Description ...: [todo]
; Syntax.........: _IrrRestoreWindow()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRestoreWindow()
; Restore the window to normal size if possible.
	$result = DllCall($_irrDll, "none:cdecl", "IrrRestoreWindow")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrRestoreWindow


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetResizableWindow
; Description ...: [todo]
; Syntax.........: _IrrSetResizableWindow($i_Resizable)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetResizableWindow($i_Resizable)
; Make the window resizable.
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetResizableWindow")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrSetResizableWindow



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMakeARGB
; Description ...: [todo]
; Syntax.........: _IrrMakeARGB($i_Alpha, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMakeARGB($i_Alpha, $i_Red, $i_Green, $i_Blue)
; make 32 bit representation of an Alpha, Red, Green, Blue color
	return int( ( "0x" & Hex($i_Alpha, 2) & Hex($i_Red, 2) & Hex($i_Green, 2) & Hex($i_Blue, 2) ) )
EndFunc   ;==>_IrrMakeARGB


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrQueryFeature
; Description ...: [todo]
; Syntax.........: _IrrQueryFeature($i_Feature)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrQueryFeature($i_Feature)
	$result = DllCall($_irrDll, "int:cdecl", "IrrQueryFeature", "int", $i_Feature)
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrQueryFeature


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDisableFeature
; Description ...: [todo]
; Syntax.........: _IrrDisableFeature($i_Feature, $i_Flag)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrDisableFeature($i_Feature, $i_Flag)
	DllCall($_irrDll, "int:cdecl", "IrrDisableFeature", "int", $i_Feature, "int", $i_Flag)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDisableFeature


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetTime
; Description ...: [todo]
; Syntax.........: _IrrGetTime()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetTime()
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetTime")
	Return $result[0]
EndFunc   ;==>_IrrGetTime


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetTime
; Description ...: [todo]
; Syntax.........: _IrrSetTime($i_Time)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetTime($i_Time)
	DllCall($_irrDll, "none:cdecl", "IrrSetTime", "int", $i_Time)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTime

;Mouse and Keyboard event functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrKeyEventAvailable
; Description ...: [todo]
; Syntax.........: _IrrKeyEventAvailable()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrKeyEventAvailable()
	$result = DllCall($_irrDll, "int:cdecl", "IrrKeyEventAvailable")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrKeyEventAvailable


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrReadKeyEvent
; Description ...: [todo]
; Syntax.........: _IrrReadKeyEvent()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrReadKeyEvent()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrReadKeyEvent")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrReadKeyEvent


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMouseEventAvailable
; Description ...: [todo]
; Syntax.........: _IrrMouseEventAvailable()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMouseEventAvailable()
	$result = DllCall($_irrDll, "int:cdecl", "IrrMouseEventAvailable")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrMouseEventAvailable


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrReadMouseEvent
; Description ...: [todo]
; Syntax.........: _IrrReadMouseEvent()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrReadMouseEvent()
	$result = DllCall($_irrDll, "int:cdecl", "IrrReadMouseEvent")
		if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrReadMouseEvent


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMousePosition
; Description ...: [todo]
; Syntax.........: _IrrSetMousePosition(ByRef $f_XPos, ByRef $f_YPos)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrHideMouse
; Description ...: [todo]
; Syntax.........: _IrrHideMouse()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrHideMouse()
	return _IrrDisplayMouse(False)
EndFunc   ;==>_IrrHideMouse


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrShowMouse
; Description ...: [todo]
; Syntax.........: _IrrShowMouse()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrShowMouse()
	return _IrrDisplayMouse(True)
EndFunc   ;==>_IrrShowMouse


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDisplayMouse
; Description ...: [todo]
; Syntax.........: _IrrDisplayMouse($i_HideShow)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrDisplayMouse($i_HideShow)
	DllCall($_irrDll, "none:cdecl", "IrrDisplayMouse", "int", $i_HideShow)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDisplayMouse

;File system functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddZipFile
; Description ...: [todo]
; Syntax.........: _IrrAddZipFile($s_Zipfile, $i_IgnoreCase, $i_IgnorePaths)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddZipFile($s_Zipfile, $i_IgnoreCase, $i_IgnorePaths)
	DllCall($_irrDll, "none:cdecl", "IrrAddZipFile", "str", $s_Zipfile, "int", $i_IgnoreCase, "int", $i_IgnorePaths)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddZipFile


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrChangeWorkingDirectory
; Description ...: [todo]
; Syntax.........: _IrrChangeWorkingDirectory($s_WorkingDir)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrChangeWorkingDirectory($s_WorkingDir)
	DllCall($_irrDll, "none:cdecl", "IrrChangeWorkingDirectory", "str", $s_WorkingDir)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return true
	EndIf
EndFunc   ;==>_IrrChangeWorkingDirectory


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetWorkingDirectory
; Description ...: [todo]
; Syntax.........: _IrrGetWorkingDirectory()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetWorkingDirectory()
	$result = DllCall($_irrDll, "str:cdecl", "IrrGetWorkingDirectory")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetWorkingDirectory

;2D functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetTextureCreationFlag
; Description ...: [todo]
; Syntax.........: _IrrSetTextureCreationFlag($i_Flag, $i_Value)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetTextureCreationFlag($i_Flag, $i_Value)
	DllCall($_irrDll, "none:cdecl", "IrrSetTextureCreationFlag", "int", $i_Flag, "int", $i_Value)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTextureCreationFlag


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetTexture
; Description ...: [todo]
; Syntax.........: _IrrGetTexture($s_TextureFile)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetTexture($s_TextureFile)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetTexture", "str", $s_TextureFile)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetImage
; Description ...: [todo]
; Syntax.........: _IrrGetImage($s_ImageFile)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetImage($s_ImageFile)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetImage", "str", $s_ImageFile)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateTexture
; Description ...: [todo]
; Syntax.........: _IrrCreateTexture($s_TextureName, $i_XSize, $i_YSize, $i_ColorFormat)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateTexture($s_TextureName, $i_XSize, $i_YSize, $i_ColorFormat)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateTexture", "str", $s_TextureName, "int", $i_XSize, "int", $i_YSize, "int", $i_ColorFormat)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateImage
; Description ...: [todo]
; Syntax.........: _IrrCreateImage($i_XSize, $i_YSize, $i_ColorFormat)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateImage($i_XSize, $i_YSize, $i_ColorFormat)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateImage", "int", $i_XSize, "int", $i_YSize, "int", $i_ColorFormat)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveTexture
; Description ...: [todo]
; Syntax.........: _IrrRemoveTexture($h_Texture)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveTexture($h_Texture)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveImage
; Description ...: [todo]
; Syntax.........: _IrrRemoveImage($h_Image)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveImage($h_Image)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveImage", "ptr", $h_Image)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrLockTexture
; Description ...: [todo]
; Syntax.........: _IrrLockTexture($h_Texture)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrLockTexture($h_Texture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrLockTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrLockTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrLockOpenGLTexture
; Description ...: [todo]
; Syntax.........: _IrrLockOpenGLTexture($h_Texture)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrLockOpenGLTexture($h_Texture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrLockOpenGLTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrLockOpenGLTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrUnlockTexture
; Description ...: [todo]
; Syntax.........: _IrrUnlockTexture($h_Texture)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrUnlockTexture($h_Texture)
	DllCall($_irrDll, "none:cdecl", "IrrUnlockTexture", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrUnlockTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrLockImage
; Description ...: [todo]
; Syntax.........: _IrrLockImage($h_Image)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrLockImage($h_Image)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrLockImage", "ptr", $h_Image)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrLockImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrUnlockImage
; Description ...: [todo]
; Syntax.........: _IrrUnlockImage($h_Image)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrUnlockImage($h_Image)
	DllCall($_irrDll, "none:cdecl", "IrrUnlockImage", "ptr", $h_Image)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrUnlockImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateRenderTargetTexture
; Description ...: [todo]
; Syntax.........: _IrrCreateRenderTargetTexture($i_XSize, $i_YSize)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateRenderTargetTexture($i_XSize, $i_YSize)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateRenderTargetTexture", "uint", $i_XSize, "uint", $i_YSize)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateRenderTargetTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMakeNormalMapTexture
; Description ...: [todo]
; Syntax.........: _IrrMakeNormalMapTexture($h_Texture, $f_Amplitude)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMakeNormalMapTexture($h_Texture, $f_Amplitude)
	DllCall($_irrDll, "none:cdecl", "IrrMakeNormalMapTexture", "ptr", $h_Texture, "float", $f_Amplitude)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMakeNormalMapTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrColorKeyTexture
; Description ...: [todo]
; Syntax.........: _IrrColorKeyTexture($h_Texture, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrColorKeyTexture($h_Texture, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrColorKeyTexture", "ptr", $h_Texture, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrColorKeyTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDraw2DImage
; Description ...: [todo]
; Syntax.........: _IrrDraw2DImage($h_Image, $i_XPos, $i_YPos)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrDraw2DImage($h_Image, $i_XPos, $i_YPos)
	DllCall($_irrDll, "none:cdecl", "IrrDraw2DImage", "ptr", $h_Image, "int", $i_XPos, "int", $i_YPos)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw2DImage


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDraw2DImageElement
; Description ...: [todo]
; Syntax.........: _IrrDraw2DImageElement($h_Texture, $i_XPos, $i_YPos, $i_SourceTopX, $i_SourceTopY, $i_SourceBottomX, $i_SourceBottomY, $i_UseAlpha)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrDraw2DImageElement($h_Texture, $i_XPos, $i_YPos, $i_SourceTopX, $i_SourceTopY, $i_SourceBottomX, $i_SourceBottomY, $i_UseAlpha)
	DllCall($_irrDll, "none:cdecl", "IrrDraw2DImageElement", "ptr", $h_Texture, "int", $i_XPos, "int", $i_YPos, "int", $i_SourceTopX, "int", $i_SourceTopY, "int", $i_SourceBottomX, "int", $i_SourceBottomY, "int", $i_UseAlpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw2DImageElement


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetFont
; Description ...: [todo]
; Syntax.........: _IrrGetFont($s_Font)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetFont($s_Font)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetFont", "str", $s_Font)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetFont


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _Irr2DFontDraw
; Description ...: [todo]
; Syntax.........: _Irr2DFontDraw($h_Font, $s_Text, $i_XPos, $i_YPos, $i_BottomX, $i_BottomY)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _Irr2DFontDraw($h_Font, $s_Text, $i_XPos, $i_YPos, $i_BottomX, $i_BottomY)
	DllCall($_irrDll, "none:cdecl", "Irr2DFontDraw", "ptr", $h_Font, "wstr", $s_Text, "int", $i_XPos, "int", $i_YPos, "int", $i_BottomX, "int", $i_BottomY)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_Irr2DFontDraw


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSaveScreenShot
; Description ...: [todo]
; Syntax.........: _IrrSaveScreenShot($s_Filename)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSaveScreenShot($s_Filename)
	DllCall($_irrDll, "none:cdecl", "IrrSaveScreenShot", "str", $s_Filename)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSaveScreenShot


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetScreenShot
; Description ...: [todo]
; Syntax.........: _IrrGetScreenShot($i_XPos, $i_YPos, $i_Width, $i_Height)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetScreenShot($i_XPos, $i_YPos, $i_Width, $i_Height)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetScreenShot", "int", $i_XPos, "int", $i_YPos, "int", $i_Width, "int", $i_Height)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetScreenShot

;Materials functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMaterialVertexColorAffects
; Description ...: [todo]
; Syntax.........: _IrrMaterialVertexColorAffects($h_Material, $i_AffectedProperty)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMaterialVertexColorAffects($h_Material, $i_AffectedProperty)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialVertexColorAffects", "ptr", $h_Material, "int", $i_AffectedProperty)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialVertexColorAffects


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMaterialBlend
; Description ...: [todo]
; Syntax.........: _IrrSetMaterialBlend($h_Material, $i_SrcBlend, $i_DstBlend)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetMaterialBlend($h_Material, $i_SrcBlend, $i_DstBlend)
	DllCall($_irrDll, "none:cdecl", "IrrSetMaterialBlend", "ptr", $h_Material, "int", $i_SrcBlend, "int", $i_DstBlend)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMaterialBlend


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMaterialSetShininess
; Description ...: [todo]
; Syntax.........: _IrrMaterialSetShininess($h_Material, $f_Shininess)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMaterialSetShininess($h_Material, $f_Shininess)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetShininess", "ptr", $h_Material, "float", $f_Shininess)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetShininess


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMaterialSetSpecularColor
; Description ...: [todo]
; Syntax.........: _IrrMaterialSetSpecularColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMaterialSetSpecularColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetSpecularColor", "ptr", $h_Material, "uint", $i_Alpha, "uint", $i_Red, "uint", $i_Green, "uint", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetSpecularColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMaterialSetDiffuseColor
; Description ...: [todo]
; Syntax.........: _IrrMaterialSetDiffuseColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMaterialSetDiffuseColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetDiffuseColor", "ptr", $h_Material, "uint", $i_Alpha, "uint", $i_Red, "uint", $i_Green, "uint", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetDiffuseColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMaterialSetAmbientColor
; Description ...: [todo]
; Syntax.........: _IrrMaterialSetAmbientColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMaterialSetAmbientColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetAmbientColor", "ptr", $h_Material, "uint", $i_Alpha, "uint", $i_Red, "uint", $i_Green, "uint", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetAmbientColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMaterialSetEmissiveColor
; Description ...: [todo]
; Syntax.........: _IrrMaterialSetEmissiveColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMaterialSetEmissiveColor($h_Material, $i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetEmissiveColor", "ptr", $h_Material, "uint", $i_Alpha, "uint", $i_Red, "uint", $i_Green, "uint", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetEmissiveColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrMaterialSetMaterialTypeParam
; Description ...: [todo]
; Syntax.........: _IrrMaterialSetMaterialTypeParam($h_Material, $f_Param)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrMaterialSetMaterialTypeParam($h_Material, $f_Param)
	DllCall($_irrDll, "none:cdecl", "IrrMaterialSetMaterialTypeParam", "ptr", $h_Material, "float", $f_Param)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrMaterialSetMaterialTypeParam


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMaterialLineThickness
; Description ...: [todo]
; Syntax.........: _IrrSetMaterialLineThickness($h_Material, $f_Thickness)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetMaterialLineThickness($h_Material, $f_Thickness)
	DllCall($_irrDll, "none:cdecl", "IrrSetMaterialLineThickness", "ptr", $h_Material, "float", $f_Thickness)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMaterialLineThickness


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddHighLevelShaderMaterial
; Description ...: [todo]
; Syntax.........: _IrrAddHighLevelShaderMaterial($h_VertexProgram, $s_StartFunction, $i_ProgType, $s_pixelProg, $s_PixelStartFunction, $i_PixelProgTpe, $i_MaterialType)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddHighLevelShaderMaterial($h_VertexProgram, $s_StartFunction, $i_ProgType, $s_pixelProg, $s_PixelStartFunction, $i_PixelProgTpe, $i_MaterialType);IrrAddHighLevelShaderMaterial
	$result = DllCall($_irrDll, "int:cdecl", "IrrAddHighLevelShaderMaterial", "ptr", $h_VertexProgram, "str", $s_StartFunction, "int", $i_ProgType, "str", $s_pixelProg, "str", $s_PixelStartFunction, "int", $i_PixelProgTpe, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
	;potentially screwed up
EndFunc   ;==>_IrrAddHighLevelShaderMaterial


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddHighLevelShaderMaterialFromFiles
; Description ...: [todo]
; Syntax.........: _IrrAddHighLevelShaderMaterialFromFiles($s_VertexProgram, $s_StartFunction, $i_ProgType, $s_pixelProg, $s_PixelStartFunction, $i_PixelProgTpe, $i_MaterialType)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddHighLevelShaderMaterialFromFiles($s_VertexProgram, $s_StartFunction, $i_ProgType, $s_pixelProg, $s_PixelStartFunction, $i_PixelProgTpe, $i_MaterialType);IrrAddHighLevelShaderMaterial
	$result = DllCall($_irrDll, "int:cdecl", "IrrAddHighLevelShaderMaterialFromFiles", "str", $s_VertexProgram, "str", $s_StartFunction, "int", $i_ProgType, "str", $s_pixelProg, "str", $s_PixelStartFunction, "int", $i_PixelProgTpe, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
	;potentially screwed up
EndFunc   ;==>_IrrAddHighLevelShaderMaterialFromFiles


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddShaderMaterial
; Description ...: [todo]
; Syntax.........: _IrrAddShaderMaterial($h_VertexProgram, $h_PixelProgram, $i_MaterialType)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddShaderMaterial($h_VertexProgram, $h_PixelProgram, $i_MaterialType)
	$result = DllCall($_irrDll, "int:cdecl", "IrrAddShaderMaterial", "ptr", $h_VertexProgram, "ptr", $h_PixelProgram, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddShaderMaterial


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddShaderMaterialFromFiles
; Description ...: [todo]
; Syntax.........: _IrrAddShaderMaterialFromFiles($s_VertexProgram, $s_PixelProgram, $i_MaterialType)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddShaderMaterialFromFiles($s_VertexProgram, $s_PixelProgram, $i_MaterialType)
	$result = DllCall($_irrDll, "int:cdecl", "IrrAddShaderMaterialFromFiles", "str", $s_VertexProgram, "str", $s_PixelProgram, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddShaderMaterialFromFiles


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateNamedVertexShaderConstant
; Description ...: [todo]
; Syntax.........: _IrrCreateNamedVertexShaderConstant($s_VertexProgram, $s_PixelProgram, $i_MaterialType)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateNamedVertexShaderConstant($s_VertexProgram, $s_PixelProgram, $i_MaterialType)
	$result = DllCall($_irrDll, "int:cdecl", "IrrCreateNamedVertexShaderConstant", "str", $s_VertexProgram, "str", $s_PixelProgram, "int", $i_MaterialType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateNamedVertexShaderConstant


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateNamedPixelShaderConstant
; Description ...: [todo]
; Syntax.........: _IrrCreateNamedPixelShaderConstant($h_Shader, $s_Name, $i_Preset, $i_Data, $i_Count)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateNamedPixelShaderConstant($h_Shader, $s_Name, $i_Preset, $i_Data, $i_Count)
	$result = DllCall($_irrDll, "int:cdecl", "IrrCreateNamedPixelShaderConstant", "ptr", $h_Shader, "str", $s_Name, "int", $i_Preset, "int", $i_Data, "int", $i_Count)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateNamedPixelShaderConstant


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateAddressedVertexShaderConstant
; Description ...: [todo]
; Syntax.........: _IrrCreateAddressedVertexShaderConstant($h_Shader, $i_Address, $i_Preset, $i_Data, $i_Count)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateAddressedVertexShaderConstant($h_Shader, $i_Address, $i_Preset, $i_Data, $i_Count)
	$result = DllCall($_irrDll, "int:cdecl", "IrrCreateAddressedVertexShaderConstant", "ptr", $h_Shader, "int", $i_Address, "int", $i_Preset, "int", $i_Data, "int", $i_Count)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateAddressedVertexShaderConstant


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateAddressedPixelShaderConstant
; Description ...: [todo]
; Syntax.........: _IrrCreateAddressedPixelShaderConstant($h_Shader, $i_Address, $i_Preset, $i_Data, $i_Count)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateAddressedPixelShaderConstant($h_Shader, $i_Address, $i_Preset, $i_Data, $i_Count)
	$result = DllCall($_irrDll, "int:cdecl", "IrrCreateAddressedPixelShaderConstant", "ptr", $h_Shader, "int", $i_Address, "int", $i_Preset, "int", $i_Data, "int", $i_Count)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateAddressedPixelShaderConstant

;Scene Functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetRootSceneNode
; Description ...: [todo]
; Syntax.........: _IrrGetRootSceneNode()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetRootSceneNode()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetRootSceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetRootSceneNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetMesh
; Description ...: [todo]
; Syntax.........: _IrrGetMesh($s_MeshFile)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetMesh($s_MeshFile)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetMesh", "str", $s_MeshFile)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMesh


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateMesh
; Description ...: [todo]
; Syntax.........: _IrrCreateMesh($s_MeshName, $a_Vertices, $a_Indices)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddHillPlaneMesh
; Description ...: [todo]
; Syntax.........: _IrrAddHillPlaneMesh($s_Name, $f_TileSizeX, $f_TileSizeY, $i_TileCountX, $i_TileCountY, $h_Material = 0, $f_HillHeight = 0, $f_CountHillsX = 0, $f_CountHillsY = 0, $f_TextureRepeatCountX = 1, $f_TextureRepeatCountY = 1)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddHillPlaneMesh($s_Name, $f_TileSizeX, $f_TileSizeY, $i_TileCountX, $i_TileCountY, $h_Material = 0, $f_HillHeight = 0, $f_CountHillsX = 0, $f_CountHillsY = 0, $f_TextureRepeatCountX = 1, $f_TextureRepeatCountY = 1)
    $result = DllCall($_irrDll, "ptr:cdecl", "IrrAddHillPlaneMesh", "str", $s_Name, "float", $f_TileSizeX, "float", $f_TileSizeY, "int", $i_TileCountX, "int", $i_TileCountY, "ptr", $h_Material, "float", $f_HillHeight ,"float", $f_CountHillsX, "float", $f_CountHillsY, "float", $f_TextureRepeatCountX, "float", $f_TextureRepeatCountY)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddHillPlaneMesh



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrWriteMesh
; Description ...: [todo]
; Syntax.........: _IrrWriteMesh($h_Mesh, $i_FileFormat, $s_Filename)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrWriteMesh($h_Mesh, $i_FileFormat, $s_Filename)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrWriteMesh", "ptr", $h_Mesh, "int", $i_FileFormat, "str", $s_Filename)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrWriteMesh


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveMesh
; Description ...: [todo]
; Syntax.........: _IrrRemoveMesh($h_Mesh)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveMesh($h_Mesh)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrRemoveMesh", "ptr", $h_Mesh)
	Return $result[0]
EndFunc   ;==>_IrrRemoveMesh


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrClearUnusedMeshes
; Description ...: [todo]
; Syntax.........: _IrrClearUnusedMeshes()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrClearUnusedMeshes()
	DllCall($_irrDll, "none:cdecl", "IrrClearUnusedMeshes")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrClearUnusedMeshes


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMeshHardwareAccelerated
; Description ...: [todo]
; Syntax.........: _IrrSetMeshHardwareAccelerated($h_mesh, $i_frame = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetMeshHardwareAccelerated($h_mesh, $i_frame = 0)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetMeshHardwareAccelerated", "ptr", $h_mesh, "int", $i_frame)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMeshHardwareAccelerated


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetMeshFrameCount
; Description ...: [todo]
; Syntax.........: _IrrGetMeshFrameCount($h_Mesh)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetMeshFrameCount($h_Mesh)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetMeshFrameCount", "ptr", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMeshFrameCount


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetMeshBufferCount
; Description ...: [todo]
; Syntax.........: _IrrGetMeshBufferCount($h_Mesh, $i_FrameNumber)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetMeshBufferCount($h_Mesh, $i_FrameNumber)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetMeshBufferCount", "ptr", $h_Mesh, "int", $i_FrameNumber)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMeshBufferCount


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetMeshIndexCount
; Description ...: [todo]
; Syntax.........: _IrrGetMeshIndexCount($h_Mesh, $i_FrameNumber, $i_MeshBuffer)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetMeshVertexCount
; Description ...: [todo]
; Syntax.........: _IrrGetMeshVertexCount($h_Mesh, $i_FrameNumber, $i_MeshBuffer)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddMeshToScene
; Description ...: [todo]
; Syntax.........: _IrrAddMeshToScene($h_Mesh)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddMeshToScene($h_Mesh)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddMeshToScene", "UINT_PTR", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddMeshToScene


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddMeshToSceneAsOcttree
; Description ...: [todo]
; Syntax.........: _IrrAddMeshToSceneAsOcttree($h_Mesh)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddMeshToSceneAsOcttree($h_Mesh)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddMeshToSceneAsOcttree", "UINT_PTR", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddMeshToSceneAsOcttree


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddStaticMeshForNormalMappingToScene
; Description ...: [todo]
; Syntax.........: _IrrAddStaticMeshForNormalMappingToScene($h_Mesh)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddStaticMeshForNormalMappingToScene($h_Mesh)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddStaticMeshForNormalMappingToScene", "UINT_PTR", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddStaticMeshForNormalMappingToScene


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrLoadScene
; Description ...: [todo]
; Syntax.........: _IrrLoadScene($s_Filename)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrLoadScene($s_Filename)
	DllCall($_irrDll, "none:cdecl", "IrrLoadScene", "str", $s_Filename)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrLoadScene


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSaveScene
; Description ...: [todo]
; Syntax.........: _IrrSaveScene($s_Filename)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSaveScene($s_Filename)
	DllCall($_irrDll, "none:cdecl", "IrrSaveScene", "str", $s_Filename)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSaveScene



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetSceneNodeFromId
; Description ...: [todo]
; Syntax.........: _IrrGetSceneNodeFromId($i_ID)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetSceneNodeFromId($i_ID)
; get a scene node based on its ID and returns null if no node is found
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetSceneNodeFromId", "int", $i_ID)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetSceneNodeFromId



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetSceneNodeFromName
; Description ...: [todo]
; Syntax.........: _IrrGetSceneNodeFromName($s_Name)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetSceneNodeFromName($s_Name)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetSceneNodeFromName", "str", $s_Name)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetSceneNodeFromName


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddBillBoardToScene
; Description ...: [todo]
; Syntax.........: _IrrAddBillBoardToScene($f_XSize, $f_YSize, $f_XPos = 0.0, $f_YPos = 0.0, $f_ZPos = 0.0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddBillBoardToScene($f_XSize, $f_YSize, $f_XPos = 0.0, $f_YPos = 0.0, $f_ZPos = 0.0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddBillBoardToScene", "float", $f_XSize, "float", $f_YSize, "float", $f_XPos, "float", $f_YPos, "float", $f_ZPos)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddBillBoardToScene


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddBillboardTextSceneNode
; Description ...: [todo]
; Syntax.........: _IrrAddBillboardTextSceneNode($h_Font, $s_Text, $f_XSize, $f_YSize, $f_XPos=0, $f_YPos=0, $f_ZPos=0, $h_Parent=0, $i_TopRGBA=0xFFFFFFFF, $i_BottomRGBA=0xFFFFFFFF)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddParticleSystemToScene
; Description ...: [todo]
; Syntax.........: _IrrAddParticleSystemToScene($i_AddEmitter, $h_Parent = 0, $i_Id = -1, $f_PosX = 0, $f_PosY = 0, $f_PosZ = 0, $f_RotX = 0, $f_RotY = 0, $f_RotZ = 0, $f_ScaleX = 1, $f_ScaleY = 1, $f_ScaleZ = 1)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddSkyBoxToScene
; Description ...: [todo]
; Syntax.........: _IrrAddSkyBoxToScene($h_UpTexture, $h_DownTexture, $h_LeftTexture, $h_RightTexture, $h_FrontTexture, $h_BackTexture)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddSkyBoxToScene($h_UpTexture, $h_DownTexture, $h_LeftTexture, $h_RightTexture, $h_FrontTexture, $h_BackTexture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSkyBoxToScene", "ptr", $h_UpTexture, "ptr", $h_DownTexture, "ptr", $h_LeftTexture, "ptr", $h_RightTexture, "ptr", $h_FrontTexture, "ptr", $h_BackTexture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSkyBoxToScene



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddSkyDomeToScene
; Description ...: [todo]
; Syntax.........: _IrrAddSkyDomeToScene($h_Texture, $i_HorizontalRes, $i_VerticalRes, $d_TexturePercent, $d_SpherePercent, $d_SphereRadius = 1000.0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddSkyDomeToScene($h_Texture, $i_HorizontalRes, $i_VerticalRes, $d_TexturePercent, $d_SpherePercent, $d_SphereRadius = 1000.0)
    $result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSkyDomeToScene", "ptr", $h_Texture, "uint", $i_HorizontalRes, "uint", $i_VerticalRes, "double", $d_TexturePercent, "double", $d_SpherePercent, "double", $d_SphereRadius)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSkyDomeToScene


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddEmptySceneNode
; Description ...: [todo]
; Syntax.........: _IrrAddEmptySceneNode()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddEmptySceneNode()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddEmptySceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddEmptySceneNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddTestSceneNode
; Description ...: [todo]
; Syntax.........: _IrrAddTestSceneNode()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddTestSceneNode()
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddTestSceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddTestSceneNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddCubeSceneNode
; Description ...: [todo]
; Syntax.........: _IrrAddCubeSceneNode($f_Size)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddCubeSceneNode($f_Size)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCubeSceneNode", "float", $f_Size)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCubeSceneNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddSphereSceneNode
; Description ...: [todo]
; Syntax.........: _IrrAddSphereSceneNode($f_Size, $i_PolyCount)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddSphereSceneNode($f_Size, $i_PolyCount)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSphereSceneNode", "float", $f_Size, "int", $i_PolyCount)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSphereSceneNode



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddWaterSurfaceSceneNode
; Description ...: [todo]
; Syntax.........: _IrrAddWaterSurfaceSceneNode($h_Mesh, $f_WaveHeight = 2.0, $f_WaveSpeed = 300.0, $f_WaveLength = 10.0, $h_Parent = 0, $i_ID = -1, $f_PosX = 0, $f_PosY = 0, $f_PosZ = 0, $f_RotX = 0, $f_RotY = 0, $f_RotZ = 0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddWaterSurfaceSceneNode($h_Mesh, $f_WaveHeight = 2.0, $f_WaveSpeed = 300.0, $f_WaveLength = 10.0, $h_Parent = 0, $i_ID = -1, $f_PosX = 0, $f_PosY = 0, $f_PosZ = 0, $f_RotX = 0, $f_RotY = 0, $f_RotZ = 0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddWaterSurfaceSceneNode", "ptr", $h_Mesh, "float", $f_WaveHeight, "float", $f_WaveSpeed, "float", $f_WaveLength, "ptr", $h_Parent, "int", $i_ID, "float", $f_PosX, "float", $f_PosY, "float", $f_PosZ, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ, "float", $f_ScaleX, "float", $f_ScaleY, "float", $f_ScaleZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddWaterSurfaceSceneNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddZoneManager
; Description ...: [todo]
; Syntax.........: _IrrAddZoneManager($f_NearDistance=0, $f_FarDistance=12000)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddZoneManager($f_NearDistance=0, $f_FarDistance=12000)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddZoneManager", "float", $f_NearDistance, "float", $f_FarDistance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddZoneManager


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddClouds
; Description ...: [todo]
; Syntax.........: _IrrAddClouds($h_Texture, $i_Lod, $i_Depth, $i_Density)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddClouds($h_Texture, $i_Lod, $i_Depth, $i_Density)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddClouds", "ptr", $h_Texture, "int", $i_Lod, "int", $i_Depth, "int", $i_Density)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddClouds


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddLensFlare
; Description ...: [todo]
; Syntax.........: _IrrAddLensFlare($h_Texture)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddLensFlare($h_Texture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddLensFlare", "ptr", $h_Texture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddLensFlare


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddGrass
; Description ...: [todo]
; Syntax.........: _IrrAddGrass($h_Terrain, $i_X, $i_Y, $i_PatchSize, $f_FadeDistance, $i_Crossed, $f_GrassScale, $i_MaxDensity, $i_DataPosX, $i_DataPosY, $h_HeightMap, $h_TextureMap, $h_GrassMap, $h_GrassTexture)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetShadowColor
; Description ...: [todo]
; Syntax.........: _IrrSetShadowColor($i_Alpha, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetShadowColor($i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetShadowColor", "int", $i_Alpha, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetShadowColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetFog
; Description ...: [todo]
; Syntax.........: _IrrSetFog($i_Red, $i_Green, $i_Blue, $i_FogType, $f_FogStart, $f_FogEnd, $f_Density)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetFog($i_Red, $i_Green, $i_Blue, $i_FogType, $f_FogStart, $f_FogEnd, $f_Density)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetFog", "int", $i_Red, "int", $i_Green, "int", $i_Blue, "int", $i_FogType, "float", $f_FogStart, "float", $f_FogEnd, "float", $f_Density)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetFog


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDraw3DLine
; Description ...: [todo]
; Syntax.........: _IrrDraw3DLine($f_XStart, $f_YStart, $f_ZStart, $f_XEnd, $f_YEnd, $f_ZEnd, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrDraw3DLine($f_XStart, $f_YStart, $f_ZStart, $f_XEnd, $f_YEnd, $f_ZEnd, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrDraw3DLine", "float", $f_XStart, "float", $f_YStart, "float", $f_ZStart, "float", $f_XEnd, "float", $f_YEnd, "float", $f_ZEnd, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDraw3DLine


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetSkyDomeColor
; Description ...: [todo]
; Syntax.........: _IrrSetSkyDomeColor($h_Dome, $i_HorizontalRed, $i_HorizontalGreen, $i_HorizontalBlue, $i_ZenithRed, $i_ZenithGreen, $i_ZenithBlue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetSkyDomeColor($h_Dome, $i_HorizontalRed, $i_HorizontalGreen, $i_HorizontalBlue, $i_ZenithRed, $i_ZenithGreen, $i_ZenithBlue)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetSkyDomeColor", "ptr", $h_Dome, "int", $i_HorizontalRed, "int", $i_HorizontalGreen, "int", $i_HorizontalBlue, "int", $i_ZenithRed, "int", $i_ZenithGreen, "int", $i_ZenithBlue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetSkyDomeColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetSkyDomeColorBand
; Description ...: [todo]
; Syntax.........: _IrrSetSkyDomeColorBand($h_Dome, $i_HorizontalRed, $i_HorizontalGreen, $i_HorizontalBlue, $i_BandVerticalPosition, $f_BandFade, $i_Additive)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetSkyDomeColorBand($h_Dome, $i_HorizontalRed, $i_HorizontalGreen, $i_HorizontalBlue, $i_BandVerticalPosition, $f_BandFade, $i_Additive)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetSkyDomeColorBand", "ptr", $h_Dome, "int", $i_HorizontalRed, "int", $i_HorizontalGreen, "int", $i_HorizontalBlue, "int", $i_BandVerticalPosition, "float", $f_BandFade, "int", $i_Additive)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetSkyDomeColorBand


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetSkyDomeColorPoint
; Description ...: [todo]
; Syntax.........: _IrrSetSkyDomeColorPoint($h_Dome, $i_Red, $i_Green, $i_Blue, $f_PosX, $f_PosY, $f_PosZ, $f_Radius, $f_PointFade, $i_Additive)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetSkyDomeColorPoint($h_Dome, $i_Red, $i_Green, $i_Blue, $f_PosX, $f_PosY, $f_PosZ, $f_Radius, $f_PointFade, $i_Additive)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetSkyDomeColorPoint", "ptr", $h_Dome, "int", $i_Red, "int", $i_Green, "int", $i_Blue, "float", $f_PosX, "float", $f_PosY, "float", $f_Radius, "float", $f_PointFade, "int", $i_Additive)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetSkyDomeColorPoint


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetZoneManagerProperties
; Description ...: [todo]
; Syntax.........: _IrrSetZoneManagerProperties($h_ZoneManager, $f_NearDistance, $f_FarDistance, $i_AccumulateBoxes)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetZoneManagerProperties($h_ZoneManager, $f_NearDistance, $f_FarDistance, $i_AccumulateBoxes)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetZoneManagerProperties", "ptr", $h_ZoneManager, "float", $f_NearDistance, "float", $f_FarDistance, "int", $i_AccumulateBoxes)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetZoneManagerProperties


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetZoneManagerBoundingBox
; Description ...: [todo]
; Syntax.........: _IrrSetZoneManagerBoundingBox($h_ZoneManager, $f_X, $f_Y, $f_Z, $f_BoxWidth, $f_BoxHeight, $f_BoxDepth)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetZoneManagerBoundingBox($h_ZoneManager, $f_X, $f_Y, $f_Z, $f_BoxWidth, $f_BoxHeight, $f_BoxDepth)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrSetZoneManagerBoundingBox", "ptr", $h_ZoneManager, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_BoxWidth, "float", $f_BoxHeight, "float", $f_BoxDepth)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrSetZoneManagerBoundingBox


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetZoneManagerAttachTerrain
; Description ...: [todo]
; Syntax.........: _IrrSetZoneManagerAttachTerrain($h_ZoneNode, $h_Terrain, $s_StructureMapFile, $s_ColorMapFile, $s_DetailMapFile, $i_ImageX, $i_ImageY, $i_SliceSize)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetZoneManagerAttachTerrain($h_ZoneNode, $h_Terrain, $s_StructureMapFile, $s_ColorMapFile, $s_DetailMapFile, $i_ImageX, $i_ImageY, $i_SliceSize)
	DllCall($_irrDll, "none:cdecl", "IrrSetZoneManagerAttachTerrain", "UINT_PTR", $h_ZoneNode, "UINT_PTR", $h_Terrain, _
		"str", $s_StructureMapFile, "str", $s_ColorMapFile, "str", $s_DetailMapFile, "int", $i_ImageX, "int", $i_ImageY, "int", $i_SliceSize)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetZoneManagerAttachTerrain


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetGrassDensity
; Description ...: [todo]
; Syntax.........: _IrrSetGrassDensity($h_Grass, $f_Density, $f_Distance)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetGrassDensity($h_Grass, $f_Density, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetGrassDensity", "ptr", $h_Grass, "float", $f_Density, "float", $f_Distance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGrassDensity


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetGrassWind
; Description ...: [todo]
; Syntax.........: _IrrSetGrassWind($h_Grass, $f_Strength, $f_Resolution)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetGrassWind($h_Grass, $f_Strength, $f_Resolution)
	DllCall($_irrDll, "none:cdecl", "IrrSetGrassWind", "ptr", $h_Grass, "float", $f_Strength, "float", $f_Resolution)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGrassWind


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetGrassDrawCount
; Description ...: [todo]
; Syntax.........: _IrrGetGrassDrawCount($h_Grass)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetGrassDrawCount($h_Grass)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetGrassDrawCount", "ptr", $h_Grass)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetGrassDrawCount


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetFlareScale
; Description ...: [todo]
; Syntax.........: _IrrSetFlareScale($h_Flare, $f_Source, $f_Optics)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetFlareScale($h_Flare, $f_Source, $f_Optics)
	DllCall($_irrDll, "none:cdecl", "IrrSetFlareScale", "ptr", $h_Flare, "float", $f_Source, "float", $f_Optics)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetFlareScale

;Scene Node functions


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeName
; Description ...: [todo]
; Syntax.........: _IrrGetNodeName($h_Node)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetNodeName($h_Node)
	$result = DllCall($_irrDll, "str:cdecl", "IrrGetNodeName", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetNodeName


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeName
; Description ...: [todo]
; Syntax.........: _IrrSetNodeName($h_Node, $s_Name)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeName($h_Node, $s_Name)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeName", "ptr", $h_Node, "str", $s_Name)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeName


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetMaterialCount
; Description ...: [todo]
; Syntax.........: _IrrGetMaterialCount($h_Node)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetMaterialCount($h_Node)
	$result = DllCall($_irrDll, "uint:cdecl", "IrrGetMaterialCount", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMaterialCount


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetMaterial
; Description ...: [todo]
; Syntax.........: _IrrGetMaterial($h_Node, $i_Material)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetMaterial($h_Node, $i_Material)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetMaterial", "ptr", $h_Node, "uint", $i_Material)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetMaterial


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeMaterialTexture
; Description ...: [todo]
; Syntax.........: _IrrSetNodeMaterialTexture($h_Node, $h_Texture, $i_Index)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeMaterialTexture($h_Node, $h_Texture, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeMaterialTexture", "UINT_PTR", $h_Node, "UINT_PTR", $h_Texture, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeMaterialTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeMaterialFlag
; Description ...: [todo]
; Syntax.........: _IrrSetNodeMaterialFlag($h_Node, $i_Type, $i_Flag)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeMaterialFlag($h_Node, $i_Type, $i_Flag)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeMaterialFlag", "UINT_PTR", $h_Node, "int", $i_Type, "uint", $i_Flag)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeMaterialFlag


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeMaterialType
; Description ...: [todo]
; Syntax.........: _IrrSetNodeMaterialType($h_Node, $i_Type)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeMaterialType($h_Node, $i_Type)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeMaterialType", "UINT_PTR", $h_Node, "int", $i_Type)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeMaterialType


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodePosition
; Description ...: [todo]
; Syntax.........: _IrrSetNodePosition($h_Node, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodePosition($h_Node, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodePosition", "UINT_PTR", $h_Node, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodePosition



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeRotation
; Description ...: [todo]
; Syntax.........: _IrrSetNodeRotation($h_Node, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeRotation($h_Node, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeRotation", "ptr", $h_Node, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeRotation


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeScale
; Description ...: [todo]
; Syntax.........: _IrrSetNodeScale($h_Node, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeScale($h_Node, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeScale", "UINT_PTR", $h_Node, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeScale


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrDebugDataVisible
; Description ...: [todo]
; Syntax.........: _IrrDebugDataVisible($h_Node, $i_Visible)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrDebugDataVisible($h_Node, $i_Visible)
	DllCall($_irrDll, "none:cdecl", "IrrDebugDataVisible", "ptr", $h_Node, "int", $i_Visible)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrDebugDataVisible


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodePosition
; Description ...: [todo]
; Syntax.........: _IrrGetNodePosition($h_Node, ByRef $a_Vector3df)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeAbsolutePosition
; Description ...: [todo]
; Syntax.........: _IrrGetNodeAbsolutePosition($h_Node, ByRef $a_Vector3df)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeRotation
; Description ...: [todo]
; Syntax.........: _IrrGetNodeRotation($h_Node, ByRef $a_Vector3df)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetJointNode
; Description ...: [todo]
; Syntax.........: _IrrGetJointNode($h_Node, $s_Joint)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetJointNode($h_Node, $s_Joint)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetJointNode", "ptr", $h_Node, "str", $s_Joint)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrGetJointNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetJointMode
; Description ...: [todo]
; Syntax.........: _IrrSetJointMode($h_Node, $i_Mode)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetJointMode($h_Node, $i_Mode)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetJointMode", "ptr", $h_Node, "int", $i_Mode)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetJointMode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddChildToParent
; Description ...: [todo]
; Syntax.........: _IrrAddChildToParent($h_ChildNode, $h_ParentNode)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddChildToParent($h_ChildNode, $h_ParentNode)
	DllCall($_irrDll, "none:cdecl", "IrrAddChildToParent", "ptr", $h_ChildNode, "ptr", $h_ParentNode)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddChildToParent



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeFirstChild
; Description ...: [todo]
; Syntax.........: _IrrGetNodeFirstChild($h_Node, ByRef $h_Position)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeNextChild
; Description ...: [todo]
; Syntax.........: _IrrGetNodeNextChild($h_Node, ByRef $h_Position)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrIsNodeLastChild
; Description ...: [todo]
; Syntax.........: _IrrIsNodeLastChild($h_Node, ByRef $h_Position)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddNodeShadow
; Description ...: [todo]
; Syntax.........: _IrrAddNodeShadow($h_Node, $h_mesh = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddNodeShadow($h_Node, $h_mesh = 0)
	DllCall($_irrDll, "none:cdecl", "IrrAddNodeShadow", "ptr", $h_Node, "ptr", $h_mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddNodeShadow


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeVisibility
; Description ...: [todo]
; Syntax.........: _IrrSetNodeVisibility($h_Node, $i_Visible)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeVisibility($h_Node, $i_Visible)
	DllCall($_irrDll, "none:cdecl", "IrrAddNodeShadow", "ptr", $h_Node, "int", $i_Visible)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeVisibility


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveNode
; Description ...: [todo]
; Syntax.........: _IrrRemoveNode($h_Node)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveNode($h_Node)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveNode", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveAllNodes
; Description ...: [todo]
; Syntax.........: _IrrRemoveAllNodes()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveAllNodes()
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAllNodes")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAllNodes


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeParent
; Description ...: [todo]
; Syntax.........: _IrrSetNodeParent($h_Node, $h_Parent)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeParent($h_Node, $h_Parent)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeParent", "ptr", $h_Node, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeParent



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeID
; Description ...: [todo]
; Syntax.........: _IrrGetNodeID($h_Node)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetNodeID($h_Node)
; get the ID of this node
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetNodeID", "ptr", $h_Node)
	Return $result[0]
EndFunc   ;==>_IrrGetNodeID



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeID
; Description ...: [todo]
; Syntax.........: _IrrSetNodeID($h_Node, $i_ID)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeID($h_Node, $i_ID)
; set the ID of this node
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeID", "ptr", $h_Node, "int", $i_ID)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeID



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeBoundingBox
; Description ...: [todo]
; Syntax.........: _IrrGetNodeBoundingBox($h_Node, ByRef $a_VectorA3df, ByRef $a_VectorB3df)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeAmbientColor
; Description ...: [todo]
; Syntax.........: _IrrSetNodeAmbientColor($h_Node, $i_Color)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeAmbientColor($h_Node, $i_Color)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAmbientColor", "ptr", $h_Node, "uint", $i_Color)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAmbientColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeDiffuseColor
; Description ...: [todo]
; Syntax.........: _IrrSetNodeDiffuseColor($h_Node, $i_Color)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeDiffuseColor($h_Node, $i_Color)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeDiffuseColor", "ptr", $h_Node, "uint", $i_Color)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeDiffuseColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeSpecularColor
; Description ...: [todo]
; Syntax.........: _IrrSetNodeSpecularColor($h_Node, $i_Color)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeSpecularColor($h_Node, $i_Color)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeSpecularColor", "ptr", $h_Node, "uint", $i_Color)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeSpecularColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeEmissiveColor
; Description ...: [todo]
; Syntax.........: _IrrSetNodeEmissiveColor($h_Node, $i_Color)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeEmissiveColor($h_Node, $i_Color)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeEmissiveColor", "ptr", $h_Node, "uint", $i_Color)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeEmissiveColor



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeColorByVertex
; Description ...: [todo]
; Syntax.........: _IrrSetNodeColorByVertex($h_Node, $i_ColorMaterial)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeAnimationRange
; Description ...: [todo]
; Syntax.........: _IrrSetNodeAnimationRange($h_Node, $i_Start, $i_End)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeAnimationRange($h_Node, $i_Start, $i_End)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAnimationRange", "ptr", $h_Node, "int", $i_Start, "int", $i_End)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAnimationRange


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrPlayNodeMD2Animation
; Description ...: [todo]
; Syntax.........: _IrrPlayNodeMD2Animation($h_Node, $i_Animation)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrPlayNodeMD2Animation($h_Node, $i_Animation)
	DllCall($_irrDll, "none:cdecl", "IrrPlayNodeMD2Animation", "ptr", $h_Node, "int", $i_Animation)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrPlayNodeMD2Animation


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeAnimationSpeed
; Description ...: [todo]
; Syntax.........: _IrrSetNodeAnimationSpeed($h_Node, $f_Speed)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeAnimationSpeed($h_Node, $f_Speed)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAnimationSpeed", "ptr", $h_Node, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAnimationSpeed


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeAnimationFrame
; Description ...: [todo]
; Syntax.........: _IrrGetNodeAnimationFrame($h_Node)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetNodeAnimationFrame($h_Node)
	$result = DllCall($_irrDll, "int:cdecl", "IrrGetNodeAnimationFrame", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetNodeAnimationFrame


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeAnimationFrame
; Description ...: [todo]
; Syntax.........: _IrrSetNodeAnimationFrame($h_Node, $f_Frame)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNodeAnimationFrame($h_Node, $f_Frame)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeAnimationFrame", "ptr", $h_Node, "float", $f_Frame)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeAnimationFrame


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetTransitionTime
; Description ...: [todo]
; Syntax.........: _IrrSetTransitionTime($h_Node, $f_Speed)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetTransitionTime($h_Node, $f_Speed)
	DllCall($_irrDll, "none:cdecl", "IrrSetTransitionTime", "ptr", $h_Node, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTransitionTime


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAnimateJoints
; Description ...: [todo]
; Syntax.........: _IrrAnimateJoints($h_Node)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAnimateJoints($h_Node)
	DllCall($_irrDll, "int:cdecl", "IrrAnimateJoints", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAnimateJoints



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddCollisionAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddCollisionAnimator($h_IrrSelector, $h_Node, $f_RadiusX, $f_RadiusY, $f_RadiusZ, $f_GravityX, $f_GravityY, $f_GravityZ, $f_OffsetX, $f_OffsetY, $f_OffsetZ)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddCollisionAnimator($h_IrrSelector, $h_Node, $f_RadiusX, $f_RadiusY, $f_RadiusZ, $f_GravityX, $f_GravityY, $f_GravityZ, $f_OffsetX, $f_OffsetY, $f_OffsetZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCollisionAnimator", "ptr", $h_IrrSelector, "ptr", $h_Node, "float", $f_RadiusX, "float", $f_RadiusY, "float", $f_RadiusZ, "float", $f_GravityX, "float", $f_GravityY, "float", $f_GravityZ, "float", $f_OffsetX, "float", $f_OffsetY, "float", $f_OffsetZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCollisionAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddDeleteAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddDeleteAnimator($h_Node, $i_Time)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddDeleteAnimator($h_Node, $i_Time)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddDeleteAnimator", "ptr", $h_Node, "int", $i_Time)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddDeleteAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFlyCircleAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddFlyCircleAnimator($h_Node, $f_CenterX, $f_CenterY, $f_CenterZ, $f_Radius, $f_Speed)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddFlyCircleAnimator($h_Node, $f_CenterX, $f_CenterY, $f_CenterZ, $f_Radius, $f_Speed)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFlyCircleAnimator", "ptr", $h_Node, "float", $f_CenterX, "float", $f_CenterY, "float", $f_CenterZ, "float", $f_Radius, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFlyCircleAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFlyStraightAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddFlyStraightAnimator($h_Node, $f_StartX, $f_StartY, $f_StartZ, $f_EndX, $f_EndY, $f_EndZ, $i_Time, $i_DoLoop)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddFlyStraightAnimator($h_Node, $f_StartX, $f_StartY, $f_StartZ, $f_EndX, $f_EndY, $f_EndZ, $i_Time, $i_DoLoop)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFlyStraightAnimator", "ptr", $h_Node, "float", $f_StartX, "float", $f_StartY, "float", $f_StartZ, "float", $f_EndX, "float", $f_EndY, "float", $f_EndZ, "uint", $i_Time, "int", $i_DoLoop)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFlyStraightAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddRotationAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddRotationAnimator($h_Node, $f_RotX, $f_RotY, $f_RotZ)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddRotationAnimator($h_Node, $f_RotX, $f_RotY, $f_RotZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddRotationAnimator", "ptr", $h_Node, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddRotationAnimator



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddSplineAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddSplineAnimator($h_Node, $i_ArraySize, $a_ArrayFloatsX, $a_ArrayFloatsY, $a_ArrayFloatsZ, $i_Start, $f_Speed, $f_Tightness)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFadeAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddFadeAnimator($h_Node, $i_DeleteAfterMiliseconds, $f_Scale = 1.0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddFadeAnimator($h_Node, $i_DeleteAfterMiliseconds, $f_Scale = 1.0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFadeAnimator", "ptr", $h_Node, "int", $i_DeleteAfterMiliseconds, "float", $f_Scale)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFadeAnimator


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveAnimator
; Description ...: [todo]
; Syntax.........: _IrrRemoveAnimator($h_Node, $h_Animator)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveAnimator($h_Node, $h_Animator)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAnimator", "ptr", $h_Node, "ptr", $h_Animator)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAnimator



;Collision Functions


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCollisionGroupFromMesh
; Description ...: [todo]
; Syntax.........: _IrrGetCollisionGroupFromMesh($h_Mesh, $h_Node, $i_Frame = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetCollisionGroupFromMesh($h_Mesh, $h_Node, $i_Frame = 0)
; gets a collision object from an animated mesh
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetCollisionGroupFromMesh", "UINT_PTR", $h_Mesh, "UINT_PTR", $h_Node, "int", $i_Frame)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionGroupFromMesh



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCollisionGroupFromComplexMesh
; Description ...: [todo]
; Syntax.........: _IrrGetCollisionGroupFromComplexMesh($h_Mesh, $h_Node, $i_Frame = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetCollisionGroupFromComplexMesh($h_Mesh, $h_Node, $i_Frame = 0)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetCollisionGroupFromComplexMesh", "UINT_PTR", $h_Mesh, "UINT_PTR", $h_Node, "int", $i_Frame)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionGroupFromComplexMesh


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCollisionGroupFromBox
; Description ...: [todo]
; Syntax.........: _IrrGetCollisionGroupFromBox($h_Node)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetCollisionGroupFromBox($h_Node)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetCollisionGroupFromBox", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionGroupFromBox


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCollisionGroupFromTerrain
; Description ...: [todo]
; Syntax.........: _IrrGetCollisionGroupFromTerrain($h_Node, $i_Lod)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetCollisionGroupFromTerrain($h_Node, $i_Lod)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetCollisionGroupFromTerrain", "ptr", $h_Node, "int", $i_Lod)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionGroupFromTerrain


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveCollisionGroup
; Description ...: [todo]
; Syntax.........: _IrrRemoveCollisionGroup($h_CollisionGroup, $h_Node)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveCollisionGroup($h_CollisionGroup, $h_Node)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveCollisionGroup", "ptr", $h_CollisionGroup, "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveCollisionGroup


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateCombinedCollisionGroup
; Description ...: [todo]
; Syntax.........: _IrrCreateCombinedCollisionGroup()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateCombinedCollisionGroup()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateCombinedCollisionGroup")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateCombinedCollisionGroup


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddCollisionGroupToCombination
; Description ...: [todo]
; Syntax.........: _IrrAddCollisionGroupToCombination($h_CombinedCollisionGroup, $h_CollisionGroup)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddCollisionGroupToCombination($h_CombinedCollisionGroup, $h_CollisionGroup)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCollisionGroupToCombination", "ptr", $h_CombinedCollisionGroup, "ptr", $h_CollisionGroup)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCollisionGroupToCombination


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveAllCollisionGroupsFromCombination
; Description ...: [todo]
; Syntax.........: _IrrRemoveAllCollisionGroupsFromCombination($h_CombinedCollisionGroup)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveAllCollisionGroupsFromCombination($h_CombinedCollisionGroup)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAllCollisionGroupsFromCombination", "ptr", $h_CombinedCollisionGroup)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAllCollisionGroupsFromCombination


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveCollisionGroupFromCombination
; Description ...: [todo]
; Syntax.........: _IrrRemoveCollisionGroupFromCombination($h_CombinedCollisionGroup, $h_CollisionGroup)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveCollisionGroupFromCombination($h_CombinedCollisionGroup, $h_CollisionGroup)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveCollisionGroupFromCombination", "ptr", $h_CombinedCollisionGroup, "ptr", $h_CollisionGroup)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveCollisionGroupFromCombination



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCollisionPoint
; Description ...: [todo]
; Syntax.........: _IrrGetCollisionPoint($a_StartVector, $a_EndVector, $h_CollisionGroup, byRef $a_CollisionVector)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetRayFromScreenCoordinates
; Description ...: [todo]
; Syntax.........: _IrrGetRayFromScreenCoordinates($i_X, $i_Y, $h_Camera)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetRayFromScreenCoordinates($i_X, $i_Y, $h_Camera)
	Local $StartVectorStruct = DllStructCreate("float;float;float")
	Local $EndVectorStruct = DllStructCreate("float;float;float")
	DllCall($_irrDll, "none:cdecl", "IrrGetRayFromScreenCoordinates", "int", $i_X, "int", $i_Y, "ptr", $h_Camera, "ptr", DllStructGetPtr($StartVectorStruct), "ptr", DllStructGetPtr($EndVectorStruct))
	Local $result[2][3] = [[DllStructGetData($StartVectorStruct, 1), DllStructGetData($StartVectorStruct, 2), DllStructGetData($StartVectorStruct, 3)],[DllStructGetData($EndVectorStruct, 1), DllStructGetData($EndVectorStruct, 2), DllStructGetData($EndVectorStruct, 3)]]
	Return $result
EndFunc   ;==>_IrrGetRayFromScreenCoordinates


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCollisionNodeFromCamera
; Description ...: [todo]
; Syntax.........: _IrrGetCollisionNodeFromCamera($h_Camera)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetCollisionNodeFromCamera($h_Camera)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrGetCollisionNodeFromCamera", "ptr", $h_Camera)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionNodeFromCamera



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCollisionNodeFromRay
; Description ...: [todo]
; Syntax.........: _IrrGetCollisionNodeFromRay(byRef $h_StartVector, byRef $h_EndVector)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetCollisionNodeFromRay(byRef $h_StartVector, byRef $h_EndVector)
; a ray is cast through the supplied coordinates and the nearest node that is
; hit by the ray is returned. if no node is hit zero is returned for the object

local $structStartVector = DllStructCreate("float;float;float")
DllStructSetData($structStartVector, 1, $h_StartVector[0])
DllStructSetData($structStartVector, 2, $h_StartVector[1])
DllStructSetData($structStartVector, 3, $h_StartVector[2])
local $structEndVector = DllStructCreate("float;float;float")
DllStructSetData($structEndVector, 1, $h_EndVector[0])
DllStructSetData($structEndVector, 2, $h_EndVector[1])
DllStructSetData($structEndVector, 3, $h_EndVector[2])

$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrGetCollisionNodeFromRay", "ptr", _
					DllStructGetPtr($structStartVector), "ptr", DllStructGetPtr($structEndVector) )
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetCollisionNodeFromRay



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCollisionNodeFromScreenCoordinates
; Description ...: [todo]
; Syntax.........: _IrrGetCollisionNodeFromScreenCoordinates($i_X, $i_Y)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetScreenCoordinatesFrom3DPosition
; Description ...: [todo]
; Syntax.........: _IrrGetScreenCoordinatesFrom3DPosition(ByRef $i_ScreenX, ByRef $i_ScreenY, $a_3DPositionVector)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGet3DPositionFromScreenCoordinates
; Description ...: [todo]
; Syntax.........: _IrrGet3DPositionFromScreenCoordinates($i_X, $i_Y, ByRef $a_Vector3df, $h_Camera, $f_NormalX=0.0, $f_NormalY=0.0, $f_NormalZ=1.0, $f_DistanceFromOrigin=0.0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGet2DPositionFromScreenCoordinates
; Description ...: [todo]
; Syntax.........: _IrrGet2DPositionFromScreenCoordinates($i_X, $i_Y, ByRef $f_X, ByRef $f_Y, $h_Camera)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetChildCollisionNodeFromRay
; Description ...: [todo]
; Syntax.........: _IrrGetChildCollisionNodeFromRay($h_Node, $i_Mask, $i_Recurse, $a_StartVector, $a_EndVector)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetChildCollisionNodeFromPoint
; Description ...: [todo]
; Syntax.........: _IrrGetChildCollisionNodeFromPoint($h_Node, $i_Mask, $i_Recurse, $a_PointVector)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetNodeAndCollisionPointFromRay
; Description ...: [todo]
; Syntax.........: _IrrGetNodeAndCollisionPointFromRay($a_StartVector, $a_EndVector, ByRef $h_Node, ByRef $f_PosX, ByRef $f_PosY, ByRef $f_PosZ, ByRef $f_NormalX, ByRef $f_NormalY, ByRef $f_NormalZ, $i_ID = 0, $h_RootNode = $IRR_NO_OBJECT)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetDistanceBetweenNodes
; Description ...: [todo]
; Syntax.........: _IrrGetDistanceBetweenNodes($h_NodeA, $h_NodeB)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetDistanceBetweenNodes($h_NodeA, $h_NodeB)
	$result = DllCall($_irrDll, "float:cdecl", "IrrGetDistanceBetweenNodes", "ptr", $h_NodeA, "ptr", $h_NodeB)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetDistanceBetweenNodes


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAreNodesIntersecting
; Description ...: [todo]
; Syntax.........: _IrrAreNodesIntersecting($h_NodeA, $h_NodeB)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAreNodesIntersecting($h_NodeA, $h_NodeB)
	$result = DllCall($_irrDll, "int:cdecl", "IrrAreNodesIntersecting", "ptr", $h_NodeA, "ptr", $h_NodeB)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAreNodesIntersecting


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrIsPointInsideNode
; Description ...: [todo]
; Syntax.........: _IrrIsPointInsideNode($h_NodeA, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrIsPointInsideNode($h_NodeA, $f_X, $f_Y, $f_Z)
	$result = DllCall($_irrDll, "int:cdecl", "IrrIsPointInsideNode", "ptr", $h_NodeA, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrIsPointInsideNode



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetCollisionResultPosition
; Description ...: [todo]
; Syntax.........: _IrrGetCollisionResultPosition($h_Selector, ByRef $a_EllipsoidPosition, ByRef $a_EllipsoidRadius, ByRef $a_Velocity, ByRef $a_Gravity, $f_SlidingSpeed, ByRef $a_OutPosition, ByRef $a_OutHitPosition, ByRef $i_OutFalling)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetCollisionResultPosition($h_Selector, ByRef $a_EllipsoidPosition, ByRef $a_EllipsoidRadius, ByRef $a_Velocity, ByRef $a_Gravity, $f_SlidingSpeed, ByRef $a_OutPosition, ByRef $a_OutHitPosition, ByRef $i_OutFalling)
; Collides a moving ellipsoid with a 3d world with gravity and returns the
; resulting new position of the ellipsoid. (contributed by The Car)
	Local $structEllipsoidPosition = DllStructCreate("float;float;float")
	DllStructSetData($structEllipsoidPosition, 1, $a_EllipsoidPosition[0])
	DllStructSetData($structEllipsoidPosition, 2, $a_EllipsoidPosition[1])
	DllStructSetData($structEllipsoidPosition, 3, $a_EllipsoidPosition[2])
	Local $structEllipsoidRadius = DllStructCreate("float;float;float")
	DllStructSetData($structEllipsoidRadius, 1, $a_EllipsoidRadius[0])
	DllStructSetData($structEllipsoidRadius, 2, $a_EllipsoidRadius[1])
	DllStructSetData($structEllipsoidRadius, 3, $a_EllipsoidRadius[2])
	Local $structVelocity = DllStructCreate("float;float;float")
	DllStructSetData($structVelocity, 1, $a_Velocity[0])
	DllStructSetData($structVelocity, 2, $a_Velocity[1])
	DllStructSetData($structVelocity, 3, $a_Velocity[2])
	Local $structGravity = DllStructCreate("float;float;float")
	DllStructSetData($structGravity, 1, $a_Gravity[0])
	DllStructSetData($structGravity, 2, $a_Gravity[1])
	DllStructSetData($structGravity, 3, $a_Gravity[2])
	Local $structOutPosition = DllStructCreate("float;float;float")
	Local $structOutHitPosition = DllStructCreate("float;float;float")

	$result = DllCall($_irrDll, "none:cdecl", "IrrGetCollisionResultPosition", "ptr", $h_Selector, "ptr", DllStructGetPtr($structEllipsoidPosition), "ptr", DllStructGetPtr($structEllipsoidRadius), _
			"ptr", DllStructGetPtr($structVelocity), "ptr", DllStructGetPtr($structGravity), "float", $f_SlidingSpeed, _
			"ptr", DllStructGetPtr($structOutPosition), "ptr", DllStructGetPtr($structOutHitPosition), "int*", $i_OutFalling)

	if @error Then
		Return Seterror(1,0,False)
	Else
		dim $a_OutPosition[3] = [ DllStructGetData($structOutPosition, 1), DllStructGetData($structOutPosition, 2), DllStructGetData($structOutPosition, 3) ]
		dim $a_OutHitPosition[3] = [ DllStructGetData($structOutHitPosition, 1), DllStructGetData($structOutHitPosition, 2), DllStructGetData($structOutHitPosition, 3) ]
		$i_OutFalling = $result[9]
		Return True
	EndIf
EndFunc   ;==>_IrrGetCollisionResultPosition



;Lighting functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddLight
; Description ...: [todo]
; Syntax.........: _IrrAddLight($h_parentNode, $f_X, $f_Y, $f_Z, $f_Red, $f_Green, $f_Blue, $f_Size)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddLight($h_parentNode, $f_X, $f_Y, $f_Z, $f_Red, $f_Green, $f_Blue, $f_Size)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddLight", "UINT_PTR", $h_parentNode, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_Red, "float", $f_Green, "float", $f_Blue, "float", $f_Size)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddLight


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetAmbientLight
; Description ...: [todo]
; Syntax.........: _IrrSetAmbientLight($f_Red, $f_Green, $f_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetAmbientLight($f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetAmbientLight", "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetAmbientLight


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightAmbientColor
; Description ...: [todo]
; Syntax.........: _IrrSetLightAmbientColor($h_Light, $f_Red, $f_Green, $f_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightAmbientColor($h_Light, $f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightAmbientColor", "ptr", $h_Light, "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightAmbientColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightAttenuation
; Description ...: [todo]
; Syntax.........: _IrrSetLightAttenuation($h_Light, $f_Red, $f_Green, $f_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightAttenuation($h_Light, $f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightAttenuation", "ptr", $h_Light, "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightAttenuation


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightCastShadows
; Description ...: [todo]
; Syntax.........: _IrrSetLightCastShadows($h_Light, $i_Shadows)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightCastShadows($h_Light, $i_Shadows)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightAttenuation", "ptr", $h_Light, "int", $i_Shadows)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightCastShadows


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightDiffuseColor
; Description ...: [todo]
; Syntax.........: _IrrSetLightDiffuseColor($h_Light, $f_Red, $f_Green, $f_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightDiffuseColor($h_Light, $f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightDiffuseColor", "ptr", $h_Light, "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightDiffuseColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightFalloff
; Description ...: [todo]
; Syntax.........: _IrrSetLightFalloff($h_Light, $f_Falloff)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightFalloff($h_Light, $f_Falloff)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightFalloff", "ptr", $h_Light, "float", $f_Falloff)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightFalloff


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightInnerCone
; Description ...: [todo]
; Syntax.........: _IrrSetLightInnerCone($h_Light, $f_InnerCone)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightInnerCone($h_Light, $f_InnerCone)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightInnerCone", "ptr", $h_Light, "float", $f_InnerCone)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightInnerCone


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightOuterCone
; Description ...: [todo]
; Syntax.........: _IrrSetLightOuterCone($h_Light, $f_OuterCone)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightOuterCone($h_Light, $f_OuterCone)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightOuterCone", "ptr", $h_Light, "float", $f_OuterCone)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightOuterCone


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightRadius
; Description ...: [todo]
; Syntax.........: _IrrSetLightRadius($h_Light, $f_Radius)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightRadius($h_Light, $f_Radius)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightOuterCone", "ptr", $h_Light, "float", $f_Radius)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightRadius


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightSpecularColor
; Description ...: [todo]
; Syntax.........: _IrrSetLightSpecularColor($h_Light, $f_Red, $f_Green, $f_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightSpecularColor($h_Light, $f_Red, $f_Green, $f_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightSpecularColor", "ptr", $h_Light, "float", $f_Red, "float", $f_Green, "float", $f_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightSpecularColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetLightType
; Description ...: [todo]
; Syntax.........: _IrrSetLightType($h_Light, $i_Type)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetLightType($h_Light, $i_Type)
	DllCall($_irrDll, "none:cdecl", "IrrSetLightType", "ptr", $h_Light, "int", $i_Type)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetLightType

;Terrain functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddTerrain
; Description ...: [todo]
; Syntax.........: _IrrAddTerrain($s_Path, $f_PosX = 0.0, $f_PosY = 0.0, $f_PosZ = 0.0, $f_RotX = 0.0, $f_RotY = 0.0, $f_RotZ = 0.0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0, $i_VertexAlpha = 255, $i_VertexRed = 255, $i_VertexGreen = 255, $i_VertexBlue = 255, $i_Smoothing = 0, $i_MaxLOD = 5, $i_PatchSize = $ETPS_17)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddTerrain($s_Path, $f_PosX = 0.0, $f_PosY = 0.0, $f_PosZ = 0.0, $f_RotX = 0.0, $f_RotY = 0.0, $f_RotZ = 0.0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0, $i_VertexAlpha = 255, $i_VertexRed = 255, $i_VertexGreen = 255, $i_VertexBlue = 255, $i_Smoothing = 0, $i_MaxLOD = 5, $i_PatchSize = $ETPS_17)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddTerrain", "str", $s_Path, "float", $f_PosX, "float", $f_PosY, "float", $f_PosZ, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ, "float", $f_ScaleX, "float", $f_ScaleY, "float", $f_ScaleZ, "int", $i_VertexAlpha, "int", $i_VertexRed, "int", $i_VertexGreen, "int", $i_VertexBlue, "int", $i_Smoothing, "int", $i_MaxLOD, "int", $i_PatchSize)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddTerrain


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddTerrainTile
; Description ...: [todo]
; Syntax.........: _IrrAddTerrainTile($h_Image, $i_TileSize = 256, $i_DataX = 0, $i_DataY = 0, $f_PosX = 0.0, $f_PosY = 0.0, $f_PosZ = 0.0, $f_RotX = 0.0, $f_RotY = 0.0, $f_RotZ = 0.0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0, $i_Smoothing = 1, $i_MaxLOD = 5, $i_PatchSize = $ETPS_17)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddSphericalTerrain
; Description ...: [todo]
; Syntax.........: _IrrAddSphericalTerrain($s_TopPath, $s_FrontPath, $s_BackPath, $s_LeftPath, $RightPath, $s_BottomPath, $f_PosX = 0.0, $f_PosY = 0.0, $f_PosZ = 0.0, $f_RotX = 0.0, $f_RotY = 0.0, $f_RotZ = 0.0, $f_ScaleX = 1.0, $f_ScaleY = 1.0, $f_ScaleZ = 1.0, $i_VertexAlpha = 255, $i_VertexRed = 255, $i_VertexGreen = 255, $i_VertexBlue = 255, $i_Smoothing = 0, $i_Spherical = 0, $i_MaxLOD = 5, $i_PatchSize = $ETPS_17)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetTerrainHeight
; Description ...: [todo]
; Syntax.........: _IrrGetTerrainHeight($h_Terrain, $f_X, $f_Y)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetTerrainHeight($h_Terrain, $f_X, $f_Y)
	$result = DllCall($_irrDll, "float:cdecl", "IrrGetTerrainHeight", "ptr", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetTerrainHeight


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrScaleTexture
; Description ...: [todo]
; Syntax.........: _IrrScaleTexture($h_Terrain, $f_X, $f_Y)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrScaleTexture($h_Terrain, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrScaleTexture", "ptr", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrScaleTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetTerrainTileHeight
; Description ...: [todo]
; Syntax.........: _IrrGetTerrainTileHeight($h_Terrain, $f_X, $f_Y)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetTerrainTileHeight($h_Terrain, $f_X, $f_Y)
	$result = DllCall($_irrDll, "float:cdecl", "IrrGetTerrainTileHeight", "ptr", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetTerrainTileHeight


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrScaleTileTexture
; Description ...: [todo]
; Syntax.........: _IrrScaleTileTexture($h_Terrain, $f_X, $f_Y)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrScaleTileTexture($h_Terrain, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrScaleTileTexture", "UINT_PTR", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrScaleTileTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAttachTile
; Description ...: [todo]
; Syntax.........: _IrrAttachTile($h_Terrain, $h_Neighbor, $i_Edge)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAttachTile($h_Terrain, $h_Neighbor, $i_Edge)
	DllCall($_irrDll, "none:cdecl", "IrrAttachTile", "UINT_PTR", $h_Terrain, "UINT_PTR", $h_Neighbor, "uint", $i_Edge)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAttachTile


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetTileStructure
; Description ...: [todo]
; Syntax.........: _IrrSetTileStructure($h_Terrain, $h_Image, $i_X, $i_Y)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetTileStructure($h_Terrain, $h_Image, $i_X, $i_Y)
	DllCall($_irrDll, "none:cdecl", "IrrSetTileStructure", "UINT_PTR", $h_Terrain, "UINT_PTR", $h_Image, "int", $i_X, "int", $i_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTileStructure



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetTileColor
; Description ...: [todo]
; Syntax.........: _IrrSetTileColor($h_Terrain, $h_Image, $i_X=0, $i_Y=0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetTileColor($h_Terrain, $h_Image, $i_X=0, $i_Y=0)
	DllCall($_irrDll, "none:cdecl", "IrrSetTileColor", "UINT_PTR", $h_Terrain, "UINT_PTR", $h_Image, "int", $i_X, "int", $i_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetTileColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrScaleSphericalTexture
; Description ...: [todo]
; Syntax.........: _IrrScaleSphericalTexture($h_Terrain, $f_X, $f_Y)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrScaleSphericalTexture($h_Terrain, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrScaleSphericalTexture", "UINT_PTR", $h_Terrain, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrScaleSphericalTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetSphericalTerrainTexture
; Description ...: [todo]
; Syntax.........: _IrrSetSphericalTerrainTexture($h_Terrain, $s_Top, $s_Front, $s_Back, $s_Left, $s_Right, $s_Bottom, $i_MaterialIndex)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetSphericalTerrainTexture($h_Terrain, $s_Top, $s_Front, $s_Back, $s_Left, $s_Right, $s_Bottom, $i_MaterialIndex)
	DllCall($_irrDll, "none:cdecl", "IrrSetSphericalTerrainTexture", "UINT_PTR", $h_Terrain, "str", $s_Top, "str", $s_Front, "str", $s_Back, "str", $s_Left, "str", $s_Right, "str", $s_Bottom, "int", $i_MaterialIndex)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetSphericalTerrainTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrLoadSphericalTerrainVertexColor
; Description ...: [todo]
; Syntax.........: _IrrLoadSphericalTerrainVertexColor($h_Terrain, $s_Top, $s_Front, $s_Back, $s_Left, $s_Right, $s_Bottom)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrLoadSphericalTerrainVertexColor($h_Terrain, $s_Top, $s_Front, $s_Back, $s_Left, $s_Right, $s_Bottom)
	DllCall($_irrDll, "none:cdecl", "IrrLoadSphericalTerrainVertexColor", "ptr", $h_Terrain, "str", $s_Top, "str", $s_Front, "str", $s_Back, "str", $s_Left, "str", $s_Right, "str", $s_Bottom)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrLoadSphericalTerrainVertexColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetSphericalTerrainSurfacePosition
; Description ...: [todo]
; Syntax.........: _IrrGetSphericalTerrainSurfacePosition($h_Terrain, $i_Face, $f_LogicalX, $f_LogicalY, $f_LogicalZ)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetSphericalTerrainSurfacePosition($h_Terrain, $i_Face, $f_LogicalX, $f_LogicalY, $f_LogicalZ)
	Local $X = DllStructCreate("float")
	Local $Y = DllStructCreate("float")
	Local $Z = DllStructCreate("float")
	DllCall($_irrDll, "none:cdecl", "IrrGetSphericalTerrainSurfacePosition", "ptr", $h_Terrain, "int", $i_Face, "float", $f_LogicalX, "float", $f_LogicalY, "float", $f_LogicalZ, "float*", DllStructGetPtr($X), "float*", DllStructGetPtr($Y), "float*", DllStructGetPtr($Z))
	Local $result[3] = [DllStructGetData($X, 1), DllStructGetData($Y, 1), DllStructGetData($Z, 1)]
EndFunc   ;==>_IrrGetSphericalTerrainSurfacePosition


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetSphericalTerrainSurfacePositionAndAngle
; Description ...: [todo]
; Syntax.........: _IrrGetSphericalTerrainSurfacePositionAndAngle($h_Terrain, $i_Face, $f_LogicalX, $f_LogicalY, $f_LogicalZ)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetSphericalTerrainLogicalSurfacePosition
; Description ...: [todo]
; Syntax.........: _IrrGetSphericalTerrainLogicalSurfacePosition($h_Terrain, $i_Face, $f_LogicalX, $f_LogicalY, $f_LogicalZ)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetSphericalTerrainLogicalSurfacePosition($h_Terrain, $i_Face, $f_LogicalX, $f_LogicalY, $f_LogicalZ)
	Local $X = DllStructCreate("float")
	Local $Y = DllStructCreate("float")
	Local $Z = DllStructCreate("float")
	DllCall($_irrDll, "none:cdecl", "IrrGetSphericalTerrainLogicalSurfacePosition", "ptr", $h_Terrain, "int", $i_Face, "float", $f_LogicalX, "float", $f_LogicalY, "float", $f_LogicalZ, "float*", DllStructGetPtr($X), "float*", DllStructGetPtr($Y), "float*", DllStructGetPtr($Z))
	Local $result[3] = [DllStructGetData($X, 1), DllStructGetData($Y, 1), DllStructGetData($Z, 1)]
EndFunc   ;==>_IrrGetSphericalTerrainLogicalSurfacePosition

;Particle functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMinParticleSize
; Description ...: [todo]
; Syntax.........: _IrrSetMinParticleSize($h_Emitter, $f_X, $f_Y)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetMinParticleSize($h_Emitter, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrSetMinParticleSize", "ptr", $h_Emitter, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMinParticleSize


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMaxParticleSize
; Description ...: [todo]
; Syntax.........: _IrrSetMaxParticleSize($h_Emitter, $f_X, $f_Y)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetMaxParticleSize($h_Emitter, $f_X, $f_Y)
	DllCall($_irrDll, "none:cdecl", "IrrSetMaxParticleSize", "ptr", $h_Emitter, "float", $f_X, "float", $f_Y)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetMaxParticleSize



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddAnimatedMeshSceneNodeEmitter
; Description ...: [todo]
; Syntax.........: _IrrAddAnimatedMeshSceneNodeEmitter($h_ParticleSystem, $h_Node, $i_UseNormals, $f_NormalModifier, $i_AllVertices, $h_SettingsStruct)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddAnimatedMeshSceneNodeEmitter($h_ParticleSystem, $h_Node, $i_UseNormals, $f_NormalModifier, $i_AllVertices, $h_SettingsStruct)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddAnimatedMeshSceneNodeEmitter", "ptr", $h_ParticleSystem, "ptr", $h_Node, "int", $i_UseNormals, "float", $f_NormalModifier, "int", $i_AllVertices, "ptr", $h_SettingsStruct)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddAnimatedMeshSceneNodeEmitter



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddRotationAffector
; Description ...: [todo]
; Syntax.........: _IrrAddRotationAffector($h_ParticleSystem, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_PivotX, $f_pivotY, $f_pivotZ)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFadeOutParticleAffector
; Description ...: [todo]
; Syntax.........: _IrrAddFadeOutParticleAffector($h_ParticleSystem, $i_FadeFactor, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddFadeOutParticleAffector($h_ParticleSystem, $i_FadeFactor, $i_Red, $i_Green, $i_Blue)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFadeOutParticleAffector", "ptr", $h_ParticleSystem, "int", $i_FadeFactor, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFadeOutParticleAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddGravityParticleAffector
; Description ...: [todo]
; Syntax.........: _IrrAddGravityParticleAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddGravityParticleAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z)
	$result = DllCall($_irrDll, "ptr:cdecl", "_IrrAddGravityParticleAffector", "ptr", $h_ParticleSystem, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddGravityParticleAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddParticleAttractionAffector
; Description ...: [todo]
; Syntax.........: _IrrAddParticleAttractionAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_Speed = 1, $i_Attract = 1, $i_AffectX = 1, $i_AffectY = 1, $i_AffectZ = 1)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddParticleAttractionAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_Speed = 1, $i_Attract = 1, $i_AffectX = 1, $i_AffectY = 1, $i_AffectZ = 1)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddParticleAttractionAffector", "ptr", $h_ParticleSystem, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_Speed, "int", $i_Attract, "int", $i_AffectX, "int", $i_AffectY, "int", $i_AffectZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticleAttractionAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateRotationAffector
; Description ...: [todo]
; Syntax.........: _IrrCreateRotationAffector($h_ParticleSystem, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_RotX, $f_RotY, $f_RotZ)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateRotationAffector($h_ParticleSystem, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_RotX, $f_RotY, $f_RotZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateRotationAffector", "ptr", $h_ParticleSystem, "float", $f_SpeedX, "float", $f_SpeedY, "float", $f_SpeedZ, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateRotationAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddStopParticleAffector
; Description ...: [todo]
; Syntax.........: _IrrAddStopParticleAffector($h_ParticleSystem, $i_Time, $h_Emitter)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddStopParticleAffector($h_ParticleSystem, $i_Time, $h_Emitter)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddStopParticleAffector", "ptr", $h_ParticleSystem, "int", $i_Time, "ptr", $h_Emitter)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddStopParticleAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddParticlePushAffector
; Description ...: [todo]
; Syntax.........: _IrrAddParticlePushAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_Far, $f_Near, $f_Column, $i_Distant)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddParticlePushAffector($h_ParticleSystem, $f_X, $f_Y, $f_Z, $f_SpeedX, $f_SpeedY, $f_SpeedZ, $f_Far, $f_Near, $f_Column, $i_Distant)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddParticlePushAffector", "ptr", $h_ParticleSystem, "float", $f_X, "float", $f_Y, "float", $f_Z, "float", $f_SpeedX, "float", $f_SpeedY, "float", $f_SpeedZ, "float", $f_Far, "float", $f_Near, "float", $f_Column, "int", $i_Distant)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticlePushAffector


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddColorMorphAffector
; Description ...: [todo]
; Syntax.........: _IrrAddColorMorphAffector($h_ParticleSystem, $i_NumberOfParticles, $a_ParticleColors, $a_ParticleTimes, $i_Smooth)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddSplineAffector
; Description ...: [todo]
; Syntax.........: _IrrAddSplineAffector($h_ParticleSystem, $a_ParticleSpline, $f_Speed, $f_Tightness, $f_Attraction, $i_DeleteAtEnd)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveAffectors
; Description ...: [todo]
; Syntax.........: _IrrRemoveAffectors($h_ParticleSystem)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveAffectors($h_ParticleSystem)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAffectors", "ptr", $h_ParticleSystem)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAffectors


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterDirection
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterDirection($h_ParticleEmitter, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleEmitterDirection($h_ParticleEmitter, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterDirection", "ptr", $h_ParticleEmitter, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterDirection


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterMinParticlesPerSecond
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterMinParticlesPerSecond($h_ParticleEmitter, $i_Min)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleEmitterMinParticlesPerSecond($h_ParticleEmitter, $i_Min)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMinParticlesPerSecond", "ptr", $h_ParticleEmitter, "int", $i_Min)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMinParticlesPerSecond


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterMaxParticlesPerSecond
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterMaxParticlesPerSecond($h_ParticleEmitter, $i_Max)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleEmitterMaxParticlesPerSecond($h_ParticleEmitter, $i_Max)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMaxParticlesPerSecond", "ptr", $h_ParticleEmitter, "int", $i_Max)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMaxParticlesPerSecond


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterMinStartColor
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterMinStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleEmitterMinStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMinStartColor", "ptr", $h_ParticleEmitter, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMinStartColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleEmitterMaxStartColor
; Description ...: [todo]
; Syntax.........: _IrrSetParticleEmitterMaxStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleEmitterMaxStartColor($h_ParticleEmitter, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleEmitterMaxStartColor", "ptr", $h_ParticleEmitter, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleEmitterMaxStartColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAffectorEnable
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAffectorEnable($h_ParticleAffector, $i_Enabled)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleAffectorEnable($h_ParticleAffector, $i_Enabled)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAffectorEnable", "ptr", $h_ParticleAffector, "int", $i_Enabled)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAffectorEnable


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetFadeOutParticleAffectorTime
; Description ...: [todo]
; Syntax.........: _IrrSetFadeOutParticleAffectorTime($h_ParticleAffector, $f_Time)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetFadeOutParticleAffectorTime($h_ParticleAffector, $f_Time)
	DllCall($_irrDll, "none:cdecl", "IrrSetFadeOutParticleAffectorTime", "ptr", $h_ParticleAffector, "float", $f_Time)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetFadeOutParticleAffectorTime


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetFadeOutParticleAffectorTargetColor
; Description ...: [todo]
; Syntax.........: _IrrSetFadeOutParticleAffectorTargetColor($h_ParticleAffector, $i_Red, $i_Green, $i_Blue)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetFadeOutParticleAffectorTargetColor($h_ParticleAffector, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetFadeOutParticleAffectorTargetColor", "ptr", $h_ParticleAffector, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetFadeOutParticleAffectorTargetColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetGravityParticleAffectorDirection
; Description ...: [todo]
; Syntax.........: _IrrSetGravityParticleAffectorDirection($h_ParticleAffector, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetGravityParticleAffectorDirection($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetGravityParticleAffectorDirection", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGravityParticleAffectorDirection


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetGravityParticleAffectorTimeForceLost
; Description ...: [todo]
; Syntax.........: _IrrSetGravityParticleAffectorTimeForceLost($h_ParticleAffector, $f_TimeForceLost)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetGravityParticleAffectorTimeForceLost($h_ParticleAffector, $f_TimeForceLost)
	DllCall($_irrDll, "none:cdecl", "IrrSetGravityParticleAffectorTimeForceLost", "ptr", $h_ParticleAffector, "float", $f_TimeForceLost)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetGravityParticleAffectorTimeForceLost


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorAffectX
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorAffectX($h_ParticleAffector, $i_Affect)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleAttractionAffectorAffectX($h_ParticleAffector, $i_Affect)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAffectX", "ptr", $h_ParticleAffector, "int", $i_Affect)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAffectX


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorAffectY
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorAffectY($h_ParticleAffector, $i_Affect)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleAttractionAffectorAffectY($h_ParticleAffector, $i_Affect)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAffectY", "ptr", $h_ParticleAffector, "int", $i_Affect)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAffectY


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorAffectZ
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorAffectZ($h_ParticleAffector, $i_Affect)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleAttractionAffectorAffectZ($h_ParticleAffector, $i_Affect)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAffectZ", "ptr", $h_ParticleAffector, "int", $i_Affect)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAffectZ


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorAttract
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorAttract($h_ParticleAffector, $i_Attract)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleAttractionAffectorAttract($h_ParticleAffector, $i_Attract)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorAttract", "ptr", $h_ParticleAffector, "int", $i_Attract)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorAttract


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetParticleAttractionAffectorPoint
; Description ...: [todo]
; Syntax.........: _IrrSetParticleAttractionAffectorPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetParticleAttractionAffectorPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetParticleAttractionAffectorPoint", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetParticleAttractionAffectorPoint


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetRotationAffectorPivotPoint
; Description ...: [todo]
; Syntax.........: _IrrSetRotationAffectorPivotPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetRotationAffectorPivotPoint($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetRotationAffectorPivotPoint", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetRotationAffectorPivotPoint


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetFurthestDistanceOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetFurthestDistanceOfEffect($h_ParticleAffector, $f_Distance)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetFurthestDistanceOfEffect($h_ParticleAffector, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetFurthestDistanceOfEffect", "ptr", $h_ParticleAffector, "float", $f_Distance)
EndFunc   ;==>_IrrSetFurthestDistanceOfEffect


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetNearestDistanceOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetNearestDistanceOfEffect($h_ParticleAffector, $f_Distance)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetNearestDistanceOfEffect($h_ParticleAffector, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetNearestDistanceOfEffect", "ptr", $h_ParticleAffector, "float", $f_Distance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNearestDistanceOfEffect


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetColumnDistanceOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetColumnDistanceOfEffect($h_ParticleAffector, $f_Distance)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetColumnDistanceOfEffect($h_ParticleAffector, $f_Distance)
	DllCall($_irrDll, "none:cdecl", "IrrSetColumnDistanceOfEffect", "ptr", $h_ParticleAffector, "float", $f_Distance)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetColumnDistanceOfEffect


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetCenterOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetCenterOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetCenterOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetCenterOfEffect", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetCenterOfEffect


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetStrengthOfEffect
; Description ...: [todo]
; Syntax.........: _IrrSetStrengthOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetStrengthOfEffect($h_ParticleAffector, $f_X, $f_Y, $f_Z)
	DllCall($_irrDll, "none:cdecl", "IrrSetStrengthOfEffect", "ptr", $h_ParticleAffector, "float", $f_X, "float", $f_Y, "float", $f_Z)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetStrengthOfEffect

;Irrlicht GUI functions

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIClear
; Description ...: [todo]
; Syntax.........: _IrrGUIClear()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGUIClear()
	DllCall($_irrDll, "none:cdecl", "IrrGUIClear")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUIClear



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIEvents
; Description ...: [todo]
; Syntax.........: _IrrGUIEvents($i_EventsForGUI)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGUIEvents($i_EventsForGUI)
; whether keyboard and mouse events should be used by the GUI
	$result = DllCall($_irrDll, "int:cdecl", "IrrGUIEvents", "int", $i_EventsForGUI)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrGUIEvents



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIEventAvailable
; Description ...: [todo]
; Syntax.........: _IrrGUIEventAvailable()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrReadGUIEvent
; Description ...: [todo]
; Syntax.........: _IrrReadGUIEvent()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrReadGUIEvent()
; read a GUI event out
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrReadGUIEvent")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrReadGUIEvent



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIRemove
; Description ...: [todo]
; Syntax.........: _IrrGUIRemove($h_Widget)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGUIRemove($h_Widget)
	DllCall($_irrDll, "none:cdecl", "IrrGUIRemove", "ptr", $h_Widget)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUIRemove


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUIGetText
; Description ...: [todo]
; Syntax.........: _IrrGUIGetText($h_Widget)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGUIGetText($h_Widget)
	$result = DllCall($_irrDll, "wstr:cdecl", "IrrGUIGetText", "ptr", $h_Widget)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGUIGetText


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUISetText
; Description ...: [todo]
; Syntax.........: _IrrGUISetText($h_Widget, $s_Text)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGUISetText($h_Widget, $s_Text)
	DllCall($_irrDll, "none:cdecl", "IrrGUISetText", "ptr", $h_Widget, "wstr", $s_Text)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUISetText



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUISetFont
; Description ...: [todo]
; Syntax.........: _IrrGUISetFont($h_Font)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGUISetFont($h_Font)
	DllCall($_irrDll, "none:cdecl", "IrrGUISetFont", "UINT_PTR", $h_Font)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUISetFont



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGUISetColor
; Description ...: [todo]
; Syntax.........: _IrrGUISetColor($i_Element, $i_Red, $i_Green, $i_Blue, $i_Alpha)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGUISetColor($i_Element, $i_Red, $i_Green, $i_Blue, $i_Alpha)
; set the color of an element used by the gui
	DllCall($_irrDll, "none:cdecl", "IrrGUISetColor", "int", $i_Element, "int", $i_Red, "int", $i_Green, "int", $i_Blue, "int", $i_Alpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrGUISetColor



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddWindow
; Description ...: [todo]
; Syntax.........: _IrrAddWindow($s_Title, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Modal, $h_Parent = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddWindow($s_Title, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Modal, $h_Parent = 0)
; add a static text object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddWindow", "wstr", $s_Title, "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "uint", $i_Modal, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddWindow



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddStaticText
; Description ...: [todo]
; Syntax.........: _IrrAddStaticText($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Border, $i_WordWrap, $h_Parent = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddStaticText($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_Border, $i_WordWrap, $h_Parent = 0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddStaticText", "wstr", $s_Text, "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "uint", $i_Border, "uint", $i_WordWrap, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddStaticText



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddButton
; Description ...: [todo]
; Syntax.........: _IrrAddButton($i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $s_Text = "", $s_TextTip = "", $h_Parent = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddScrollBar
; Description ...: [todo]
; Syntax.........: _IrrAddScrollBar($i_Horizontal, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_CurrentValue, $i_MaxValue, $h_Parent = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddScrollBar($i_Horizontal, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_CurrentValue, $i_MaxValue, $h_Parent = 0)
; add a scrollbar object to the gui display
$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddScrollBar", "int", $i_Horizontal, "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_CurrentValue, "int", $i_MaxValue, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddScrollBar



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddListBox
; Description ...: [todo]
; Syntax.........: _IrrAddListBox($i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Background, $h_Parent=0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddListBox($i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Background, $h_Parent=0)
; add a listbox object containing a list of items to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddListBox", "int", $i_TopX, "int", $i_TopY, "int", $i_BottomX, "int", $i_BottomY, "int", $i_ID, "int", $i_Background, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddListBox


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddListBoxItem
; Description ...: [todo]
; Syntax.........: _IrrAddListBoxItem($h_ListBox, $s_Text)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddListBoxItem($h_ListBox, $s_Text)
	DllCall($_irrDll, "none:cdecl", "IrrAddListBoxItem", "ptr", $h_ListBox, "wstr", $s_Text)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrAddListBoxItem


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrInsertListBoxItem
; Description ...: [todo]
; Syntax.........: _IrrInsertListBoxItem($h_ListBox, $s_Text, $i_Index)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrInsertListBoxItem($h_ListBox, $s_Text, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrInsertListBoxItem", "ptr", $h_ListBox, "str", $s_Text, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrInsertListBoxItem


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveListBoxItem
; Description ...: [todo]
; Syntax.........: _IrrRemoveListBoxItem($h_ListBox, $i_Index)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrRemoveListBoxItem($h_ListBox, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveListBoxItem", "ptr", $h_ListBox, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveListBoxItem


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSelectListBoxItem
; Description ...: [todo]
; Syntax.........: _IrrSelectListBoxItem($h_ListBox, $i_Index)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSelectListBoxItem($h_ListBox, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrSelectListBoxItem", "ptr", $h_ListBox, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSelectListBoxItem



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddEditBox
; Description ...: [todo]
; Syntax.........: _IrrAddEditBox($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Border, $i_Password = $IRR_GUI_NOT_PASSWORD, $h_Parent = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddCheckBox
; Description ...: [todo]
; Syntax.........: _IrrAddCheckBox($s_Text, $i_TopX, $i_TopY, $i_BottomX, $i_BottomY, $i_ID, $i_Checked, $h_Parent = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCheckCheckBox
; Description ...: [todo]
; Syntax.........: _IrrCheckCheckBox($h_CheckBox, $i_Checked)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCheckCheckBox($h_CheckBox, $i_Checked)
	DllCall($_irrDll, "none:cdecl", "IrrCheckCheckBox", "ptr", $h_CheckBox, "int", $i_Checked)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrCheckCheckBox



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddImage
; Description ...: [todo]
; Syntax.........: _IrrAddImage($h_Texture, $i_X, $i_Y, $i_UseAlpha, $i_ID, $h_Parent = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddImage($h_Texture, $i_X, $i_Y, $i_UseAlpha, $i_ID, $h_Parent = 0)
; add an image object to the gui display
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddImage", "UINT_PTR", $h_Texture, "int", $i_X, "int", $i_Y, "int", $i_UseAlpha, "int", $i_ID, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddImage



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddFileOpen
; Description ...: [todo]
; Syntax.........: _IrrAddFileOpen($s_Title, $i_ID, $i_Modal, $h_Parent = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddFileOpen($s_Title, $i_ID, $i_Modal, $h_Parent = 0)
; open a modal file open dialog
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFileOpen", "wstr", $s_Title, "int", $i_ID, "int", $i_Modal, "ptr", $h_Parent)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFileOpen



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrGetLastSelectedFile
; Description ...: [todo]
; Syntax.........: _IrrGetLastSelectedFile()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrGetLastSelectedFile()
; get the last file name selected from a file selection dialog
	$result = DllCall($_irrDll, "wstr:cdecl", "IrrGetLastSelectedFile")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrGetLastSelectedFile


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrCreateBatchingMesh
; Description ...: [todo]
; Syntax.........: _IrrCreateBatchingMesh()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrCreateBatchingMesh()
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrCreateBatchingMesh")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrCreateBatchingMesh


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddToBatchingMesh
; Description ...: [todo]
; Syntax.........: _IrrAddToBatchingMesh($h_meshBatch, $h_mesh, $f_posX = 0.0, $f_posY = 0.0, $f_posZ = 0.0, $f_rotX = 0.0, $f_rotY = 0.0, $f_rotZ = 0.0, $f_scaleX = 1.0, $f_scaleY = 1.0, $f_scaleZ = 1.0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrFinalizeBatchingMesh
; Description ...: [todo]
; Syntax.........: _IrrFinalizeBatchingMesh($h_meshBatch)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrFinalizeBatchingMesh($h_meshBatch)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrFinalizeBatchingMesh", "ptr", $h_meshBatch)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrFinalizeBatchingMesh


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetMeshMaterialTexture
; Description ...: [todo]
; Syntax.........: _IrrSetMeshMaterialTexture($h_mesh, $h_texture, $i_index, $i_buffer = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetMeshMaterialTexture($h_mesh, $h_texture, $i_index, $i_buffer = 0)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetMeshMaterialTexture", "ptr", $h_mesh, "ptr", $h_texture, "int", $i_index, "int", $i_buffer)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrSetMeshMaterialTexture


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrScaleMesh
; Description ...: [todo]
; Syntax.........: _IrrScaleMesh($h_mesh, $f_scale, $i_frame = 0, $i_meshBuffer = 0, $h_sourceMesh = 0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrScaleMesh($h_mesh, $f_scale, $i_frame = 0, $i_meshBuffer = 0, $h_sourceMesh = 0)
	$result = DllCall($_irrDll, "none:cdecl", "IrrScaleMesh", "ptr", $h_mesh, "float", $f_scale, "int", $i_frame, "int", $i_meshBuffer, "ptr", $h_sourceMesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrScaleMesh


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddBeamSceneNode
; Description ...: [todo]
; Syntax.........: _IrrAddBeamSceneNode()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddBeamSceneNode()
; add a beam node to the scene
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddBeamSceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddBeamSceneNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetBeamSize
; Description ...: [todo]
; Syntax.........: _IrrSetBeamSize($h_BeamNode, $f_Size)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetBeamSize($h_BeamNode, $f_Size)
; set the size of a beam
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetBeamSize", "ptr", $h_BeamNode, "float", $f_Size)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetBeamSize


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetBeamPosition
; Description ...: [todo]
; Syntax.........: _IrrSetBeamPosition($h_BeamNode, $f_SX, $f_SY, $f_SZ, $f_EX, $f_EY, $f_EZ)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddBoltSceneNode
; Description ...: [todo]
; Syntax.........: _IrrAddBoltSceneNode()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddBoltSceneNode()
; add a bolt node to the scene
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddBoltSceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddBoltSceneNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetBoltProperties
; Description ...: [todo]
; Syntax.........: _IrrSetBoltProperties($h_BoltNode, $f_SX, $f_SY, $f_SZ, $f_EX, $f_EY, $f_EZ, $i_UpdateTime=50, $i_Height=10, $f_Thickness=5.0, $i_Parts=10, $i_Bolts=6, $i_Steadyend=$IRR_OFF, $i_Color=0x0000FFFF)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetBillBoardSize
; Description ...: [todo]
; Syntax.........: _IrrSetBillBoardSize($h_Node, $f_Width, $f_Height)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrSetBillBoardSize($h_Node, $f_Width, $f_Height)
; sets the size of a billboard node
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetBillBoardSize", "ptr", $h_Node, "float", $f_Width, "float", $f_Height)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetBillBoardSize


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrSetBillBoardColor
; Description ...: [todo]
; Syntax.........: _IrrSetBillBoardColor($h_Node, $i_TopColor, $i_BottomColor)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsStart
; Description ...: [todo]
; Syntax.........: _IrrXEffectsStart($i_Vsm=$IRR_OFF, $i_SoftShadows=$IRR_OFF, $iBitdepth32=$IRR_OFF)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrXEffectsStart($i_Vsm=$IRR_OFF, $i_SoftShadows=$IRR_OFF, $iBitdepth32=$IRR_OFF)
; start the XEffects system
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsStart", "int", $i_Vsm, "int", $i_SoftShadows, "int", $iBitdepth32)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsStart


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsAddShadowToNode
; Description ...: [todo]
; Syntax.........: _IrrXEffectsAddShadowToNode($h_Node, $i_FilterType=$EFT_NONE, $i_shadowType=$ESM_BOTH)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrXEffectsAddShadowToNode($h_Node, $i_FilterType=$EFT_NONE, $i_shadowType=$ESM_BOTH)
; start the XEffects system
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrXEffectsAddShadowToNode", "ptr", $h_Node, "int", $i_FilterType, "int", $i_shadowType)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrXEffectsAddShadowToNode


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsAddShadowLight
; Description ...: [todo]
; Syntax.........: _IrrXEffectsAddShadowLight($i_ShadowDimen, $f_PosX, $f_PosY, $f_PosZ, $f_TargetX, $f_TargetY, $f_TargetZ, $f_R, $f_G, $f_B, $f_Alpha, $f_LightNearDist, $f_LightFarDist, $f_AngleDegrees )
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsSetAmbientColor
; Description ...: [todo]
; Syntax.........: _IrrXEffectsSetAmbientColor($i_R, $i_G, $i_B, $i_Alpha)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrXEffectsSetAmbientColor($i_R, $i_G, $i_B, $i_Alpha)
; sets the ambient lighting procuded in the scene by the XEffects system
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsSetAmbientColor", "uint", $i_R, "uint", $i_G, "uint", $i_B, "uint", $i_Alpha)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsSetAmbientColor


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsSetClearColor
; Description ...: [todo]
; Syntax.........: _IrrXEffectsSetClearColor($i_R, $i_G, $i_B, $i_Alpha)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsSetShadowLightPosition
; Description ...: [todo]
; Syntax.........: _IrrXEffectsSetShadowLightPosition($i_Index, $f_PosX, $f_PosY, $f_PosZ)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsEnableDepthPass
; Description ...: [todo]
; Syntax.........: _IrrXEffectsEnableDepthPass($i_Enable)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrXEffectsEnableDepthPass($i_Enable)
; enable XEffects depth pass
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsEnableDepthPass", "int", $i_Enable)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsEnableDepthPass


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsAddPostProcessingFromFile
; Description ...: [todo]
; Syntax.........: _IrrXEffectsAddPostProcessingFromFile($s_Name, $i_Enable=0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrXEffectsAddPostProcessingFromFile($s_Name, $i_Enable=0)
; enable XEffects depth pass
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsAddPostProcessingFromFile", "str", $s_Name, "int", $i_Enable)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsAddPostProcessingFromFile


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsAddNodeToDepthPass
; Description ...: [todo]
; Syntax.........: _IrrXEffectsAddNodeToDepthPass($h_Node)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrXEffectsAddNodeToDepthPass($h_Node)
; adds a node to the list of nodes used for calculating the depth pass
	$result = DllCall($_irrDll, "none:cdecl", "IrrXEffectsAddNodeToDepthPass", "ptr", $h_Node)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrXEffectsAddNodeToDepthPass


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrXEffectsSetPostProcessingUserTexture
; Description ...: [todo]
; Syntax.........: _IrrXEffectsSetPostProcessingUserTexture($h_Texture)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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



; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: xxx__CreateParticleEmitter
; Description ...: [todo]
; Syntax.........: xxx__CreateParticleEmitter($f_MinBoxX, $f_MinBoxY, $f_MinBoxZ, $f_MaxBoxX, $f_MaxBoxY, $f_MaxBoxZ, $f_DirectionX, $f_DirectionY, $f_DirectionZ, $i_MinParticlesPerSecond, $i_MaxParticlesPerSecond, $i_MinStartRed, $i_MinStartGreen, $i_MinStartBlue, $i_MaxStartRed, $i_MaxStartGreen, $i_MaxStartBlue, $i_MinLifetime, $i_MaxLifetime, $f_MinStartSizeX, $f_MinStartSizeY, $f_MaxStartSizeX, $f_MaxStartSizeY, $i_MaxAngle)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __CreateVertex
; Description ...: [todo]
; Syntax.........: __CreateVertex($f_X, $f_Y, $f_Z, $f_NormalX, $f_NormalY, $f_NormalZ, $i_ARGB, $f_TextureX, $f_TextureY)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __CreateVector
; Description ...: [todo]
; Syntax.........: __CreateVector($f_X, $f_Y, $f_Z)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func __CreateVector($f_X, $f_Y, $f_Z)
	Local $VectorStruct = DllStructCreate("float;float;float")
	DllStructSetData($VectorStruct, 1, $f_X)
	DllStructSetData($VectorStruct, 2, $f_Y)
	DllStructSetData($VectorStruct, 3, $f_Z)
	Return $VectorStruct
EndFunc   ;==>___CreateVector



Global enum _ ; enumeration KEY_EVENT for possible Elements readable by __getKeyEvt
	$EVT_KEY_IKEY = 1,	_ 	; unsigned integer "key"
	$EVT_KEY_IDIRECTION, _ 	; unsigned integer "direction"
	$EVT_KEY_IFLAGS			; unsigned integer "flags"

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __getKeyEvt
; Description ...: [todo]
; Syntax.........: __getKeyEvt($p_KeyEvent, $i_Element = $EVT_KEY_IKEY)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __getMouseEvt
; Description ...: [todo]
; Syntax.........: __getMouseEvt($p_MouseEvent, $i_Element = $EVT_MOUSE_IACTION)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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


; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __getGuiEvt
; Description ...: [todo]
; Syntax.........: __getGuiEvt($p_GUIEvent, $i_Element = $EVT_GUI_IID)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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

; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __CreateIrrModel
; Description ...: [todo]
; Syntax.........: __CreateIrrModel()
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func __CreateIrrModel()
	Local $irrModel = DllStructCreate("UINT_PTR node;UINT_PTR camera;UINT_PTR terrain;UINT_PTR particles")
	DllStructSetData($irrModel, "node", 0)
	DllStructSetData($irrModel, "camera", 0)
	DllStructSetData($irrModel, "terrain", 0)
	DllStructSetData($irrModel, "particles", 0)
	return $irrModel
EndFunc ;==> __CreateIrrModel




; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: __CreateParticleEmitter
; Description ...: [todo]
; Syntax.........: __CreateParticleEmitter($f_MinBoxX, $f_MinBoxY, $f_MinBoxZ, $f_MaxBoxX, $f_MaxBoxY, $f_MaxBoxZ, $f_DirectionX, $f_DirectionY, $f_DirectionZ, $i_MinParticlesPerSecond, $i_MaxParticlesPerSecond, $i_MinStartRed, $i_MinStartGreen, $i_MinStartBlue, $i_MaxStartRed, $i_MaxStartGreen, $i_MaxStartBlue, $i_MinLifetime, $i_MaxLifetime, $f_MinStartSizeX, $f_MinStartSizeY, $f_MaxStartSizeX, $f_MaxStartSizeY, $i_MaxAngle)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
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




; #NO_DOC_FUNCTION# =============================================================================================================
; Name...........: _IrrAddParticleEmitter
; Description ...: [todo]
; Syntax.........: _IrrAddParticleEmitter($h_ParticleSystem, $h_SettingsStruct)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddParticleEmitter($h_ParticleSystem, $h_SettingsStruct)
; create an emitter that can be added to a particle system

	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddParticleEmitter", "UINT_PTR", $h_ParticleSystem, "UINT_PTR", $h_SettingsStruct)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddParticleEmitter



