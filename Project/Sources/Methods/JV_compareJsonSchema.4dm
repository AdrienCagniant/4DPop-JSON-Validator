//%attributes = {"invisible":true}

  // ----------------------------------------------------
  // User name (OS): Adrien Cagniant
  // Date and time: 07/02/17, 15:54:49
  // ----------------------------------------------------
  // Method: compareJsonSchema
  // Description
  // 
  //
  // Parameters
  // ----------------------------------------------------

C_OBJECT:C1216($resultValidation;vObJsonDoc;$vObFormsSchema;$o)
C_BOOLEAN:C305(jsonIsValid)

jsonIsValid:=True:C214
ON ERR CALL:C155("JV_errorHandler")
$vObFormsSchema:=JSON Parse:C1218(vSchemaLoaded;*)
vJsonLoaded:=ST Get plain text:C1092(vJsonLoaded)
$vObJsonDoc:=JSON Parse:C1218(vJsonLoaded;*)
ON ERR CALL:C155("")

If (jsonIsValid)
	
	$resultValidation:=JSON Validate:C1456($vObJsonDoc;$vObFormsSchema)
	
	
	
	If ($resultValidation.success=True:C214)
		  // GUI if valid
		messageComparisonJson:=Get localized string:C991("JsonVal_jsonValidated")
		OBJECT SET VISIBLE:C603(*;"lbError";False:C215)
		_O_OBJECT SET COLOR:C271(*;"rectJSON";Red:K11:4)
		OBJECT SET VISIBLE:C603(messageComparisonSchemas;False:C215)
		OBJECT SET VISIBLE:C603(messageComparisonJson;True:C214)
		
		$is4dForm:=JV_isJsonA4DForm 
		If ($is4dForm)
			OBJECT SET VISIBLE:C603(*;"ButtonOpen4DForm";True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*;"ButtonOpen4DForm";False:C215)
			
		End if 
	Else 
		
		ARRAY OBJECT:C1221(tab_errors;0)
		  // GUI if invalid
		OB GET ARRAY:C1229($resultValidation;"errors";tab_errors)
		$errorCount:=Size of array:C274(tab_errors)
		
		messageComparisonJson:=Get localized string:C991("JsonVal_jsonNotValidated")+String:C10($errorCount)
		  //:="Your JSON is not validated. Number of errors according the JSON schema loaded: " 
		OBJECT SET VISIBLE:C603(*;"lbError";True:C214)
		_O_OBJECT SET COLOR:C271(*;"rectJSON";Blue:K11:7)
		OBJECT SET VISIBLE:C603(messageComparisonSchemas;False:C215)
		OBJECT SET VISIBLE:C603(messageComparisonJson;True:C214)
		
		  //error GUI 
		$o:=JV_organizeError ($resultValidation)
		  // select the first element found
		If (OB Is defined:C1231($o))
			HIGHLIGHT TEXT:C210(vJsonLoaded;OB Get:C1224($o;"rangeStart";Is longint:K8:6);OB Get:C1224($o;"rangeStart";Is longint:K8:6))
		End if 
		
		vJsonValidated:=True:C214
	End if 
	
Else 
	
	messageComparisonJson:=Get localized string:C991("JsonVal_invalidJson")
	OBJECT SET VISIBLE:C603(*;"lbError";False:C215)
	_O_OBJECT SET COLOR:C271(*;"rectJSON";Blue:K11:7)
	OBJECT SET VISIBLE:C603(messageComparisonSchemas;False:C215)
	OBJECT SET VISIBLE:C603(messageComparisonJson;True:C214)
	
End if 