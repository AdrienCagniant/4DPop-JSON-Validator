//%attributes = {"invisible":true}

  // ----------------------------------------------------
  // User name (OS): Adrien Cagniant
  // Date and time: 07/02/17, 18:25:32
  // ----------------------------------------------------
  // Method: compareSchemaMetaSchema
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
ON ERR CALL:C155("")

If (jsonIsValid)
	$resultValidation:=JSON Validate:C1456($vObFormsSchema;vJsonMetaSchema)
	
	If ($resultValidation.success=True:C214)
		ST SET TEXT:C1115(messageComparisonSchemas;Get localized string:C991("JsonVal_schemaValidated"))
		
		ST INSERT URL:C1280(messageComparisonSchemas;Get localized string:C991("JsonVal_urlJsonMetaSchema");Get localized string:C991("JsonVal_urlJsonMetaSchema");ST End text:K78:16;ST End text:K78:16)
		
		OBJECT SET VISIBLE:C603(*;"lbError";False:C215)
		_O_OBJECT SET COLOR:C271(*;"rectSchema";Red:K11:4)
		OBJECT SET VISIBLE:C603(messageComparisonJson;False:C215)
		OBJECT SET VISIBLE:C603(messageComparisonSchemas;True:C214)
		
	Else 
		
		ARRAY OBJECT:C1221(tab_errors;0)
		  // GUI if invalid
		OB GET ARRAY:C1229($resultValidation;"errors";tab_errors)
		$errorCount:=Size of array:C274(tab_errors)
		
		ST SET TEXT:C1115(messageComparisonSchemas;Get localized string:C991("JsonVal_schemaNotValidated")+String:C10($errorCount))
		
		  //meta-schema defined by JSON ")
		ST INSERT URL:C1280(messageComparisonSchemas;Get localized string:C991("JsonVal_urlJsonMetaSchema");Get localized string:C991("JsonVal_urlJsonMetaSchema");ST End text:K78:16;ST End text:K78:16)
		  //ST SET TEXT(messageComparisonSchemas;".)";ST End text;ST End text)
		OBJECT SET VISIBLE:C603(*;"lbError";True:C214)
		_O_OBJECT SET COLOR:C271(*;"rectSchema";Blue:K11:7)
		OBJECT SET VISIBLE:C603(messageComparisonJson;False:C215)
		OBJECT SET VISIBLE:C603(messageComparisonSchemas;True:C214)
		
		$o:=JV_organizeError ($resultValidation)  // ($resultValidation.errors)
		  // select the first element found
		If (OB Is defined:C1231($o))
			HIGHLIGHT TEXT:C210(vSchemaLoaded;OB Get:C1224($o;"rangeStart";Is longint:K8:6);OB Get:C1224($o;"rangeStart";Is longint:K8:6))
		End if 
		
		vJsonValidated:=False:C215
	End if 
Else 
	
	messageComparisonSchemas:=Get localized string:C991("JsonVal_invalidJson")
	OBJECT SET VISIBLE:C603(*;"lbError";False:C215)
	_O_OBJECT SET COLOR:C271(*;"rectSchema";Blue:K11:7)
	OBJECT SET VISIBLE:C603(messageComparisonSchemas;True:C214)
	OBJECT SET VISIBLE:C603(messageComparisonJson;False:C215)
	
	
End if 