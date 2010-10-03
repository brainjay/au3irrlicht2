; ----------------------------------------------------------------------------
; Irrlicht Wrapper for Imperative Languages - Freebasic Examples
; Frank Dodd (2006)
; Converted/modified for the au3Irr2 project by smashly
; ----------------------------------------------------------------------------
; Example 104 : Level of Detail
; This example demonstrates an automatic mesh management node that swaps the
; mesh used for a node based on how far away that node is from the camera. By
; adding low resoloution meshes at a distance  you can reduce the number of
; polygons drawn to the scene and gain a significant improvement of the speed
; of the program
; If you add a distance with no mesh this is taken ; the limit of the node and
; beyond this distance the node is faded away to nothing. This allows you to
; very easily fade nodes in and out of your scene ; they appear at the edges.
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


; Play with these 3 variables to see things different ;)
Global $USE_LOD = 1 ; Use LOD = 1, Don't Use LOD = 0

Global $iNodeType = 1 ; Set what type of nodes to create; 1 = Mesh Nodes, 2 = Billboard Nodes, 3 = Billboard Group scene nodes (needs Billboard group functions I posted earlier)
Global $ROWS_AND_COLUMNS = 20 ; Change this to control how many objects are added to the scene

Global $hLOD1Mesh ;irr_mesh
Global $hLOD2Mesh ;irr_mesh
Global $hMeshTextureA ;irr_texture
Global $hMeshTextureB ;irr_texture
Global $hParticleTexture ;irr_texture
Global $hMaterial ;irr_material
Global $hOurCamera ;irr_camera
Global $iAmountNodes = $ROWS_AND_COLUMNS * $ROWS_AND_COLUMNS ; how many nodes we are starting with.
Global $aSceneNodes[$iAmountNodes] ;irr_node array of scene node handles
Global $iNodes = $iAmountNodes ;integer
Global $k = 0 ;using this in our loop when creating nodes
Global $hLODManager, $hCallBack ; handle to the LODManager , Handle to CallBack function

; We'll register a CallBack function so that the LOD Manager can let us know when nodes are changing
; In this case we're using the callback to let us know how many nodes are are visible which we'll write to the window title.
$hCallBack = DllCallbackRegister("_NodeChangeCallback", "int:cdecl", "uint;ptr")

;This is our callback function
Func _NodeChangeCallback($u_Visible, $h_Node)
    If $u_Visible And $iNodes < $iAmountNodes Then
        $iNodes += 1
    Else
        If $iAmountNodes Then $iNodes -= 1
    EndIf
EndFunc   ;==>_NodeChangeCallback

;Free the callback function when autoit exits.
OnAutoItExitRegister("_FreeCallBack")

Func _FreeCallBack()
    DllCallbackFree($hCallBack)
    $hCallBack = 0
EndFunc   ;==>_FreeCallBack


; start the irrlicht interface
_IrrStart($IRR_EDT_DIRECT3D9, 800, 600, $IRR_BITS_PER_PIXEL_32, _
        $IRR_WINDOWED, $IRR_NO_SHADOWS, $IRR_IGNORE_EVENTS)

; load the meshes used for level of detail on this object
$hLOD1Mesh = _IrrGetMesh("../media/cylinderY.obj")
$hLOD2Mesh = _IrrGetMesh("../media/cylinderYLow.obj")

; scale the two meshes to a size appropriate for our scene
_IrrScaleMesh($hLOD1Mesh, 8.0)
_IrrScaleMesh($hLOD2Mesh, 8.0)

; for a fair test make sure that the both meshes are hardware accellerated
_IrrSetMeshHardwareAccelerated($hLOD1Mesh)
_IrrSetMeshHardwareAccelerated($hLOD2Mesh)

; load texture resources for texturing the scene nodes
$hMeshTextureA = _IrrGetTexture("../media/Cross.bmp")
$hMeshTextureB = _IrrGetTexture("../media/Diagonal.bmp")
$hParticleTexture = _IrrGetTexture("../media/cloud4.png")

