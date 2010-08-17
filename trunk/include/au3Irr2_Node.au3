#include-once

#include "au3Irr2_constants.au3"

; #INDEX# =======================================================================================================================
; Title .........: Node
; AutoIt Version : v3.3.6.1
; Language ......: English
; Description ...: Calls for manipulating, texturing and getting information from nodes in the scene.
; Author(s) .....: jRowe, linus.
;                  DLL functionality by Frank Dodd (IrrlichtWrapper), Nikolaus Gebhardt and Irrlicht team (Irrlicht).
; Dll(s) ........: IrrlichtWrapper.dll, Irrlicht.dll, msvcp71.dll
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Not working/documented/implemented at this time
;_IrrGetNodeName
;_IrrSetNodeName
;_IrrGetMaterialCount
;_IrrGetMaterial
;_IrrSetNodeMaterialType
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
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;_IrrSetNodeMaterialTexture
;_IrrSetNodeMaterialFlag
;_IrrSetNodePosition
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeMaterialTexture
; Description ...: Applys a texture to a node in the scene.
; Syntax.........: _IrrSetNodeMaterialTexture($h_Node, $h_Texture, $i_Index)
; Parameters ....: $h_Node - Handle of a node in the scene
;                  $h_Texture - Handle of a texture object
;                  $i_Index - Material index number of the material layer, usually 0 or 1.
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: How the texture is applied across the surface of the node will depend on the texturing coordinates in each of the vectors of the mesh and how they are plotted across the surface of the texture.
;                  Some nodes can have several textures applied to them to create special material effects.
; Related .......: _IrrSetNodeMaterialFlag, _IrrSetNodeMaterialType
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _IrrSetNodeMaterialTexture($h_Node, $h_Texture, $i_Index)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeMaterialTexture", "UINT_PTR", $h_Node, "UINT_PTR", $h_Texture, "int", $i_Index)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeMaterialTexture


; #FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodeMaterialFlag
; Description ...: Sets material properies of a node that will effect its appearance on the screen.
; Syntax.........: _IrrSetNodeMaterialFlag($h_Node, $i_Type, $i_Flag)
; Parameters ....: $h_Node - Handle of a node in the scene
;                  $i_Type - Material type is one of the following properties:
;                  |$IRR_EMF_WIREFRAME - Render as wireframe outline
;                  |$IRR_EMF_GOURAUD_SHADING - Render smoothly across polygons
;                  |$IRR_EMF_LIGHTING - Material is effected by lighting
;                  |$IRR_EMF_ZBUFFER - Enable z buffer
;                  |$IRR_EMF_ZWRITE_ENABLE - Can write as well as read z buffer
;                  |$IRR_EMF_BACK_FACE_CULLING - Cull polygons facing away
;                  |$IRR_EMF_BILINEAR_FILTER - Enable bilinear filtering
;                  |$IRR_EMF_TRILINEAR_FILTER - Enable trilinear filtering
;                  |$IRR_EMF_ANISOTROPIC_FILTER - Reduce blur in distant textures
;                  |$IRR_EMF_FOG_ENABLE - Enable fogging in the distance
;                  |$IRR_EMF_NORMALIZE_NORMALS - Use when scaling dynamically lighted models
;                  $i_Flag - Switches selected property on or off:
;                  |$IRR_ON
;                  |$IRR_OFF
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: None.
; Related .......: _IrrSetNodeMaterialTexture, _IrrSetNodeMaterialType
; Link ..........:
; Example .......: No
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
; Related .......: _IrrSetNodeMaterialTexture, _IrrSetNodeMaterialFlag
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _IrrSetNodeMaterialType($h_Node, $i_Type)
	DllCall($_irrDll, "none:cdecl", "IrrSetNodeMaterialType", "UINT_PTR", $h_Node, "int", $i_Type)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrSetNodeMaterialType


; #FUNCTION# =============================================================================================================
; Name...........: _IrrSetNodePosition
; Description ...: Moves the node to the new position.
; Syntax.........: _IrrSetNodePosition($h_Node, $f_X, $f_Y, $f_Z)
; Parameters ....: $h_Node - Handle of a scene node
;                  $f_X - X value of new position
;                  $f_Y - Y value of new position
;                  $f_Z - Z value of new position
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: None
; Link ..........:
; Example .......: None
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








