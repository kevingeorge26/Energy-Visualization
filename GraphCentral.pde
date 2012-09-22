class GraphCentral
{
	int xPos,yPos;
	PFont font;
	
	int selectedTab = 0;
	String tabs[] = {"Normal","percentage","Data","Clusters"};
	
	int[] tabLeft = new int[4], tabRight = new int[4];
	int tabTop,tabBottom,tabPad = 10*scaleFactor;
	
	Graph graph;
	
	GraphCentral(int xPos, int yPos , PFont font)
	{
		this.xPos = xPos;
		this.yPos = yPos;
		this.font = font;	
		
		tabBottom = yPos;
		tabTop = yPos - (int)textAscent() - 10*scaleFactor;
		
		
		//noFill();
		//stroke(200);  
		//rect(xPos,yPos,width-xPos-spacing*scaleFactor,height - yPos - spacing*scaleFactor);	
		
		graph = new Graph(xPos,yPos,width-xPos-spacing*scaleFactor,height - yPos - spacing*scaleFactor);
		
	}
	
	void refreshGraphCentral()
	{
		textFont(font);
		textAlign(LEFT);
		
		int runningX = xPos;
		
		for( int i = 0 ; i < tabs.length ; i++ )
		{
			String tab = tabs[i];
			
			tabLeft[i] = runningX;
			int tabWidth = (int)textWidth(tab);
			tabRight[i] = runningX + tabWidth + 2*scaleFactor*tabPad;			
						
			fill( selectedTab == i ? 255 : 100 );
			text(tab,tabLeft[i],tabBottom);
			
			runningX = tabRight[i];		
		}		
			
		if(selectedTab == 0)
		{
			graph.refreshGraph();
		}
	}
	
	void handleMouseClick(int xClick,int yClick)
	{
		 if (yClick > tabTop && yClick < tabBottom) 
		 {
    		for (int col = 0; col < tabs.length; col++)
    		{
      			if (xClick > tabLeft[col] && xClick < tabRight[col])
      			{
        			selectedTab = col;
      			}
    		}
  		}
	}
 
 	
}