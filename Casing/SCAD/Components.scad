include <Settings.scad>;



if (BNC90 == 1){
    BNC90_1();
    BNC90_2();
}

if (ESP == 1){
    ESP();
}

if (Power == 1){
    Power();
}

if (DPDT == 1){
    Switch();
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
if (Screen_Frame == 1){
    ScreenFrame();
}

if (Rotary == 1){
    Rotary();
}

if (PCB == 1){
    translate([x_Box-x_PCB-Wall-tol,Wall+tol,Wall+hex_bottom])difference(){
        PCB();
        translate([32,y_PCB-7.1,-20])cylinder(r=1.3,h=100,$fn=60);
        translate([32,y_PCB-25.1,-20])cylinder(r=1.3,h=100,$fn=60);
    }
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
    
    translate([x_Box-x_PCB-Wall+55,12.5,Wall+hex_bottom+z_PCB+22.5]){
        rotate([90,0,0]){
            cylinder(r=r_Rotary,h=h_Rotary,$fn=smoothness);
            translate([-11.25,-y_Rotary+10,0])cube([x_Rotary,y_Rotary,z_Rotary]);
        }
    }
}


module BNC90_1(){
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
    
    translate([x_Box-Wall-14,Wall+tol+y_PCB-57,Wall+hex_bottom])rotate([0,0,180]){
        color([1,1,1])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90,-y_BNC90/2,z_PCB])cube([x_BNC90,y_BNC90,z_BNC90]);
        color([1,1,1])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90-h1_BNC90,0,z_BNC90/2+z_PCB])rotate([0,90,0])cylinder(r=r1_BNC90+tol,h=h1_BNC90,$fn=smoothness);
        color([192/255,192/255,192/255])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90-h1_BNC90-h2_BNC90,0,z_BNC90/2+z_PCB])rotate([0,90,0])cylinder(r=r2_BNC90,h=h2_BNC90,$fn=Smoothness);
        translate([0,0,-h_pinBNC90+z_PCB])cylinder(r=r_pinBNC90,h=h_pinBNC90,$fn=Smoothness);
        translate([0,-2.54,-h_pinBNC90+z_PCB])cylinder(r=r_pinBNC90,h=h_pinBNC90,$fn=Smoothness);
    }
}


module BNC90_2(){
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
    
    translate([x_Box-Wall-14,Wall+tol+y_PCB-8,Wall+hex_bottom])rotate([0,0,180]){
        color([1,1,1])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90,-y_BNC90/2,z_PCB])cube([x_BNC90,y_BNC90,z_BNC90]);
        color([1,1,1])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90-h1_BNC90,0,z_BNC90/2+z_PCB])rotate([0,90,0])cylinder(r=r1_BNC90+tol,h=h1_BNC90,$fn=smoothness);
        color([192/255,192/255,192/255])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90-h1_BNC90-h2_BNC90,0,z_BNC90/2+z_PCB])rotate([0,90,0])cylinder(r=r2_BNC90,h=h2_BNC90,$fn=Smoothness);
        translate([0,0,-h_pinBNC90+z_PCB])cylinder(r=r_pinBNC90,h=h_pinBNC90,$fn=Smoothness);
        translate([0,-2.54,-h_pinBNC90+z_PCB])cylinder(r=r_pinBNC90,h=h_pinBNC90,$fn=Smoothness);
    }
}


module Power(){
x_Power = 9;
y_Power = 13.6;
z_Power = 11;

    translate([x_Box-x_PCB-Wall+110,y_Box-13,Wall+hex_bottom+z_PCB]){
        color([0.1,0.1,0.1]){
            translate([-x_Power/2,0,0])cube([x_Power,y_Power,z_Power]);
        }
    }
}

module Power_Switch(){
x_Power = 9;
y_Power = 13.6;
z_Power = 11;
r_Power = 21/2;

    
    color([0.1,0.1,0.1])translate([x_Box-x_PCB-Wall+110+x_Power/2,y_Box-Wall-tol,Wall+hex_bottom+z_PCB]){
        translate([-x_Power/2,0,30])rotate([-90,0,0])cylinder(r=r_Power, h=Wall+2*tol, $fn=smoothness);
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
        color([0.8,0.1,0.1])translate([-x_Switch/2,0,0])cube([x_Switch,y_Switch,z_Switch]);
        color([192/255,192/255,192/255])translate([0,0,hpos_Switch])rotate([90,0,0])cylinder(r=r_Switch+tol,h=h_Switch,$fn=smoothness);
    }
}

module Switch_TTL(){
x_TTL = 10;
z_TTL = 5;
x_posTTL = 8.8/2-13;
z_posTTL = 4.4 -z_TTL/2;
    
    translate([x_Box-x_PCB-Wall+72.5-4.4,Wall+tol,Wall+hex_bottom+z_PCB]){
        translate([x_posTTL,-Wall-tol,z_posTTL])cube([x_TTL,Wall,z_TTL]);
    }
}

module Switch_Pedal(){
x_Pedal = 10;
z_Pedal = 5;
x_posPedal = 8.8/2+3;
z_posPedal = 4.4 -z_Pedal/2;
    
    translate([x_Box-x_PCB-Wall+72.5-4.4,Wall+tol,Wall+hex_bottom+z_PCB]){
        translate([x_posPedal,-Wall-tol,z_posPedal])cube([x_Pedal,Wall,z_Pedal]);
    }
}

