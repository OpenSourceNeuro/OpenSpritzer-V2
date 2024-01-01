Wall = 3;
tol = 0.1;
Smoothness = 360;
Sm = 60;
Acrylic = [0,0,0.8,0.8];

// // // // // // // // // // // // // //
// // // // //   Switches  // // // // //

DXF = 1;

PCB = 10;
BNC90 = 10;
DPDT = 10;
Power = 10;
Power_Switch = 10;
ESP = 10;
Rotary = 10;
Festo = 10;

Regulator = 10;
Manometer = 10;
Solenoid = 10;
Screen = 10;

Hex_Bottom = 10;
Hex_Top = 10;

Rack19 = 10;

Acrylic_Bottom  = 10;
Acrylic_Top  = 10;
Acrylic_Front  = 10;
Acrylic_Back  = 10;
Acrylic_Left  = 1;
Acrylic_Right  = 10;


// // // // // // // // // // // // // //
// // // // General Settings  // // // //

r_hex = 5.65/2;
hex_bottom = 5;
hex_top = 18+20+20;
z_PCB = 2;

x_Box = 200;
y_Box = 100;
z_Box = hex_bottom + z_PCB + hex_top;
r_Box = 5;

x_PCB = 180;
y_PCB = y_Box-2*Wall-2*tol;
r_PCB = 3;

r_Rack = 3+tol;
x_Rack = 25.5;
x_rack = 7;
x_rack_minus = 5-1;
x_rack_plus = x_rack+x_rack_minus;
d_Rack = 15.9;


xpos1_M3 = x_Box-Wall-x_PCB+10;
xpos2_M3 = x_Box-Wall-x_PCB+161;
ypos1_M3 = y_Box-Wall-tol-72;
ypos2_M3 = y_Box-Wall-tol-7.5;
r_M3 = 3/2;




    x_Rack19 = 25;
    y_Rack19 = 2;
    z_Rack19 = 44.45;
    
    X_Rack19 = 2;
    Y_Rack19 = 45;
    Z_Rack19 = 44.45;
    
    d_Rack19 = 13;
    D_Rack19 = 31;
    l_Rack19 = 14.5;
    r_Rack19 = 4/2+0.2;
    R_Rack19 = 7/2;
    L_Rack19 = 6;
    dd_Rack19 = 25+2*R_Rack19;
    ypos1 = 8;
    ypos2 = 17;
    ypos3 = 30;
    ypos4 = 39;
    xpos1 = 6;
    xpos2 = 12;

// // // // // // // // // // // // // //
// // // // //  Functions  // // // // //

if (PCB == 1){
    translate([x_Box-x_PCB-Wall-tol,Wall+tol,Wall+hex_bottom])difference(){
        PCB();
        translate([32,y_PCB-7.1,-20])cylinder(r=1.3,h=100,$fn=60);
        translate([32,y_PCB-25.1,-20])cylinder(r=1.3,h=100,$fn=60);
    }
}




if (BNC90 == 1){
    BNC90();
}

if (ESP == 1){
    ESP();
}

if (Power == 1){
    Power();
}

if (Power_Switch == 1){
    Power_Switch();
}

if (DPDT == 1){
    Switch();
}

if (Hex_Bottom == 1){
    translate([xpos1_M3,ypos1_M3,Wall])Hex(hex_bottom);
    translate([xpos2_M3,ypos1_M3,Wall])Hex(hex_bottom);
    translate([xpos1_M3,ypos2_M3,Wall])Hex(hex_bottom);
    translate([xpos2_M3,ypos2_M3,Wall])Hex(hex_bottom);
}

if (Hex_Top == 1){
    translate([xpos1_M3,ypos1_M3,Wall+hex_bottom+z_PCB])Hex(hex_top);
    translate([xpos2_M3,ypos1_M3,Wall+hex_bottom+z_PCB])Hex(hex_top);
    translate([xpos1_M3,ypos2_M3,Wall+hex_bottom+z_PCB])Hex(hex_top);
    translate([xpos2_M3,ypos2_M3,Wall+hex_bottom+z_PCB])Hex(hex_top);
}

if (Festo == 1){
    Festo();
}
if (Regulator == 1){
    Regulator();
}
if (Manometer == 1){
    Manometer();
}

