class Graph
{
	int xPos,yPos,xLength,yLength;
	
	
	int plotX1,plotX2,plotY1,plotY2;
	int scaleColor;
	int padding = 100 * scaleFactor;
	
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
	}
	
	void createLabels()
	{
		String yLabel1;
			
		// create first y label
		if(showAttribute.attr1 == null)
		{
			yLabel1 = "Select\nAttribute";
		}
		else
		{
			yLabel1 = showAttribute.attr1.getAxisLabel();
		}
		
		fill(255);
		PFont font = createFont("SansSerif", 10*scaleFactor);
		textFont(font);
		textLeading(12*scaleFactor);		
		text(yLabel1, xPos+(scaleFactor*spacing) ,(int)(plotY1+plotY2)/2);
		
		String yLabel2;
			
		// create second y label
		if(showAttribute.attr2 == null)
		{
			yLabel2 = "Select\nAttribute";
		}
		else
		{
			yLabel2 = showAttribute.attr2.getAxisLabel();
		}
		textAlign(RIGHT, CENTER);
		text(yLabel2, xPos+xLength-(2*scaleFactor*spacing) ,(int)(plotY1+plotY2)/2);
		
		// create x axis label
		textAlign(CENTER, CENTER);
		text("year",(int)(plotX1+plotX2)/2, yPos + yLength - (50*scaleFactor));
	}	
	
	
	void createAxis()
	{
		strokeWeight(2);  // set the line width
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
	
	private void createXAxis()
	{
		fill(0);
  		textSize(10 * scaleFactor);
  		textAlign(CENTER);
  
  // Use thin, gray lines to draw the grid
  		stroke(224);
  		strokeWeight(1);
  
  		for (int row = startYear; row <= endYear; row++) 
  		{
    		if ( row % yearInterval == 0) 
    		{
      			float x = map(row, startYear, endYear, plotX1, plotX2);
      			text(Integer.toString(row), x, plotY2 + textAscent() + 10*scaleFactor);
      			line(x, plotY1, x, plotY2);
    		}
		}
	}
	
}