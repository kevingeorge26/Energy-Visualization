class Map
{
	int xPos,yPos,xLength,yLength;
	PShape bot;
	
	Map(int xPos,int yPos, int xLength , int yLength)
	{
		this.xPos = xPos;
		this.yPos = yPos;
		this.xLength = xLength;
		this.yLength = yLength;
		
		bot = loadShape("A_large_blank_world_map_with_oceans_marked_in_blue.svg");
		
	}
	
	void placeMap()
	{
		fill(255);
		rect(xPos,yPos, xLength, yLength);
		shape(bot, xPos,yPos, xLength, yLength);  
	}
	
	void handleMouseClick()
	{
		
	}
}