//%attributes = {"invisible":true}
C_BOOLEAN:C305($0)
C_OBJECT:C1216($obJson)
ON ERR CALL:C155("errorHandler")
$obJson:=JSON Parse:C1218(vJsonLoaded)
ON ERR CALL:C155("")

$ob4d:=OB Get:C1224($obJson;"$4d";Is object:K8:27)

$kind:=OB Get:C1224($ob4d;"kind";Is text:K8:3)


If ($kind="form")
	$0:=True:C214
Else 
	$0:=False:C215
End if 