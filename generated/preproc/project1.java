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
	
	public void drawCheckbox()
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
	
	public void handleChecked(int xClick,int yClick)
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
	int xPos,yPos,xLength,yLength;
	
	
	int plotX1,plotX2,plotY1,plotY2;
	int scaleColor;
	int padding = 100 * scaleFactor;
	
	Graph(int xPos,int yPos, int xLength , int yLength)
	{
		this.xPos = xPos;
		this.yPos = yPos;
		this.xLength = xLength;
		this.yLength = yLength;
	}
	
	public void refreshGraph()
	{
		createAxis();
		createLabels();
	}
	
	public void createLabels()
	{
		String yLabel1;
			
		// create first y label
		if(showAttribute.attr1 == null)
		{
			yLabel1 = "Select\nAttribute";
		}
		else
		{
			yLabel1 = showAttribute.attr1.getAxisLabel();
		}
		
		fill(255);
		PFont font = createFont("SansSerif", 10*scaleFactor);
		textFont(font);
		textLeading(12*scaleFactor);		
		text(yLabel1, xPos+(scaleFactor*spacing) ,(int)(plotY1+plotY2)/2);
		
		String yLabel2;
			
		// create second y label
		if(showAttribute.attr2 == null)
		{
			yLabel2 = "Select\nAttribute";
		}
		else
		{
			yLabel2 = showAttribute.attr2.getAxisLabel();
		}
		textAlign(RIGHT, CENTER);
		text(yLabel2, xPos+xLength-(2*scaleFactor*spacing) ,(int)(plotY1+plotY2)/2);
		
		// create x axis label
		textAlign(CENTER, CENTER);
		text("year",(int)(plotX1+plotX2)/2, yPos + yLength - (50*scaleFactor));
	}	
	
	
	public void createAxis()
	{
		strokeWeight(2);  // set the line width
  		stroke(255);
		
		smooth();
		noFill();
		
		plotX1 = xPos+padding;
		plotX2 = xPos + xLength - padding;
		
		plotY1 = yPos+ (30*scaleFactor);
		plotY2 = yPos + yLength - padding;
		
		beginShape();
		vertex(plotX1,plotY1);
		vertex(plotX1,plotY2 );
		vertex(plotX2,plotY2);
		vertex(plotX2,plotY1);
		endShape();
	}
	
	private void createXAxis()
	{
		fill(0);
  		textSize(10 * scaleFactor);
  		textAlign(CENTER);
  
  // Use thin, gray lines to draw the grid
  		stroke(224);
  		strokeWeight(1);
  
  		for (int row = startYear; row <= endYear; row++) 
  		{
    		if ( row % yearInterval == 0) 
    		{
      			float x = map(row, startYear, endYear, plotX1, plotX2);
      			text(Integer.toString(row), x, plotY2 + textAscent() + 10*scaleFactor);
      			line(x, plotY1, x, plotY2);
    		}
		}
	}
	
}
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
	
	public void refreshGraphCentral()
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
	
	public void handleMouseClick(int xClick,int yClick)
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
class Keyboard
{
	String[] key = {"q","w","e","r","t","y","u","i","o","p"};
	String[] key2 = {"a","s","d","f","g","h","j","k","l"};
	String[] key3 = {"z","x","c","v","b","n","m"};
	String[] key4 = {" ","del"};
	
	
	int buttonWidth,buttonHeight;
	int rowTwoY;   // using the same y co-ordinate to place the year slider
	
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
     		rowTwoY = rowOneY + buttonHeight + spacing*scaleFactor;
     		
     		
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
     	.setSize(200*scaleFactor,30*scaleFactor)
     	.setColor(countryColor)
     	.addListener(mys);                 
	}
	
	public void reDraw(int xPosition,int yPosition)
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
	
	public void removeLabel()
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
class Myslider
{
	Range range;
	int xPos , yPos, sLength , sHeight;
	int start,end;
	
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
    	start = PApplet.parseInt(theEvent.getController().getArrayValue(0));
    	end = PApplet.parseInt(theEvent.getController().getArrayValue(1));
    }
    
  	}
}

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
	
	
	public void refresh()
	{
		for (int i = 0 ; i < checkbox.length ; i++ )
		{
			checkbox[i].drawCheckbox();
		}
	}
	
	
	public void handleMouseClick(int xClick,int yClick)
	{
		for (int i = 0 ; i < checkbox.length ; i++ )
		{
			checkbox[i].handleChecked( xClick , yClick );
		}
	}
	
	
	public void trackSelectedAttribute(Attribute attr)
	{
		noOfAttributeSelected++;
		if( attr1 != null)
		{
			attr1 = attr;
		}
		else
		{
			attr2 = attr;
		}
	}
	
	public void trackUnselectedAttribute(Attribute attr)
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
class ShowSelectedCountries
{
	int xPosition,yPosition;
	
	
	ArrayList availableColors = new ArrayList();
	HashMap selectedCountry = new HashMap(); // country , label class
	
	
	
