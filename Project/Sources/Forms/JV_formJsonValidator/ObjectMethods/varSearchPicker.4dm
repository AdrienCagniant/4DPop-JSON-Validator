
Case of 
	: (Form event code:C388=On Validate:K2:3)
		vDoQuery:=True:C214
		SET TIMER:C645(1)
		
	: (Form event code:C388=On Data Change:K2:15)
		vDoQuery:=True:C214
		SET TIMER:C645(30)
		
End case 
