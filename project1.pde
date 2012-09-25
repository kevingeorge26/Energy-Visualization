import controlP5.*;
import omicronAPI.*;

ControlP5 cp5;

CountrySearch countrySearch;
Keyboard keyboard;
CountrySelect countrySelect;
GraphCentral graphCentral;
ShowSelectedCountries showSelectedCountries;
ShowAttribute showAttribute;
Myslider myslider;

Atlas atlas;


OmicronAPI omicronManager;
TouchListener touchListener;
PApplet applet;

// Override of PApplet init() which is called before setup()
public void init() {
  super.init();
 
  // Creates the OmicronAPI object. This is placed in init() since we want to use fullscreen
  omicronManager = new OmicronAPI(this);
 
  // Removes the title bar for full screen mode (present mode will not work on Cyber-commons wall)
 //omicronManager.setFullscreen(true);
}







int spacing = 5;
int textFontSize = 15;
int scaleFactor =1;
int inputHeight = 30;
int distancefromTop = 100;
int startYear = 1980;
int endYear = 2008;
int yearInterval = 4;
boolean flag = true;
int checkboxFontSize = 15;

boolean firstTime = true;

void setup()
{
	size(1360*scaleFactor,384*scaleFactor,JAVA2D);
	applet = this;
	omicronManager.ConnectToTracker(7001, 7340, "131.193.77.159");
 
  // Create a listener to get events
  touchListener = new TouchListener();
 
  // Register listener with OmicronAPI
  omicronManager.setTouchListener(touchListener);
  
	
	
	//background(139,139,137);

	cp5 = new ControlP5(this);
	CColor cc = new CColor(0xffcdc9c9, 0xffffffff, 0xfff0ffff,  0xff2E0854, 0xffff0000) ;
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
	graphCentral = new GraphCentral(myslider.xPos + myslider.sLength + spacing*scaleFactor,showSelectedCountries.yPosition);
	
	// java classes
	atlas = new Atlas();
}
 
void draw()
{ 	
	background(20);
	 omicronManager.process();  
	 
	if(firstTime)
	{
		try
		{
			Thread.sleep(2000);
			firstTime = false;
		}
		catch(Exception e)
		{
			println("exception in draw of project1.pde" + e.getMessage());
		}
	}
	
	
	showAttribute.refresh(); 
	graphCentral.refreshGraphCentral();
	
}


void touchDown(int ID, float xPos, float yPos, float xWidth, float yWidth)
{
//mouseX = (int)xPos;
//mouseY = (int)yPos;

 cp5.getPointer().set((int) xPos, (int) yPos);
 cp5.getPointer().pressed();
 showAttribute.handleMouseClick( (int) xPos, (int) yPos);
 graphCentral.handleMouseClick((int) xPos, (int) yPos);

//mousePressed();

}// touchDown

void touchUp(int ID, float xPos, float yPos, float xWidth, float yWidth)
{
 
  cp5.getPointer().released();

}

//////////////////////////////////////////////////////////////////////////
void touchMove(int ID, float xPos, float yPos, float xWidth, float yWidth){
 
}// touchMove





void mousePressed()
{
	 
} 

void controlEvent(ControlEvent theEvent) 
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
