#include <TFT_eSPI.h>    
#include "NotoSansBold15.h"
#include "NotoSansBold36.h"
TFT_eSPI tft = TFT_eSPI();         // Invoke custom library
#include <TFT_eWidget.h> 

GraphWidget gr = GraphWidget(&tft);    // Graph widget
TraceWidget tr = TraceWidget(&gr);    // Graph trace 


#define DARKSOL_Bckg1    0x00E4
#define DARKSOL_Bckg2    0x0146
#define DARKSOL_Bckg3    0x01A8
#define DARKSOL_Base     0x9514
#define DARKSOL_Red      0xD985
#define BLACK 0x0000
#define WHITE 0xFFFF
#define AA_FONT_SMALL NotoSansBold15
#define AA_FONT_LARGE NotoSansBold36


int x0Rect = 240;
int xRect = 320 - x0Rect-5;
int y0Txt1 = 150;
int y0Rect1 = y0Txt1 -5;
int y0Txt2 = 180;
int y0Rect2 = y0Txt2 -5;
int y0Txt3 = 210;
int y0Rect3 = y0Txt3 -5;
int yRect = 25;

int xTxt = 260;

int NumberOfPulse = 1;
int PulseOn = 200;
int PulseOff = 200;



void PedalScreen(){

  tft.loadFont(AA_FONT_LARGE);
  tft.fillScreen(DARKSOL_Bckg3);
  tft.setTextColor(DARKSOL_Base);

  
  tft.fillRect(0,0,320,50,DARKSOL_Bckg1);
  tft.setCursor(20,10);
  tft.print("OpenSpritzer ");


  tft.loadFont(AA_FONT_SMALL);

  tft.setCursor(280,30);
  tft.print("v2.1");

  
  tft.setCursor(10,y0Txt1);
  tft.print("Number of pulse");

  tft.setCursor(10,y0Txt2);
  tft.print("Pulse length (ms)");

  tft.setCursor(10,y0Txt3);
  tft.print("Inter-pulse length (ms)");


  tft.fillRect(x0Rect,y0Rect1,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt+10,y0Txt1);
  tft.print(NumberOfPulse);

  tft.fillRect(x0Rect,y0Rect2,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt,y0Txt2);
  tft.print(PulseOn);

  tft.fillRect(x0Rect,y0Rect3,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt,y0Txt3);
  tft.print(PulseOff);

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
  
  tr.startTrace(DARKSOL_Red);                               // Start a trace 
 
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



int16_t xpos = 0;
int16_t ypos = 0;
PNG png; // PNG decoder instance
#define MAX_IMAGE_WDITH 320 // Adjust for your images


void pngDraw(PNGDRAW *pDraw) {
  uint16_t lineBuffer[MAX_IMAGE_WDITH];
  png.getLineAsRGB565(pDraw, lineBuffer, PNG_RGB565_BIG_ENDIAN, 0xffffffff);
  tft.pushImage(xpos, ypos + pDraw->y, pDraw->iWidth, 1, lineBuffer);
}



void WelcomeScreen(){
  int16_t rc = png.openFLASH((uint8_t *)Spiky, sizeof(Spiky), pngDraw);
  if (rc == PNG_SUCCESS) {
    tft.startWrite();
    rc = png.decode(NULL, 0);
  }
}



void TTLScreen(){
  int16_t rc = png.openFLASH((uint8_t *)Spiky, sizeof(Spiky), pngDraw);
  if (rc == PNG_SUCCESS) {
    tft.startWrite();
    rc = png.decode(NULL, 0);
  }

  tft.loadFont(AA_FONT_LARGE);
  tft.setTextColor(WHITE);
  tft.setCursor(75,200);
  tft.print("TTL mode ");
}





