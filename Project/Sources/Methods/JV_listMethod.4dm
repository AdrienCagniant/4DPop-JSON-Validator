//%attributes = {"invisible":true}
  //%attributes = {"lang":"en"} comment added and reserved by 4D.
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		$list:=New list:C375
		For ($i;1;20)
			APPEND TO LIST:C376($list;"item "+String:C10($i);$i)
		End for 
		$p:=OBJECT Get pointer:C1124(Object current:K67:2)
		$p->:=$list
		
End case 