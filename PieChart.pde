class PieChart
{
	
	int xPos,yPos,xLength,yLength;
		
	PieChart(int xPos,int yPos, int xLength , int yLength)
	{
		this.xPos = xPos;
		this.yPos = yPos;
		this.xLength = xLength;
		this.yLength = yLength;
	}
	
	void refreshChart()
	{
		
			createCircle1();	
			createCircle2();
		
	}
	
	void createCircle1()
	{
		String heading;
		
		if(showAttribute.attr1 == null)
		{
			heading = "Select Attribute";
		}
		else
		{
			heading = showAttribute.attr1.getAxisLabel();
			Set<String> selectCountries = showSelectedCountries.getSelectedCountries();
			int[] percent = atlas.getPercentage(selectCountries,myslider.start,myslider.end,showAttribute.attr1);
			
			
			
			
		}
		
		PFont font = createFont("SansSerif", 10*scaleFactor);
		textFont(font);
		textAlign(CENTER);
		fill(255);
		
		text(heading,xPos + xLength/4, yPos + (scaleFactor * spacing * 5) );
		
		
		
		
		
		
	}
	
	void createCircle2()
	{
		String heading;
		
		if(showAttribute.attr2 == null)
		{
			heading = "Select Attribute";
		}
		else
		{
			heading = showAttribute.attr2.getAxisLabel();
		}
		
		PFont font = createFont("SansSerif", 10*scaleFactor);
		textFont(font);
		textAlign(CENTER);
		fill(255);
		
		text( heading,xPos + 3* (xLength/4) , yPos + (scaleFactor * spacing * 5) );
		
		
		
		textAlign(LEFT);
	}
}