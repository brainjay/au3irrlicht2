#include "au3Irrlicht2.au3"

Global $hMesh, $iFrameCount

_IrrStart()

$hMesh = _IrrGetMesh("./media/zumlin.md2")

$iFrameCount = _IrrGetMeshFrameCount($hMesh)

MsgBox(64, "_IrrGetMeshFrameCount", "zumlin.md2 mesh contains " & $iFrameCount & " frames")

_IrrStop()