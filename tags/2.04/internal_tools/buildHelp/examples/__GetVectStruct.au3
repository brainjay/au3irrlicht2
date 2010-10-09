#include "au3Irrlicht2.au3"

_IrrStart()

local $nodeCamera = _IrrAddCamera( 150,50,0, 0,50,0 )
local $nodeTest = _IrrAddTestSceneNode()
_IrrSetNodeMaterialTexture( $nodeTest, _IrrGetTexture(".\media\au3irr2_logo.jpg"), 0)
_IrrSetNodeMaterialFlag( $nodeTest, $IRR_EMF_LIGHTING, $IRR_OFF )

local $tVectors = __CreateVectStruct(4)
__SetVectStruct($tVectors, 0, -100, 50, 0)
__SetVectStruct($tVectors, 1, 0, 100, -100)
__SetVectStruct($tVectors, 2, 100, 50, 0)
__SetVectStruct($tVectors, 3, 0, 100, 100)

_IrrAddSplineAnimator( $nodeTest, $tVectors, 0, 0.5, 1)

MsgBox (0, "", "Y value of very last vector: " & __GetVectStruct($tVectors, 3, $VECT_Y) )

WHILE _IrrRunning()
    _IrrBeginScene( 0, 0, 25 )
    _IrrDrawScene()
    _IrrEndScene()
WEND

_IrrStop()
