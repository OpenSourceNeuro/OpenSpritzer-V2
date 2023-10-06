#include <PNGdec.h>
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>

#include "WelcomeScreen.h"
#include "AiEsp32RotaryEncoder.h"
#include "AiEsp32RotaryEncoderNumberSelector.h"
#include "Menus.h"

bool Flag_Menu;
bool Flag_MenuSelection;
bool menu_select;
bool menu_select_close;

#define Solenoid      32
#define Pedal         34
#define SpritzLED     5

#define Rotary_SW     21
#define Rotary_DT     26
#define Rotary_CLK    25
#define Rotary_VCC    -1 
#define Rotary_Steps   4

AiEsp32RotaryEncoder *rotaryEncoder = new AiEsp32RotaryEncoder(Rotary_DT, Rotary_CLK, Rotary_SW, Rotary_VCC, Rotary_Steps);
AiEsp32RotaryEncoderNumberSelector numberSelector = AiEsp32RotaryEncoderNumberSelector();

unsigned long RotaryAcceleration = 250;
int RotaryMinimum                = 0;
int RotaryMaximum                = 999999;
static unsigned long RotaryTime;
unsigned long RotaryDuration     = 10000;
void IRAM_ATTR readEncoderISR(){
    rotaryEncoder->readEncoder_ISR();
}



void HardwareSettings(){

    tft.setRotation(3);

    TitleFlag = true;

    Flag_Menu = false;
    Flag_MenuSelection = false;
    Flag_MenuSelected = false;

    menu1_selected = false;
    menu2_selected = false;
    menu3_selected = false;
    menu_select = false;
    menu_select_close = false;

    rotaryEncoder->begin();
    rotaryEncoder->setup(readEncoderISR);
    numberSelector.attachEncoder(rotaryEncoder);

    pinMode(Pedal, INPUT);
    pinMode(Solenoid, OUTPUT);
    pinMode(SpritzLED, OUTPUT);

    digitalWrite(Solenoid, LOW);  
    digitalWrite(SpritzLED, LOW);
}




void Menu_Loop(){

  numberSelector.setRange(0, 2, 1, true, 0);
  numberSelector.setValue(0);
  rotaryEncoder->setAcceleration(0);
  MenuSelection = 0;
  Flag_Menu = true;
  Flag_MenuSelection = true;
  FirstMenuSelected();
}


void Menu_Selection(){

  MenuSelection = numberSelector.getValue();
  
  if (MenuSelection == 0 && Flag_MenuSelected == true){
    FirstMenuSelected();
  }
  if (MenuSelection == 1 && Flag_MenuSelected == true){
    SecondMenuSelected();
  }
  if (MenuSelection == 2 && Flag_MenuSelected == true){
    ThirdMenuSelected();    
  }
}


void MenuSelection_Loop_Close(){

  if (MenuSelection == 0){
    menu1_selected = false;
    menu_select = false;
    menu_select_close = false;
    FirstMenuSelected();
    numberSelector.setRange(0, 2, 1, true, 0);
    numberSelector.setValue(MenuSelection);
    rotaryEncoder->setAcceleration(0);
  }

  if (MenuSelection == 1){
    menu2_selected = false;
    menu_select = false;
    menu_select_close = false;
    SecondMenuSelected();
    numberSelector.setRange(0, 2, 1, true, 0);
    numberSelector.setValue(MenuSelection);
    rotaryEncoder->setAcceleration(0);
  }

  if (MenuSelection == 2){
    menu3_selected = false;
    menu_select = false;
    menu_select_close = false;
    ThirdMenuSelected();
    numberSelector.setRange(0, 2, 1, true, 0);
    numberSelector.setValue(MenuSelection);
    rotaryEncoder->setAcceleration(0);
  }
}


void MenuSelection_Loop_Open(){

  if (MenuSelection == 0){
    menu1_selected = true;
    menu_select_close = true;
    FirstMenuSelectedText();
    numberSelector.setRange(1, 100, 1, false, 0);
    numberSelector.setValue(NumberOfPulse);
    rotaryEncoder->setAcceleration(0);
  }

  if (MenuSelection == 1){
    menu2_selected = true;
    menu_select_close = true;
    SecondMenuSelectedText();
    numberSelector.setRange(RotaryMinimum, RotaryMaximum, 1, false, 0);
    numberSelector.setValue(PulseOn);
    rotaryEncoder->setAcceleration(RotaryAcceleration);  
  }

  if (MenuSelection == 2){
    menu3_selected = true;
    menu_select_close = true;
    ThirdMenuSelectedText();
    
    numberSelector.setRange(RotaryMinimum, RotaryMaximum, 1, false, 0);
    numberSelector.setValue(PulseOff);
    rotaryEncoder->setAcceleration(RotaryAcceleration);  
  }

}

void NumberOfPulse_Loop(){
  NumberOfPulse = numberSelector.getValue();
  FirstMenuSelectedText();
}

void PulseOn_Loop(){
  PulseOn = numberSelector.getValue();
  SecondMenuSelectedText();
}

void PulseOff_Loop(){
  PulseOff = numberSelector.getValue();
  ThirdMenuSelectedText();
}

void Refresh(){
  RotaryTime = 0;
  Flag_Menu = false;
  HomePage();
}

void Pulse(){
  for (int i = 1; i <= NumberOfPulse; i++){
    digitalWrite(Solenoid, HIGH);
    digitalWrite(SpritzLED, HIGH);
    delay(PulseOn);
    digitalWrite(Solenoid, LOW);
    digitalWrite(SpritzLED, LOW);
    delay(PulseOff);
  }
}