if (Solenoid == 1){
    Solenoid();
}

if (Screen == 1){
    Screen();
}
if (Rotary == 1){
    Rotary();
}
if  (Rack19 == 1){
    Rack19();
}


if (Acrylic_Bottom == 1 && DXF == 0){
    Acrylic_Botom();
}
if (Acrylic_Bottom == 1 && DXF == 1){
    Acrylic_Botom_DXF();
}


if (Acrylic_Top == 1 && DXF == 0){
    Acrylic_Top();
}
if (Acrylic_Top == 1 && DXF == 1){
    Acrylic_Top_DXF();
}


if (Acrylic_Front == 1 && DXF == 0){
    Acrylic_Front();
}
if (Acrylic_Front == 1 && DXF == 1){
    Acrylic_Front_DXF();
}


if (Acrylic_Back == 1 && DXF == 0){
    Acrylic_Back();
}
if (Acrylic_Back == 1 && DXF == 1){
    Acrylic_Back_DXF();
}


if (Acrylic_Left == 1 && DXF == 0){
    Acrylic_Left();
}
if (Acrylic_Left == 1 && DXF == 1){
    Acrylic_Left_DXF();
}


if (Acrylic_Right == 1 && DXF == 0){
    Acrylic_Right();
}
if (Acrylic_Right == 1 && DXF == 1){
    Acrylic_Right_DXF();
}


// // // // // // // // // // // // // //
// // // // //   Modules   // // // // //

module PCB(){
    color([0.1,0.8,0])translate([r_PCB,r_PCB,0])minkowski(){
        cube([x_PCB-2*r_PCB,y_PCB-2*r_PCB,z_PCB-tol]);
        cylinder(r=r_PCB,h=tol,$fn=Smoothness);
    }
}

module Rotary(){
r_Rotary = 7.5/2;
h_Rotary = 25;
x_Rotary = 19;
y_Rotary = 26;
z_Rotary = 1;
    translate([x_Box-x_PCB-Wall+55,12.5,Wall+hex_bottom+z_PCB+22.5])rotate([90,0,0]){
        cylinder(r=r_Rotary,h=h_Rotary,$fn=Sm);
        translate([-11.25,-y_Rotary+10,0])cube([x_Rotary,y_Rotary,z_Rotary]);
    }
}



module BNC90(){
x_BNC90 = 14.8;
y_BNC90 = 14.9;
z_BNC90 = 13.1;
h1_BNC90 = 10.5;
r1_BNC90 = 12.8/2;
h2_BNC90 = 9.8;
r2_BNC90 = 9.6/2;
h_pinBNC90 = 4.2;
r_pinBNC90 = 0.89/2;
offset_pinBNC90 = 0.2;
    translate([x_Box-Wall-14,Wall+tol+y_PCB-57,Wall+hex_bottom])rotate([0,0,180])BNC();
    translate([x_Box-Wall-14,Wall+tol+y_PCB-8   ,Wall+hex_bottom])rotate([0,0,180])BNC();
    
    module BNC(){
        color([1,1,1])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90,-y_BNC90/2,z_PCB])cube([x_BNC90,y_BNC90,z_BNC90]);
        color([1,1,1])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90-h1_BNC90,0,z_BNC90/2+z_PCB])rotate([0,90,0])cylinder(r=r1_BNC90+tol,h=h1_BNC90,$fn=Sm);
        color([192/255,192/255,192/255])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90-h1_BNC90-h2_BNC90,0,z_BNC90/2+z_PCB])rotate([0,90,0])cylinder(r=r2_BNC90,h=h2_BNC90,$fn=Sm);
        translate([0,0,-h_pinBNC90+z_PCB])cylinder(r=r_pinBNC90,h=h_pinBNC90,$fn=Sm);
        translate([0,-2.54,-h_pinBNC90+z_PCB])cylinder(r=r_pinBNC90,h=h_pinBNC90,$fn=Sm);
    }
}

module Power(){
x_Power = 9;
y_Power = 13.6;
z_Power = 11;
 
