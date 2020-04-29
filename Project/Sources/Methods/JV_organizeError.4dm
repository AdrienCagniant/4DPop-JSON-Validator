//%attributes = {"invisible":true}

  // ----------------------------------------------------
  // User name (OS): Adrien Cagniant
  // Date and time: 03/02/17, 18:06:36
  // ----------------------------------------------------
  // Method: errStringify
  // Description
  // 

  // Parameters
  // ----------------------------------------------------
C_OBJECT:C1216($resultValidation;$1)
ARRAY OBJECT:C1221($tab_errors;0)
$resultValidation:=OB Copy:C1225($1)

OB GET ARRAY:C1229($resultValidation;"errors";$tab_errors)
C_TEXT:C284($textToReturn;$txtToStyle)
C_LONGINT:C283($lenghtFound;$sz;$nbChar)

$textToReturn:=""
$sz:=Size of array:C274($tab_errors)
ARRAY TEXT:C222(errValidationJsonPath;$sz)
ARRAY TEXT:C222(errValidationSchemaPath;$sz)
ARRAY TEXT:C222(errValidationMsg;$sz)
ARRAY TEXT:C222(errPosition;$sz)
ARRAY LONGINT:C221(errline;$sz)

C_OBJECT:C1216($o;$0)
C_LONGINT:C283($found)

For ($i;1;$sz)
	  //loop in the error tab result from the command JSON Validate
	errValidationJsonPath{$i}:=OB Get:C1224($tab_errors{$i};"jsonPath";Is text:K8:3)
	errValidationMsg{$i}:=OB Get:C1224($tab_errors{$i};"message";Is text:K8:3)
	errValidationSchemaPath{$i}:=OB Get:C1224($tab_errors{$i};"schemaPaths";Is text:K8:3)
	errline{$i}:=OB Get:C1224($tab_errors{$i};"line";Is longint:K8:6)
	errPosition{$i}:="Line: "+String:C10(OB Get:C1224($tab_errors{$i};"line";Is longint:K8:6))+", offset: "+String:C10(OB Get:C1224($tab_errors{$i};"offset";Is longint:K8:6))+". Error: "+OB Get:C1224($tab_errors{$i};"message";Is text:K8:3)
	
End for 

  //Select only one time the line to highlight, filter doublons. 
ARRAY LONGINT:C221(errLineToHighliht;0)
For ($i;1;$sz)
	$found:=Find in array:C230(errLineToHighliht;errline{$i})
	If ($found=-1)
		  //store all line to highlight 
		APPEND TO ARRAY:C911(errLineToHighliht;errline{$i})
	End if 
End for 

ARRAY OBJECT:C1221($rangeToStyle;0)
$nbChar:=Length:C16(vJsonLoaded)

ARRAY TEXT:C222($arrText;0)
TEXT TO ARRAY:C1149(vJsonLoaded;$arrText;50000;"times";5)
$sz:=Size of array:C274(errLineToHighliht)

For ($i;1;$sz)
	
	
	If (errLineToHighliht{$i}>0)
		  // ignore if a line haven't been set
		$txtToStyle:=$arrText{errLineToHighliht{$i}}
		
		  //count it because it could be not only one string which is the same
		$countOfSameText:=Count in array:C907($arrText;$txtToStyle)
		If ($countOfSameText>1)
			  //if there are more than one
			ARRAY LONGINT:C221($foundInArray;0)
			$start:=0
			For ($l;0;$countOfSameText)
				APPEND TO ARRAY:C911($foundInArray;Find in array:C230($arrText;$txtToStyle;$start))
				$start:=$foundInArray{$l+1}+1
			End for 
			
			For ($j;0;$countOfSameText)
				If (errLineToHighliht{$i}=$foundInArray{$j})
					$nToselect:=$j
				End if 
			End for 
			$startRange:=1
			
			For ($k;0;$nToselect-1)
				$startRange:=Position:C15($txtToStyle;vJsonLoaded;$startRange;$lenghtFound)
				$startRange:=$startRange+1
			End for 
			
			$startRange:=$startRange-1
			
		Else 
			  //else there is only one matching text, easy to know where it is
			$startRange:=Position:C15($txtToStyle;vJsonLoaded;1;$lenghtFound)
		End if 
		
		
		$o:=New object:C1471
		OB SET:C1220($o;"rangeStart";$startRange)
		OB SET:C1220($o;"rangeEnd";$startRange+$lenghtFound)
		
		  // Doing it sequentially because I don't want to change vJsonLoaded during loop, first storing the ranges and after styling it.
		APPEND TO ARRAY:C911($rangeToStyle;$o)
		
	End if 
End for 

$szLineToStyle:=Size of array:C274($rangeToStyle)
For ($k;0;$szLineToStyle)
	ST SET ATTRIBUTES:C1093(vJsonLoaded;OB Get:C1224($rangeToStyle{$k};"rangeStart";Is longint:K8:6);OB Get:C1224($rangeToStyle{$k};"rangeEnd";Is longint:K8:6);Attribute background color:K65:8;"#f9a9a9")
End for 


$sz:=Size of array:C274(errline)
If ($sz>0)
	If (errline{1}#-1)
		  //order by line
		LISTBOX SORT COLUMNS:C916(*;"lbError";2;>)
		
		  //hierarchy by errPosition which is line + error message
		ARRAY POINTER:C280($ArrHierarch;1)
		$ArrHierarch{1}:=->errPosition
		LISTBOX SET HIERARCHY:C1098(*;"lbError";True:C214;$ArrHierarch)
		LISTBOX COLLAPSE:C1101(*;"lbError")
	Else 
		  //if there is no lines and offsets returned by the command 4D JSON Validate
		LISTBOX SET HIERARCHY:C1098(*;"lbError";False:C215)
	End if 
End if 

If (Size of array:C274($rangeToStyle)>0)
	If (OB Is defined:C1231($rangeToStyle{1}))
		$0:=$rangeToStyle{1}
	End if 
End if 