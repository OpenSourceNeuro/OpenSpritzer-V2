#include "GeneralSettings.h"

/*====================================================================================
                                    Setup
====================================================================================*/
void setup()
{
  HardwareSettings();
  tft.init();
  tft.fillScreen(DARKSOL_Bckg1);
}

/*====================================================================================
                                    Loop
=====================================================================================*/
void loop() {

  if (TitleFlag == true) {
    WelcomeScreen();
  } 
  
  if(digitalRead(Pedal) == HIGH){
    Pulse();
  }

  if (rotaryEncoder->isEncoderButtonClicked()){

    RotaryTime = millis();
    
    if (Flag_Menu == true){
      menu_select = true;
      if (menu_select_close == true){
        MenuSelection_Loop_Close();
      }
      
      if (menu_select == true){
        MenuSelection_Loop_Open();
      }
    }
    
    if (Flag_Menu == false){
      Menu_Loop();
    }

  }

  if (rotaryEncoder->encoderChanged()) {
    RotaryTime = millis();

    if (Flag_MenuSelection == true && menu1_selected == false && menu2_selected == false && menu3_selected == false){
      Flag_MenuSelected = true;
      Menu_Selection();
    }

    if (menu1_selected == true){
      NumberOfPulse_Loop();
    }

    if (menu2_selected == true){
      PulseOn_Loop();
    }

    if (menu3_selected == true){
      PulseOff_Loop();
    }
  }

  if (millis() - RotaryTime > RotaryDuration && Flag_Menu == true){
    Refresh();
    UpdateGraph();
  }

  if (digitalRead(TTL) == HIGH){
    TTL_Pulse();
  }

  if (digitalRead(TTL_Screen) == HIGH && Flag_TTL == true){
    Flag_TTL = false;
    TTL_Screen();
  }
  if (digitalRead(TTL_Screen) == LOW && Flag_TTL == false){
    Flag_TTL = true;
    HomePage();
  }
  
}  






