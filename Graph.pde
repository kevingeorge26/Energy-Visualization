class Graph
{
	int xPos,yPos,xLength,yLength;
	
	
	int plotX1,plotX2,plotY1,plotY2;
	int scaleColor;
	int padding = 100 * scaleFactor;
	float maxValue;
	
	Graph(int xPos,int yPos, int xLength , int yLength)
	{
		this.xPos = xPos;
		this.yPos = yPos;
		this.xLength = xLength;
		this.yLength = yLength;
	}
	
	void refreshGraph()
	{
		
		createAxis();
		createLabels();
		drawYearLabels();
		createDataLines();		
		drawVolumeLabels();
	}
	
	int yearInterval = 3;
	void drawYearLabels()
	 {
  		fill(255);
  		textSize(10*scaleFactor);
  		textAlign(CENTER);
  
  		// Use thin, gray lines to draw the grid
  		
  		for (int row = myslider.start; row < myslider.end; row++)
  	 	{
    		if (row % yearInterval == 0) 
    		{
      			float x = map(row, myslider.start, myslider.end, plotX1, plotX2);
      			text(row, x, plotY2 + textAscent() + 10*scaleFactor);
      	
    		}	
  		}
  		
  		textAlign(LEFT);
	}
	
	
	int volumeIntervalMinor = 100;   // Add this above setup()
	int volumeInterval = 200;

void drawVolumeLabels()
{
  fill(255);
  textSize(10);
  textAlign(RIGHT);
  
  stroke(128);
  strokeWeight(1*scaleFactor);
  float dataMin = 0;
  float dataMax = maxValue;

  for (float v = dataMin; v <= dataMax; v += volumeIntervalMinor) {
    if (v % volumeIntervalMinor == 0) {     // If a tick mark
      float y = map(v, dataMin, dataMax, plotY2, plotY1);  
      if (v % volumeInterval == 0) {        // If a major tick mark
        float textOffset = textAscent()/2;  // Center vertically
        if (v == dataMin) {
          textOffset = 0;                   // Align by the bottom
        } else if (v == dataMax) {
          textOffset = textAscent();        // Align by the top
        }
        text(floor(v), plotX1 - 10, y + textOffset);
        line(plotX1 - 4*scaleFactor, y, plotX1, y);     // Draw major tick
      } else {
        //line(plotX1 - 2, y, plotX1, y);     // Draw minor tick
      }
    }
  }
  
  
  textAlign(LEFT);
  
  
  for (float v = dataMin; v <= dataMax; v += volumeIntervalMinor) {
    if (v % volumeIntervalMinor == 0) {     // If a tick mark
      float y = map(v, dataMin, dataMax, plotY2, plotY1);  
      if (v % volumeInterval == 0) {        // If a major tick mark
        float textOffset = textAscent()/2;  // Center vertically
        if (v == dataMin) {
          textOffset = 0;                   // Align by the bottom
        } else if (v == dataMax) {
          textOffset = textAscent();        // Align by the top
        }
        text(floor(v), plotX2 + 10, y + textOffset);
        line(plotX2, y, plotX2+4*scaleFactor, y);     // Draw major tick
      } else {
        //line(plotX1 - 2, y, plotX1, y);     // Draw minor tick
      }
    }
  }
  
  
}
	
	
	
	void createLabels()
	{
		String yLabel1;
		strokeWeight(scaleFactor);
			
		// create first y label
		if(showAttribute.attr1 == null)
		{
			yLabel1 = "Select\nAttribute";
		}
		else
		{
			yLabel1 = showAttribute.attr2.getAxisLabel() + "\n" + showAttribute.attr2.getUnit();
		}
		
		fill(255);
		PFont font = createFont("SansSerif", 10*scaleFactor);
		textFont(font);
		textLeading(12*scaleFactor);		
		text(yLabel1, xPos+(scaleFactor*spacing) ,(int)(plotY1+plotY2)/2);
		
		line(xPos+(scaleFactor*spacing) , (int)(plotY1+plotY2)/2 + 4*(textAscent()+textDescent()),xPos+(scaleFactor*spacing)+textWidth("Total Energy"), (int)(plotY1+plotY2)/2 + 4*(textAscent()+textDescent()));
		
		String yLabel2;
			
		// create second y label
		if(showAttribute.attr2 == null)
		{
			yLabel2 = "Select\nAttribute";
		}
		else
		{
			yLabel2 = showAttribute.attr1.getAxisLabel() + "\n" + showAttribute.attr1.getUnit();
		}
		textAlign(RIGHT, CENTER);
		text(yLabel2, xPos+xLength-(2*scaleFactor*spacing) ,(int)(plotY1+plotY2)/2);
		
		line( xPos+xLength-(2*scaleFactor*spacing)-textWidth("Total Energy"),(int)(plotY1+plotY2)/2 + 4*(textAscent()+textDescent()),xPos+xLength-(2*scaleFactor*spacing) , (int)(plotY1+plotY2)/2 + 4*(textAscent()+textDescent()));
		ellipseMode(RADIUS);
		ellipse(xPos+xLength-(2*scaleFactor*spacing)-textWidth("Total Energy")/2,(int)(plotY1+plotY2)/2 + 4*(textAscent()+textDescent()),2*scaleFactor,2*scaleFactor);
				
		// create x axis label
		textAlign(CENTER, CENTER);
		text("year",(int)(plotX1+plotX2)/2, yPos + yLength - (50*scaleFactor));
		textAlign(LEFT, CENTER);
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
		vertex(plotX2,plotY1);
		endShape();
	}
	
	void createDataLines()
	{
		Set<String> selectCountries = showSelectedCountries.getSelectedCountries();
		maxValue = atlas.getBiggestValue(selectCountries,myslider.start,myslider.end ,showAttribute.attr1 , showAttribute.attr2);
		
		for(String country :  selectCountries )
		{
			Label labelTemp = (Label)showSelectedCountries.selectedCountry.get(country);
			CColor tempColor = (CColor)labelTemp.countryColor;
			
			if(showAttribute.attr1 != null)
			{
				float[] val = atlas.getAttrValue(country,myslider.start,myslider.end,showAttribute.attr1);
				plotLines(val,tempColor.getBackground(),false,maxValue);
			}
			
			if( showAttribute.attr2 != null)
			{
				float[] val = atlas.getAttrValue(country,myslider.start,myslider.end,showAttribute.attr2);
				plotDashedLines(val,tempColor.getBackground(),false,maxValue);
			}
		}
		
	}
	
	void plotLines(float[] val, int lineColor, boolean isDashed,float maxValue)
	{
		beginShape();
		noFill();
		
		stroke(lineColor);
		strokeWeight(scaleFactor);
		
		for(int i = 0 ; i < val.length ; i++ )
		{
			float x = map(myslider.start + i , myslider.start,myslider.end,plotX1,plotX2);
			float y = map(val[i],0,maxValue,plotY2,plotY1);
			
			
			vertex(x,y);
		}
		
		endShape();
	}
	
	void plotDashedLines(float[] val, int lineColor, boolean isDashed,float maxValue)
	{
		beginShape();
		noFill();
		
		stroke(lineColor);
		strokeWeight(scaleFactor);
		
		for(int i = 0 ; i < val.length ; i++ )
		{
			float x = map(myslider.start + i , myslider.start,myslider.end,plotX1,plotX2);
			float y = map(val[i],0,maxValue,plotY2,plotY1);
			ellipseMode(RADIUS);
			ellipse(x,y,2*scaleFactor,2*scaleFactor);
			vertex(x,y);
		}
		
		endShape();
	}
	
	
	
}