/**
 * Martin Egli
 * 2025-08-06
 * cyclodial gear/drive, just a model (fast rendering)
 * v02: everything shall be 3d printed, used with 5010 BLDC Motor + AS5600 magnetic encoder
 * resources
 * + https://mevirtuoso.com/cycloidal-drive/
 * + https://ch.mathworks.com/help/sdl/ref/cycloidaldrive.html
 * maybe later
 * + https://www.youtube.com/watch?v=cvuBCdxfGDg
 */

module cyclo02modelA(loc_res = 64) {
    // from the bottom
    hull() {
        translate([0, 0, 2])
        cylinder(d = 60, h = 19, $fn = loc_res);
        translate([0, 0, 0])
        cylinder(d = 56, h = 2, $fn = loc_res);
    }
    difference() {
        hull() {
            translate([0, 0, 26])
            cylinder(d = 70, h = 24, $fn = loc_res);
            translate([0, 0, 21])
            cylinder(d = 60, h = 2, $fn = loc_res);
        }
        translate([0, 0, 49])
        cylinder(d = 55, h = 2, $fn = loc_res);
    }
    // A longer output disc
    translate([0, 0, 49])
    cylinder(d = 45, h = 1, $fn = loc_res); 
    rad1 = 34.0;
    nb_screws = 8;
    for(n = [0:1:nb_screws-1])
        translate([rad1*cos(n*360/nb_screws), rad1*sin(n*360/nb_screws), 26]) {
        cylinder(d = 8, h = 24, $fn = loc_res);   
    }
}
*cyclo02modelA();

module cyclo02modelB(loc_res = 64) {
    // from the bottom
    hull() {
        translate([0, 0, 2])
        cylinder(d = 60, h = 19, $fn = loc_res);
        translate([0, 0, 0])
        cylinder(d = 56, h = 2, $fn = loc_res);
    }
    difference() {
        hull() {
            translate([0, 0, 26])
            cylinder(d = 70, h = 24, $fn = loc_res);
            translate([0, 0, 21])
            cylinder(d = 60, h = 2, $fn = loc_res);
        }
        translate([0, 0, 49])
        cylinder(d = 55, h = 2, $fn = loc_res);
    }
    // output disc
    translate([0, 0, 49])
    cylinder(d = 45, h = 2, $fn = loc_res); 
    rad1 = 34.0;
    nb_screws = 8;
    for(n = [0:1:nb_screws-1])
        translate([rad1*cos(n*360/nb_screws), rad1*sin(n*360/nb_screws), 26]) {
        cylinder(d = 8, h = 24, $fn = loc_res);   
    }
    // B input/output disc to the side
    translate([0, 0, 25])
    rotate([90, 0, 0])
    cylinder(d = 45, h = 40, $fn = loc_res);
}
*cyclo02modelB();

module joint01(loc_res = 64) {
    translate([0, -50, 0])
    rotate([-90, 0, 0])
    cyclo02modelA(loc_res = loc_res);
    translate([-25, 40, 0])
    rotate([0, 90, 0])
    cyclo02modelB(loc_res = loc_res);

    translate([26, 40, 0])
    rotate([0, 90, 0])
    cyclo02modelA(loc_res = loc_res);
}
module joint02(loc_res = 64) {
    rotate([0, 180, 0])
    joint01(loc_res = loc_res);
}
module joint03(loc_res = 64) {
    rotate([0, 180, 180])
    joint01(loc_res = loc_res);
}
module joint04(loc_res = 64) {
    rotate([0, 0, 180])
    joint01(loc_res = loc_res);
}

/*
translate([50, 100, 0])
joint01();
translate([-50, 100, 0])
joint02();
translate([50, -100, 0])
joint03();
translate([-50, -100, 0])
joint04();
*/

