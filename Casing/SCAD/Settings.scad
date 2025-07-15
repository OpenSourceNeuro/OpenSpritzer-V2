Wall = 3;
tol = 0.1;
Smoothness = 360;
smoothness = 60;
Acrylic = [0,0,0.8,0.2];

r_hex = 5.65/2;
hex_bottom = 5;
hex_top = 18+20+20;
z_PCB = 2;

x_Box = 200;
y_Box = 100;
z_Box = hex_bottom + z_PCB + hex_top;
r_Box = 5;

x_PCB = x_Box-2*Wall-2*tol;
y_PCB = y_Box-2*Wall-2*tol;

r_PCB = 3;



r_Rack = 3+tol;
x_Rack = 25;
x_rack = 10;
x_rack_minus = x_Rack/2-x_rack/2;
x_rack_plus = x_rack+x_rack_minus;
d_Rack = 15.9;


xpos1_M3 = x_Box-Wall-x_PCB+10;
xpos2_M3 = x_Box-Wall-x_PCB+161;
ypos1_M3 = y_Box-Wall-tol-72;
ypos2_M3 = y_Box-Wall-tol-7.5;
r_M3 = 3/2;





x_Step = 10;
y_Step = 8;
z_Step = 6;