    color([0.1,0.1,0.1])translate([x_Box-x_PCB-Wall+110,y_Box-13,Wall+hex_bottom+z_PCB]){
        translate([-x_Power/2,0,0])cube([x_Power,y_Power,z_Power]);
    }
}

module Power_Switch(){
x_Power = 9;
y_Power = 13.6;
z_Power = 11;
r_Power = 21/2;

    
    color([0.1,0.1,0.1])translate([x_Box-x_PCB-Wall+110+x_Power/2,y_Box-Wall-tol,Wall+hex_bottom+z_PCB]){
        translate([-x_Power/2,0,30])rotate([-90,0,0])cylinder(r=r_Power, h=Wall+2*tol, $fn=Sm);
    }
}

module Switch(){
x_Switch = 8.8;
y_Switch = 13.7;
z_Switch = 8.8;
r_Switch = 6/2;
h_Switch = 2.7+5;    
hpos_Switch = 4.4;
    translate([x_Box-x_PCB-Wall+72.5,Wall+tol,Wall+hex_bottom+z_PCB]){
        color([0.8,0.1,0.1])cube([x_Switch,y_Switch,z_Switch]);
        color([192/255,192/255,192/255])translate([0,0,hpos_Switch])rotate([90,0,0])cylinder(r=r_Switch+tol,h=h_Switch,$fn=Sm);
    }
}

module Panels(){
x_Panel = 10;
z_Panel = 5;
r_Switch = 6/2;
hpos_Panel = 4.4-z_Panel/2;

    translate([x_Box-x_PCB-Wall+72.5+r_Switch,-tol,Wall+hex_bottom+z_PCB+hpos_Panel])cube([x_Panel, Wall+2*tol,z_Panel]);
    translate([x_Box-x_PCB-Wall+72.5-x_Panel-r_Switch,-tol,Wall+hex_bottom+z_PCB+hpos_Panel])cube([x_Panel, Wall+2*tol,z_Panel]);
}

module Hex(height){
    color([255/255,215/255,0])cylinder(r=r_hex,h=height,$fn=8);
}

module ESP(){
x_ESP = 55;
y_ESP = 28;
z_ESP = 11.5;
x_USB = 6;
y_USB = 9;
z_USB = 6;
h_USB = 3;
xpos_ESP = 4.3;
ypos_ESP = 0;
r_pinUSB = 0.6/2;
h_pinUSB = 5;
    translate([x_Box-Wall-tol-3.25,14+Wall+tol+y_PCB-32.5,Wall+hex_bottom+z_PCB-1.75])rotate([0,0,180]){
        translate([-xpos_ESP,ypos_ESP,z_PCB]){
            cube([x_ESP,y_ESP,z_ESP]);
            translate([-Wall-tol,y_ESP/2-y_USB/2,z_ESP+h_USB-z_USB/2])cube([x_USB+Wall+tol,y_USB,z_USB]);
        }  
    }
}

module Festo(){
    color([1,0,1])translate([x_Box-12.5,17,Wall+hex_bottom+Wall+17.5])rotate([0,90,0])cylinder(r=12/2,h=25,$fn=Sm);
}

