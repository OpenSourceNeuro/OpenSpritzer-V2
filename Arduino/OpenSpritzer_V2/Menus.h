#include "TFT.h"

bool Flag_MenuSelected;

int menuCounter = 0;

int menu1_value =0;
int menu2_value =0;
int menu3_value =0;

bool menu1_selected;
bool menu2_selected;
bool menu3_selected;


int MenuSelection;



void UpdateGraph(){
  int On = PulseOn;
  int Off = PulseOff;
  int Number = NumberOfPulse;

  int PreOn = On/10;
  int PostOff = Off/10;
  int Dur = Number*(On+Off);
  int Ms = Dur /4;

  gr.createGraph(280, 55, DARKSOL_Bckg2);                   // Graph area is 280 pixels wide, 55 high, dark solarised background 2
  gr.setGraphScale(-PreOn, Dur+PostOff, 0, 100.0);          // X scale units is from -a 10th of the On value to the duration of the stimulus plus a 10th of the Off value, y scale units is 0 to 100
  gr.setGraphGrid(0.0, 100.0, 0, 25.0, DARKSOL_Bckg1);      // X grid starts at 0 with lines every 100 x-scale units  Y grid starts at 0 with lines every 25 y-scale units
  gr.drawGraph(20, 60);                                     // Draw empty graph, top left corner at 20, 60 on TFT

  tr.startTrace(DARKSOL_Red);// Start a trace 
 
  tr.addPoint(-PreOn, 1.0);
  tr.addPoint(0.0, 1.0);
  for (int i = 0; i <= Number-1; i++) {
    tr.addPoint(i*(On+Off),100.0);
    tr.addPoint(i*(On+Off)+On,100.0);
    tr.addPoint(i*(On+Off)+On,1.0);
    tr.addPoint(i*(On+Off)+On+Off,1.0);
  }
  tr.addPoint(Dur, 1.0); 
  tr.addPoint(Dur+PostOff, 1.0); 

  tft.fillRect(0,115,320,20,DARKSOL_Bckg3);
  tft.setTextDatum(TC_DATUM); // Top centre text datum
  for (int i = 0; i<= 4; i++){
    tft.drawNumber(i*Ms, gr.getPointX(i*Ms), gr.getPointY(0.0) +3);
  }
}



void FirstMenuSelected(){
  tft.setTextColor(DARKSOL_Base);
  tft.fillRect(x0Rect,y0Rect1,xRect,yRect,DARKSOL_Bckg1);
  tft.drawRect(x0Rect,y0Rect1,xRect,yRect,DARKSOL_Red);
  tft.setCursor(xTxt+10,y0Txt1);
  tft.print(NumberOfPulse);

  tft.fillRect(x0Rect,y0Rect2,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt,y0Txt2);
  tft.print(PulseOn);

  tft.fillRect(x0Rect,y0Rect3,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt,y0Txt3);
  tft.print(PulseOff);

  Flag_MenuSelected = false;
  UpdateGraph();
}



void SecondMenuSelected(){
  tft.setTextColor(DARKSOL_Base);
  tft.fillRect(x0Rect,y0Rect2,xRect,yRect,DARKSOL_Bckg1);
  tft.drawRect(x0Rect,y0Rect2,xRect,yRect,DARKSOL_Red);
  tft.setCursor(xTxt,y0Txt2);
  tft.print(PulseOn);

  
  tft.fillRect(x0Rect,y0Rect3,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt,y0Txt3);
  tft.print(PulseOff);  
  
  tft.fillRect(x0Rect,y0Rect1,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt+10,y0Txt1);
  tft.print(NumberOfPulse);

  Flag_MenuSelected = false;
  UpdateGraph();
}



void ThirdMenuSelected(){
  tft.setTextColor(DARKSOL_Base);
  tft.fillRect(x0Rect,y0Rect3,xRect,yRect,DARKSOL_Bckg1);
  tft.drawRect(x0Rect,y0Rect3 ,xRect,yRect,DARKSOL_Red);
  tft.setCursor(xTxt,y0Txt3);
  tft.print(PulseOff);
  
  
  tft.fillRect(x0Rect,y0Rect1,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt+10,y0Txt1);
  tft.print(NumberOfPulse);

  tft.fillRect(x0Rect,y0Rect2,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt,y0Txt2);
  tft.print(PulseOn);

  Flag_MenuSelected = false;
  UpdateGraph();
}



void FirstMenuSelectedText(){
  tft.setTextColor(DARKSOL_Red);
  tft.fillRect(x0Rect,y0Rect1,xRect,yRect,DARKSOL_Bckg1);
  tft.drawRect(x0Rect,y0Rect1,xRect,yRect,DARKSOL_Red);
  tft.setCursor(xTxt+10,y0Txt1);
  tft.print(NumberOfPulse);
}



void SecondMenuSelectedText(){
  tft.setTextColor(DARKSOL_Red);
  tft.fillRect(x0Rect,y0Rect2,xRect,yRect,DARKSOL_Bckg1);
  tft.drawRect(x0Rect,y0Rect2,xRect,yRect,DARKSOL_Red);
  tft.setCursor(xTxt,y0Txt2);
  tft.print(PulseOn);
}



void ThirdMenuSelectedText(){
  tft.setTextColor(DARKSOL_Red);
  tft.fillRect(x0Rect,y0Rect3,xRect,yRect,DARKSOL_Bckg1);
  tft.drawRect(x0Rect,y0Rect3 ,xRect,yRect,DARKSOL_Red);
  tft.setCursor(xTxt,y0Txt3);
  tft.print(PulseOff);
}