; Add a big grid of nodes to demonstrate level of detail
For $i = -($ROWS_AND_COLUMNS / 2) To ($ROWS_AND_COLUMNS / 2) - 1
    For $j = -($ROWS_AND_COLUMNS / 2) To ($ROWS_AND_COLUMNS / 2) - 1
        Switch $iNodeType
            Case 1 ; Mesh Nodes
                $aSceneNodes[$k] = _IrrAddMeshToScene($hLOD1Mesh)
                _IrrSetNodePosition($aSceneNodes[$k], $i * 40.0, 0.0, $j * 40.0)

                If Not Mod($i + Mod($j, 2), 2) Then
                    _IrrSetNodeMaterialTexture($aSceneNodes[$k], $hMeshTextureA, 0)
                Else
                    _IrrSetNodeMaterialTexture($aSceneNodes[$k], $hMeshTextureB, 0)
                EndIf

            Case 2 ;Billboard Nodes
                $aSceneNodes[$k] = _IrrAddBillBoardToScene(20.0, 20.0, $i * 40.0, 0.0, $j * 40.0)
                _IrrSetNodeMaterialTexture($aSceneNodes[$k], $hParticleTexture, 0)
                _IrrSetNodeMaterialType($aSceneNodes[$k], $IRR_EMT_TRANSPARENT_ADD_COLOR)

            Case 3 ;Billboard Group scene nodes
                $aSceneNodes[$k] = _IrrAddBillBoardGroupToScene()
                For $l = 1 To 5
                    _IrrAddBillBoardToGroup($aSceneNodes[$k], $l * 4.0, $l * 4.0, Random(-2.5, 5.0), Random(-2.5, 5.0), Random(-2.5, 5.0), 0, 255, 255, 255, 255)
                Next
                _IrrSetNodePosition($aSceneNodes[$k], $i * 40.0, 0.0, $j * 40.0)
                _IrrSetNodeMaterialTexture($aSceneNodes[$k], $hParticleTexture, 0)
                _IrrSetNodeMaterialType($aSceneNodes[$k], $IRR_EMT_TRANSPARENT_ADD_COLOR)
        EndSwitch
        _IrrSetNodeMaterialFlag($aSceneNodes[$k], $IRR_EMF_LIGHTING, $IRR_ON)
        $hMaterial = _IrrGetMaterial($aSceneNodes[$k], 0)
        _IrrMaterialVertexColorAffects($hMaterial, $ECM_NONE)
        _IrrMaterialSetAmbientColor($hMaterial, 255, 255, 255, 255)
        _IrrMaterialSetDiffuseColor($hMaterial, 255, 255, 255, 255)
        $k += 1
    Next
Next

; add a LOD Manager, this takes 3 parameters
; the first is the number of 1/4 seconds over which a node is faded in or out
; in this example it is 2 so they will fade in and out in about a 500ms
; the second parameter is whether alpha is used when objects are faded, some
; materials need it some dont you will have to experiment with this
; the last parameter is a callback function that is called whenever a node is
; made invisible or visible if you dont want this feature leave the parameter out.
$hLODManager = _IrrAddLODManager(2, $IRR_ON, DllCallbackGetPtr($hCallBack))

; The material map tells the LOD system which material you want to use to fade
; a node out for a particular material type. by default every node uses
; IRR_EMT_TRANSPARENT_VERTEX_ALPHA for fading but you can change this on a per
; material basis so here instead of using IRR_EMT_TRANSPARENT_VERTEX_ALPHA the
; material type IRR_EMT_TRANSPARENT_ADD_COLOR uses itself when fading again this
; needs experimentation to find what works best for your scene
_IrrSetLODMaterialMap($hLODManager, $IRR_EMT_TRANSPARENT_ADD_COLOR, $IRR_EMT_TRANSPARENT_ADD_COLOR)

; add the first level of detail from 0 outwards this uses a high resoloution mesh
_IrrAddLODMesh($hLODManager, 0.0, $hLOD1Mesh)

; add a lower levl of detail from 300.0 outwards, this is more in the distance
; so the mesh is swapped for a low detail mesh
_IrrAddLODMesh($hLODManager, 300.0, $hLOD2Mesh)

; fade objects out from 600.0 outwards, when an object is over 600.0 units away
; it will fade out of the scene smoothly
_IrrAddLODMesh($hLODManager, 600.0, $IRR_NO_OBJECT)

; disable lighting on the manager
_IrrSetNodeMaterialFlag($hLODManager, $IRR_EMF_LIGHTING, $IRR_OFF)

; add all of the nodes to the LOD Manager if $USE_LOD variable <> 0
If $USE_LOD Then
    $i = 0
    While $i < $k
        _IrrAddChildToParent($aSceneNodes[$i], $hLODManager)
        $i += 1
    WEnd
EndIf

; add a camera into the scene
$hOurCamera = _IrrAddFPSCamera($IRR_NO_OBJECT, 100.0, 0.05)
_IrrSetNodePosition($hOurCamera, 0, $ROWS_AND_COLUMNS * 4, $ROWS_AND_COLUMNS * 2)
_IrrSetCameraTarget($hOurCamera, 0, 50, 0)
_IrrSetCameraClipDistance($hOurCamera, 2500.0)

; set the ambient light level across the entire scene
_IrrSetAmbientLight(1, 1, 1)

; hide the mouse pointer
_IrrHideMouse()

; add some text to let people know the fps camera keys.
_IrrAddStaticText("ARROW KEYS TO MOVE AROUND", 8, 8, 200, 20, $IRR_GUI_NO_BORDER, $IRR_GUI_NO_WRAP)

; while the irrlicht environment is still running
While _IrrRunning() And Sleep(10)

    ; begin the scene, erasing the canvas with sky-blue before rendering
    _IrrBeginScene(255, 255, 0)

    ; display number of visible nodes (LOD callback function is setting the $iNodes value) and the framerate.
    _IrrSetWindowCaption("104 Example LOD - Visable Nodes: " & $iNodes & " - FPS: " & _IrrGetFPS())

    ;;To display the static text
    _IrrDrawGUI()


    ; draw the scene
    _IrrDrawScene()

    ; end drawing the scene and render it
    _IrrEndScene()
WEnd

; Stop the irrlicht engine and release resources
_IrrStop()



