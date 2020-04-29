//%attributes = {"invisible":true}

  // ----------------------------------------------------
  // User name (OS): Adrien Cagniant
  // Date and time: 30/03/17, 16:49:38
  // ----------------------------------------------------
  // Method: onSearch
  // Description
  // 
  //
  // Parameters
  // $0 <-- object containing several properties according the search (1st range found, search performed, number found []range found
  //----------------------------------------------------

C_OBJECT:C1216($0;$o)
C_TEXT:C284($1;$2;$vTxtToSearch;$vTxtWhereToSearch)
C_LONGINT:C283($lengthfound;$start)

$vTxtToSearch:=$1
$vTxtWhereToSearch:=ST Get plain text:C1092($2)
$sizeSearch:=Length:C16($vTxtToSearch)
$sizeSchema:=Length:C16($vTxtWhereToSearch)

ARRAY OBJECT:C1221($rangeToStyle;0)

If ($sizeSearch>1)
	  // we don't search on letters, only words
	
	$start:=1
	
	Repeat 
		vlResult:=Position:C15($vTxtToSearch;$vTxtWhereToSearch;$start;$lengthfound)
		If (vlResult>0)
			$o:=New object:C1471
			OB SET:C1220($o;"rangeStart";vlResult)
			OB SET:C1220($o;"rangeEnd";vlResult+$lengthfound)
			
			APPEND TO ARRAY:C911($rangeToStyle;$o)
			$start:=vlResult+$lengthfound
		End if 
	Until (vlResult=0)
	
	$nbFound:=Size of array:C274($rangeToStyle)
	For ($k;0;$nbFound)
		ST SET ATTRIBUTES:C1093($vTxtWhereToSearch;OB Get:C1224($rangeToStyle{$k};"rangeStart";Is longint:K8:6);OB Get:C1224($rangeToStyle{$k};"rangeEnd";Is longint:K8:6);Attribute background color:K65:8;"#f4c842")
	End for 
	
	$o:=New object:C1471
	OB SET:C1220($o;"newText";$vTxtWhereToSearch)
	OB SET:C1220($o;"numberFound";$nbFound)
	OB SET:C1220($o;"searchPerformed";True:C214)
	OB SET ARRAY:C1227($o;"rangeToStyle";$rangeToStyle)
	
Else 
	  //there is only one letter we don't do the search. 
	  // remove the style
	$vTxtWhereToSearch:=ST Get plain text:C1092($vTxtWhereToSearch)
	$o:=New object:C1471
	OB SET:C1220($o;"searchPerformed";False:C215)
	OB SET:C1220($o;"numberFound";0)
	OB SET:C1220($o;"newText";$vTxtWhereToSearch)
	OB SET ARRAY:C1227($o;"rangeToStyle";$rangeToStyle)
	
End if 

$0:=$o
