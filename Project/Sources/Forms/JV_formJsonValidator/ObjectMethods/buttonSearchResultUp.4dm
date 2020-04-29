Case of 
		  //button up
	: (Form event code:C388=On Clicked:K2:4)
		C_POINTER:C301($ptrOnAreaToSearch)
		ARRAY OBJECT:C1221($_rangeFound;0)
		OB GET ARRAY:C1229(resultSearch;"rangeToStyle";$_rangeFound)
		
		If (OB Get:C1224(resultSearch;"searchPerformed"))
			If (OB Get:C1224(resultSearch;"numberFound")>0)
				
				If (vTargetIsSchema)
					  //search for schema
					$ptrOnAreaToSearch:=OBJECT Get pointer:C1124(Object named:K67:5;"variableSchema")
				Else 
					  //search for JSON
					$ptrOnAreaToSearch:=OBJECT Get pointer:C1124(Object named:K67:5;"variableJson")
				End if 
				If (vRangeSelected=1)
					  //if we reach the first one
					vRangeSelected:=vFound
					
				Else 
					
					vRangeSelected:=vRangeSelected-1
					
				End if 
				
				$start:=OB Get:C1224($_rangeFound{vRangeSelected};"rangeStart";Is longint:K8:6)
				$end:=OB Get:C1224($_rangeFound{vRangeSelected};"rangeEnd";Is longint:K8:6)
				HIGHLIGHT TEXT:C210($ptrOnAreaToSearch->;$start;$end)
				
			End if 
		End if 
		
End case 