module Regulator(){
    reg_r_base = 27/2;
    reg_h_base = 6.5;
    reg_x = 27;
    reg_y = 25;
    reg_z = 22;
    reg_r_top = 26/2;
    reg_h_top = 3;
    reg_thread_r = 22.75/2;
    reg_thread_h = 7;
    reg_ring_r = 21.5/2;
    reg_ring_h = 4;
    reg_gauge_r = 14/2;
    reg_gauge_h = 2;
    reg_gauge2_h = 5.5;
    reg_gauge2_x = 14+1.1;
    reg_gauge2_z = 5;
    reg_tube_r = 6/2+1;
    reg_tube_h = 50;
    reg_gauge_screw = 22.5/2;
    translate([x_Box-38.5,31.5+Wall,Wall+hex_bottom+Wall+17.5])color([1,0,1])rotate([90,0,0]){
        cylinder(r=reg_r_base,reg_h_base,$fn=Smoothness);
        translate([-reg_x/2,-reg_y/2,reg_h_base])cube([reg_x,reg_y,reg_z]); 
        translate([0,0,reg_h_base+reg_z])cylinder(r=reg_r_top,reg_h_top,$fn=Smoothness);
        translate([0,0,reg_h_base+reg_z+reg_h_top])cylinder(r=reg_thread_r,reg_thread_h,$fn=Smoothness);
        translate([0,0,reg_h_base+reg_z+reg_h_top+reg_thread_h])cylinder(r=reg_ring_r,reg_ring_h,$fn=Smoothness);
        translate([0,-reg_y/2,reg_h_base+reg_z/2])rotate([90,0,0])cylinder(r=reg_gauge_r,h=reg_gauge_h,$fn=Smoothness);
        translate([0,reg_y/2+reg_gauge_h,reg_h_base+reg_z/2])rotate([90,0,0])cylinder(r=reg_gauge_r,h=reg_gauge_h,$fn=Smoothness);
        
        translate([-reg_x/2,0,reg_h_base+reg_z/2])rotate([0,90,0])cylinder(r=reg_tube_r,h=reg_tube_h,$fn=Smoothness);
        translate([reg_y/2,0,reg_h_base+reg_z/2])rotate([0,-90,0])cylinder(r=reg_tube_r,h=reg_tube_h,$fn=Smoothness);        
    }
}  

module Spritzer_LED(){
r_LED = 6/2;
    
    translate([x_Box-17.5,-tol,Wall+hex_bottom+Wall+17.5])rotate([-90,0,0])cylinder(r=r_LED,h=Wall+2*tol,$fn=Sm);
}

module Manometer(){
    reg_gauge_r = 10/2;
    reg_gauge_h = 2;
    reg_gauge2_h = 12;
    reg_gauge2_x = 14.25;
    reg_gauge2_y = reg_gauge2_x;
    reg_gauge2_z = 8;
    reg_tube_r = 6/2+1;
    reg_tube_h = 50;
    reg_gauge_screw = 22.5/2;
    r_manometer = 40/2;
    h_manometer = 22;
    r_manometer_flange = 44.8/2;
    h_manometer_flange = 4;
    
    z_Slot = 7.5;
    
    color([1,0,1])translate([x_Box-x_PCB-Wall+98,42,45])rotate([90,0,0]){
        
        cylinder(r=reg_gauge_r,h=reg_gauge2_h,$fn=Smoothness);
        translate([-reg_gauge2_x/2,-reg_gauge2_y/2,reg_gauge2_h])cube([reg_gauge2_x,reg_gauge2_y,reg_gauge2_z]);
        translate([0,0,reg_gauge2_h+reg_gauge2_z])cylinder(r=r_manometer, h=h_manometer, $fn=Smoothness);
        translate([0,0,reg_gauge2_h+reg_gauge2_z+h_manometer])cylinder(r=r_manometer_flange, h=h_manometer_flange, $fn=Smoothness);
        
        translate([0,0,reg_gauge2_h+reg_gauge2_z-1])scale([1.2,1,1])cylinder(r=r_manometer+1,h=z_Slot+Wall, $fn=Smoothness);
    }
}

module Solenoid(){
b1 = 10;
d1 = 6;
d2 = 2.4;
h1 = 68;
h2 = 13;
h3 = 7;
l1 = 50.5;
l2 = 18;
l3 = 32;
l4 = 9.5;
    color([1,0,1]){
        translate([33.9+2,y_Box-Wall-tol-32.1,Wall+hex_bottom+z_PCB+tol]){
            cube([h1,l3,b1]);
            translate([h3,0,b1/2])rotate([90,0,0])cylinder(r=b1/2, h=l4, $fn=Sm);
            translate([h3,l3,b1/2])rotate([-90,0,0])cylinder(r=b1/2, h=l4, $fn=Sm);
            translate([h2,l3/2-l2/2,0])rotate([180,0,0])cylinder(r=d2/2,h=10,$fn=Sm);
            translate([h2,l3/2+l2/2,0])rotate([180,0,0])cylinder(r=d2/2,h=10,$fn=Sm);
        }
    }
}   

