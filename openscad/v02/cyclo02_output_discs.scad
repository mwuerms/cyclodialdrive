/**
 * Martin Egli
 * 2025-08-06
 * cyclodial gear/drive
 * v02: everything shall be 3d printed, used with 5010 BLDC Motor + AS5600 magnetic encoder
 * resources
 * + https://mevirtuoso.com/cycloidal-drive/
 * + https://ch.mathworks.com/help/sdl/ref/cycloidaldrive.html
 * maybe later
 * + https://www.youtube.com/watch?v=cvuBCdxfGDg
 */
use <electronics_parts.scad>
use <mechanics_parts.scad>
use <parts.scad>
use <screws.scad>

module inner_roller_bearing(loc_res = 32) {
    roller_bearing(h1 = 2*4+2*5, h2 = 4, h3 = 2*5, loc_res = loc_res);
}

module output_disc1(show_bearings = 1, col = "LightCyan", loc_res = 32) {
    if(show_bearings) {
        rad_out = 38.4/2;
        for(n = [0:1:7])
        translate([rad_out*cos(360/8*n), rad_out*sin(360/8*n), 0.5])
        inner_roller_bearing();
    }
    odia = 45;
    idia = 27;
    th = 4;
    th1 = 0.5;
    color(col)
    difference() {
        union() {
            difference() {
                translate([0, 0, 0])
                cylinder(d = odia, h = th, $fn = loc_res);
                translate([0, 0, -1])
                cylinder(d = idia, h = th+2, $fn = loc_res);
            }
            difference() {
                translate([0, 0, th])
                cylinder(d = odia+1, h = th1, $fn = loc_res);
                translate([0, 0, th-1])
                cylinder(d = idia-1, h = th1+2, $fn = loc_res);
            }
        }
        rad_out = 38.4/2;
        for(n = [0:1:7])
        translate([rad_out*cos(360/8*n), rad_out*sin(360/8*n), 0]) {
            translate([0, 0, 0.5])
            cylinder(d = 3.2, h = th+1, $fn = loc_res);
            translate([0, 0, -1])
            cylinder(d = 1, h = th, $fn = loc_res);
        }
        // look inside
        *translate([0, 0, -1])
        cube(45);
    }    
}

module output_disc2(col = "LightBlue", loc_res = 32) {
    odia = 45;
    idia = 27;
    th = 4;
    th1 = 0.5;
    th2 = 6+1;
    color(col)
    difference() {
        union() {
            difference() {
                translate([0, 0, -th1])
                cylinder(d = odia+1, h = th1, $fn = loc_res);
                translate([0, 0, -1])
                cylinder(d = idia, h = th1+2, $fn = loc_res);
            }
            
            difference() {
                translate([0, 0, 0])
                cylinder(d = odia, h = th2, $fn = loc_res);
                translate([0, 0, -1])
                cylinder(d = idia, h = th+1, $fn = loc_res);
                translate([0, 0, -1])
                cylinder(d = idia-1, h = th+1.5, $fn = loc_res);
            }
            
        }
        rad_out = 38.4/2;
        for(n = [0:1:7])
        translate([rad_out*cos(360/8*n), rad_out*sin(360/8*n), 0]) {
            translate([0, 0, -1])
            cylinder(d = 3.2, h = th+0.6, $fn = loc_res);
            translate([0, 0, th-1])
            cylinder(d = 1, h = th, $fn = loc_res);
        }
        // look inside
        *translate([0, 0, -1])
        cube(45);
    }    
}
