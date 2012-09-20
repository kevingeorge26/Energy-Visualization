class Graph
{
	int x,y;
	
	Graph()
	{
		x = width/2;
		y = height/2;		
		
	}
	
	void drawGraph()
	{
		rect(x,y,100,100);
		fill(200);
	}
}