//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project method : doc_volumeName
  // Database: runtime
  // ID[2B6888351CBF4E87A0C1EA955B44C52E]
  // Created #30/11/10 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  // Returns the volume name from a pathname
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_i;$Lon_parameters)
C_TEXT:C284($Txt_path;$Txt_volumeName)

ARRAY LONGINT:C221($tLon_lengths;0)
ARRAY LONGINT:C221($tLon_positions;0)

If (False:C215)
	C_TEXT:C284(doc_volumeName ;$0)
	C_TEXT:C284(doc_volumeName ;$1)
End if 

  // ----------------------------------------------------
  // Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1;"Missing parameter"))
	
	  //Required parameters
	$Txt_path:=$1
	
	  //Optional parameters
	If ($Lon_parameters>=2)
		
		  // <NONE>
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

  // ----------------------------------------------------
If (Match regex:C1019("(?mi-s)^\\W*(?:([^:]{1,}:)\\\\[^\\n]*)|(?:\\\\{2}([^\\\\]*)\\\\)|(?:([^:]*):){1}[^\\$]*$";$Txt_path;1;$tLon_positions;$tLon_lengths))
	
	For ($Lon_i;1;Size of array:C274($tLon_lengths);1)
		
		If ($tLon_positions{$Lon_i}>0)
			
			$Txt_volumeName:=Substring:C12($Txt_path;$tLon_positions{$Lon_i};$tLon_lengths{$Lon_i})
			
			$Lon_i:=MAXLONG:K35:2-1
			
		End if 
	End for 
End if 
  // ----------------------------------------------------
  // Return
$0:=$Txt_volumeName

  // ----------------------------------------------------
  // End