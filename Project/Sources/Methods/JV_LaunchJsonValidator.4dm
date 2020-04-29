//%attributes = {"invisible":true,"shared":true}
C_POINTER:C301($1)
C_BOOLEAN:C305($2)


If (Count parameters:C259=1)
	
	$Lon_x:=New process:C317(Current method name:C684;0;"$JSON validator";$1;True:C214)
	
Else 
	
	$ref:=Open form window:C675("JV_formJsonValidator";Plain form window:K39:10;Horizontally centered:K39:1;Vertically centered:K39:4)
	DIALOG:C40("JV_formJsonValidator")
	
End if 



