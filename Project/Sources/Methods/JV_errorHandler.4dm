//%attributes = {"invisible":true}
errOccured:=True:C214
  //ARRAY INTEGER($errCodes;10)
  //ARRAY INTEGER($errCpts;10)
  //ARRAY TEXT($errMsgs;10)
  //GET LAST ERROR STACK($errCodes;$errCpts;$errMsgs)
  //errCode:=$errCodes{1}
  //errCpt:=$errCpts{1}
  //errMsg:=$errMsgs{1}

ALERT:C41(Get localized string:C991("JsonVal_errorJsonInvalid"))

jsonIsValid:=False:C215