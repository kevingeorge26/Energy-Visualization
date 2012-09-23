class Myslider
{
	Range range;
	int xPos , yPos, sLength , sHeight;
	int start = 1980,end=2008;
	
	// the y axis co-ordinates is same as the y coordinate for the second row of the keyboard
	// the x axis co-ordinate is same as check box start point
	// length as big as the longest checkbox
	
	Myslider( int xPos , int yPos , int sLength , int sHeight)
	{

		this.xPos = xPos;
		this.yPos = yPos;
		this.sLength = sLength;
		this.sHeight = sHeight;
		
		MyControlListener myListner = new MyControlListener();

		range = cp5.addRange("")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(xPos,yPos)
             .setSize(314,40)
             .setHandleSize(20*scaleFactor)
             .setRange(1980,2008)
             .setRangeValues(1980,2008)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true)
             .setColorForeground(0xffFFFFFF)
             .setColorBackground(color(255,40))
             .addListener(myListner)
             ;
             
         
	}
	
	
	class MyControlListener implements ControlListener 
	{
    public void controlEvent(ControlEvent theEvent) 
    {
    	start = int(theEvent.getController().getArrayValue(0));
    	end = int(theEvent.getController().getArrayValue(1));
    }
    
  	}
}
