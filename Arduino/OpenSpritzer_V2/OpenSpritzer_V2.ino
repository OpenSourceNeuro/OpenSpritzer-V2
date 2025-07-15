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
void loop()
{

  if (TitleFlag == true) {
    WelcomeScreen();
    delay(2000);
    TitleFlag = false;
  }
    


  if (TitleFlag == false){
    
    PedalReading = digitalRead(Switch_Pedal); 
    TTLReading = digitalRead(Switch_TTL); 

    if (PedalReading == HIGH && PreviousPedalState == LOW){
      Switch_Pedal_Flag = true;
      Switch_TTL_Flag = false;
      PreviousPedalState = HIGH;
      PreviousTTLState = LOW;
      PedalScreen();
    }

    if (TTLReading == HIGH && PreviousTTLState == LOW){
      Switch_Pedal_Flag = false;
      Switch_TTL_Flag = true;
      TTL_Screen_Flag = true;
      PreviousPedalState = LOW;
      PreviousTTLState = HIGH;
    }


    if (Switch_Pedal_Flag == true){

      if (digitalRead(Pedal) == HIGH){
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
      }
    }


    if (Switch_TTL_Flag == true){
      if (TTL_Screen_Flag == true){
        TTLScreen();
        TTL_Screen_Flag = false;
      }
    }
  }  
}






