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
    cylinder(d = 45, h = 2, $fn = loc_res); 
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
    cylinder(d = 45, h = 1, $fn = loc_res); 
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



// put together
translate([0, -50, 0])
rotate([-90, 0, 0])
cyclo02modelA();
translate([-25, 40, 0])
rotate([0, 90, 0])
cyclo02modelB();

translate([28, 40, 0])
rotate([0, 90, 0])
cyclo02modelA();
