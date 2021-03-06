class GraphCentral
{
	int xPos,yPos;
	PFont font;
	
	int selectedTab = 2;
	String tabs[] = {"Normal","percentage","Data","Finding1","Map","Finding2"};
	
	int[] tabLeft = new int[6], tabRight = new int[6];
	int tabTop,tabBottom,tabPad = 10*scaleFactor;
	
	Graph graph;
	Map mymap;
	PieChart piechart;
	DataTable datatable;
	Cluster cluster;
	Cluster2 cluster2;
	
	GraphCentral(int xPos, int yPos )
	{
		this.xPos = xPos;
		this.yPos = yPos;
		this.font = createFont("SansSerif", 10*scaleFactor);
		
		tabBottom = yPos;
		tabTop = yPos - (int)textAscent() - 10*scaleFactor;
		
		
		//noFill();
		//stroke(200);  
		//rect(xPos,yPos,width-xPos-spacing*scaleFactor,height - yPos - spacing*scaleFactor);	
		
		graph = new Graph(xPos,yPos,width-xPos-spacing*scaleFactor,height - yPos - spacing*scaleFactor);
		mymap = new Map(xPos,yPos,width-xPos-spacing*scaleFactor,height - yPos - spacing*scaleFactor);
		piechart = new PieChart(xPos,yPos,width-xPos-spacing*scaleFactor,height - yPos - spacing*scaleFactor);
		datatable = new DataTable(xPos,yPos,width-xPos-spacing*scaleFactor,height - yPos - spacing*scaleFactor);
		cluster = new Cluster(xPos,yPos,width-xPos-spacing*scaleFactor,height - yPos - spacing*scaleFactor);
		cluster2 = new Cluster2(xPos,yPos,width-xPos-spacing*scaleFactor,height - yPos - spacing*scaleFactor);
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
			tabRight[i] = runningX + tabWidth + 1*scaleFactor*tabPad;			
						
			fill( selectedTab == i ? 255 : 100 );
			text(tab,tabLeft[i],tabBottom);
			
			runningX = tabRight[i];		
		}		
			
		if(selectedTab == 0)
		{
			graph.refreshGraph();
		}
		if(selectedTab == 1)
		{
			piechart.refreshChart();
		}
		if(selectedTab == 2)
		{
			datatable.refreshTable();
		}
		if(selectedTab == 3)
		{
			cluster.refreshGraph();
		}
		if(selectedTab == 4)
		{
			mymap.placeMap();
		}
		if(selectedTab == 5)
		{
			cluster2.refreshGraph();
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
  		
  		
  		if(selectedTab == 4)
  		{
  			mymap.handleMouseClick(xClick,yClick);
  		}
	}
 
 	
}