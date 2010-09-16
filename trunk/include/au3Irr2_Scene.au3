#include-once

#include "au3Irr2_constants.au3"

; #INDEX# =======================================================================================================================
; Title .........: Scene
; AutoIt Version : v3.3.6.1
; Language ......: English
; Description ...: Calls for managing the scene, loading and creating mesh objects and then adding them to the scene
;                  as nodes to be rendered on the screen.
; Author(s) .....: jRowe, linus.
;                  DLL functionality by Frank Dodd and IrrlichtWrapper for FreeBasic team (IrrlichtWrapper.dll),
;                  and Nikolaus Gebhardt and Irrlicht team (Irrlicht.dll).
; Dll(s) ........: IrrlichtWrapper.dll, Irrlicht.dll, msvcp71.dll, msvcr71.dll
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Not working/documented/implemented at this time
;_IrrCreateMesh
;_IrrAddSphereSceneMesh
;_IrrWriteMesh
;_IrrGetMeshFrameCount
;_IrrGetMeshBufferCount
;_IrrGetMeshIndexCount
;_IrrGetMeshVertexCount
;_IrrAddParticleSystemToScene
;_IrrAddEmptySceneNode
;_IrrSetZoneManagerAttachTerrain
;_IrrGetGrassDrawCount
;_IrrSetFlareScale
;__CreateVertex
;__CreateVector
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;_IrrGetRootSceneNode
;_IrrGetMesh
;_IrrAddHillPlaneMesh
;_IrrRemoveMesh
;_IrrClearUnusedMeshes
;_IrrSetMeshHardwareAccelerated
;_IrrAddMeshToScene
;_IrrAddMeshToSceneAsOcttree
;_IrrAddStaticMeshForNormalMappingToScene
;_IrrLoadScene
;_IrrSaveScene
;_IrrGetSceneNodeFromId
;_IrrGetSceneNodeFromName
;_IrrAddBillBoardToScene
;_IrrAddBillboardTextSceneNode
;_IrrAddSkyBoxToScene
;_IrrAddSkyDomeToScene
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
;_IrrSetGrassDensity
;_IrrSetGrassWind
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
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrGetMesh
; Description ...: Loads the specified mesh ready to be added to the scene.
; Syntax.........: _IrrGetMesh($s_MeshFile)
; Parameters ....: $s_MeshFile - Filename of the mesh object to load
; Return values .: Success - Handle of the loaded mesh object
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: The Irrlicht engine supports a wide range of mesh types.
;                  <br><b>Static objects:</b>
;                  @@StandardTable@@
;                  Irrlicht static meshes (.irrmesh, r/w)	3D Studio meshes (.3ds, r)
;                  |Alias Wavefront Maya (.obj, r/w)	Lightwave Objects (.lwo, r)
;                  |COLLADA 1.4 (.xml, .dae, r/w)	OGRE meshes (.mesh, r)
;                  |My3DTools 3 (.my3D, r)	LMTools (.lmts, r)
;                  |Quake 3 levels (.bsp, r)	DeleD (.dmf, r)
;                  |FSRad oct (.oct, r)	Cartography shop 4 (.csm, r)
;                  |STL 3D files (.stl, r/w)	PLY 3D files (.ply, r/w)
;                  @@End@@
;                  <br><b>Animated objects:</b>
;                  @@StandardTable@@
;                  B3D files (.b3d, r, skeleton)	Microsoft DirectX (.x, r) (binary & text, skeleton)
;                  |Milkshape (.ms3d, r, skeleton)	Quake 3 models (.md3, r, morph)
;                  |Quake 2 models (.md2, r, morph)
;                  @@End@@
; Related .......: _IrrAddMeshToScene, _IrrRemoveMesh
; Link ..........:
; Example .......: Yes
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
; Name...........: _IrrAddSphereSceneMesh
; Description ...: [todo]
; Syntax.........: _IrrAddSphereSceneMesh($s_MeshName, $f_Radius, $i_PolyCount)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: [success] - [explanation]
;                  [failure] - [explanation]
;                  |[moreExplanationIndented]
; Author ........: [todo]
; Modified.......:
; Remarks .......: [todo]
; Related .......: [todo: functionName, functionName]
; Link ..........:
; Example .......: [todo: Yes, No]
; ===============================================================================================================================
Func _IrrAddSphereSceneMesh($s_MeshName, $f_Radius, $i_PolyCount)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSphereSceneMesh", "str", $s_MeshName, "float", $f_Radius, "int", $i_PolyCount)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>IrrAddSphereSceneMesh



; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveMesh
; Description ...: Removes a mesh from the scene cache, freeing up resources.
; Syntax.........: _IrrRemoveMesh($h_Mesh)
; Parameters ....: $h_Mesh - Handle of a mesh object
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrGetMesh
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrRemoveMesh($h_Mesh)
	$result = DllCall($_irrDll, "none:cdecl", "IrrRemoveMesh", "ptr", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrRemoveMesh


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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



; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddMeshToScene
; Description ...: Adds a mesh to the scene as a new 3D node.
; Syntax.........: _IrrAddMeshToScene($h_Mesh)
; Parameters ....: $h_Mesh - Handle of a mesh object
; Return values .: Success - Handle of the new node in the scene
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrGetMesh
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddMeshToScene($h_Mesh)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddMeshToScene", "UINT_PTR", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddMeshToScene


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddMeshToSceneAsOcttree
; Description ...: Adds a mesh to the scene as a new 3D node, optimised with an Octtree.
; Syntax.........: _IrrAddMeshToSceneAsOcttree($h_Mesh)
; Parameters ....: $h_Mesh - Handle of an mesh object
; Return values .: Success - Handle to the irrlicht node object
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: This method optimise's the mesh with an Octtree, this is particularly useful for maps where there is a lot of geometry in the mesh but little of it can be seen at any one time.
;                  Optimizing your node with this function will result in a large increase in performance.
; Related .......: None
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddMeshToSceneAsOcttree($h_Mesh)
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddMeshToSceneAsOcttree", "UINT_PTR", $h_Mesh)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddMeshToSceneAsOcttree


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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



; #FUNCTION# =============================================================================================================
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



; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddBillBoardToScene
; Description ...: Adds a billboard to the scene of the specified size and at the specified position.
; Syntax.........: _IrrAddBillBoardToScene($f_XSize, $f_YSize, $f_XPos = 0.0, $f_YPos = 0.0, $f_ZPos = 0.0)
; Parameters ....: $f_XSize - X size of the node
;                  $f_YSize - Y size of the node
;                  $f_XPos - [optional] X position
;                  $f_YPos - [optional] Y position
;                  $f_ZPos - [optional] Z position
; Return values .: Success - Handle of the new billboard scene node
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: A billboard is a flat 3D textured sprite that always faces towards the camera. You need to texture this element with a separate command.
; Related .......: _IrrSetNodeMaterialTexture, _IrrSetNodeMaterialFlag
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddBillBoardToScene($f_XSize, $f_YSize, $f_XPos = 0.0, $f_YPos = 0.0, $f_ZPos = 0.0)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddBillBoardToScene", "float", $f_XSize, "float", $f_YSize, "float", $f_XPos, "float", $f_YPos, "float", $f_ZPos)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddBillBoardToScene


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddSkyBoxToScene
; Description ...: Adds a skybox node to the scene.
; Syntax.........: _IrrAddSkyBoxToScene($h_UpTexture, $h_DownTexture, $h_LeftTexture, $h_RightTexture, $h_FrontTexture, $h_BackTexture)
; Parameters ....: $h_UpTexture - Handle of the top side texture
;                  $h_DownTexture - Handle of the bottom side texture
;                  $h_LeftTexture - Handle of the left side texture
;                  $h_RightTexture - Handle of the right side texture
;                  $h_FrontTexture - Handle of the front side texture
;                  $h_BackTexture - Handle of the back side texture
; Return values .: success - Handle of the skybox node
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: A skybox is a huge hollow cube that encapsulates the entire scene and has a different texture applied to each of its six surfaces to represent a distant sky or matte scene.
; Related .......: _IrrAddSkyDomeToScene
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddSkyBoxToScene($h_UpTexture, $h_DownTexture, $h_LeftTexture, $h_RightTexture, $h_FrontTexture, $h_BackTexture)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSkyBoxToScene", "ptr", $h_UpTexture, "ptr", $h_DownTexture, "ptr", $h_LeftTexture, "ptr", $h_RightTexture, "ptr", $h_FrontTexture, "ptr", $h_BackTexture)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSkyBoxToScene



; #FUNCTION# =============================================================================================================
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
; Related .......: _IrrAddSkyBoxToScene, _IrrSetSkyDomeColor, _IrrSetSkyDomeColorBand, _IrrSetSkyDomeColorPoint
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddTestSceneNode
; Description ...: Adds a simple cube node to the scene
; Syntax.........: _IrrAddTestSceneNode()
; Parameters ....: None
; Return values .: success - Handle of the cube scene node
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: The test scene node is a cube with fixed dimensions mainly for test purposes.
; Related .......: _IrrAddCubeSceneNode, _IrrAddSphereSceneNode
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddTestSceneNode()
	$result = DllCall($_irrDll, "UINT_PTR:cdecl", "IrrAddTestSceneNode")
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddTestSceneNode


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddCubeSceneNode
; Description ...: Adds a cube object to the scene with the specified dimensions.
; Syntax.........: _IrrAddCubeSceneNode($f_Size)
; Parameters ....: $f_Size - Edge length of the cube.
; Return values .: success - Handle of the cube scene node
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrAddTestSceneNode, _IrrAddSphereSceneNode
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddCubeSceneNode($f_Size)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCubeSceneNode", "float", $f_Size)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCubeSceneNode


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddSphereSceneNode
; Description ...: Adds a simple sphere object to the scene
; Syntax.........: _IrrAddSphereSceneNode($f_Size, $i_PolyCount = 16)
; Parameters ....: $f_Size - Radius of the sphere
;                  $i_PolyCount - [optional] Level of detail for the sphere.
;                  |Too high values could produce a very high density mesh and affect your frame rate adversely.
; Return values .: success - Handle of the sphere scene node
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrAddTestSceneNode, _IrrAddCubeSceneNode
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddSphereSceneNode($f_Size, $i_PolyCount = 16)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSphereSceneNode", "float", $f_Size, "int", $i_PolyCount)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSphereSceneNode



; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrSetShadowColor
; Description ...: Sets the colour of shadows cast by objects in the scene.
; Syntax.........: _IrrSetShadowColor($i_Alpha, $i_Red, $i_Green, $i_Blue)
; Parameters ....: $i_Alpha - Alpha blend for the shadow.
;                  |Value of 128 would mean a half washed out shadow which gives the appearence of ambient light in the room illuminating the shadowed surface.
;                  $i_Red, $i_Green, $i_Blue - Colour values for shadow colour from 0 to 255.
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: The shadow colour is a global property for the whole scene (however you can change it when moving into different areas of your scene).
;                  If you are observing a bright scene you might use a light grey shadow instead of a heavy black shadow to add to realism.
; Related .......: _IrrAddNodeShadow, _IrrAddLight
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrSetShadowColor($i_Alpha, $i_Red, $i_Green, $i_Blue)
	DllCall($_irrDll, "none:cdecl", "IrrSetShadowColor", "int", $i_Alpha, "int", $i_Red, "int", $i_Green, "int", $i_Blue)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetShadowColor


; #FUNCTION# =============================================================================================================
; Name...........: _IrrSetFog
; Description ...: Set the properties of fog in the scene
; Syntax.........: _IrrSetFog($i_Red, $i_Green, $i_Blue, $i_FogType, $f_FogStart, $f_FogEnd, $f_Density = 0.025)
; Parameters ....: $i_Red, $i_Green, $i_Blue - Define colour of the fog (0-255).
;                  |Should be set to the same colour as the scene sky so the scene fogs out nicely into nothing.
;                  $i_FogType - Defines how the fog is calculated:
;                  |$IRR_LINEAR_FOG - computed as [end - distance / end - start], density value is not used.
;                  |$IRR_EXPONENTIAL_FOG - computed as [1 / (2.718^(distance * densitiy))], both start and end values are not used.
;                  $f_FogStart, $f_FogEnd - Distances at which the fog starts and at which it reaches its maximum density.
;                  |Values are ignored for exponential fog.
;                  $f_Density - [optional] Determines how quickly the exponential change takes place, with value from 0 to 1.
;                  |Example: A value of 0.025 equals 20% visibility at 50 units distance. Value is ignored for linear fog.
; Return values .: success - True
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: None.
; Related .......: None.
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrSetFog($i_Red, $i_Green, $i_Blue, $i_FogType, $f_FogStart, $f_FogEnd, $f_Density = 0.001)
	$result = DllCall($_irrDll, "none:cdecl", "IrrSetFog", "int", $i_Red, "int", $i_Green, "int", $i_Blue, "int", $i_FogType, "float", $f_FogStart, "float", $f_FogEnd, "float", $f_Density)
	if @error Then
		Return Seterror(1,0,False)
	Else
		Return True
	EndIf
EndFunc   ;==>_IrrSetFog


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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
