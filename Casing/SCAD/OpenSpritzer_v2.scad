include <Settings.scad>;
include <Components.scad>;
include <BoxPannels.scad>;




// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                                 Module Switches                               */


        DXF             = 0;       // 0 generates 3D files to export STL, 1 generates 2D files to export DXF
        Rack_Version    = 0;       // 0 generates the simple box version, 1 generates the rack version of the box

        Bottom_Pannel   = 0;       // Display Bottom Pannel
        Top_Pannel      = 0;       // Display Top Pannel
        Front_Pannel    = 1;       // Display Front Pannel
        Back_Pannel     = 1;       // Display Back Pannel
        Left_Pannel     = 1;       // Display Left Pannel
        Right_Pannel    = 1;       // Display Right Pannel




// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                             Display Optional Switches                         */


        Hex_Bottom      = 0;       // Display Hex screws below the PCB
        Hex_Top         = 0;       // Display Hex screws above the PCB

        PCB             = 1;       // Display PCB
        BNC90           = 0;       // Display 2 BNC ports on the right pannel
        DPDT            = 0;       // Display switch button on the front pannel
        Power           = 0;       // Display power plug on the back pannel
        ESP             = 0;       // Display the ESP board on the PCB and its USB port on the right pannel
        Rotary          = 0;       // Display rotary button on the front pannel
        
        Festo           = 0;       // Display FESTO pressure connector on the right pannel
        Regulator       = 0;       // Display FESTO pressure regulator and its know on the front pannel
        Manometer       = 0;       // Display FESTO pressure manometer and its gauge on the front pannel
        Solenoid        = 0;       // Display FESTO pressure solenoid and its connectors on the back pannel
        
        Screen          = 0;       // Display the screen on the front pannel
        Screen_Frame    = 0;       // Display the screen frame on top of the screen




// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                                     Modules                                   */



    if (Bottom_Pannel == 1 && DXF == 0){
        Bottom();
    }
    if (Bottom_Pannel == 1 && DXF == 1){
        projection()Bottom();
    }


    if (Top_Pannel == 1 && DXF == 0){
        Top();
    }
    if (Top_Pannel == 1 && DXF == 1){
        projection()Top();
    }


    if (Front_Pannel == 1 && DXF == 0 && Rack_Version == 0){
        Front();
    }
    if (Front_Pannel == 1 && DXF == 1 && Rack_Version == 0){
        projection()rotate([-90,0,0])Front();
    }
    if (Front_Pannel == 1 && DXF == 0 && Rack_Version == 1){
        Front_Rack();
    }
    if (Front_Pannel == 1 && DXF == 1 && Rack_Version == 1){
        projection()rotate([-90,0,0])Front_Rack();
    }


    if (Back_Pannel == 1 && DXF == 0){
        Back();
    }
    if (Back_Pannel == 1 && DXF == 1){
        projection()rotate([90,0,0])Back();
    }


    if (Left_Pannel == 1 && DXF == 0){
        Left();
    }
    if (Left_Pannel == 1 && DXF == 1){
        projection()rotate([0,-90,0])Left();
    }


    if (Right_Pannel == 1 && DXF == 0){
        Right();
    }
    if (Right_Pannel == 1 && DXF == 1){
        projection()rotate([0,-90,0])Right();
    }