	ShowSelectedCountries()
	{
		init();
				
		xPosition = (int) width/5 + spacing*scaleFactor*2;
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
		if(!selectedCountry.containsKey(country))
		{
		if(availableColors.size() > 0)
		{	
			CColor temp = ((CColor)availableColors.get(0));	
			availableColors.remove(0);
			
			int i = selectedCountry.keySet().size();
			
			int yPos = yPosition + i * scaleFactor * (spacing + 30 );
			
			Label label = new Label(country,temp,xPosition,yPos);
			selectedCountry.put(country,label);
		}
		else
		{
			println("Max country limit reached");
		}
		}
	}
	
	public void removeCountry(String country)
	{
		Label deleted = (Label) selectedCountry.remove(country);
		availableColors.add(deleted.countryColor);
		deleted.removeLabel();
		
		redrawList();
	}
	
	public void redrawList()
	{
		int i = 0;
		try
		{
			
		
		Set<String> listOfCountries = (Set<String>) selectedCountry.keySet();
		for(String country :  listOfCountries )
		{
			Label toShift = (Label) selectedCountry.get(country);
			toShift.removeLabel();
			
			int yPos = yPosition + i * scaleFactor * (spacing + 40 );		
			i++;
			
			toShift.reDraw(xPosition,yPos);			
			
		}
		}
		catch(Exception e)
		{
			println("exception");
		}

		
		
	}
		
}


ControlP5 cp5;

CountrySearch countrySearch;
Keyboard keyboard;
CountrySelect countrySelect;
GraphCentral graphCentral;
ShowSelectedCountries showSelectedCountries;
ShowAttribute showAttribute;
Myslider myslider;

Kevin kevin;


int spacing = 5;
int textFontSize = 15;
int scaleFactor = 1;
int inputHeight = 30;
int distancefromTop = 100;
int startYear = 1980;
int endYear = 2008;
int yearInterval = 4;
boolean flag = true;
int checkboxFontSize = 15;

public void setup()
{
	size(1360*scaleFactor,384*scaleFactor,JAVA2D);
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
	showSelectedCountries = new ShowSelectedCountries();
	showAttribute = new ShowAttribute(showSelectedCountries.xPosition,showSelectedCountries.yPosition);
	myslider = new Myslider(showAttribute.xPos , keyboard.rowTwoY , 314*scaleFactor , 40*scaleFactor);
	graphCentral = new GraphCentral(myslider.xPos + myslider.sLength + spacing*scaleFactor,showSelectedCountries.yPosition,font);
	
	// java classes
	kevin = new Kevin();
}
 
public void draw()
{ 	
	background(20);
	showAttribute.refresh(); 
	graphCentral.refreshGraphCentral();
	
}

public void mousePressed()
{
	 showAttribute.handleMouseClick(mouseX,mouseY);
	 graphCentral.handleMouseClick(mouseX,mouseY);
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
