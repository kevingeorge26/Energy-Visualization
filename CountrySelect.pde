class CountrySelect
{
	ListBox l;
	String[] oldList;
	
	CountrySelect()
	{
		l = cp5.addListBox("Country List")
         .setPosition(countrySearch.x + spacing*scaleFactor, distancefromTop * scaleFactor)
         .setSize(countrySearch.cWidth - spacing*2*scaleFactor, height/2 - scaleFactor * spacing * 3 - distancefromTop)
         .setItemHeight(textFontSize*scaleFactor)
         .setBarHeight(textFontSize*scaleFactor + 10*scaleFactor)
        // .setColorActive(color(255, 128))
         ;
         
         
         MyControlListener my = new MyControlListener();
         l.addListener(my);
         
         

  
	}
	
	void updateList(String[] updatedList)
	{
		if(oldList != null)
		{
			for(int i = 0 ; i < oldList.length ; i++ )
			{
				l.removeItem(oldList[i]);
			}
		}
				
		l.addItems(updatedList);
		oldList = updatedList;
	}
	
	class MyControlListener implements ControlListener 
	{
    	public void controlEvent(ControlEvent theEvent) 
    	{
    		int index = ((int)theEvent.getValue());
    		showSelectedCountries.addCountry(oldList[index]);
    	}
    }
}