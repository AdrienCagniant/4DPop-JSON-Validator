C_LONGINT:C283($Lon_bottom;$Lon_formEvent;$Lon_left;$Lon_right;$Lon_top)
C_POINTER:C301($Ptr_me)
C_TEXT:C284($Dir_target;$File_componentPreferences;$File_userPreferences;$Txt_buffer;$Txt_me;$Txt_path)
C_TEXT:C284($Txt_unitTestName)

  // ----------------------------------------------------
  // Initialisations
$Lon_formEvent:=Form event code:C388
$Txt_me:=OBJECT Get name:C1087(Object current:K67:2)
$Ptr_me:=OBJECT Get pointer:C1124(Object current:K67:2)

$Lon_formEvent:=Form event code:C388

  // ----------------------------------------------------

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		  //Resize the widget
		OBJECT GET COORDINATES:C663(*;$Txt_me+".template";$Lon_left;$Lon_top;$Lon_right;$Lon_bottom)
		
		If (($Lon_left+$Lon_top+$Lon_right+$Lon_bottom)#0)
			
			OBJECT SET COORDINATES:C1248(*;$Txt_me;$Lon_left;$Lon_top;$Lon_right;$Lon_bottom)
			
		End if 
		
		PathPicker SET TYPE ($Txt_me;Is a document:K24:1)
		pathPicker SET MESSAGE ($Txt_me;"Select a JSON:")
		PathPicker SET PLACEHOLDER ($Txt_me;"Please select a JSON")
		PathPicker SET OPTIONS ($Txt_me;True:C214;0)
		pathPicker SET FILE TYPES ($Txt_me;".json")
		pathPicker SET DIRECTORY ($Txt_me;Get 4D folder:C485(Current resources folder:K5:16))
		PathPicker SET SELECTION OPTION ($Txt_me;Package open:K24:8)
		
	: (Form event code:C388=On Data Change:K2:15)
		
		If (vclearSchema)
			vclearSchema:=False:C215
		Else 
			
			If (ok=1)
				If (Test path name:C476($ptr_me->)=1)
					  //load the Scheama in the text area
					vSchemaLoaded:=Document to text:C1236($ptr_me->)
					  //varJSONloadedName:="Document: "+$fileName
					
				Else 
					ALERT:C41("Error with the file.")
				End if 
				
			End if 
			
		End if 
		
End case 