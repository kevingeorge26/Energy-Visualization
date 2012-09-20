class ShowSelectedCountries
{
	int xPosition,yPosition;
	
	
	ArrayList availableColors = new ArrayList();
	HashMap selectedCountry = new HashMap(); // country , label class
	
	
	
	ShowSelectedCountries()
	{
		init();
				
		xPosition = (int) width/5 + spacing*scaleFactor*4;
		yPosition = distancefromTop*scaleFactor - inputHeight * scaleFactor;
					
	}
	
	void init()
	{
		 availableColors.add( new CColor(0xffcdc9c9, 0xff66CD00, 0xfff0ffff,  0xff4169e1, 0xffff0000)  ) ;
		 availableColors.add( new CColor(0xffcdc9c9, 0xff39B7CD, 0xfff0ffff,  0xff4169e1, 0xffff0000)  ) ;
		 availableColors.add( new CColor(0xffcdc9c9, 0xff8E388E, 0xfff0ffff,  0xff4169e1, 0xffff0000)  ) ;	
	}
	
	void addCountry(String country)
	{
		if(availableColors.size() > 0)
		{	
			CColor temp = ((CColor)availableColors.get(0));	
			availableColors.remove(0);
			
			int i = selectedCountry.keySet().size();
			
			int yPos = yPosition + i * scaleFactor * (spacing + 40 );
			
			Label label = new Label(country,temp,xPosition,yPos);
			selectedCountry.put(country,label);
		}
		else
		{
			println("Max country limit reached");
		}
	}
	
	void removeCountry(String country)
	{
		Label deleted = (Label) selectedCountry.remove(country);
		println(deleted);
		availableColors.add(deleted.countryColor);
		deleted.removeLabel();
		
		redrawList();
	}
	
	void redrawList()
	{
		int i = 0;
		for(String country : (String)selectedCountry.keySet() )
		{
			Label toShift = (Label) selectedCountry.remove(country);
			CColor cc = toShift.countryColor;
			toShift.removeLabel();
			
			int yPos = yPosition + i * scaleFactor * (spacing + 40 );
			Label label = new Label(country,cc,xPosition,yPos);
			selectedCountry.put(country,label);
			
			i++;
			
			
		}

		
		
	}
		
}