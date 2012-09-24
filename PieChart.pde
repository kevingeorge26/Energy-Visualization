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
		//	createCircle2();
		
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
			
			Set<String> tempCountries = showSelectedCountries.getSelectedCountries();
			String selectCountries[] =  tempCountries.toArray(new String[tempCountries.size()]);
			
			int[] percent = atlas.getPercentage(selectCountries,myslider.start,myslider.end,showAttribute.attr1);
			
			int centerX = int (xPos + (xLength/4));
			int centerY = int (yPos + (yLength/2));

			int diameter = 100*scaleFactor;
			int lastAngle = 0;
			
			println("*************************************************88");
			Label labelTemp;
			CColor tempColor;
			
			for (int i = 0; i < percent.length; i++)
			{	
				int arccolor;			
    			if( selectCountries.length > 0 && i < selectCountries.length)
    			{
    				labelTemp = (Label)showSelectedCountries.selectedCountry.get(selectCountries[i]);
					tempColor = (CColor)labelTemp.countryColor;
    				arccolor = tempColor.getBackground();
    				
    				println(selectCountries[i] + " angle = " + percent[i]);
    			}
    			else
    			{
    				arccolor = 255;
    				println("world" + " angle = " + percent[i]);
    			}
    			
    			//noStroke();
    			fill(arccolor);
    			arc(centerX, centerY, diameter, diameter, lastAngle, lastAngle+radians(percent[i]) );
    			lastAngle += radians(percent[i]);
  			}
			
		}
		
		PFont font = createFont("SansSerif", 10*scaleFactor);
		//textFont(font);
		//textAlign(CENTER);
		//fill(255);
		
		//text(heading,xPos + xLength/4, yPos + (scaleFactor * spacing * 5) );		
		
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