class CountrySearch
{
	 int x,y;
	 int cWidth;
	 String currentTyped = "";
	
	CountrySearch()
	{
		x = spacing*scaleFactor;
		y = height/2 - scaleFactor * spacing * 2;
		
		cWidth = (int) width / 5;
				
		
		PFont font = createFont("SansSerif", textFontSize*scaleFactor);
		
		cp5.addTextfield("Search Countries")
     		.setPosition(x + spacing*scaleFactor,y + spacing*scaleFactor)
     		.setSize(cWidth - spacing*2*scaleFactor ,inputHeight * scaleFactor)
     		.setFont(font)
     		.setFocus(true)
     		.setColor(color(0,0,0));
	}
	
	void calledOnDraw()
	{
		
	}	
	
	void showCountrySuggestions(String toSearch)
	{
		String[] test = Atlas.getCountrySuggestions(toSearch);
		countrySelect.updateList(test);
	}
	
	void keyboardEvent(String input)
	{
		if (input.equals(" "))
		{
		 currentTyped = currentTyped + " "; 	
		}
		
		else if (input.equals("del") )
		{
			if ( currentTyped.length() > 0)
			{
				currentTyped = currentTyped.substring( 0,currentTyped.length() -1 );
			}
		}
		else
		{
			currentTyped = currentTyped + input;
		}
		
		  Textfield txt = ((Textfield)cp5.getController("Search Countries"));
		  txt.setValue(currentTyped);
		  
		  showCountrySuggestions(currentTyped); 
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	void addToText(char ch)
	{
		currentTyped = currentTyped + ch;
		
	}
	
	void drawText()
	{
		textSize(textFontSize);
		text(currentTyped,x+spacing,y+spacing,cWidth-spacing,30);
		fill(0, 102, 153);
	}*/
	
	
}
