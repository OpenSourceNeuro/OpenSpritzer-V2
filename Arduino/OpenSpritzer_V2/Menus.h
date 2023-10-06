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









