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

module input_shaft_hub(ax_wid = 7, col = "LightCoral", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 19.7, h = 4, $fn = loc_res);
            translate([-ax_wid/2, -ax_wid/2, 0])
            cube([ax_wid, ax_wid, 20]);
        }        
        translate([0, 0, 2])
        bldc5010_m3cut_rotor(show = 0, len = 2, loc_res = loc_res);
        translate([0, 0, -1])
        cylinder(d = 4.1, h = 4.8, $fn = loc_res);
    }
}

module input_shaft_hub1a(ax_wid = 7, col = "LightCoral", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 19.7, h = 4, $fn = loc_res);
            translate([-ax_wid/2, -ax_wid/2, 0])
            cube([ax_wid, ax_wid, 20]);
        }        
        translate([0, 0, 2])
        bldc5010_m3cut_rotor2(show = 0, len = 2, loc_res = loc_res);
        translate([0, 0, -1])
        cylinder(d = 4.1, h = 4.8, $fn = loc_res);
        
        translate([-20/2, -20/2, -1])
        cube([20, (20-ax_wid)/2, 6]);
        translate([-20/2, (ax_wid)/2, -1])
        cube([20, (20-ax_wid)/2, 6]);
    }
}

module input_shaft_spacer1(ax_wid = 7, col = "LightSalmon", loc_res = 32) {
}

module input_shaft_disc1(ax_wid = 7.2, th = 4, col = "LightSalmon", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 19.7, h = th, $fn = loc_res);
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

module input_shaft_disc1a(ax_wid = 7.2, th = 8, col = "LightSalmon", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 19.7, h = th, $fn = loc_res);
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
        translate([-20/2, -7.2/2, -1])
        cube([20, 7.2, 4+1]);
    }
}

module input_shaft_spacer2(ax_wid = 7, col = "LightSalmon", loc_res = 32) {
}

module input_shaft_disc2(ax_wid = 7.2, th = 4, col = "LightCyan", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([1, 0, 0])
            cylinder(d = 14.7, h = th, $fn = loc_res);
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
    difference() {
        translate([-xsize/2+excentricity, -ysize/2, 0])
        linear_extrude(height= th)
        import (file = "images/cyclodisc02adisc.svg");
        
        translate([excentricity, 0, -1])
        cylinder(d = 7.0, h = th+2, $fn = loc_res);
        // cut 18.0 mm center bore
        *translate([excentricity, 0, -1])
        cylinder(d = 18.0, h = th+2, $fn = loc_res);
    }
}

module inner_rolers(outer_dia = 35, roler_dia = 4, nb_roler = 8, th = 4, loc_res = 32) {
    // output rollers
    for(n = [0: 1: (nb_roler-1)])
    translate([outer_dia/2 * cos(n * 360/nb_roler), outer_dia/2 * sin(n * 360/nb_roler), 0])
    cylinder(d = roler_dia, h = th, $fn = loc_res);
}

module output_disc(outer_dia = 35, th1 = 4, col = "LightBlue", loc_res = 32) {
    color(col)
    union() {
        difference() {
            union() {
                translate([0, 0, 0])
                cylinder(d = outer_dia+6, h = th1, $fn = loc_res);
            }
            translate([0, 0, -1])
            cylinder(d = 20, h = th1+2, $fn = loc_res);
            translate([0, 0, -1])
            inner_rolers(th = th1+2);
        }
        
    }
}

module outer_rolers(outer_dia = 55, roler_dia = 4, nb_roler = 16, th = 4, loc_res = 32) {
    for(n = [0: 1: (nb_roler-1)])
    translate([outer_dia/2 * cos(n * 360/nb_roler), outer_dia/2 * sin(n * 360/nb_roler), 0])
    cylinder(d = roler_dia, h = th, $fn = loc_res);
}

module outer_case(outer_dia = 55, th1 = 20, th2 = 4, col = "LightGreen", loc_res = 32) {
    color(col)
    union() {
        difference() {
            union() {
                translate([0, 0, 0])
                cylinder(d = outer_dia+4, h = th1, $fn = loc_res);
            }
            translate([0, 0, th2])
            cylinder(d = outer_dia+2, h = th1, $fn = loc_res);
            translate([0, 0, -1])
            cylinder(d = 20, h = th1+2, $fn = loc_res);
        }
        outer_rolers(th = 20);
    }
}

module puttogether(loc_res = 32) {
    // 5010 BLDC motor
    *translate([0, 0, 0])
    bldc5010_motor(show = 0, loc_res = 2*loc_res);
    translate([0, 0, -4.5])
    bldc5010_magnet_holder_5mm_v1_0(loc_res = loc_res);
    
    // input shaft
    translate([0, 0, 19]) {
        translate([0, 0, 0])
        input_shaft_hub(loc_res = loc_res);
        translate([0, 0, 4])
        input_shaft_disc1(loc_res = loc_res);
        translate([0, 0, 8])
        input_shaft_disc2(loc_res = loc_res);
        translate([0, 0, 8])
        cyclodial_disc1();
        
        translate([0, 0, 12])
        rotate([0, 0, 180])
        input_shaft_disc2(loc_res = loc_res);
        translate([0, 0, 12])
        rotate([0, 0, 180])
        cyclodial_disc1();
    
        translate([0, 0, 16])
        input_shaft_disc1(loc_res = loc_res);
        
        translate([0, 0, 0])
        outer_case(loc_res = loc_res);
        
        translate([0, 0, 4])
        output_disc(loc_res = loc_res);
        translate([0, 0, 16])
        output_disc(loc_res = loc_res);
        
    }
    *inner_rolers(th = 20);
}

// show
*puttogether();

// print
*input_shaft_hub(loc_res = 128); // 1x
*input_shaft_disc1(loc_res = 128); // 2x
*input_shaft_disc2(loc_res = 128); // 2x

*bldc5010_magnet_holder_5mm_v1_0(loc_res = 128); // 1 x
cyclodial_disc1(loc_res = 128); // 2 x
*outer_case(loc_res = 128); // 1 x
*output_disc(loc_res = 128); // 2 x

*input_shaft_hub1a(loc_res = 128); // 1x
*translate([0, 0, 1])
input_shaft_disc1a(loc_res = 128); // 1x