module LED(){
r_LED = 6/2+tol;
    translate([x_Box-15,0,45])rotate([-90,0,0])cylinder(r=r_LED,h=Wall,$fn=smoothness);
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
    translate([x_Box-12.5,17,Wall+hex_bottom+Wall+15])rotate([0,90,0]){
        color([1,0,1])cylinder(r=12/2,h=25,$fn=Smoothness);
    }
}


module Regulator(){
    reg_r_base = 27/2;
    reg_h_base = 6.5;
    reg_x = 27;
    reg_y = 25;
    reg_z = 22;
    reg_r_top = 26/2;
    reg_h_top = 3;
    reg_thread_r = 23/2;
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
    r_manometer = 40.25/2;
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
    
    translate([33.9+2,y_Box-Wall-tol-32.1,Wall+hex_bottom+z_PCB+tol]){
        color([1,0,1]){
            cube([h1,l3,b1]);
            translate([h3,0,b1/2])rotate([90,0,0])cylinder(r=b1/2, h=l4, $fn=smoothness);
            translate([h3,l3,b1/2])rotate([-90,0,0])cylinder(r=b1/2, h=l4, $fn=smoothness);
            translate([h2,l3/2-l2/2,0])rotate([180,0,0])cylinder(r=d2/2,h=10,$fn=smoothness);
            translate([h2,l3/2+l2/2,0])rotate([180,0,0])cylinder(r=d2/2,h=10,$fn=smoothness);
        }
    }
}   

x_screen = 58.25;
y_screen = 35.25;
z_screen = 8;
x_screen2 = 48.75;
y_screen2 = 35;  
z_screen2 = 2.5;  
x_screen_screw = 55; //55
y_screen_screw = 30; //32
module Screen(){
    translate([5,10.5-tol,Wall+z_Box/2-y_screen/2])rotate([90,0,0]){
        cube([x_screen,y_screen,z_screen+tol]);
        translate([4,0.25/2,z_screen])cube([x_screen2,y_screen2,z_screen2+tol]);
        
////        translate([x_screen/2-x_screen_screw/2-2,y_screen/2-y_screen_screw/2,z_screen])cylinder(r=1+tol,h=z_screen2+tol,$fn=smoothness);
////        translate([x_screen/2+x_screen_screw/2,y_screen/2+y_screen_screw/2,z_screen])cylinder(r=1+tol,h=z_screen2+tol,$fn=smoothness);
////        translate([x_screen/2+x_screen_screw/2,y_screen/2-y_screen_screw/2,z_screen])cylinder(r=1+tol,h=z_screen2+tol,$fn=smoothness);
////        translate([x_screen/2-x_screen_screw/2-2,y_screen/2+y_screen_screw/2,z_screen])cylinder(r=1+tol,h=z_screen2+tol,$fn=smoothness);
    }
}


module ScreenFrame(){
x_screen_angle = 17;
y_screen_angle = 45.5;
x_screen_offset = 3;
x_offset = 3;
    
    translate([33.6,-3,35.5])rotate([90,0,0])difference(){
        union(){
            cube([x_screen2 + 2*Wall , y_screen2 + 2*Wall, 2*Wall], center=true);
            translate([-x_offset-x_screen2/2-Wall,-y_screen2/2-Wall,-Wall])cube([x_offset, y_screen2 + 2*Wall, 2*Wall]);
            translate([x_screen2/2+Wall,-y_screen2/2-Wall,-Wall])cube([x_screen_offset,y_screen2+2*Wall,2*Wall]);
        }
        
        translate([-x_screen2/2-Wall-x_offset,-y_screen2/2-Wall,-Wall])rotate([0,-x_screen_angle,0])cube([x_screen2, y_screen2+2*Wall,2*Wall]);
        mirror([1,0,0])translate([-x_screen2/2-Wall-x_screen_offset,-y_screen2/2-Wall,-Wall])rotate([0,-x_screen_angle,0])cube([x_screen2, y_screen2+2*Wall,2*Wall]);
        
        translate([-x_screen2/2-Wall-x_offset,-y_screen2/2-Wall,-Wall])rotate([y_screen_angle,0,0])cube([x_screen2+2*Wall+x_screen_offset+x_offset, y_screen2+2*Wall,2*Wall]);
        mirror([0,1,0])translate([-x_screen2/2-Wall-x_offset,-y_screen2/2-Wall,-Wall])rotate([y_screen_angle,0,0])cube([x_screen2+2*Wall+x_screen_offset+x_offset, y_screen2+2*Wall,2*Wall]);
        
        difference(){
            cube([x_screen2-2, y_screen2-2, 2*Wall+tol], center=true);
            translate([-x_screen2/2,-y_screen2/2,-Wall])cube([5,y_screen2,2*Wall]);
        }
    
    translate([-28,-16,-2*Wall])cylinder(r=1+tol, h=4*Wall, $fn=smoothness);
    translate([27,-16,-2*Wall])cylinder(r=1+tol, h=4*Wall, $fn=smoothness);
    translate([-28,16,-2*Wall])cylinder(r=1+tol, h=4*Wall, $fn=smoothness);
    translate([27,16,-2*Wall])cylinder(r=1+tol, h=4*Wall, $fn=smoothness);
        
    translate([-28,-16,-Wall+0.5])cylinder(r=3.75/2+tol, h=4*Wall, $fn=smoothness);
    translate([27,-16,-Wall+0.5])cylinder(r=3.75/2+tol, h=4*Wall, $fn=smoothness);
    translate([-28,16,-Wall+0.5])cylinder(r=3.75/2+tol, h=4*Wall, $fn=smoothness);
    translate([27,16,-Wall+0.5])cylinder(r=3.75/2+tol, h=4*Wall, $fn=smoothness);
    }
}




