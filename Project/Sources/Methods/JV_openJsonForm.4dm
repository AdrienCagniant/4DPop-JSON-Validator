//%attributes = {"invisible":true}
C_TEXT:C284($vJsonLoaded)

$vFilePath:=Get 4D folder:C485(Current resources folder:K5:16)+"formJsonTemp.json"

$vJsonLoaded:=ST Get plain text:C1092(vJsonLoaded)
TEXT TO DOCUMENT:C1237($vFilePath;$vJsonLoaded)
If (ok=0)
	If (Test path name:C476($vFilePath)=Is a document:K24:1)
		DIALOG:C40("Resources/formJsonTemp.json")
		DELETE DOCUMENT:C159($vFilePath)
	End if 
End if 
