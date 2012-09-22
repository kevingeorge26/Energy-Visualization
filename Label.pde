class Label
{
	String country;
	int xPosition,yPosition;
	CColor countryColor;
	Button but;
	
	
	
	Label(String country,CColor countryColor,int xPosition,int yPosition)
	{
		this.country = country;
		this.countryColor = countryColor;
		this.xPosition = xPosition;
		this.yPosition = yPosition;
		
		drawLabel();
		
	}
	
	void drawLabel()
	{			
		MyControlListener mys = new MyControlListener();		
		
		but = cp5.addButton(country)
     	.setValue(100)
     	.setPosition(xPosition,yPosition)
     	.setSize(200*scaleFactor,30*scaleFactor)
     	.setColor(countryColor)
     	.addListener(mys);                 
	}
	
	void reDraw(int xPosition,int yPosition)
	{
		this.xPosition = xPosition;
		this.yPosition = yPosition;
		
		MyControlListener mys = new MyControlListener();
		
		but = cp5.addButton(country)
     	.setValue(100)
     	.setPosition(xPosition,yPosition)
     	.setSize(200*scaleFactor,40*scaleFactor)
     	.setColor(countryColor)
     	.addListener(mys);         
	}
	
	void removeLabel()
	{
		but.remove();
	}
	
	class MyControlListener implements ControlListener 
	{
    	public void controlEvent(ControlEvent theEvent) 
    	{
    		println("@@@@@@");
    		println(theEvent.getName());
    		showSelectedCountries.removeCountry(theEvent.getName());
    	}
    }
}