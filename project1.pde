import controlP5.*;

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

void setup()
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
 
void draw()
{ 	
	background(20);
	showAttribute.refresh(); 
	graphCentral.refreshGraphCentral();
	
}

void mousePressed()
{
	 showAttribute.handleMouseClick(mouseX,mouseY);
	 graphCentral.handleMouseClick(mouseX,mouseY);
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
