class Keyboard
{
	String[] key = {"q","w","e","r","t","y","u","i","o","p"};
	String[] key2 = {"a","s","d","f","g","h","j","k","l"};
	String[] key3 = {"z","x","c","v","b","n","m"};
	String[] key4 = {" ","del"};
	
	
	int buttonWidth,buttonHeight;
	
	Keyboard()
	{	
		
		
  		MyControlListener myListner = new MyControlListener();
  
  
		buttonWidth = 20 * scaleFactor;
		buttonHeight = 20 * scaleFactor;
		
		int rowOneX = countrySearch.x + 2*spacing*scaleFactor;
		int rowOneY = countrySearch.y + 2 * spacing*scaleFactor + 40*scaleFactor + 25 * scaleFactor; // size of the text area + size of the label below it
		
     		for (int i = 0 ; i < key.length ; i++)
     		{
     			cp5.addButton(key[i])
     		.setValue(i)
     		.setPosition(  rowOneX + (spacing*scaleFactor + buttonWidth ) * i, rowOneY )
     		.setSize(buttonWidth,buttonHeight)
     		.addListener(myListner);
     				
     		}
     		
     		int rowTwoX = rowOneX + buttonWidth/2;
     		int rowTwoY = rowOneY + buttonHeight + spacing*scaleFactor;
     		
     		
     		for (int i = 0 ; i < key2.length ; i++)
     		{
     			cp5.addButton(key2[i])
     		.setValue(i+10)
     		.setPosition(  rowTwoX + (spacing*scaleFactor + buttonWidth ) * i, rowTwoY )
     		.setSize(buttonWidth,buttonHeight)
     		.addListener(myListner);;
     				
     		}
     		
     		int rowThreeX = rowTwoX + buttonWidth/2;
     		int rowThreeY = rowTwoY + buttonHeight + spacing*scaleFactor;
     		
			for (int i = 0 ; i < key3.length ; i++)
     		{
     			cp5.addButton(key3[i])
     		.setValue(i+20)
     		.setPosition(  rowThreeX + (spacing*scaleFactor + buttonWidth ) * i, rowThreeY )
     		.setSize(buttonWidth,buttonHeight)
     		.addListener(myListner);;
     				
     		}
     		
     		int rowFourX = rowThreeX + buttonWidth/2;
     		int rowFourY = rowThreeY + buttonHeight + spacing*scaleFactor;
     		
     		//space
     			cp5.addButton(key4[0])
     		.setValue(0+30)
     		.setPosition(  rowFourX + spacing*scaleFactor , rowFourY )
     		.setSize(buttonWidth*5,buttonHeight)
     		.addListener(myListner);;
     		
     		//delete
     		Button temp = cp5.addButton(key4[1])
     		.setValue(0+31)
     		.setPosition(  rowFourX + 2*spacing*scaleFactor + buttonWidth*5 , rowFourY )
     		.setSize(buttonWidth *2,buttonHeight)
     		.addListener(myListner);;
     				
     		print(temp.getPosition().x);
	}
	
	
	class MyControlListener implements ControlListener 
	{
    public void controlEvent(ControlEvent theEvent) 
    {
    	countrySearch.keyboardEvent(theEvent.getName());
    }
    
  	}
	
}