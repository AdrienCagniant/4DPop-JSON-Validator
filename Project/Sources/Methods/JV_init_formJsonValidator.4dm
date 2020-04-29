//%attributes = {"invisible":true}
C_OBJECT:C1216(vObJsonDoc;vObFormsSchema;vJsonMetaSchema)
C_TEXT:C284($vSchema;$vFilePath;vUrlText;messageComparisonJson;messageComparisonSchemas;$pathSchemasLoaded;pathJsonLoaded;varJSONloadedName;varSchemaloadedName;vSearch)
C_BOOLEAN:C305(vTargetIsSchema;vDoQuery;vClearJson;vClearSchema;vJsonValidated)
C_LONGINT:C283(vFound;vRangeSelected)
C_OBJECT:C1216(resultSearch)


resultSearch:=New object:C1471
OB SET:C1220(resultSearch;"searchPerformed";False:C215)
vFound:=0
vRangeSelected:=0
vJsonValidated:=True:C214
vDoQuery:=False:C215
vTargetIsSchema:=True:C214
vClearJson:=False:C215
vClearSchema:=False:C215
vSearch:=""
messageComparisonJson:=""
messageComparisonSchemas:=""

$vFilePath:=Get 4D folder:C485(Current resources folder:K5:16;*)+"json-schema.json"
If (Test path name:C476($vFilePath)=Is a document:K24:1)
	
	$vSchema:=Document to text:C1236($vFilePath)
	vJsonMetaSchema:=JSON Parse:C1218($vSchema;*)
	
Else 
	OB SET:C1220(vJsonMetaSchema;"$schema";"http://json-schema.org/draft-04/schema#")
End if 

$ptrPath:=OBJECT Get pointer:C1124(Object named:K67:5;"pathJson")
$ptrPath->:=Get 4D folder:C485(Current resources folder:K5:16;*)+"ex.json"
If (Test path name:C476($ptrPath->)=Is a document:K24:1)
	vJsonLoaded:=Document to text:C1236($ptrPath->)
Else 
	vJsonLoaded:="{}"
	TEXT TO DOCUMENT:C1237($ptrPath->;vJsonLoaded)
End if 


$ptrSchema:=OBJECT Get pointer:C1124(Object named:K67:5;"pathSchema")
$ptrSchema->:=Get 4D folder:C485(Current resources folder:K5:16;*)+"exSchema.json"
If (Test path name:C476($ptrSchema->)=Is a document:K24:1)
	vSchemaLoaded:=Document to text:C1236($ptrSchema->)
Else 
	vSchemaLoaded:="{}"
	TEXT TO DOCUMENT:C1237($ptrSchema->;vSchemaLoaded)
End if 

_O_OBJECT SET COLOR:C271(*;"rectSchema";Red:K11:4)
_O_OBJECT SET COLOR:C271(*;"rectJSON";Red:K11:4)

GOTO OBJECT:C206(*;"variableJson")

SET TIMER:C645(0)
