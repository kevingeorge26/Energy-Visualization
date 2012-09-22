class Checkbox
{
	// the length for the longest checkbox will be used as sliders length
	// the xpos for the checkbox will be used as the xpos of the slider
	
	int xPos,yPos;
	PFont font;
	String label;
	int checkboxHeight;
	int textWidthLabel;
	boolean isChecked;
	Attribute attr;
	
	Checkbox(int xPos,int yPos, PFont font,Attribute attr)
	{
		this.xPos = xPos;
		this.yPos = yPos;
		this.font = font;
		this.label = label;
		this.attr = attr;
		this.label = attr.getLabel();
		
		isChecked = false;
	}
	
	void drawCheckbox()
	{
		stroke(255);
		fill(255);		
		textFont(font);
		textAlign(LEFT);
		
		int textHeight = (int)textAscent();
		checkboxHeight = textHeight;		
		textWidthLabel = (int)textWidth(label);
		
		text(label,xPos + textHeight*2,yPos+textHeight);		
		if(isChecked)
		{
			fill(255);
		}
		else
		{
			noFill();
		}
		rect(xPos,yPos,textHeight,textHeight);
		
		// set the lenght for slider
		if(attr == Attribute.ENERGY_CONSUMPTION_CAPITA)
		{
			if(showAttribute.sliderLength == 0)
			{
						
				showAttribute.sliderLength = textWidthLabel + 3*textHeight;			
				
			}
		}
		
	}
	
	void handleChecked(int xClick,int yClick)
	{
		int endX = xPos + 2*checkboxHeight + textWidthLabel;
		int endY = yPos + checkboxHeight;
		
		if( isChecked || ( showAttribute.noOfAttributeSelected < 2 ) )
		{		
			if(xClick < endX && xClick >xPos)
			{
				if(yClick < endY && yClick > yPos)
				{
					if( isChecked )
					{
						showAttribute.trackUnselectedAttribute(attr);
						
					}
					else
					{
						showAttribute.trackSelectedAttribute(attr);
					}
					
					isChecked = !isChecked;
				
				}
			}
		}
	}
}