module Screen(){
x_screen = 58.25;
y_screen = 35.25;
z_screen = 8;
x_screen2 = 48.75;
y_screen2 = 35;  
z_screen2 = 2.5;  
x_screen_screw = 53;
y_screen_screw = 30;    
    translate([5,10.5-tol,Wall+z_Box/2-y_screen/2])rotate([90,0,0]){
        cube([x_screen,y_screen,z_screen]);
        translate([4,0.25/2,z_screen])cube([x_screen2,y_screen2,z_screen2]);
        translate([x_screen/2-x_screen_screw/2,y_screen/2-y_screen_screw/2,z_screen])cylinder(r=1+tol,h=z_screen2+tol,$fn=Sm);
        translate([x_screen/2+x_screen_screw/2,y_screen/2+y_screen_screw/2,z_screen])cylinder(r=1+tol,h=z_screen2+tol,$fn=Sm);
        translate([x_screen/2+x_screen_screw/2,y_screen/2-y_screen_screw/2,z_screen])cylinder(r=1+tol,h=z_screen2+tol,$fn=Sm);
        translate([x_screen/2-x_screen_screw/2,y_screen/2+y_screen_screw/2,z_screen])cylinder(r=1+tol,h=z_screen2+tol,$fn=Sm);
    }
}


module Rack19(){

    
    translate([-x_Rack19-2-tol,Wall+tol,z_Box/2-z_Rack19/2+Wall]){
        difference(){
            cube([x_Rack19,y_Rack19,z_Rack19]);
            
            translate([xpos1,-tol,z_Rack19/2-dd_Rack19/2])rotate([-90,0,0])cylinder(r=R_Rack19,h=Wall,$fn=Sm);
            translate([xpos2,-tol,z_Rack19/2-dd_Rack19/2])rotate([-90,0,0])cylinder(r=R_Rack19,h=Wall,$fn=Sm);
            translate([xpos1,-tol,z_Rack19/2+dd_Rack19/2])rotate([-90,0,0])cylinder(r=R_Rack19,h=Wall,$fn=Sm);
            translate([xpos2,-tol,z_Rack19/2+dd_Rack19/2])rotate([-90,0,0])cylinder(r=R_Rack19,h=Wall,$fn=Sm);
            
            translate([xpos1,-tol,z_Rack19/2+dd_Rack19/2-R_Rack19])cube([L_Rack19,Wall,2*R_Rack19]);
            translate([xpos1,-tol,z_Rack19/2-dd_Rack19/2-R_Rack19])cube([L_Rack19,Wall,2*R_Rack19]);
        }
        
        difference(){
            translate([x_Rack19,0,0])cube([X_Rack19,Y_Rack19,Z_Rack19]);
            
            translate([x_Rack19-tol,ypos1,z_Rack19/2-D_Rack19/2])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall,$fn=Sm);
            translate([x_Rack19-tol,ypos1,z_Rack19/2+D_Rack19/2])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall,$fn=Sm);
            
            translate([x_Rack19-tol,ypos2,z_Rack19/2-d_Rack19/2])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall,$fn=Sm);
            translate([x_Rack19-tol,ypos2,z_Rack19/2+d_Rack19/2])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall,$fn=Sm);
            
            translate([x_Rack19-tol,ypos3,z_Rack19/2-d_Rack19/2])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall,$fn=Sm);
            translate([x_Rack19-tol,ypos3,z_Rack19/2+d_Rack19/2])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall,$fn=Sm);
            
            translate([x_Rack19-tol,ypos4,z_Rack19/2-D_Rack19/2])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall,$fn=Sm);
            translate([x_Rack19-tol,ypos4,z_Rack19/2+D_Rack19/2])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall,$fn=Sm);
            
            
            translate([x_Rack19-tol,ypos1+(cos(45)*r_Rack19),z_Rack19/2-D_Rack19/2-(cos(45)*r_Rack19)])rotate([45,0,0])cube([Wall,l_Rack19-r_Rack19,2*r_Rack19]);
            translate([x_Rack19-tol,ypos1-(cos(45)*r_Rack19),z_Rack19/2+D_Rack19/2-(cos(45)*r_Rack19)])rotate([-45,0,0])cube([Wall,l_Rack19-r_Rack19,2*r_Rack19]);
            translate([x_Rack19-tol,ypos3-(cos(45)*r_Rack19),z_Rack19/2-d_Rack19/2-(cos(45)*r_Rack19)])rotate([-45,0,0])cube([Wall,l_Rack19-r_Rack19,2*r_Rack19]);
            translate([x_Rack19-tol,ypos3+(cos(45)*r_Rack19),z_Rack19/2+d_Rack19/2-(cos(45)*r_Rack19)])rotate([45,0,0])cube([Wall,l_Rack19-r_Rack19,2*r_Rack19]);
            
        }
    }
    
}
Rack19();

