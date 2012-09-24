class Cluster2
{
	int xPos,yPos,xLength,yLength;
	
	int option = 1;
	
	int plotX1,plotX2,plotY1,plotY2;
	int scaleColor;
	int padding = 100 * scaleFactor;
	
	float maxValueY,maxValueX;
	
	Cluster2(int xPos,int yPos, int xLength , int yLength)
	{
		this.xPos = xPos;
		this.yPos = yPos;
		this.xLength = xLength;
		this.yLength = yLength;
	}
	
	void refreshGraph()
	{		
		createAxis();
		
		if( option == 1 )
		{
			createLabelOne();
			createDataLines();
		}
		else
		{
			
		}
		
		//drawYearLabels();
		//createDataLines();		
		//drawVolumeLabels();
	}
	
	void createAxis()
	{
		strokeWeight(scaleFactor);  // set the line width
  		stroke(255);
		
		smooth();
		noFill();
		
		plotX1 = xPos+padding;
		plotX2 = xPos + xLength - padding;
		
		plotY1 = yPos+ (30*scaleFactor);
		plotY2 = yPos + yLength - padding;
		
		beginShape();
		vertex(plotX1,plotY1);
		vertex(plotX1,plotY2 );
		vertex(plotX2,plotY2);
		//vertex(plotX2,plotY1);
		endShape();
	}
	
	
	void createLabelOne()
	{
		String yLabel1;
		strokeWeight(scaleFactor);
				
		fill(255);
		PFont font = createFont("SansSerif", 10*scaleFactor);
		textFont(font);
		textLeading(12*scaleFactor);		
		text("Electicity Prod\n" + "per capita\n" + "in kWH", xPos+(scaleFactor*spacing) ,(int)(plotY1+plotY2)/2);
		
				
		// create x axis label
		textAlign(CENTER, CENTER);
		text("CO2 Emission " + "per capita" + "  in MT",(int)(plotX1+plotX2)/2, yPos + yLength - (50*scaleFactor));
		textAlign(LEFT, CENTER);
	}	
	
	
	void createDataLines()
	{
		Set<String> selectCountries = showSelectedCountries.getSelectedCountries();
		
		maxValueY = atlas.getBiggestValue(selectCountries,1980,2009 ,Attribute.ELECTRICTY_GENERATION_CAPITA , null);
		//println("maxValueY" + maxValueY);
		maxValueX = atlas.getBiggestValue(selectCountries,1980,2009 ,Attribute.CO2_EMISSION_CAPITA , null);
		
		for(String country :  selectCountries )
		{
			Label labelTemp = (Label)showSelectedCountries.selectedCountry.get(country);
			CColor tempColor = (CColor)labelTemp.countryColor;
			
			float[] valy = atlas.getAttrValue(country,myslider.start,myslider.end,Attribute.ELECTRICTY_GENERATION_CAPITA);
			float[] valx = atlas.getAttrValue(country,myslider.start,myslider.end,Attribute.CO2_EMISSION_CAPITA);
								
			plotPoints(valx,valy,tempColor.getBackground());
		}
		
	}
	
	void plotPoints(float valx[] , float valy[] , int dotColor)
	{
		fill(dotColor);
		
		float x,y;
		for( int i = 0 ; i < valx.length ; i++)
		{
			x = map(valx[i],0,maxValueX,plotX1,plotX2);
			y = map(valy[i],0,maxValueY,plotY2,plotY1);
			ellipseMode(RADIUS);
			ellipse(x,y,2*scaleFactor,2*scaleFactor);	
		}
	}
	
	
	
}