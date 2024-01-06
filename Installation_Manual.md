<p align="left">
<img width="270" height="170" src="./Images/SpikyLogo.png">
</p>

<h1 align="center"> OpenSpritzer v2 - Installation Manual</h1></p>


<br></br>


<h2 align="left">
Overview
</h2>

<br>

<div align= "justify">

<p>
This document contains detailed assembly instructions, a software guideline and includes a parts list.
</p>

<p>
The Arduino code and 3D casing files (SCAD) for either 3D printing or laser cutting (STL and DXF) can be downloaded <a href="https://github.com/OpenSourceNeuro/OpenSpritzer-V2/tree/main/Casing"><strong>here</strong></a>, and further modified to fit customise purposes. The device is designed to regulate the pressure and duration of a single or repeated puff(s) of compressed air. Typically, the output air port is connected to a glass puffer pipette which has been drawn into a sharp point with a narrow (2-3μm) diameter pore.
</p>

<p>
The device itself consists of a printed circuit board, a microcontroller, a solenoid valve, a pressure regulator with a manometer and various interface, off-the-shelf, components.
</p>

<img align="right" width="600" src="./Images/Figure3.png">

<p>
The device is here shown without its covering lid.
The pressure regulator is mounted on the right and attached to the front panel via a retaining threaded ring that comes with the regulator.
M3 threaded spacers are mounted onto the PCB and are meant to be screwed to the top and bottom part of the box.
The solenoid is screwed directly onto the PCB.
The manometer is locked onto the front panel with a 3D printed part and two M3 bolts.
</p>

</div>

<br></br>

## Driver Installation
<br>

OpenSpritzer firmware runs on an Espressif ESP32 board and requires the USB to UART bridge <a href="https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers"> CP210x driver</a>,  which can be downloaded<a href="https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=downloads"> <strong>here</strong></a>.

Once the driver has been installed, users can upload and modify the <a href="https://github.com/OpenSourceNeuro/OpenSpritzer-V2/tree/main/Arduino/OpenSpritzer_V2">microcontroller code</a> through the <a href="https://www.arduino.cc/en/software">Arduino IDE</a> (Integrated Development Environment).

<br></br>

## Microcontroller Arduino code

<br>

##### Arduino IDE

<br>

The ESP32 microcontroller runs a C++ code which can be accessed via the Arduino IDE, which can be downloaded <a href="https://www.arduino.cc/en/software">here</a>.

<br>

##### ESP32 Add-on

<br>

<img align="right" height="200" src="./Images/Arduino01.png">

Once the IDE is installed, users needs to install the ESP32 board library:

In the Arduino IDE, go to <strong> File > Preferences </strong>

Enter the following link into the <strong>Additional Board Manager URLs</strong> field:

https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json

<img align="center" height="300" src="./Images/Arduino02.png">
Then click on the <strong>OK</strong> button.

<br></br>

Next, open the Boards Manager. Go to <strong> Tools > Board > Board Manager...</strong>

Search for ESP32 and press install button for the <strong>ESP32 by Espressif Systems</strong>.

<img align="center" height="300" src="./Images/Arduino03.png">
Then click on the <strong>Install</strong> button.

<br></br>

##### Compiling the code

<br>

Within the Arduino IDE, user needs to select the FQBN (Fully Qualified Board Name) on which the code will be compiled for.

Here the ESP32 Dev Module needs to be selected.

Go to <strong>Tools > Board > esp32 > ESP32 Dev Module </strong>

<img align="center" src="./Images/Arduino04.png">
The board name should be displayed  as shown.

<br></br>

Before compiling the LED Zappelin code, a few librairies need to be installed:
  - Arduino-SerialCommand
  - Adafruit_TLC5947
  - Adafruit_NeoPixel

Most of them can be downloaded from the Arduino IDE: Go to <strong>Sketch > Include Librairy > Manage Libraries</strong>, enter the library name, then install it following the same process as for the board library.

We however recommend for the Arduino-SerialCommand library to manually place the library folder which can be found <a href="https://github.com/OpenSourceNeuro/LED-Zappelin-V2/tree/main/Arduino/Librairies">here</a> into the library folder. For Windows Users: <strong>C:/Users/x/Documents/Arduino/libraries</strong>

Now everything is set to compile and verify the code.

Users can now select the COM port on which the ESP32 is connected ( Go to <strong>Tools > port</strong> ) and upload the code onto the board.

<br></br>


##### Code and calibration

<br>

The code runs continuously on the board in a loop detailed in the main tab (LED_Zappelin_V2.ino).
To not interfere with the proper function and communication of the program, avoid modifying this part of the code.

<br>

In <strong>General_Settings.h</strong>:

- There exists two versions for the NeoPixel strips that serve as proxy LEDs for the device. If the proxy LEDs do not display the appropriate colours, comment/uncomment the Adafruit_NeoPixel functions:
<img align="center" src="./Images/Arduino05.png">

<br>

In <strong> LED_Values.h </strong>

- Users can select here the colours displayed by the proxy LEDs by entering the wavelength corresponding to each stimulating LEDs.
<img align="center" src="./Images/Arduino06.png">

- The TLC5947 is a linear current-sink LED driver with a 12bits resolution (4096 values).
However, some LEDs may reach their maximum intensities before reaching the maximum stimulating value (4095). A calibration step is then require here.

    Trimmer potentiometers corresponding to each LED channels can be found on the device. They regulate the maximum current intensity each stimulating LED can be drove with.

    First, user need to set each stimulating LED to their desired maximum intensity by adjusting the potentiometer value.

    Once done, play a <a href="">step-increased stimulation sequence</a> for the tested LED and not at which value the LED maximum intensity is reached and (may?) plateau.

    Finally enter the noted value in the <strong> LED_Values.h</strong> tab.
    <img align="center" src="./Images/Arduino07.png">

    <br></br>

    Reupload the code onto the board, now the tested LED will have a linear intensity increase from 0 to 100% without any saturation.

<br></br>

No further modification of the code is then required from the user who can now control the board directly from the GUI.
