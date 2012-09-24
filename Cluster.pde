class Cluster
{
	int xPos,yPos,xLength,yLength;
	
	Cluster(int xPos,int yPos, int xLength , int yLength)
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
}