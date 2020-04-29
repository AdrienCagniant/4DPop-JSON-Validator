Case of 
		
	: (Form event code:C388=On Getting Focus:K2:7)
		If (Not:C34(vTargetIsSchema))
			
			OBJECT GET COORDINATES:C663(Self:C308->;$left;$top;$right;$bottom)
			
			
			OBJECT GET COORDINATES:C663(*;"variableSearchResult";$leftV;$topV;$rightV;$bottomV)
			OBJECT SET COORDINATES:C1248(*;"variableSearchResult";$left+200;$topV;$left+260;$bottomV)
			
			OBJECT GET COORDINATES:C663(*;"variableSearchResult1";$leftV;$topV;$rightV;$bottomV)
			OBJECT SET COORDINATES:C1248(*;"variableSearchResult1";$left+200;$topV;$left+260;$bottomV)
			
			OBJECT GET COORDINATES:C663(*;"varSearchPicker";$leftP;$topP;$rightP;$bottomP)
			OBJECT SET COORDINATES:C1248(*;"varSearchPicker";$left-9;$topP;$left+191;$bottomP)
			
			OBJECT GET COORDINATES:C663(*;"buttonSearchResultUp";$leftB;$topB;$rightB;$bottomB)
			OBJECT SET COORDINATES:C1248(*;"buttonSearchResultUp";$left+260;$topB;$left+280;$bottomB)
			
			OBJECT GET COORDINATES:C663(*;"buttonSearchResultDown";$leftB;$topB;$rightB;$bottomB)
			OBJECT SET COORDINATES:C1248(*;"buttonSearchResultDown";$left+280;$topB;$left+300;$bottomB)
			
			OBJECT GET COORDINATES:C663(*;"toolButton";$leftB;$topB;$rightB;$bottomB)
			OBJECT SET COORDINATES:C1248(*;"toolButton";$right-12;$topB;$right+26;$bottomB)
			
			
			SET TIMER:C645(-1)
			
			
			vTargetIsSchema:=True:C214
			vjsonLoaded:=ST Get plain text:C1092(vjsonLoaded)
			OB SET:C1220(resultSearch;"searchPerformed";False:C215)
			JV_guiSearchIsPerformed (False:C215)
			vSearch:=""
		End if 
		
		
End case 