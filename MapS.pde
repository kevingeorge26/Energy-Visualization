class MapS
{ 
	int x,y;
	
	MapS()
	{
		x = width/2;
		y = height/2;		
		
	}
	
	void drawMap()
	{
		rect(x,y,100,100);
		fill(100);
	}
}