module leg01(loc_res = 64) {
    joint01(loc_res = loc_res);
    hull() {
        translate([52, 40, 0])
        rotate([0, 90, 0])
        cylinder(d = 70, h = 30, $fn = loc_res);
        translate([52+30, 40, 0])
        rotate([0, 90, 0])
        cylinder(d = 60, h = 5, $fn = loc_res);
        
        translate([52, 240, -50])
        rotate([0, 90, 0])
        cylinder(d = 40, h = 30, $fn = loc_res);
        translate([52+30, 240, -50])
        rotate([0, 90, 0])
        cylinder(d = 30, h = 5, $fn = loc_res);
    }
    hull() {
        translate([52, 240, -50])
        rotate([0, 90, 0])
        cylinder(d = 40, h = 30, $fn = loc_res);
        translate([52+30, 240, -50])
        rotate([0, 90, 0])
        cylinder(d = 30, h = 5, $fn = loc_res);
        
        translate([52, 40, -100])
        rotate([0, 90, 0])
        cylinder(d = 20, h = 30, $fn = loc_res);
        translate([52+30, 40, -100])
        rotate([0, 90, 0])
        cylinder(d = 10, h = 5, $fn = loc_res);
    }
}
module leg02(loc_res = 64) {
    joint02(loc_res = loc_res);
    hull() {
        translate([-(52+30), 40, 0])
        rotate([0, 90, 0])
        cylinder(d = 70, h = 30, $fn = loc_res);
        translate([-(52+35), 40, 0])
        rotate([0, 90, 0])
        cylinder(d = 60, h = 5, $fn = loc_res);
        
        translate([-(52+30), 240, -50])
        rotate([0, 90, 0])
        cylinder(d = 40, h = 30, $fn = loc_res);
        translate([-(52+35), 240, -50])
        rotate([0, 90, 0])
        cylinder(d = 30, h = 5, $fn = loc_res);
    }
    hull() {
        translate([-(52+30), 240, -50])
        rotate([0, 90, 0])
        cylinder(d = 40, h = 30, $fn = loc_res);
        translate([-(52+35), 240, -50])
        rotate([0, 90, 0])
        cylinder(d = 30, h = 5, $fn = loc_res);
        
        translate([-(52+30), 40, -100])
        rotate([0, 90, 0])
        cylinder(d = 20, h = 30, $fn = loc_res);
        translate([-(52+35), 40, -100])
        rotate([0, 90, 0])
        cylinder(d = 10, h = 5, $fn = loc_res);
    }
}
module leg03(loc_res = 64) {
    joint03(loc_res = loc_res);
    hull() {
        translate([52, 40-80, 0])
        rotate([0, 90, 0])
        cylinder(d = 70, h = 30, $fn = loc_res);
        translate([52+30, 40-80, 0])
        rotate([0, 90, 0])
        cylinder(d = 60, h = 5, $fn = loc_res);
        
        translate([52, 240-80, -50])
        rotate([0, 90, 0])
        cylinder(d = 40, h = 30, $fn = loc_res);
        translate([52+30, 240-80, -50])
        rotate([0, 90, 0])
        cylinder(d = 30, h = 5, $fn = loc_res);
    }
    hull() {
        translate([52, 240-80, -50])
        rotate([0, 90, 0])
        cylinder(d = 40, h = 30, $fn = loc_res);
        translate([52+30, 240-80, -50])
        rotate([0, 90, 0])
        cylinder(d = 30, h = 5, $fn = loc_res);
        
        translate([52, 40-80, -100])
        rotate([0, 90, 0])
        cylinder(d = 20, h = 30, $fn = loc_res);
        translate([52+30, 40-80, -100])
        rotate([0, 90, 0])
        cylinder(d = 10, h = 5, $fn = loc_res);
    }
}
module leg04(loc_res = 64) {
    joint04(loc_res = loc_res);
    hull() {
        translate([-(52+30), 40-80, 0])
        rotate([0, 90, 0])
        cylinder(d = 70, h = 30, $fn = loc_res);
        translate([-(52+35), 40-80, 0])
        rotate([0, 90, 0])
        cylinder(d = 60, h = 5, $fn = loc_res);
        
        translate([-(52+30), 240-80, -50])
        rotate([0, 90, 0])
        cylinder(d = 40, h = 30, $fn = loc_res);
        translate([-(52+35), 240-80, -50])
        rotate([0, 90, 0])
        cylinder(d = 30, h = 5, $fn = loc_res);
    }
    hull() {
        translate([-(52+30), 240-80, -50])
        rotate([0, 90, 0])
        cylinder(d = 40, h = 30, $fn = loc_res);
        translate([-(52+35), 240-80, -50])
        rotate([0, 90, 0])
        cylinder(d = 30, h = 5, $fn = loc_res);
        
        translate([-(52+30), 40-80, -100])
        rotate([0, 90, 0])
        cylinder(d = 20, h = 30, $fn = loc_res);
        translate([-(52+35), 40-80, -100])
        rotate([0, 90, 0])
        cylinder(d = 10, h = 5, $fn = loc_res);
    }
}

module model01(loc_res = 64) {
    translate([50, 100, 0])
    leg01(loc_res = loc_res);
    translate([-50, 100, 0])
    leg02(loc_res = loc_res);
    translate([50, -100, 0])
    leg03(loc_res = loc_res);
    translate([-50, -100, 0])
    leg04(loc_res = loc_res);
    hull() {
        translate([-50, 90, 0])
        rotate([90, 0, 0])
        cylinder(d = 80, h = 180, $fn = loc_res);
        translate([+50, 90, 0])
        rotate([90, 0, 0])
        cylinder(d = 80, h = 180, $fn = loc_res);
    }
}
model01();