// // // // // // // // // // // // // //
// // // // //     Box     // // // // //

x_Step = 10;
y_Step = 8;
z_Step = 6;

module Acrylic_Botom(){
    color(Acrylic)difference(){
        minkowski(){
            cube([x_Box,y_Box,Wall-1]);
            cylinder(r=r_Box,h=1,$fn=Smoothness);
        }

        translate([xpos1_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=Sm);
        translate([xpos2_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=Sm);
        translate([xpos1_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=Sm);
        translate([xpos2_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=Sm);
        
        for (i = [0:2:x_Step-1]){
            translate([(Wall+tol) + ((i) * (x_Box-2*Wall-2*tol)/x_Step)-tol,-tol,-tol])cube([(x_Box-2*Wall-2*tol)/x_Step+2*tol, Wall+2*tol, Wall+2*tol]);
            translate([(Wall+tol) + ((i+1) * (x_Box-2*Wall-2*tol)/x_Step)-tol,y_Box-Wall-tol,-tol])cube([(x_Box-2*Wall-2*tol)/x_Step+2*tol, Wall+2*tol, Wall+2*tol]);
        }
            
        for (i = [0:2:y_Step-1]){
            translate([-tol, (Wall+tol) + ((i+1) * (y_Box-2*Wall-2*tol)/y_Step)-tol, -tol])cube([Wall+2*tol, (y_Box-2*Wall-2*tol)/y_Step+2*tol, Wall+2*tol]);
            translate([x_Box-Wall-tol, (Wall+tol) + ((i) * (y_Box-2*Wall-2*tol)/y_Step)-tol, -tol])cube([Wall+2*tol, (y_Box-2*Wall-2*tol)/y_Step+2*tol, Wall+2*tol]);
        }
    }
}

module Acrylic_Top(){
    color(Acrylic)translate([0,0,z_Box+Wall])difference(){
        minkowski(){
            cube([x_Box,y_Box,Wall-1]);
            cylinder(r=r_Box,h=1,$fn=Smoothness);
        }
        
        translate([xpos1_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=Sm);
        translate([xpos2_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=Sm);
        translate([xpos1_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=Sm);
        translate([xpos2_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=Sm);
        
        for (i = [0:2:x_Step-1]){
            translate([(Wall+tol) + ((i+1) * (x_Box-2*Wall-2*tol)/x_Step)-tol,-tol,-tol])cube([(x_Box-2*Wall-2*tol)/x_Step+2*tol, Wall+2*tol, Wall+2*tol]);
            translate([(Wall+tol) + ((i) * (x_Box-2*Wall-2*tol)/x_Step)-tol,y_Box-Wall-tol,-tol])cube([(x_Box-2*Wall-2*tol)/x_Step+2*tol, Wall+2*tol, Wall+2*tol]);
        }
            
        for (i = [0:2:y_Step-1]){
            translate([-tol, (Wall+tol) + ((i) * (y_Box-2*Wall-2*tol)/y_Step)-tol, -tol])cube([Wall+2*tol, (y_Box-2*Wall-2*tol)/y_Step+2*tol, Wall+2*tol]);
            translate([x_Box-Wall-tol, (Wall+tol) + ((i+1) * (y_Box-2*Wall-2*tol)/y_Step)-tol, -tol])cube([Wall+2*tol, (y_Box-2*Wall-2*tol)/y_Step+2*tol, Wall+2*tol]);
        }
    }
}

module Acrylic_Front(){
    xxx = 3;
    hhh = 1;
    color(Acrylic){
        difference(){
            union(){
                translate([0,0,Wall])cube([x_Box,Wall,z_Box]);
                difference(){
                    translate([-x_Rack,0,Wall])minkowski(){
                        translate([0,0,xxx*3/2])cube([x_Rack+xxx,Wall-hhh,z_Box-2*xxx]);
                        translate([0,0,-xxx/2])rotate([-90,0,0])cylinder(r=xxx, h=hhh, $fn=Smoothness);
                    }
                    
                    //translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Sm);
                    translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2-d_Rack])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Sm);
                    translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2+d_Rack])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Sm);
                    
                    //translate([-x_Rack+x_rack_plus,-tol,Wall+z_Box/2])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Sm);
                    translate([-x_Rack+x_rack_plus,-tol,Wall+z_Box/2-d_Rack])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Sm);
                    translate([-x_Rack+x_rack_plus,-tol,Wall+z_Box/2+d_Rack])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Sm);
                    
                    //translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2-r_Rack])cube([x_rack,Wall+2*tol,2*r_Rack]);
                    translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2-r_Rack-d_Rack])cube([x_rack,Wall+2*tol,2*r_Rack]);
                    translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2-r_Rack+d_Rack])cube([x_rack,Wall+2*tol,2*r_Rack]);
                }
            }
            
            translate([0,0,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,-tol,(i+1) * z_Box/z_Step-tol])cube([Wall+tol,Wall+2*tol,z_Box/z_Step+2*tol]);
            }
            translate([0,0,Wall])for (i = [0:2:z_Step-1]){
                translate([x_Box-Wall,-tol,(i) * z_Box/z_Step-tol])cube([Wall+tol,Wall+2*tol,z_Box/z_Step+2*tol]);
            }
            
            Switch();
            Regulator();
            Screen();
            Manometer();
            Rotary();
            Spritzer_LED();
            Panels();
        }
    
        translate([0,0,0])for (i = [0:2:x_Step-1]){
            translate([(Wall+tol) + ((i) * (x_Box-2*Wall)/x_Step),0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
        }
        translate([0,0,z_Box+Wall])for (i = [0:2:x_Step-1]){
            translate([(Wall+tol) + ((i+1) * (x_Box-2*Wall)/x_Step),0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
        }
    }
}

module Acrylic_Back(){
    //color([0,1,0]){
    color(Acrylic){
        difference(){
            translate([0,y_Box-Wall,Wall])cube([x_Box,Wall,z_Box]);
            
            translate([0,y_Box-Wall,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,-tol,(i) * z_Box/z_Step-tol])cube([Wall+tol,Wall+2*tol,z_Box/z_Step+2*tol]);
            }
            translate([0,y_Box-Wall,Wall])for (i = [0:2:z_Step-1]){
                translate([x_Box-Wall,-tol,(i+1) * z_Box/z_Step-tol])cube([Wall+tol,Wall+2*tol,z_Box/z_Step+2*tol]);
            }
            
            Solenoid();
            Power();
            Power_Switch();
        }
    
        translate([0,y_Box-Wall,0])for (i = [0:2:x_Step-1]){
            translate([(Wall+tol) + ((i+1) * (x_Box-2*Wall)/x_Step)-tol,0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
        }
        translate([0,y_Box-Wall,z_Box+Wall])for (i = [0:2:x_Step-1]){
            translate([(Wall+tol) + ((i) * (x_Box-2*Wall)/x_Step)-tol,0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
        }
    }
}

module Acrylic_Left(){
    //color([1,0,0]){
    color(Acrylic){
        difference(){
            translate([0,0,Wall])cube([Wall,y_Box,z_Box]);
            
            translate([0,0,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,-tol,(i) * z_Box/z_Step])cube([Wall+2*tol,Wall+tol,z_Box/z_Step]);
            }
            translate([0,y_Box-Wall,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,0,(i+1) * z_Box/z_Step])cube([Wall+2*tol+10,Wall+tol,z_Box/z_Step]);
            }
            
            translate([-tol,ypos1+Wall/2,z_Box/2-D_Rack19/2+Wall])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall+2*tol,$fn=Sm);
            translate([-tol,ypos1+2.5*Wall,z_Box/2-D_Rack19/2+Wall])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall+2*tol,$fn=Sm);
            translate([-tol,ypos1+Wall/2,z_Box/2-D_Rack19/2+Wall-r_Rack19])cube([Wall+2*tol,2*Wall,2*r_Rack19]);
            
            translate([-tol,ypos4+Wall/2,z_Box/2-D_Rack19/2+Wall])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall+2*tol,$fn=Sm);
            translate([-tol,ypos4+2.5*Wall,z_Box/2-D_Rack19/2+Wall])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall+2*tol,$fn=Sm);
            translate([-tol,ypos4+Wall/2,z_Box/2-D_Rack19/2+Wall-r_Rack19])cube([Wall+2*tol,2*Wall,2*r_Rack19]);
            
            translate([-tol,ypos1+Wall/2,z_Box/2+D_Rack19/2+Wall])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall+2*tol,$fn=Sm);
            translate([-tol,ypos1+2.5*Wall,z_Box/2+D_Rack19/2+Wall])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall+2*tol,$fn=Sm);
            translate([-tol,ypos1+Wall/2,z_Box/2+D_Rack19/2+Wall-r_Rack19])cube([Wall+2*tol,2*Wall,2*r_Rack19]);
            
            translate([-tol,ypos4+Wall/2,z_Box/2+D_Rack19/2+Wall])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall+2*tol,$fn=Sm);
            translate([-tol,ypos4+2.5*Wall,z_Box/2+D_Rack19/2+Wall])rotate([0,90,0])cylinder(r=r_Rack19,h=Wall+2*tol,$fn=Sm);
            translate([-tol,ypos4+Wall/2,z_Box/2+D_Rack19/2+Wall-r_Rack19])cube([Wall+2*tol,2*Wall,2*r_Rack19]);
        }
        
        translate([0,0,z_Box+Wall])for (i = [0:2:y_Step-1]){
            translate([0, (Wall+tol) + ((i) * (y_Box-2*Wall-2*tol)/y_Step), 0])cube([Wall, (y_Box-2*Wall-2*tol)/y_Step, Wall]);
        }
        translate([0,0,0])for (i = [0:2:y_Step-1]){
            translate([0, (Wall+tol) + ((i+1) * (y_Box-2*Wall-2*tol)/y_Step), -tol])cube([Wall, (y_Box-2*Wall-2*tol)/y_Step, Wall+2*tol]);
        }
    }
}

