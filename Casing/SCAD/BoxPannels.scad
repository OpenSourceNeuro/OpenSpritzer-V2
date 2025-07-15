include <Settings.scad>;
include <Components.scad>;



// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                                 Bottom Pannel                                 */

module Bottom(){
    color(Acrylic)difference(){
        minkowski(){
            cube([x_Box,y_Box,Wall-1]);
            cylinder(r=r_Box,h=1,$fn=Smoothness);
        }

        translate([xpos1_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=smoothness);
        translate([xpos2_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=smoothness);
        translate([xpos1_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=smoothness);
        translate([xpos2_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=smoothness);
        
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



// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                                   Top Pannel                                  */

module Top(){
    color(Acrylic)translate([0,0,z_Box+Wall])difference(){
        minkowski(){
            cube([x_Box,y_Box,Wall-1]);
            cylinder(r=r_Box,h=1,$fn=Smoothness);
        }
        
        translate([xpos1_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=smoothness);
        translate([xpos2_M3,ypos1_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=smoothness);
        translate([xpos1_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=smoothness);
        translate([xpos2_M3,ypos2_M3,-tol])cylinder(r=r_M3,h=Wall+2*tol,$fn=smoothness);
        
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



// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                                  Front Pannel                                 */

module Front_Rack(){
    color(Acrylic){difference(){
        union(){
            translate([0,0,Wall])cube([x_Box,Wall,z_Box]);
            difference(){
                translate([-x_Rack,0,Wall])cube([x_Rack,Wall,z_Box]);
                
                translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Smoothness);
                translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2-d_Rack])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Smoothness);
                translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2+d_Rack])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Smoothness);
                
                translate([-x_Rack+x_rack_plus,-tol,Wall+z_Box/2])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Smoothness);
                translate([-x_Rack+x_rack_plus,-tol,Wall+z_Box/2-d_Rack])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Smoothness);
                translate([-x_Rack+x_rack_plus,-tol,Wall+z_Box/2+d_Rack])rotate([-90,0,0])cylinder(r=r_Rack,h=Wall+2*tol,$fn=Smoothness);
                
                translate([-x_Rack+x_rack_minus,-tol,Wall+z_Box/2-r_Rack])cube([x_rack,Wall+2*tol,2*r_Rack]);
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
        
        Screen();
        Rotary();
        Manometer();
        Regulator();
        Switch();
        Switch_TTL();
        Switch_Pedal();
        LED();
    }
    
    translate([0,0,0])for (i = [0:2:x_Step-1]){
        translate([(Wall+tol) + ((i) * (x_Box-2*Wall)/x_Step),0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
    }
    translate([0,0,z_Box+Wall])for (i = [0:2:x_Step-1]){
        translate([(Wall+tol) + ((i+1) * (x_Box-2*Wall)/x_Step),0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
    }
    }
}

module Front(){
    color(Acrylic){difference(){
        translate([0,0,Wall])cube([x_Box,Wall,z_Box]);

        translate([0,0,Wall])for (i = [0:2:z_Step-1]){
            translate([-tol,-tol,(i+1) * z_Box/z_Step-tol])cube([Wall+tol,Wall+2*tol,z_Box/z_Step+2*tol]);
        }
        translate([0,0,Wall])for (i = [0:2:z_Step-1]){
            translate([x_Box-Wall,-tol,(i) * z_Box/z_Step-tol])cube([Wall+tol,Wall+2*tol,z_Box/z_Step+2*tol]);
        }
        
        Screen();
        Rotary();
        Manometer();
        Regulator();
        Switch();
        Switch_TTL();
        Switch_Pedal();
        LED();
        }
    
        translate([0,0,0])for (i = [0:2:x_Step-1]){
            translate([(Wall+tol) + ((i) * (x_Box-2*Wall)/x_Step),0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
        }
        translate([0,0,z_Box+Wall])for (i = [0:2:x_Step-1]){
            translate([(Wall+tol) + ((i+1) * (x_Box-2*Wall)/x_Step),0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
        }
    }
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                                  Back Pannel                                  */

module Back(){
    color(Acrylic){difference(){
        translate([0,y_Box-Wall,Wall])cube([x_Box,Wall,z_Box]);
        
        translate([0,y_Box-Wall,Wall])for (i = [0:2:z_Step-1]){
            translate([-tol,-tol,(i) * z_Box/z_Step-tol])cube([Wall+tol,Wall+2*tol,z_Box/z_Step+2*tol]);
        }
        translate([0,y_Box-Wall,Wall])for (i = [0:2:z_Step-1]){
            translate([x_Box-Wall,-tol,(i+1) * z_Box/z_Step-tol])cube([Wall+tol,Wall+2*tol,z_Box/z_Step+2*tol]);
        }
        Power();
        Power_Switch();
        Solenoid();
    }
    
    translate([0,y_Box-Wall,0])for (i = [0:2:x_Step-1]){
        translate([(Wall+tol) + ((i+1) * (x_Box-2*Wall)/x_Step)-tol,0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
    }
    translate([0,y_Box-Wall,z_Box+Wall])for (i = [0:2:x_Step-1]){
        translate([(Wall+tol) + ((i) * (x_Box-2*Wall)/x_Step)-tol,0,0])cube([(x_Box-2*Wall)/x_Step, Wall, Wall]);
    }
    }
}



// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                                  Left Pannel                                  */

module Left(){
    color(Acrylic){
        difference(){
            translate([0,0,Wall])cube([Wall,y_Box,z_Box]);
            
            translate([0,0,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,-tol,(i) * z_Box/z_Step])cube([Wall+2*tol,Wall+tol,z_Box/z_Step]);
            }
            translate([0,y_Box-Wall,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,0,(i+1) * z_Box/z_Step])cube([Wall+2*tol+10,Wall+tol,z_Box/z_Step]);
            }
        }
        
        translate([0,0,z_Box+Wall])for (i = [0:2:y_Step-1]){
            translate([0, (Wall+tol) + ((i) * (y_Box-2*Wall-2*tol)/y_Step), 0])cube([Wall, (y_Box-2*Wall-2*tol)/y_Step, Wall]);
        }
        translate([0,0,0])for (i = [0:2:y_Step-1]){
            translate([0, (Wall+tol) + ((i+1) * (y_Box-2*Wall-2*tol)/y_Step), -tol])cube([Wall, (y_Box-2*Wall-2*tol)/y_Step, Wall+2*tol]);
        }
    }
}



// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                                  Right Pannel                                 */

module Right(){
    color(Acrylic){
        difference(){
            translate([x_Box-Wall,0,Wall])cube([Wall,y_Box,z_Box]);
            
            translate([x_Box-Wall,0,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,-tol,(i+1) * z_Box/z_Step])cube([Wall+2*tol,Wall+tol,z_Box/z_Step]);
            }
            translate([x_Box-Wall,y_Box-Wall,Wall])for (i = [0:2:z_Step-1]){
                translate([-tol,0,(i) * z_Box/z_Step])cube([Wall+2*tol+10,Wall+tol,z_Box/z_Step]);
            }
            
            Festo();
            ESP();
            BNC90_1();
            BNC90_2();
        }
        
        translate([x_Box-Wall,0,z_Box+Wall])for (i = [0:2:y_Step-1]){
            translate([0, (Wall+tol) + ((i+1) * (y_Box-2*Wall-2*tol)/y_Step), 0])cube([Wall, (y_Box-2*Wall-2*tol)/y_Step, Wall]);
        }
        translate([x_Box-Wall,0,0])for (i = [0:2:y_Step-1]){
            translate([0, (Wall+tol) + ((i) * (y_Box-2*Wall-2*tol)/y_Step), -tol])cube([Wall, (y_Box-2*Wall-2*tol)/y_Step, Wall+2*tol]);
        }
    }
}

