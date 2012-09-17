import controlP5.*;

ControlP5 cp5;

CountrySearch countrySearch;
Keyboard keyboard;
CountrySelect countrySelect;

Kevin kevin;

int spacing = 10;
int textFontSize = 15;
int scaleFactor = 1;
int inputHeight = 30;
int distancefromTop = 50;

void setup()
{
	size(1360,384);
	background(139,139,137);

	cp5 = new ControlP5(this);
	CColor cc = new CColor(0xffcdc9c9, 0xffcdc9c9, 0xfff0ffff,  0xff4169e1, 0xffff0000) ;
	cp5.setColor(cc);
	
	PFont font = createFont("SansSerif", textFontSize*scaleFactor);
	cp5.setFont(font);
	
	//pde classes
	countrySearch = new CountrySearch();
	keyboard      = new Keyboard(); 
	countrySelect = new CountrySelect();
	
	// java classes
	kevin = new Kevin();
}
 
void draw()
{ 
	//countrySearch.drawText();
	//countrySearch.showCountrySuggestions();
	 background(20);
	
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
