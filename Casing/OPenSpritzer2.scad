Acrylic_Wall = 3;
tol = 0.1;
Smoothness = 60;
xxx = 20;


x_PCB = 65;
y_PCB = 85;
z_PCB = 2;
r_PCB = 3;
r_Acrylic = 5;

PCB_Spacing = 2.54;

r_hex = 5.65/2;
hex_bottom = 8;
hex_top = 20+8;



// // // Switches // // //
DXF = 0;

PCB = 1;

BNC90 = 10;
DPDT = 10;
Power = 10;
ESP = 10;
Rotary = 10;

Regulator = 1;
Solenoid = 1;

Hex_Bottom = 1;
Hex_Top = 1;

Acrylic_Bottom  = 1;
Acrylic_Top  = 1;
Acrylic_Front  = 1;
Acrylic_Back  = 1;
Acrylic_Left  = 1;
Acrylic_Right  = 1;

// // // Parameters // // // //

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

x_Power = 9;
y_Power = 13.6;
z_Power = 11;
xoffset_pinPower1 = 25;
yoffset_pinPower1 = y_PCB - 4.75;
xoffset_pinPower2 = 20.3;
yoffset_pinPower2 = y_PCB - 7.79;
xoffset_pinPower3 = 25;
yoffset_pinPower3 = y_PCB - 10.8;
x_pinPower1 = 4.5;
y_pinPower1 = y_Power-7.5;
x_pinPower2 = -0.1;
y_pinPower2 = y_Power-10.8;
x_pinPower3 = 4.5;
y_pinPower3 = y_Power-13.6;
xpos_Power = 60;
ypos_Power = y_PCB-4.75;

x_Switch = 8.8;
y_Switch = 13.7;
z_Switch = 8.8;
r_Switch = 6/2;
h_Switch = 2.7;
hpos_Switch = 4.4;
xoffset_pinSwitch = 1.86;
yoffset_pinSwitch = 7.62;
h_pinSwitch = 4.2;
r_pinSwitch = 0.6/2;
xoffset_pinSwitch1 = 25;
xoffset_pinSwitch2 = 25+PCB_Spacing;
xoffset_pinSwitch3 = 25-PCB_Spacing;
xoffset_pinSwitch4 = 50;
xoffset_pinSwitch5 = 50+PCB_Spacing;
xoffset_pinSwitch6 = 50-PCB_Spacing;
yoffset_pinSwitch1 = y_PCB-88.07;
yoffset_pinSwitch2 = y_PCB-90.62;

xpos1_M3 = 5;
xpos2_M3 = 47.5;
ypos1_M3 = 10;
ypos2_M3 = 75;
r_M3 = 3/2;

r_Hole = 0.5+tol;
ypos_BNC90_1 = y_PCB-60;
ypos_BNC90_1bis = y_PCB-82.54;
ypos_BNC90_2 = y_PCB-25;
ypos_BNC90_2bis = y_PCB-22.5;
xpos_BNC90 = 12.4;
xpos_Switch_1 = 24;
xpos_Switch_1bis = 27.7;
ypos_Switch = y_PCB-80.75;

xpos_Rotary = 47.5;
ypos_Rotary = 1.5;
zpos_Rotary = 22;
r_Rotary = 7.5/2;
h_Rotary = 25;

xmargin_Acrylic = 10;
ymargin_Acrylic = 10;
x_Acrylic = x_PCB + 2*xmargin_Acrylic;
y_Acrylic = y_PCB + 2*ymargin_Acrylic;
z_Acrylic = Acrylic_Wall;

x_AcrylicFront = x_PCB;
y_AcrylicFront = Acrylic_Wall;
z_AcrylicFront = z_PCB + hex_bottom + hex_top ;

x_AcrylicSide = Acrylic_Wall;
y_AcrylicSide = y_PCB;
z_AcrylicSide = z_PCB + hex_bottom + hex_top;

y1margin_AcrylicFront = 2;
y2margin_AcrylicFront = 2;

