//%attributes = {"invisible":true}

If (vTargetIsSchema)
	
	$ptrPathSchema:=OBJECT Get pointer:C1124(Object named:K67:5;"pathSchema")
	
	If (Test path name:C476($ptrPathSchema->)=Is a document:K24:1)
		TEXT TO DOCUMENT:C1237($ptrPathSchema->;vSchemaLoaded)
	Else 
		ALERT:C41(Get localized string:C991("JsonVal_pathInvalid"))
	End if 
	
	
Else 
	
	$ptrPath:=OBJECT Get pointer:C1124(Object named:K67:5;"pathJson")
	
	If (Test path name:C476($ptrPath->)=Is a document:K24:1)
		TEXT TO DOCUMENT:C1237($ptrPath->;vJsonLoaded)
	Else 
		ALERT:C41(Get localized string:C991("JsonVal_pathInvalid"))
	End if 
End if 