module Acrylic_Right(){
    //color([1,0,1])translate([x_Box-Wall,0,0]){
    color(Acrylic)translate([x_Box-Wall,0,0]){
        difference(){
            translate([0,0,Wall])cube([Wall,y_Box,z_Box]);
            
            translate([0,0,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,-tol,(i+1) * z_Box/z_Step])cube([Wall+2*tol,Wall+tol,z_Box/z_Step]);
            }
            translate([0,y_Box-Wall,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,0,(i) * z_Box/z_Step])cube([Wall+2*tol+10,Wall+tol,z_Box/z_Step]);
            }
            
            translate([-x_Box+Wall,0,0]){
                Festo();
                BNC90();
                ESP();
            }
            
        }
        
        translate([0,0,z_Box+Wall])for (i = [0:2:y_Step-1]){
            translate([0, (Wall+tol) + ((i+1) * (y_Box-2*Wall-2*tol)/y_Step), 0])cube([Wall, (y_Box-2*Wall-2*tol)/y_Step, Wall]);
        }
        translate([0,0,0])for (i = [0:2:y_Step-1]){
            translate([0, (Wall+tol) + ((i) * (y_Box-2*Wall-2*tol)/y_Step), -tol])cube([Wall, (y_Box-2*Wall-2*tol)/y_Step, Wall+2*tol]);
        }
    }
}

module Acrylic_Botom_DXF(){
    projection()Acrylic_Botom();
}
module Acrylic_Top_DXF(){
    projection()Acrylic_Top();
}
module Acrylic_Front_DXF(){
    projection()rotate([-90,0,0])Acrylic_Front();
}
module Acrylic_Back_DXF(){
    projection()rotate([90,0,0])Acrylic_Back();
}
module Acrylic_Left_DXF(){
    projection()rotate([0,90,0])Acrylic_Left();
}
module Acrylic_Right_DXF(){
    projection()rotate([0,-90,0])Acrylic_Right();
}


