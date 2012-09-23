class ShowAttribute
{
	int xPos,yPos;
	
	int noOfAttributeSelected = 0; // keeps track of number of attr selected
	// doesnt allow more that 2 attribute to be selected
	// check the checkbox class for more details
	
	
	int sliderLength = 0;
	
	Checkbox[] checkbox = new Checkbox[Attribute.values().length];
	Attribute attr1,attr2;
	
	ShowAttribute(int prevX,int prevY)
	{
		xPos = prevX + 200*scaleFactor + spacing*scaleFactor;   // length of the selected country label
		yPos = prevY;	
		
		PFont fontC = createFont("SansSerif", checkboxFontSize*scaleFactor);
		
		for (int i = 0 ; i < checkbox.length ; i++ )
		{
			checkbox[i] = new Checkbox( xPos, yPos + i* (spacing*2*scaleFactor + ((int)textAscent())), fontC, Attribute.values()[i]);
		}	
		
	}
	
	
	void refresh()
	{
		for (int i = 0 ; i < checkbox.length ; i++ )
		{
			checkbox[i].drawCheckbox();
		}
	}
	
	
	void handleMouseClick(int xClick,int yClick)
	{
		for (int i = 0 ; i < checkbox.length ; i++ )
		{
			checkbox[i].handleChecked( xClick , yClick );
		}
	}
	
	
	void trackSelectedAttribute(Attribute attr)
	{
		noOfAttributeSelected++;
		
		if( attr1 == null)
		{
			attr1 = attr;
		}
		else
		{
			attr2 = attr;
		}
	}
	
	void trackUnselectedAttribute(Attribute attr)
	{
		noOfAttributeSelected--;
		if ( attr1 == attr)
		{
			attr1 = null;
		}
		else
		{
			attr2 = null;
		}
	}
	
}