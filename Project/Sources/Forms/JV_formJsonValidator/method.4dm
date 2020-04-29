
  // ----------------------------------------------------
  // User name (OS): Adrien Cagniant
  // Date and time: 03/02/17, 15:22:39
  // ----------------------------------------------------
  // Method: Form1
  // Description
  // 

  // Parameters
  // ----------------------------------------------------


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		JV_init_formJsonValidator 
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		C_POINTER:C301($ptrOnAreaToSearch)
		SET TIMER:C645(0)
		
		If (vDoQuery)
			If (vTargetIsSchema)
				  //search for schema
				$ptrOnAreaToSearch:=OBJECT Get pointer:C1124(Object named:K67:5;"variableSchema")
			Else 
				  //search for JSON
				$ptrOnAreaToSearch:=OBJECT Get pointer:C1124(Object named:K67:5;"variableJson")
			End if 
			
			  //search on the schema variable
			resultSearch:=JV_onSearch (vSearch;$ptrOnAreaToSearch->)
			
			vFound:=OB Get:C1224(resultSearch;"numberFound")
			$ptrOnAreaToSearch->:=OB Get:C1224(resultSearch;"newText")
			
			If (OB Get:C1224(resultSearch;"searchPerformed"))
				  //highlight results
				If (OB Get:C1224(resultSearch;"numberFound")>0)
					
					  // select the first element found
					ARRAY OBJECT:C1221($_rangeFound;0)
					OB GET ARRAY:C1229(resultSearch;"rangeToStyle";$_rangeFound)
					vRangeSelected:=1
					C_LONGINT:C283($end;$start)
					
					$start:=OB Get:C1224($_rangeFound{vRangeSelected};"rangeStart";Is longint:K8:6)
					$end:=OB Get:C1224($_rangeFound{vRangeSelected};"rangeEnd";Is longint:K8:6)
					  //HIGHLIGHT TEXT($ptrOnAreaToSearch->;$start;$end)
					JV_guiSearchIsPerformed (True:C214)
				Else 
					JV_guiSearchIsPerformed (False:C215)
				End if 
				
			Else 
				
				vRangeSelected:=0
				vFound:=0
				OB SET:C1220(resultSearch;"searchPerformed";False:C215)
				JV_guiSearchIsPerformed (False:C215)
			End if 
			
			vDoQuery:=False:C215
		Else 
			  //do nothing
			
		End if 
		
End case 