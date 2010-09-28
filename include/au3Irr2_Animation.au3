#include-once

#include "au3Irr2_constants.au3"
#include "au3Irr2_system.au3"

; #INDEX# =======================================================================================================================
; Title .........: Animation
; AutoIt Version : v3.3.6.1
; Language ......: English
; Description ...: Calls that control the animation of nodes in the scene either by playing animation that is embedded
;                  in the mesh or applying animator controls to automatically effect the nodes.
; Author(s) .....: jRowe, linus.
;                  DLL functionality by Frank Dodd and IrrlichtWrapper for FreeBasic team (IrrlichtWrapper.dll),
;                  and Nikolaus Gebhardt and Irrlicht team (Irrlicht.dll).
; Dll(s) ........: IrrlichtWrapper.dll, Irrlicht.dll, msvcp71.dll, msvcr71.dll
; ===============================================================================================================================

; #NO_DOC_FUNCTION# =============================================================================================================
; Not working/documented/implemented at this time
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
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
; ===============================================================================================================================

; #INTERNAL_USE_ONLY# ===========================================================================================================
; ===============================================================================================================================

; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrPlayNodeMD2Animation
; Description ...: Selects the animation sequence of MD2 to be played.
; Syntax.........: _IrrPlayNodeMD2Animation($h_Node, $i_Animation)
; Parameters ....: $h_Node -
;                  $i_Animation - sequence should be one of the following values:
;                  |$IRR_EMAT_STAND
;                  |$IRR_EMAT_RUN
;                  |$IRR_EMAT_ATTACK
;                  |$IRR_EMAT_PAIN_A
;                  |$IRR_EMAT_PAIN_B
;                  |$IRR_EMAT_PAIN_C
;                  |$IRR_EMAT_JUMP
;                  |$IRR_EMAT_FLIP
;                  |$IRR_EMAT_SALUTE
;                  |$IRR_EMAT_FALLBACK
;                  |$IRR_EMAT_WAVE
;                  |$IRR_EMAT_POINT
;                  |$IRR_EMAT_CROUCH_STAND
;                  |$IRR_EMAT_CROUCH_WALK
;                  |$IRR_EMAT_CROUCH_ATTACK
;                  |$IRR_EMAT_CROUCH_PAIN
;                  |$IRR_EMAT_CROUCH_DEATH
;                  |$IRR_EMAT_DEATH_FALLBACK
;                  |$IRR_EMAT_DEATH_FALLFORWARD
;                  |$IRR_EMAT_DEATH_FALLBACKSLOW
;                  |$IRR_EMAT_BOOM
; Return values .: Success - True
;                  Failure - False
; Author ........:
; Modified.......:
; Remarks .......: MD2 format models have specific animation sequences contained within them that can be played back with a simple call.
; Related .......: None
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrPlayNodeMD2Animation($h_Node, $i_Animation)
	DllCall($_irrDll, "none:cdecl", "IrrPlayNodeMD2Animation", "ptr", $h_Node, "int", $i_Animation)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrPlayNodeMD2Animation


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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


; #FUNCTION# =============================================================================================================
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



; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddCollisionAnimator
; Description ...: Animator applying collision detection and gravity to its parent node.
; Syntax.........: _IrrAddCollisionAnimator($h_IrrSelector, $h_Node, $f_RadiusX, $f_RadiusY, $f_RadiusZ, $f_GravityX, $f_GravityY, $f_GravityZ, $f_OffsetX, $f_OffsetY, $f_OffsetZ)
; Parameters ....: $h_IrrSelector - Handle of a selecor object as created with _IrrGetCollision[...]
;                  |The selector represents a selection of triangles in the scene, this is usually all of the triangles in a map for instance.
;                  $h_Node - Handle of a scene node to be collided against the selector.
;                  $f_RadiusX, $f_RadiusY, $f_RadiusZ - Define an ellipsoid that defines the area of collision this eliptical shape allows the collision detection to slide the object up steps and even ladders.
;                  |If you make it too big you might be too large to get through a doorway but if you make it too small you may not be able to climb steps. You should play with these values and find the best ones for your scene.
;                  $f_GravityX, $f_GravityY, $f_GravityZ - Specify the force that is applied to the node for each axis.
;                  |For example 0.0,-9.8,0.0 defines a typical downward force. Other values could be used to simulate e.g. wind effects.
;                  $f_OffsetX, $f_OffsetY, $f_OffsetZ - Offset the node by a specific distance from the center of the collision.
;                  |As the center of the object and the size of your collision ellipsoid vary you can use this to adjust the position of the node and to bring it into contact with the ground.
; Return values .: success - Handle of the created animator.
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: The collision detection will stop the object penetrating through a surface in the objects it is colliding against and will also press it against the surface using gravity.
; Related .......: _IrrRemoveAnimator, _IrrGetCollisionGroupFromMesh, _IrrGetCollisionGroupFromComplexMesh, _IrrGetCollisionGroupFromBox, _IrrGetCollisionGroupFromTerrain, _IrrCreateCombinedCollisionGroup
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddCollisionAnimator($h_IrrSelector, $h_Node, $f_RadiusX, $f_RadiusY, $f_RadiusZ, $f_GravityX, $f_GravityY, $f_GravityZ, $f_OffsetX, $f_OffsetY, $f_OffsetZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddCollisionAnimator", "ptr", $h_IrrSelector, "ptr", $h_Node, "float", $f_RadiusX, "float", $f_RadiusY, "float", $f_RadiusZ, "float", $f_GravityX, "float", $f_GravityY, "float", $f_GravityZ, "float", $f_OffsetX, "float", $f_OffsetY, "float", $f_OffsetZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddCollisionAnimator


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddDeleteAnimator
; Description ...: Animator deleting its parent node after specified time (ms).
; Syntax.........: _IrrAddDeleteAnimator($h_Node, $i_Time)
; Parameters ....: $h_Node - Handle of a scene Node.
;                  $i_Time - Living time of the animator in milliseconds.
; Return values .: success - Handle of the created animator.
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: You could use this animator to delete a falling rock for example, all you would need to do is attach the delete animator, a movement animator and then forget about it.
; Related .......: _IrrRemoveAnimator
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddDeleteAnimator($h_Node, $i_Time)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddDeleteAnimator", "ptr", $h_Node, "int", $i_Time)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddDeleteAnimator


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddFlyCircleAnimator
; Description ...: Animator moving its parent node in a circular path.
; Syntax.........: _IrrAddFlyCircleAnimator($h_Node, $f_CenterX, $f_CenterY, $f_CenterZ, $f_Radius, $f_Speed)
; Parameters ....: $h_Node - Handle of a scene Node.
;                  $f_CenterX, $f_CenterY, $f_CenterZ - Define center of the circular path.
;                  $f_Radius - Defines the radius of the circular path.
;                  $f_Speed - Defines how far the node is moved each frame.
; Return values .: success - Handle of the created animator.
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrRemoveAnimator
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddFlyCircleAnimator($h_Node, $f_CenterX, $f_CenterY, $f_CenterZ, $f_Radius, $f_Speed)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFlyCircleAnimator", "ptr", $h_Node, "float", $f_CenterX, "float", $f_CenterY, "float", $f_CenterZ, "float", $f_Radius, "float", $f_Speed)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFlyCircleAnimator


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddFlyStraightAnimator
; Description ...: Animator moving its parent node in a straight line from a start to an end point.
; Syntax.........: _IrrAddFlyStraightAnimator($h_Node, $f_StartX, $f_StartY, $f_StartZ, $f_EndX, $f_EndY, $f_EndZ, $i_Time, $i_DoLoop)
; Parameters ....: $h_Node - Handle of a scene Node.
;                  $f_StartX, $f_StartY, $f_StartZ - Specify the start point of the path.
;                  $f_EndX, $f_EndY, $f_EndZ - Specify the end point of the path.
;                  $i_Time - Number of milliseconds the animator will take to move the node from start to end point.
;                  $i_DoLoop - Determines single or continously movement type:
;                  |$IRR_ONE_SHOT - For a single animation and then stop.
;                  |$IRR_LOOP - To continuously repeat the animation.
; Return values .: success - Handle of the created animator.
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrRemoveAnimator
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddFlyStraightAnimator($h_Node, $f_StartX, $f_StartY, $f_StartZ, $f_EndX, $f_EndY, $f_EndZ, $i_Time, $i_DoLoop)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddFlyStraightAnimator", "ptr", $h_Node, "float", $f_StartX, "float", $f_StartY, "float", $f_StartZ, "float", $f_EndX, "float", $f_EndY, "float", $f_EndZ, "uint", $i_Time, "int", $i_DoLoop)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddFlyStraightAnimator


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddRotationAnimator
; Description ...: Animator spinning its parent node around each axis.
; Syntax.........: _IrrAddRotationAnimator($h_Node, $f_RotX, $f_RotY, $f_RotZ)
; Parameters ....: $h_Node - Handle of a scene Node.
;                  $f_RotX, $f_RotY, $f_RotZ - Specify number of radians the object is spun around each axis.
; Return values .: success - Handle of the created animator.
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: None
; Related .......: _IrrRemoveAnimator
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddRotationAnimator($h_Node, $f_RotX, $f_RotY, $f_RotZ)
	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddRotationAnimator", "ptr", $h_Node, "float", $f_RotX, "float", $f_RotY, "float", $f_RotZ)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddRotationAnimator



; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddSplineAnimator
; Description ...: Animator moving its parent node along a spline curve.
; Syntax.........: _IrrAddSplineAnimator($h_Node, $tVectorStruct, $i_Start, $f_Speed, $f_Tightness)
; Parameters ....: $h_Node - Handle of a scene Node.
;                  $tVectorStruct - Struct array with 3D-points defining the spline curve.
;                  |Use __CreateVectStruct and __SetVectStruct to build the required struct.
;                  $i_Start - Time in milliseconds that must pass before the animation starts.
;                  $f_Speed - Defines the rate the node moves along the spline curve.
;                  $f_Tightness - Specifies how tightly the curve is tied to the points.
;                  |Value between 0 (angular) and 1 (very loose).
; Return values .: success - Handle of the created animator.
;                  failure - False and sets @error:
;                  |1 - error from .dll call
;                  |2 - $tVectorStruct is not a dllstruct
; Author ........:
; Modified.......:
; Remarks .......: This is one of the more difficult to set up of the animators but is very natural looking and powerful.
;                  A spline is a curved line that passes through or close to a list of co-ordinates, creating a smooth flight.
;                  This animator needs a list of coordinates stored in a struct array for the X, Y and Z locations of all the points.
;                  A good way to get coordinates for this struct is to load in the camera position example and move your camera to a point and write down its coordinates.
; Related .......: __CreateVectStruct, __SetVectStruct, _IrrRemoveAnimator
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrAddSplineAnimator($h_Node, $tVectorStruct, $i_Start, $f_Speed, $f_Tightness)

	if not IsDllStruct($tVectorStruct) then return SetError(2, 0, False)
	local $iSplineVects = DllStructGetSize($tVectorStruct) / DllStructGetSize(DllStructCreate($tagIRR_VECTOR))

	Local $XArrayStruct = DllStructCreate("float[" & $iSplineVects & "]")
	Local $YArrayStruct = DllStructCreate("float[" & $iSplineVects & "]")
	Local $ZArrayStruct = DllStructCreate("float[" & $iSplineVects & "]")

	; dll funtion expect 3 structs, each for x/y/z. So sort $TVectorStruct into them:
	For $i = 1 To $iSplineVects
		DllStructSetData($XArrayStruct, 1, __GetVectStruct($tVectorStruct, $i-1, $VECT_X), $i ) ; x values
		DllStructSetData($YArrayStruct, 1, __GetVectStruct($tVectorStruct, $i-1, $VECT_Y), $i ) ; y values
		DllStructSetData($ZArrayStruct, 1, __GetVectStruct($tVectorStruct, $i-1, $VECT_Z), $i ) ; z values
	Next

	$result = DllCall($_irrDll, "ptr:cdecl", "IrrAddSplineAnimator", "ptr", $h_Node, "int", $iSplineVects, _
	"ptr", DllStructGetPtr($XArrayStruct,1), "ptr", DllStructGetPtr($YArrayStruct,1), "ptr", DllStructGetPtr($ZArrayStruct,1), _
	"int", $i_Start, "float", $f_Speed, "float", $f_Tightness)

	if @error Then
		Return Seterror(1,0,False)
	Else
		return $result[0]
	EndIf
EndFunc   ;==>_IrrAddSplineAnimator


; #FUNCTION# =============================================================================================================
; Name...........: _IrrAddFadeAnimator
; Description ...: [todo]
; Syntax.........: _IrrAddFadeAnimator($h_Node, $i_DeleteAfterMiliseconds, $f_Scale = 1.0)
; Parameters ....: [param1] - [explanation]
;                  |[moreTextForParam1]
;                  [param2] - [explanation]
; Return values .: success - Handle of the created animator.
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: [todo]
; Related .......: _IrrAddDeleteAnimator, _IrrRemoveAnimator
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


; #FUNCTION# =============================================================================================================
; Name...........: _IrrRemoveAnimator
; Description ...: Removes an applied animator from a node.
; Syntax.........: _IrrRemoveAnimator($h_Node, $h_Animator)
; Parameters ....: $h_Node - Handle of a scene Node.
;                  $h_Animator - Handle of the animator to be removed.
; Return values .: success - True
;                  failure - False
; Author ........:
; Modified.......:
; Remarks .......: After the function call a played animation is stopped or the animator cleaned up so you can apply a new one.
; Related .......: _IrrAddCollisionAnimator, _IrrAddDeleteAnimator, _IrrAddFlyCircleAnimator, _IrrAddFlyStraightAnimator, _IrrAddRotationAnimator, _IrrAddSplineAnimator, _IrrAddFadeAnimator
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _IrrRemoveAnimator($h_Node, $h_Animator)
	DllCall($_irrDll, "none:cdecl", "IrrRemoveAnimator", "ptr", $h_Node, "ptr", $h_Animator)
	if @error Then
		Return Seterror(1,0,False)
	Else
		return True
	EndIf
EndFunc   ;==>_IrrRemoveAnimator
