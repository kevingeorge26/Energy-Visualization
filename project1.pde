import controlP5.*;

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

void setup()
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
 
void draw()
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

void mousePressed()
{
	 if (mouseY > 0 && mouseX > width/2)
	 {
	 	print("second half");
	 	flag = !flag;
	 	
	 	
	 }
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
