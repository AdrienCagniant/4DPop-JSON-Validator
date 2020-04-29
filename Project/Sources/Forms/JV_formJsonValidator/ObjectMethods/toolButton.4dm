Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If (vTargetIsSchema)
			  // it's for schema
			
			
			$menuContents:=Get localized string:C991("JsonVal_saveSchema")
			$menuContents:=$menuContents+";"+Get localized string:C991("JsonVal_clearSchema")
			
			$default:=-1
			
			OBJECT GET COORDINATES:C663(Self:C308->;$left;$top;$right;$bottom)
			$resultPopup:=Pop up menu:C542($menuContents;$default;$left;$bottom-5)
			
			$ptrPathSchema:=OBJECT Get pointer:C1124(Object named:K67:5;"pathSchema")
			
			Case of 
				: ($resultPopup=1)
					  //Save schema
					If (Test path name:C476($ptrPathSchema->)=Is a document:K24:1)
						TEXT TO DOCUMENT:C1237($ptrPathSchema->;vSchemaLoaded)
					Else 
						ALERT:C41(Get localized string:C991("JsonVal_pathInvalid"))
					End if 
					
				: ($resultPopup=2)
					
					  //Clear Schema
					
					ST SET TEXT:C1115(vSchemaLoaded;"{"+Char:C90(Carriage return:K15:38)+"}")
					$ptrPathSchema->:=""
					vclearSchema:=True:C214
				Else 
					  //doNothing
					
			End case 
			
			
			
			
			
		Else 
			  // it's for JSON
			
			$menuContents:=Get localized string:C991("JsonVal_saveJson")
			$menuContents:=$menuContents+";"+Get localized string:C991("JsonVal_clearJson")
			
			
			
			$default:=-1
			OBJECT GET COORDINATES:C663(Self:C308->;$left;$top;$right;$bottom)
			
			$resultPopup:=Pop up menu:C542($menuContents;$default;$left;$bottom-5)
			
			$ptrPath:=OBJECT Get pointer:C1124(Object named:K67:5;"pathJson")
			
			Case of 
				: ($resultPopup=1)
					  //Save schema
					If (Test path name:C476($ptrPath->)=Is a document:K24:1)
						TEXT TO DOCUMENT:C1237($ptrPath->;vJsonLoaded)
					Else 
						ALERT:C41(Get localized string:C991("JsonVal_pathInvalid"))
					End if 
					
				: ($resultPopup=2)
					
					  //Clear Schema
					
					ST SET TEXT:C1115(vJsonLoaded;"{"+Char:C90(Carriage return:K15:38)+"}")
					$ptrPath->:=""
					vclearJson:=True:C214
					
				Else 
					  //doNothing
					
			End case 
		End if 
		
End case 
