/**
 * Martin Egli
 * 2025-07-30
 * cyclodial gear/drive
 * v01: everything shall be 3d printed, this is for testing purpose only
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

module input_shaft_hub(ax_wid = 6, col = "LightCoral", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 20, h = 5.5, $fn = loc_res);
            translate([0, 0, 0])
            cylinder(d = 21, h = 1, $fn = loc_res);
            translate([-ax_wid/2, -ax_wid/2, 0])
            cube([ax_wid, ax_wid, 20]);
        }        
        translate([0, 0, 3])
        bldc5010_m3cut_rotor(show = 0, len = 5, loc_res = loc_res);
        translate([0, 0, -1])
        cylinder(d = 4.1, h = 4.8, $fn = loc_res);
    }
}

module input_shaft_disc1(ax_wid = 6.1, th = 1.95, col = "LightSalmon", loc_res = 32) {
    exc = 1.0; // excentricity
    color(col)
    difference() {
        union() {
            translate([0, 0, 0.5])
            cylinder(d = 12, h = th, $fn = loc_res);
            translate([0, 0, 0])
            cylinder(d = 13, h = 0.5, $fn = loc_res);
        }        
        translate([-exc, 0, 0]) {
            translate([-ax_wid/2, -ax_wid/2, -1])
            cube([ax_wid, ax_wid, th+2]);
            translate([-ax_wid/2, -ax_wid/2, -1])
            cylinder(d = 1, h = th+2, $fn = loc_res);
            translate([-ax_wid/2, +ax_wid/2, -1])
            cylinder(d = 1, h = th+2, $fn = loc_res);
            translate([+ax_wid/2, -ax_wid/2, -1])
            cylinder(d = 1, h = th+2, $fn = loc_res);
            translate([+ax_wid/2, +ax_wid/2, -1])
            cylinder(d = 1, h = th+2, $fn = loc_res);
        }
    }
}

module input_shaft_disc2(ax_wid = 6.1, th = 4, col = "LightCyan", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 20.0, h = th, $fn = loc_res);
            translate([0, 0, -0.5])
            cylinder(d = 21.0, h = 0.5, $fn = loc_res);
        }        
        translate([-ax_wid/2, -ax_wid/2, -1])
        cube([ax_wid, ax_wid, th+2]);
        translate([-ax_wid/2, -ax_wid/2, -1])
        cylinder(d = 1, h = th+2, $fn = loc_res);
        translate([-ax_wid/2, +ax_wid/2, -1])
        cylinder(d = 1, h = th+2, $fn = loc_res);
        translate([+ax_wid/2, -ax_wid/2, -1])
        cylinder(d = 1, h = th+2, $fn = loc_res);
        translate([+ax_wid/2, +ax_wid/2, -1])
        cylinder(d = 1, h = th+2, $fn = loc_res);
    }
}

module cyclodial_disc1(th = 4, col = "LightSteelBlue", loc_res = 32) {
    // use images/cyclodisc02a.svg, get size in mm: [Ctrl] + D
    excentricity = 1.0;
    xsize = 56.49382;
    ysize = 56.72390;
    color(col)
    translate([excentricity, 0, 0])
    difference() {
        translate([-xsize/2, -ysize/2, 0])
        linear_extrude(height= th)
        import (file = "images/cyclodisc02adisc.svg");
        
        // cut 8 x 7.0 mm holes in an 38.4 mm circle
        rad_out = 38.4/2;
        for(n = [0:1:7])
        translate([rad_out*cos(360/8*n), rad_out*sin(360/8*n), -1])
        cylinder(d = 7.0, h = th+2, $fn = loc_res);
        // cut 18.0 mm center hole
        translate([0, 0, -1])
        cylinder(d = 18.0, h = th+2, $fn = loc_res);
        // orientation: little dent
        translate([-25, 0, th-0.4])
        cylinder(d = 1, h = 1, $fn = loc_res);
    }
}

module roller_bearing(dia1 = 3, dia2 = 5, h1 = 4*5, h2 = 5, h3 = 2*5, loc_res = 32) {
    color("Silver")
    translate([0, 0, 0])
    cylinder(d = dia1, h = h1, $fn = loc_res);
    color("PaleGoldenrod")
    translate([0, 0, h2])
    cylinder(d = dia2, h = h3, $fn = loc_res);
}

module inner_roller_bearing(loc_res = 32) {
    roller_bearing(h1 = 2*4+2*5, h2 = 4, h3 = 2*5, loc_res = loc_res);
}

module inner_rolers(outer_dia = 35, roler_dia = 4, nb_roler = 8, th = 4, loc_res = 32) {
    // output rollers
    for(n = [0: 1: (nb_roler-1)])
    translate([outer_dia/2 * cos(n * 360/nb_roler), outer_dia/2 * sin(n * 360/nb_roler), 0])
    cylinder(d = roler_dia, h = th, $fn = loc_res);
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

module puttogether(loc_res = 32) {
    // 5010 BLDC motor
    *translate([0, 0, 0])
    bldc5010_motor(show = 0, loc_res = 2*loc_res);
    translate([0, 0, -4.5])
    bldc5010_magnet_holder_5mm_v1_0(loc_res = loc_res);
    
    translate([0, 0, 19]) {
        // from below: two ball bearings + output disc
        *translate([0, 0, 1])
        ballbearing27x20x4();
                
        *translate([0, 0, -1])
        ballbearing55x45x6();
        *translate([0, 0, 1])
        output_disc1(show_bearings = 1, loc_res = loc_res);
        
        // 6 mm square input shaft
        translate([0, 0, 0])
        input_shaft_hub(loc_res = loc_res);
        
        // 1st cycloidal disc with ball bearing
        *translate([1, 0, 6])
        ballbearing18x12x4();
        *translate([1, 0, 5.5])
        rotate([0, 0, 0])
        input_shaft_disc1(loc_res = loc_res);
        *translate([1, 0, 10.5])
        rotate([180, 0, 0])
        input_shaft_disc1(loc_res = loc_res);
        *translate([0, 0, 6])
        cyclodial_disc1(loc_res = loc_res);
        
        // 2nd cycloidal disc with ball bearing
        *translate([-1, 0, 11])
        ballbearing18x12x4();
        *translate([-1, 0, 10.5])
        rotate([0, 0, 180])
        input_shaft_disc1(loc_res = loc_res);
        *translate([-1, 0, 15.5])
        rotate([180, 0, 180])
        input_shaft_disc1(loc_res = loc_res);
        *translate([-2, 0, 11])
        cyclodial_disc1(loc_res = loc_res);
        
        // on top: final two ball bearings + output disc
        translate([0, 0, 16])
        ballbearing27x20x4();
        translate([0, 0, 16])
        input_shaft_disc2(loc_res = loc_res);
        
        translate([0, 0, 16])
        ballbearing55x45x6();
        translate([0, 0, 16])
        output_disc2(loc_res = loc_res);
    }
}

// show
puttogether();

// print
*output_disc1(show_bearings = 0, loc_res = 128); // 1 x
*input_shaft_hub(loc_res = 128); // 1 x
*input_shaft_disc1(loc_res = 128); // 4 x
*input_shaft_disc2(loc_res = 128); // 1 x
*output_disc2(loc_res = 128); // 1 x
