class Map
{
	int xPos,yPos,xLength,yLength;
	PShape bot;
	
	Map(int xPos,int yPos, int xLength , int yLength)
	{
		this.xPos = xPos + spacing*scaleFactor*2;
		this.yPos = yPos + spacing*scaleFactor*2;
		this.xLength = xLength - spacing*scaleFactor*2;
		this.yLength = yLength - spacing*scaleFactor*2;
		
		bot = loadShape("World_map_-_low_resolution.svg");
		
	}
	
	void placeMap()
	{
		fill(255);
		rect(xPos,yPos, xLength, yLength);
		shape(bot, xPos,yPos, xLength, yLength);  
		
		//line()
	}
	
	void handleMouseClick(int xMouse,int yMouse)
	{
		
		if( xMouse > xPos && xMouse < ( xPos + (xLength * .40)) )
		{
			if(yMouse < yPos + yLength/2 && yMouse > yPos )
			{
				showSelectedCountries.addCountry("north america");
			}
			else if(yMouse > yPos + yLength/2)
			{
				showSelectedCountries.addCountry("south america");
			}
		}
		
		else if ( (xMouse < xPos + xLength*.62)  && xMouse > ( xPos + (xLength * .40)))
		{
			if( yMouse > yPos &&  yMouse < yPos + .4 *yLength)
			{
				showSelectedCountries.addCountry("europe");
				
			}
			else if (  yMouse > yPos + .4 *yLength)
			{
				showSelectedCountries.addCountry("africa");
				
			}
			
		}
		
		else if (xMouse > xPos + xLength*.62 )
		{
			if(yMouse > yPos && yMouse < yPos + yLength/2)
			{
				showSelectedCountries.addCountry("eurasia");
				
			}
			else
			{
				showSelectedCountries.addCountry("asia & oceania");
				
			}
		}
			
		
		
	}
}