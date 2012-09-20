import processing.core.*; 
import processing.xml.*; 

import controlP5.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class project1 extends PApplet {

class CountryPDE
{
	String country;
	Button button;
	
	CountryPDE(String country, Button button)
	{
		this.country = country;
		this.button = button;
		
		
		
		
	}
}
class CountrySearch
{
	 int x,y;
	 int cWidth;
	 String currentTyped = "";
	
	CountrySearch()
	{
		x = spacing*scaleFactor;
		y = height/2 - scaleFactor * spacing * 2;
		
		cWidth = (int) width / 5;
				
		
		PFont font = createFont("SansSerif", textFontSize*scaleFactor);
		
		cp5.addTextfield("Search Countries")
     		.setPosition(x + spacing*scaleFactor,y + spacing*scaleFactor)
     		.setSize(cWidth - spacing*2*scaleFactor ,inputHeight * scaleFactor)
     		.setFont(font)
     		.setFocus(true)
     		.setColor(color(0,0,0));
	}
	
	public void calledOnDraw()
	{
		
	}	
	
	public void showCountrySuggestions(String toSearch)
	{
		String[] test = Atlas.getCountrySuggestions(toSearch);
		countrySelect.updateList(test);
	}
	
	public void keyboardEvent(String input)
	{
		if (input.equals(" "))
		{
		 currentTyped = currentTyped + " "; 	
		}
		
		else if (input.equals("del") )
		{
			if ( currentTyped.length() > 0)
			{
				currentTyped = currentTyped.substring( 0,currentTyped.length() -1 );
			}
		}
		else
		{
			currentTyped = currentTyped + input;
		}
		
		  Textfield txt = ((Textfield)cp5.getController("Search Countries"));
		  txt.setValue(currentTyped);
		  
		  showCountrySuggestions(currentTyped); 
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	void addToText(char ch)
	{
		currentTyped = currentTyped + ch;
		
	}
	
	void drawText()
	{
		textSize(textFontSize);
		text(currentTyped,x+spacing,y+spacing,cWidth-spacing,30);
		fill(0, 102, 153);
	}*/
	
	
}

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
	
	public void updateList(String[] updatedList)
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
class Graph
{
	int x,y;
	
	Graph()
	{
		x = width/2;
		y = height/2;		
		
	}
	
	public void drawGraph()
	{
		rect(x,y,100,100);
		fill(200);
	}
}
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
	
	public void drawLabel()
	{
		
		
		MyControlListener mys = new MyControlListener();
		
		but = cp5.addButton(country)
     .setValue(100)
     .setPosition(xPosition,yPosition)
     .setSize(200*scaleFactor,40*scaleFactor)
     .setColor(countryColor)
     .addListener(mys);
                   
         
         
	}
	
	public void removeLabel()
	{
		but.remove();
	}
	
	class MyControlListener implements ControlListener 
	{
    	public void controlEvent(ControlEvent theEvent) 
    	{
    		
    		showSelectedCountries.removeCountry("");
    	}
    }
}
class MapS
{ 
	int x,y;
	
	MapS()
	{
		x = width/2;
		y = height/2;		
		
	}
	
	public void drawMap()
	{
		rect(x,y,100,100);
		fill(100);
	}
}
class ShowSelectedCountries
{
	int xPosition,yPosition;
	
	
	ArrayList availableColors = new ArrayList();
	HashMap selectedCountry = new HashMap(); // country , label class
	
	
	
	ShowSelectedCountries()
	{
		init();
				
		xPosition = (int) width/5 + spacing*scaleFactor*4;
		yPosition = distancefromTop*scaleFactor - inputHeight * scaleFactor;
					
	}
	
	public void init()
	{
		 availableColors.add( new CColor(0xffcdc9c9, 0xff66CD00, 0xfff0ffff,  0xff4169e1, 0xffff0000)  ) ;
		 availableColors.add( new CColor(0xffcdc9c9, 0xff39B7CD, 0xfff0ffff,  0xff4169e1, 0xffff0000)  ) ;
		 availableColors.add( new CColor(0xffcdc9c9, 0xff8E388E, 0xfff0ffff,  0xff4169e1, 0xffff0000)  ) ;	
	}
	
	public void addCountry(String country)
	{
		if(availableColors.size() > 0)
		{	
			CColor temp = ((CColor)availableColors.get(0));	
			availableColors.remove(0);
			
			int i = selectedCountry.keySet().size();
			
			int yPos = yPosition + i * scaleFactor * (spacing + 40 );
			
			Label label = new Label(country,temp,xPosition,yPos);
			selectedCountry.put(country,label);
		}
		else
		{
			println("Max country limit reached");
		}
	}
	
	public void removeCountry(String country)
	{
		Label deleted = (Label) selectedCountry.remove(country);
		println(deleted);
		availableColors.add(deleted.countryColor);
		deleted.removeLabel();
		
		redrawList();
	}
	
	public void redrawList()
	{
		int i = 0;
		for(String country : (String)selectedCountry.keySet() )
		{
			Label toShift = (Label) selectedCountry.remove(country);
			CColor cc = toShift.countryColor;
			toShift.removeLabel();
			
			int yPos = yPosition + i * scaleFactor * (spacing + 40 );
			Label label = new Label(country,cc,xPosition,yPos);
			selectedCountry.put(country,label);
			
			i++;
			
			
		}

		
		
	}
		
}


ControlP5 cp5;

CountrySearch countrySearch;
Keyboard keyboard;
CountrySelect countrySelect;
MapS mapS;
Graph graph;
ShowSelectedCountries showSelectedCountries;

Kevin kevin;


int spacing = 5;
int textFontSize = 15;
int scaleFactor = 1;
int inputHeight = 30;
int distancefromTop = 100;
boolean flag = true;

public void setup()
{
	size(1360,384);
	//background(139,139,137);

	cp5 = new ControlP5(this);
	CColor cc = new CColor(0xffcdc9c9, 0xffcdc9c9, 0xfff0ffff,  0xff2E0854, 0xffff0000) ;
	cp5.setColor(cc);
	
	PFont font = createFont("SansSerif", textFontSize*scaleFactor);
	cp5.setFont(font);
	
	//pde classes
	countrySearch = new CountrySearch();
	keyboard      = new Keyboard(); 
	countrySelect = new CountrySelect();
	mapS = new MapS();
	graph = new Graph();
	showSelectedCountries = new ShowSelectedCountries();
	
	// java classes
	kevin = new Kevin();
}
 
public void draw()
{ 
	//countrySearch.drawText();
	//countrySearch.showCountrySuggestions();
	 background(20);
	 
	 if(flag)
	 {
	 
	 mapS.drawMap();
	 }
	 else
	 graph.drawGraph();
	 
	
}

public void mousePressed()
{
	 if (mouseY > 0 && mouseX > width/2)
	 {
	 	print("second half");
	 	flag = !flag;
	 	
	 	
	 }
} 

public void controlEvent(ControlEvent theEvent) 
{
  if(theEvent.isAssignableFrom(Textfield.class)) 
  {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
  }
  
  else if(theEvent.isAssignableFrom(Button.class))
  {  
  	 
  }
  
}

    static public void main(String args[]) {
        PApplet.main(new String[] { "--bgcolor=#ECE9D8", "project1" });
    }
}