x1margin_AcrylicSide = 2;
x2margin_AcrylicSide = 2;
x1margin_AcrylicFront = x1margin_AcrylicSide+Acrylic_Wall;
x2margin_AcrylicFront = x2margin_AcrylicSide+Acrylic_Wall;

y1margin_AcrylicSide = y1margin_AcrylicFront;
y2margin_AcrylicSide = y2margin_AcrylicFront;




// // // Functions // // //

if (PCB == 1){
    difference(){
        PCB();
        translate([xpos1_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=z_PCB+2*tol,$fn=Smoothness);
        translate([xpos1_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=z_PCB+2*tol,$fn=Smoothness);
        translate([xpos2_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=z_PCB+2*tol,$fn=Smoothness);
        translate([xpos2_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=z_PCB+2*tol,$fn=Smoothness);
    }
}

if (Rotary == 1){
    Rotary();
}


module Rotary(){
    translate([xpos_Rotary,ypos_Rotary,zpos_Rotary])rotate([90,0,0])cylinder(r=r_Rotary,h=h_Rotary,$fn=Smoothness);
}

if (BNC90 == 1){
    translate([xpos_BNC90,ypos_BNC90_1,0])BNC90();
    translate([xpos_BNC90,ypos_BNC90_2,0])BNC90();
}

if (ESP == 1){
    translate([14.8,y_PCB-0.25,z_PCB])rotate([0,0,-90])ESP();
}

if (Power == 1){
    translate([xpos_Power,ypos_Power,0])Power();
}

if (DPDT == 1){
    translate([xpos_Switch_1,ypos_Switch,0])Switch();
}

if (Hex_Bottom == 1){
    translate([xpos1_M3,ypos1_M3,-hex_bottom])Hex(hex_bottom);
    translate([xpos2_M3,ypos1_M3,-hex_bottom])Hex(hex_bottom);
    translate([xpos1_M3,ypos2_M3,-hex_bottom])Hex(hex_bottom);
    translate([xpos2_M3,ypos2_M3,-hex_bottom])Hex(hex_bottom);
}

if (Hex_Top == 1){
    translate([xpos1_M3,ypos1_M3,z_PCB])Hex(hex_top);
    translate([xpos2_M3,ypos1_M3,z_PCB])Hex(hex_top);
    translate([xpos1_M3,ypos2_M3,z_PCB])Hex(hex_top);
    translate([xpos2_M3,ypos2_M3,z_PCB])Hex(hex_top);
}

if (Regulator == 1){
    translate([90,28,15])rotate([0,0,0])Regulator();
}

if (Solenoid == 1){
    translate([52.5,y_PCB-30,z_PCB+hex_top-10-tol])rotate([0,0,0])Solenoid();
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


// // // Modules // // //


module PCB(){
    color([0.1,0.8,0])translate([r_PCB,r_PCB,0])minkowski(){
        cube([x_PCB-2*r_PCB,y_PCB-2*r_PCB,z_PCB-tol]);
        cylinder(r=r_PCB,h=tol,$fn=Smoothness);
    }
}

module BNC90(){
    color([1,1,1])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90,-y_BNC90/2,z_PCB])cube([x_BNC90,y_BNC90,z_BNC90]);
    color([1,1,1])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90-h1_BNC90,0,z_BNC90/2+z_PCB])rotate([0,90,0])cylinder(r=r1_BNC90+tol,h=h1_BNC90,$fn=Smoothness);
    color([192/255,192/255,192/255])translate([-x_BNC90+offset_pinBNC90+r_pinBNC90-h1_BNC90-h2_BNC90,0,z_BNC90/2+z_PCB])rotate([0,90,0])cylinder(r=r2_BNC90,h=h2_BNC90,$fn=Smoothness);
    translate([0,0,-h_pinBNC90+z_PCB])cylinder(r=r_pinBNC90,h=h_pinBNC90,$fn=Smoothness);
    translate([0,-PCB_Spacing,-h_pinBNC90+z_PCB])cylinder(r=r_pinBNC90,h=h_pinBNC90,$fn=Smoothness);
}

module Power(){
    color([0.1,0.1,0.1])translate([-x_pinPower1,-y_pinPower1,z_PCB]){
        cube([x_Power,y_Power+xxx,z_Power]);
        translate([x_pinPower1,y_pinPower1,-tol-z_PCB])cylinder(r=r_Hole,h=z_PCB+2*tol,$fn=Smoothness);
        translate([x_pinPower2,y_pinPower2,-tol-z_PCB])cylinder(r=r_Hole,h=z_PCB+2*tol,$fn=Smoothness);
        translate([x_pinPower3,y_pinPower3,-tol-z_PCB])cylinder(r=r_Hole,h=z_PCB+2*tol,$fn=Smoothness);
    }
}

module Switch(){
    translate([-xoffset_pinSwitch,-y_Switch+yoffset_pinSwitch,z_PCB]){
        color([0.8,0.1,0.1])cube([x_Switch,y_Switch,z_Switch]);
        color([192/255,192/255,192/255])translate([x_Switch/2,0,hpos_Switch])rotate([90,0,0])cylinder(r=r_Switch+tol,h=h_Switch+xxx,$fn=Smoothness);
        translate([xoffset_pinSwitch,y_Switch-yoffset_pinSwitch,-h_pinSwitch+z_PCB])cylinder(r=r_pinSwitch,h=h_pinSwitch,$fn=Smoothness);
        translate([x_Switch-xoffset_pinSwitch,y_Switch-yoffset_pinSwitch,-h_pinSwitch+z_PCB])cylinder(r=r_pinSwitch,h=h_pinSwitch,$fn=Smoothness);
        translate([xoffset_pinSwitch,y_Switch-yoffset_pinSwitch+2*PCB_Spacing,-h_pinSwitch+z_PCB])cylinder(r=r_pinSwitch,h=h_pinSwitch,$fn=Smoothness);
        translate([xoffset_pinSwitch+PCB_Spacing,y_Switch-yoffset_pinSwitch+2*PCB_Spacing,-h_pinSwitch+z_PCB])cylinder(r=r_pinSwitch,h=h_pinSwitch,$fn=Smoothness);
        translate([xoffset_pinSwitch+2*PCB_Spacing,y_Switch-yoffset_pinSwitch+2*PCB_Spacing,-h_pinSwitch+z_PCB])cylinder(r=r_pinSwitch,h=h_pinSwitch,$fn=Smoothness);
        translate([xoffset_pinSwitch,y_Switch-yoffset_pinSwitch+3*PCB_Spacing,-h_pinSwitch+z_PCB])cylinder(r=r_pinSwitch,h=h_pinSwitch,$fn=Smoothness);
        translate([xoffset_pinSwitch+PCB_Spacing,y_Switch-yoffset_pinSwitch+3*PCB_Spacing,-h_pinSwitch+z_PCB])cylinder(r=r_pinSwitch,h=h_pinSwitch,$fn=Smoothness);
        translate([xoffset_pinSwitch+2*PCB_Spacing,y_Switch-yoffset_pinSwitch+3*PCB_Spacing,-h_pinSwitch+z_PCB])cylinder(r=r_pinSwitch,h=h_pinSwitch,$fn=Smoothness);
    }
}

module Hex(height){
    color([255/255,215/255,0])cylinder(r=r_hex,h=height,$fn=8);
}

module ESP(){
    translate([-xpos_ESP,ypos_ESP,z_PCB]){cube([x_ESP,y_ESP,z_ESP]);
        translate([-xxx,y_ESP/2-y_USB/2,z_ESP+h_USB-z_USB/2])cube([x_USB+xxx,y_USB,z_USB]);
    }  
}

module Regulator(){
    reg_r_base = 27/2;
    reg_h_base = 6.5;
    reg_x = 27;
    reg_y = 25;
    reg_z = 22;
    reg_r_top = 26/2;
    reg_h_top = 20;
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
    color([1,0,1])rotate([90,0,0]){
        cylinder(r=reg_r_base,reg_h_base,$fn=Smoothness);
        translate([-reg_x/2,-reg_y/2,reg_h_base])cube([reg_x,reg_y,reg_z]); 
        translate([0,0,reg_h_base+reg_z])cylinder(r=reg_r_top,reg_h_top,$fn=Smoothness);
        translate([0,0,reg_h_base+reg_z+reg_h_top])cylinder(r=reg_thread_r,reg_thread_h,$fn=Smoothness);
        translate([0,0,reg_h_base+reg_z+reg_h_top+reg_thread_h])cylinder(r=reg_ring_r,reg_ring_h,$fn=Smoothness);
        
        translate([0,-reg_y/2,reg_h_base+reg_z/2])rotate([90,0,0])cylinder(r=reg_gauge_r,h=reg_gauge_h,$fn=Smoothness);
        translate([0,reg_y/2,reg_h_base+reg_z/2])rotate([-90,0,0])cylinder(r=reg_gauge_r,h=reg_gauge2_h,$fn=Smoothness);
        translate([-reg_gauge2_x/2,reg_y/2+reg_gauge2_h,reg_h_base+reg_z/2-reg_gauge2_x/2])cube([reg_gauge2_x,reg_gauge2_z,reg_gauge2_x]);
        translate([0,reg_y/2+reg_gauge2_h+reg_gauge2_z,reg_h_base+reg_z/2])rotate([-90,0,0])cylinder(r=39/2, h=26.5, $fn=Smoothness);
        
        translate([-reg_x/2,0,reg_h_base+reg_z/2])rotate([0,90,0])cylinder(r=reg_tube_r,h=reg_tube_h,$fn=Smoothness);
        translate([reg_y/2,0,reg_h_base+reg_z/2])rotate([0,-90,0])cylinder(r=reg_tube_r,h=reg_tube_h,$fn=Smoothness);        
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
        {
            cube([h1,l3,b1]);
            translate([h3,0,b1/2])rotate([90,0,0])cylinder(r=b1/2, h=l4, $fn=Smoothness);
            translate([h3,l3,b1/2])rotate([-90,0,0])cylinder(r=b1/2, h=l4, $fn=Smoothness);
            translate([h2,l3/2-l2/2,0])rotate([180,0,0])cylinder(r=d2/2,h=10,$fn=Smoothness);
            translate([h2,l3/2+l2/2,0])rotate([180,0,0])cylinder(r=d2/2,h=10,$fn=Smoothness);
        }
    }
}   





///////////////////////////////////////////////////////////////////////////////////////

module Acrylic_Botom(){
    color([0,0,0.8,0.2])difference(){
        translate([-xmargin_Acrylic+r_Acrylic,-ymargin_Acrylic+r_Acrylic,-hex_bottom-z_Acrylic]){
            minkowski(){
                cube([x_Acrylic-2*r_Acrylic,y_Acrylic-2*r_Acrylic,z_Acrylic-1]);
                cylinder(r=r_Acrylic,h=1,$fn=Smoothness);
            }
        }
        translate([xpos1_M3,ypos1_M3,-hex_bottom-z_Acrylic-tol])cylinder(r=r_M3,h=z_Acrylic+2*tol,$fn=Smoothness);
        translate([xpos2_M3,ypos1_M3,-hex_bottom-z_Acrylic-tol])cylinder(r=r_M3,h=z_Acrylic+2*tol,$fn=Smoothness);
        translate([xpos1_M3,ypos2_M3,-hex_bottom-z_Acrylic-tol])cylinder(r=r_M3,h=z_Acrylic+2*tol,$fn=Smoothness);
        translate([xpos2_M3,ypos2_M3,-hex_bottom-z_Acrylic-tol])cylinder(r=r_M3,h=z_Acrylic+2*tol,$fn=Smoothness);
        for (i = [0:2:9]){
            translate([x_AcrylicFront+x2margin_AcrylicSide-tol,-y1margin_AcrylicSide-Acrylic_Wall+(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide+2*Acrylic_Wall)*(i+1)/11-tol,-2*Acrylic_Wall-hex_bottom-tol])cube([Acrylic_Wall+2*tol,(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide)/11+2*tol,2*Acrylic_Wall+tol]);
            translate([-x1margin_AcrylicSide-x_AcrylicSide-tol,-y1margin_AcrylicSide-Acrylic_Wall+(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide+2*Acrylic_Wall)*(i+1)/11-tol,-2*Acrylic_Wall-hex_bottom-tol])cube([Acrylic_Wall+2*tol,(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide)/11+2*tol,2*Acrylic_Wall+tol]);
            translate([-x1margin_AcrylicFront+(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)*(i+1)/11-tol,y_PCB+y2margin_AcrylicFront-tol,-2*Acrylic_Wall-hex_bottom-tol])cube([(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)/9+2*tol,Acrylic_Wall+2*tol,2*Acrylic_Wall+tol]);
           translate([-x1margin_AcrylicFront+(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)*(i+1)/11-tol,-y1margin_AcrylicFront-y_AcrylicFront-tol,-2*Acrylic_Wall-hex_bottom-tol])cube([(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)/10+2*tol,Acrylic_Wall+2*tol,2*Acrylic_Wall+tol]);
        } 
        
    }
}


module Acrylic_Top(){
    color([0,0,0.8,0.2])difference(){
        translate([-xmargin_Acrylic+r_Acrylic,-ymargin_Acrylic+r_Acrylic,z_PCB+hex_top]){
            minkowski(){
                cube([x_Acrylic-2*r_Acrylic,y_Acrylic-2*r_Acrylic,z_Acrylic-1]);
                cylinder(r=r_Acrylic,h=1,$fn=Smoothness);
            }
        }
        translate([xpos1_M3,ypos1_M3,z_PCB+hex_top-tol])cylinder(r=r_M3,h=z_Acrylic+2*tol+xxx,$fn=Smoothness);
        translate([xpos2_M3,ypos1_M3,z_PCB+hex_top-tol])cylinder(r=r_M3,h=z_Acrylic+2*tol+xxx,$fn=Smoothness);
        translate([xpos1_M3,ypos2_M3,z_PCB+hex_top-tol])cylinder(r=r_M3,h=z_Acrylic+2*tol+xxx,$fn=Smoothness);
        translate([xpos2_M3,ypos2_M3,z_PCB+hex_top-tol])cylinder(r=r_M3,h=z_Acrylic+2*tol+xxx,$fn=Smoothness);
        for (i = [0:2:9]){            
            translate([x_AcrylicFront+x2margin_AcrylicSide-tol,-y1margin_AcrylicSide-Acrylic_Wall+(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide+2*Acrylic_Wall)*(i+1)/11-tol,z_AcrylicFront-hex_bottom])cube([Acrylic_Wall+2*tol,(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide)/11+2*tol,2*Acrylic_Wall+tol]);
            translate([-x1margin_AcrylicSide-x_AcrylicSide-tol,-y1margin_AcrylicSide-Acrylic_Wall+(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide+2*Acrylic_Wall)*(i+1)/11-tol,z_AcrylicFront-hex_bottom])cube([Acrylic_Wall+2*tol,(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide)/11+2*tol,2*Acrylic_Wall+tol]);
            translate([-x1margin_AcrylicFront+(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)*(i+1)/11-tol,y_PCB+y2margin_AcrylicFront-tol,z_AcrylicFront-hex_bottom])cube([(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)/9+2*tol,Acrylic_Wall+2*tol,2*Acrylic_Wall+tol]);
            translate([-x1margin_AcrylicFront+(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)*(i+1)/11-tol,-y1margin_AcrylicFront-y_AcrylicFront-tol,z_AcrylicFront-hex_bottom])cube([(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)/10+2*tol,Acrylic_Wall+2*tol,2*Acrylic_Wall+tol]);
        }
    }
}


module Acrylic_Front(){
    color([0,0,0.8,0.2]){
        difference(){
            translate([-x1margin_AcrylicFront,-y1margin_AcrylicFront-y_AcrylicFront,-hex_bottom])cube([x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront,y_AcrylicFront,z_AcrylicFront]);
            translate([xpos_Switch_1,ypos_Switch,0])Switch();
            Rotary();
            for (i = [0:2:6]){
                translate([-x1margin_AcrylicFront-tol,-y1margin_AcrylicFront-Acrylic_Wall-tol,-hex_bottom+z_AcrylicSide*(i+1)/6])cube([Acrylic_Wall+2*tol,Acrylic_Wall+2*tol,z_AcrylicSide/6]);
                translate([x_AcrylicFront+x2margin_AcrylicFront-Acrylic_Wall-tol,-y1margin_AcrylicFront-Acrylic_Wall-tol,-hex_bottom+z_AcrylicSide*(i+1)/6])cube([Acrylic_Wall+2*tol,Acrylic_Wall+2*tol,z_AcrylicSide/6]);
            }
        }
        for (i = [0:2:9]){
            translate([-x1margin_AcrylicFront+(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)*(i+1)/11,-y1margin_AcrylicFront-y_AcrylicFront,-Acrylic_Wall-hex_bottom])cube([(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)/10,Acrylic_Wall,Acrylic_Wall]);
            translate([-x1margin_AcrylicFront+(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)*(i+1)/11,-y1margin_AcrylicFront-y_AcrylicFront,z_AcrylicFront-hex_bottom])cube([(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)/10,Acrylic_Wall,Acrylic_Wall]);
        }
    }
}
module Acrylic_Back(){
    color([0,0,0.8,0.2]){
        difference(){
            translate([-x1margin_AcrylicFront,y_PCB+y2margin_AcrylicFront,-hex_bottom])cube([x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront,y_AcrylicFront,z_AcrylicFront]);
            for (i = [0:2:6]){
                translate([-x1margin_AcrylicFront-tol,y_PCB+y2margin_AcrylicFront-tol,-hex_bottom+z_AcrylicSide*(i+1)/6])cube([Acrylic_Wall+2*tol,Acrylic_Wall+2*tol,z_AcrylicSide/6]);
                translate([x_AcrylicFront+x2margin_AcrylicFront-Acrylic_Wall-tol,y_PCB+y2margin_AcrylicFront-tol,-hex_bottom+z_AcrylicSide*(i+1)/6])cube([Acrylic_Wall+2*tol,Acrylic_Wall+2*tol,z_AcrylicSide/6]);
            }
            translate([14.8,y_PCB-0.25,z_PCB])rotate([0,0,-90])ESP();
            translate([xpos_Power,ypos_Power,0])Power();
        }
        for (i = [0:2:9]){
            translate([-x1margin_AcrylicFront+(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)*(i+1)/11,y_PCB+y2margin_AcrylicFront,-Acrylic_Wall-hex_bottom])cube([(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)/9,Acrylic_Wall,Acrylic_Wall]);
            translate([-x1margin_AcrylicFront+(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)*(i+1)/11,y_PCB+y2margin_AcrylicFront,z_AcrylicFront-hex_bottom])cube([(x_AcrylicFront+x1margin_AcrylicFront+x2margin_AcrylicFront)/9,Acrylic_Wall,Acrylic_Wall]);
        }
    }
}
module Acrylic_Left(){
    color([0,0,0.8,0.2]){
        difference(){
            translate([-x1margin_AcrylicSide-x_AcrylicSide,-y1margin_AcrylicSide,-hex_bottom])cube([x_AcrylicSide,y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide,z_AcrylicSide]);
            translate([xpos_BNC90,ypos_BNC90_1,0])BNC90();
            translate([xpos_BNC90,ypos_BNC90_2,0])BNC90();
        }
        difference(){
            translate([-x1margin_AcrylicSide-x_AcrylicSide,-y1margin_AcrylicSide-Acrylic_Wall,-hex_bottom])cube([Acrylic_Wall,Acrylic_Wall,z_AcrylicSide]);
            for (i = [0:2:6]){
                translate([-x1margin_AcrylicSide-x_AcrylicSide-tol,-y1margin_AcrylicSide-Acrylic_Wall-tol,z_AcrylicSide*i/6-hex_bottom-tol])cube([Acrylic_Wall+2*tol,Acrylic_Wall+2*tol,z_AcrylicSide/6+2*tol]);
            }
        }
        difference(){
            translate([-x1margin_AcrylicSide-x_AcrylicSide,y_AcrylicSide+y1margin_AcrylicSide,-hex_bottom])cube([Acrylic_Wall,Acrylic_Wall,z_AcrylicSide]);
            for (i = [0:2:6]){
                translate([-x1margin_AcrylicSide-x_AcrylicSide-tol,y_AcrylicSide+y1margin_AcrylicSide-tol,z_AcrylicSide*i/6-hex_bottom-tol])cube([Acrylic_Wall+2*tol,Acrylic_Wall+2*tol,z_AcrylicSide/6+2*tol]);
            }
        }
        for (i = [0:2:9]){
            translate([-x1margin_AcrylicSide-x_AcrylicSide,-y1margin_AcrylicSide-Acrylic_Wall+(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide+2*Acrylic_Wall)*(i+1)/11,-Acrylic_Wall-hex_bottom])cube([Acrylic_Wall,(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide)/11,Acrylic_Wall]);
            translate([-x1margin_AcrylicSide-x_AcrylicSide,-y1margin_AcrylicSide-Acrylic_Wall+(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide+2*Acrylic_Wall)*(i+1)/11,z_AcrylicFront-hex_bottom])cube([Acrylic_Wall,(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide)/11,Acrylic_Wall]);
        }
    }
}
module Acrylic_Right(){
    color([0,0,0.8,0.2]){
    //color([0,0,1]){
        difference(){
            translate([x_PCB+x2margin_AcrylicSide,-y1margin_AcrylicSide,-hex_bottom])cube([x_AcrylicSide,y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide,z_AcrylicSide]);
            }
        difference(){
            translate([x_AcrylicFront+x2margin_AcrylicSide,-y1margin_AcrylicSide-Acrylic_Wall,-hex_bottom])cube([Acrylic_Wall,Acrylic_Wall,z_AcrylicSide]);
            for (i = [0:2:6]){
                translate([x_AcrylicFront+x2margin_AcrylicSide-tol,-y1margin_AcrylicSide-Acrylic_Wall-tol,z_AcrylicSide*i/6-hex_bottom-tol])cube([Acrylic_Wall+2*tol,Acrylic_Wall+2*tol,z_AcrylicSide/6+2*tol]);
            }
        }
        difference(){
            translate([x_AcrylicFront+x2margin_AcrylicSide,y_AcrylicSide+y1margin_AcrylicSide,-hex_bottom])cube([Acrylic_Wall,Acrylic_Wall,z_AcrylicSide]);
            for (i = [0:2:6]){
                translate([x_AcrylicFront+x2margin_AcrylicSide-tol,y_AcrylicSide+y1margin_AcrylicSide-tol,z_AcrylicSide*i/6-hex_bottom-tol])cube([Acrylic_Wall+2*tol,Acrylic_Wall+2*tol,z_AcrylicSide/6+2*tol]);
            }
        }
        for (i = [0:2:9]){
            translate([x_AcrylicFront+x2margin_AcrylicSide,-y1margin_AcrylicSide-Acrylic_Wall+(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide+2*Acrylic_Wall)*(i+1)/11,-Acrylic_Wall-hex_bottom])cube([Acrylic_Wall,(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide)/11,Acrylic_Wall]);
            translate([x_AcrylicFront+x2margin_AcrylicSide,-y1margin_AcrylicSide-Acrylic_Wall+(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide+2*Acrylic_Wall)*(i+1)/11,z_AcrylicFront-hex_bottom])cube([Acrylic_Wall,(y_AcrylicSide+y1margin_AcrylicSide+y2margin_AcrylicSide)/11,Acrylic_Wall]);
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



    
            
        