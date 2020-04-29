
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		C_POINTER:C301($ptr)
		C_LONGINT:C283($col;$row)
		LISTBOX GET CELL POSITION:C971(Self:C308->;$col;$row)
		If ($row>0)
			ARRAY TEXT:C222($arrText;0)
			
			
			If (vJsonValidated)
				$ptr:=->vJsonLoaded
			Else 
				$ptr:=->vschemaLoaded
			End if 
			  //remove all style in order to have the correct number of char
			$ptr->:=ST Get plain text:C1092($ptr->)
			
			TEXT TO ARRAY:C1149($ptr->;$arrText;50000;"arial";5)
			
			
			If (errline{$row}>0)
				  //Ignore if the line is under 0
				C_TEXT:C284($txtToSelect)
				  // retrieve the exact text to select in the array of line
				$txtToSelect:=$arrText{errline{$row}}
				
				  //count it because it could be not only one string which is the same
				C_LONGINT:C283($countOfSameText;$i;$j;$nToselect)
				$countOfSameText:=Count in array:C907($arrText;$txtToSelect)
				If ($countOfSameText>1)
					ARRAY LONGINT:C221($foundInArray;0)
					$start:=0
					For ($i;0;$countOfSameText)
						APPEND TO ARRAY:C911($foundInArray;Find in array:C230($arrText;$txtToSelect;$start))
						$start:=$foundInArray{$i+1}+1
					End for 
					
					For ($j;0;$countOfSameText)
						If (errline{$row}=$foundInArray{$j})
							$nToselect:=$j
						End if 
					End for 
					$startRange:=1
					C_LONGINT:C283($lenghtFound)
					For ($k;0;$nToselect-1)
						$startRange:=Position:C15($txtToSelect;$ptr->;$startRange;$lenghtFound)
						$startRange:=$startRange+1
					End for 
					
					$startRange:=$startRange-1
					
				Else 
					  //else there is only one matching text, easy to know where it is
					$startRange:=Position:C15($txtToSelect;$ptr->;1;$lenghtFound)
				End if 
				
				  // find the text in the 
				
				HIGHLIGHT TEXT:C210($ptr->;$startRange;($startRange+$lenghtFound))
				
			End if 
		End if 
End case 