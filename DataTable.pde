class DataTable
{
	int xPos,yPos,xLength,yLength;
	String label1,label2;
	
	Attribute attr1;
	
	DataTable(int xPos,int yPos, int xLength , int yLength)
	{
		this.xPos = xPos + spacing*scaleFactor*2;
		this.yPos = yPos + spacing*scaleFactor*2;
		this.xLength = xLength - spacing*scaleFactor*2;
		this.yLength = yLength - spacing*scaleFactor*2;
	}
	
	void refreshTable()
	{
		if(showAttribute.attr1 == null && showAttribute.attr2 == null)
		{
			label1 = "Select Attribute";
		} 
		
		else
		{
			if(showAttribute.attr1 == null)
			{
				label1 = showAttribute.attr2.getLabel() + showAttribute.attr2.getUnit();
				attr1 = showAttribute.attr2;
			}			
			else
			{
				label1 = showAttribute.attr2.getLabel() + showAttribute.attr1.getUnit();
				attr1 = showAttribute.attr1;
			}
			
			
			Set<String> selectCountries = showSelectedCountries.getSelectedCountries();
			
			if( selectCountries.size() > 0)
				drawTable(selectCountries.toArray(new String[selectCountries.size()])[0]);
			
		}		
		
		
		
	}
	
	
	void drawTable(String country)
	{
		
			
		int rowSize = yLength/20;
		int row;
		
		int start = myslider.start;
		int end = myslider.end;
		
		
		float[] toPrint = atlas.getAttrValue(country,start,end ,attr1);
		
		row = end-start > 20 ? 20 : end-start;
	
		PFont font = createFont("SansSerif", 8*scaleFactor);
		textFont(font);
		textAlign(CENTER);
		
		Label labelTemp = (Label)showSelectedCountries.selectedCountry.get(country);
		CColor tempColor = (CColor)labelTemp.countryColor;
			
			
		int ccolor = tempColor.getBackground();
		stroke(ccolor);
  		
		for(int i = 0 ; i < row ; i ++)
		{
			noFill();
			stroke( i%2 == 0 ? 0 : 100 );
			rect(xPos , yPos + (rowSize *i), xLength , rowSize );
			
			if( i == 0 )
			{
				stroke(0);
				text(label1 , xPos + xLength/2 , yPos + (rowSize *i) + textAscent() );
			
			}
			else
			{
				fill(ccolor);
				text(toPrint[i] , xPos + xLength/2 , yPos + (rowSize *i) + textAscent() );
				fill(255);
				text(start + (i-1), xPos + xLength/4 , yPos + (rowSize *i) + textAscent() );
			}
			
		}
		
		
		textAlign(LEFT);
		
	}
}