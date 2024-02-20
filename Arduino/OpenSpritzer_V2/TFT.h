#include <TFT_eSPI.h>    
#include "NotoSansBold15.h"
#include "NotoSansBold36.h"
TFT_eSPI tft = TFT_eSPI();         // Invoke custom library
#include <TFT_eWidget.h> 

GraphWidget gr = GraphWidget(&tft);    // Graph widget
// Traces are drawn on tft using graph instance
TraceWidget tr = TraceWidget(&gr);    // Graph trace 1


#define DARKSOL_Bckg1    0x00E4
#define DARKSOL_Bckg2    0x0146
#define DARKSOL_Bckg3    0x01A8
#define DARKSOL_Base     0x9514
#define DARKSOL_Red      0xD985
#define BLACK 0x0000
#define WHITE 0xFFFF
#define AA_FONT_SMALL NotoSansBold15
#define AA_FONT_LARGE NotoSansBold36

bool TitleFlag;

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
          // Hardware-specific library

void HomePage()
{
  tft.loadFont(AA_FONT_LARGE);
  tft.fillScreen(DARKSOL_Bckg3);
  tft.setTextColor(DARKSOL_Base);

  
  //tft.setTextSize(3);
  tft.fillRect(0,0,320,50,DARKSOL_Bckg1);
  tft.setCursor(20,10);
  tft.print("OpenSpritzer v2");


  tft.loadFont(AA_FONT_SMALL);
  
  //PulseGraph();

  
  tft.setTextSize(2);
  tft.setCursor(10,y0Txt1);
  tft.print("Number of pulse");

  tft.setCursor(10,y0Txt2);
  tft.print("Pulse length (ms)");

  tft.setCursor(10,y0Txt3);
  tft.print("Inter-pulse length (ms)");


  tft.setTextSize(2);
  tft.fillRect(x0Rect,y0Rect1,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt+10,y0Txt1);
  tft.print(NumberOfPulse);

  tft.fillRect(x0Rect,y0Rect2,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt,y0Txt2);
  tft.print(PulseOn);

  tft.fillRect(x0Rect,y0Rect3,xRect,yRect,DARKSOL_Bckg2);
  tft.setCursor(xTxt,y0Txt3);
  tft.print(PulseOff);

  
  gr.createGraph(280, 55, DARKSOL_Bckg2);// Graph area is 200 pixels wide, 150 high, dark grey background
  gr.setGraphScale(-20, 420.0, 0, 100.0);// x scale units is from 0 to 100, y scale units is -50 to 50
  gr.setGraphGrid(0.0, 50.0, 0, 25.0, DARKSOL_Bckg1);// X grid starts at 0 with lines every 10 x-scale units  Y grid starts at -50 with lines every 25 y-scale units
  gr.drawGraph(20, 60);// Draw empty graph, top left corner at 40,10 on TFT
  
  tr.startTrace(DARKSOL_Red);// Start a trace 
 
  tr.addPoint(-20.0, 1.0);
  tr.addPoint(0.0, 1.0); 
  tr.addPoint(0.0, 100.0); 
  tr.addPoint(200.0, 100.0); 
  tr.addPoint(200.0, 1.0); 
  tr.addPoint(420.0, 1.0);  

  tft.setTextDatum(TC_DATUM); // Top centre text datum
  tft.drawNumber(0, gr.getPointX(0.0), gr.getPointY(0.0) +3);
  tft.drawNumber(100, gr.getPointX(100.0), gr.getPointY(0.0) +3);
  tft.drawNumber(200, gr.getPointX(200.0), gr.getPointY(0.0) +3);
  tft.drawNumber(300, gr.getPointX(300.0), gr.getPointY(0.0) +3);
  tft.drawNumber(400, gr.getPointX(400.0), gr.getPointY(0.0) +3);
  
  TitleFlag = false;
     
}

void TTL_Screen(){

  tft.loadFont(AA_FONT_LARGE);
  tft.fillScreen(DARKSOL_Bckg3);
  tft.setTextColor(DARKSOL_Base);

  
  //tft.setTextSize(3);
  tft.fillRect(0,0,320,50,DARKSOL_Bckg1);
  tft.setCursor(20,10);
  tft.print("OpenSpritzer v2");


  tft.loadFont(AA_FONT_SMALL);

  tft.setTextSize(2);
  tft.setCursor(20,100);
  tft.print("TTL mode activated");

}

int16_t xpos = 0;
int16_t ypos = 0;
PNG png; // PNG decoder inatance
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
    //tft.endWrite();
  }
  
  delay(2000);
  HomePage();
}





