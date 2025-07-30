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
            cylinder(d = 18, h = 4, $fn = loc_res);
            translate([-ax_wid/2, -ax_wid/2, 0])
            cube([ax_wid, ax_wid, 20]);
        }        
            translate([0, 0, 2])
            bldc5010_m3cut_rotor(show = 0, len = 4, loc_res = loc_res);
        
    }
}

module input_shaft_spacer1(ax_wid = 7, col = "LightSalmon", loc_res = 32) {
    color(col)
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(d = 18, h = 4, $fn = loc_res);
            translate([-ax_wid/2, -ax_wid/2, 0])
            cube([ax_wid, ax_wid, 20]);
        }        
            translate([0, 0, 2])
            bldc5010_m3cut_rotor(show = 0, len = 4, loc_res = loc_res);
        
    }
}

module input_shaft_spacer2(ax_wid = 7, col = "LightSalmon", loc_res = 32) {
}

module cyclodial_disc1(th = 4, loc_res = 32) {
    // use images/cyclodisc01b.svg, get size in mm: [Ctrl] + D
    excentricity = 1.0;
    xsize = 52.53282;
    ysize = 52.80275;
    translate([-xsize/2+excentricity, -ysize/2, 0])
    difference() {
        linear_extrude(height= th)
        import (file = "images/cyclodisc01bdisc.svg");
        translate([0, 0, -1])
        linear_extrude(height = th+2)
        import (file = "images/cyclodisc01bcut.svg");
        // correction: should be 15 mm center bore
        translate([0, 0, -1])
        cylinder(d = 15, h = th+2, $fn = loc_res);
    }
}

// output rollers
module inner_rolers(outer_dia = 35, roler_dia = 4, nb_roler = 8, th = 4, loc_res = 32) {
    for(n = [0: 1: (nb_roler-1)])
    translate([outer_dia/2 * cos(n * 360/nb_roler), outer_dia/2 * sin(n * 360/nb_roler), 0])
    cylinder(d = roler_dia, h = th, $fn = loc_res);
}

module outer_rolers(outer_dia = 55, roler_dia = 4, nb_roler = 16, th = 4, loc_res = 32) {
    for(n = [0: 1: (nb_roler-1)])
    translate([outer_dia/2 * cos(n * 360/nb_roler), outer_dia/2 * sin(n * 360/nb_roler), 0])
    cylinder(d = roler_dia, h = th, $fn = loc_res);
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
        *translate([0, 0, 4])
        input_shaft_spacer1(loc_res = loc_res);
    
        translate([0, 0, 8])
        cyclodial_disc1();
        *translate([0, 0, 9])
        cylinder(d = 15, h = 4, $fn = loc_res);
        *translate([1, 0, 10])
        cylinder(d = 13, h = 4, $fn = loc_res);
        
        translate([0, 0, 8])
        inner_rolers(th = 20);
        
    }
    translate([0, 0, 8])
    outer_rolers(th = 20);
}

// show
puttogether();

// print
*input_shaft_hub(loc_res = 128); // 1x
*input_shaft_spacer1(loc_res = 128); // 4x
*input_shaft_spacer2(loc_res = 128); // 4x

*bldc5010_magnet_holder_5mm_v1_0(loc_res = 128); // 1 x
*cyclodial_disc1(); // 1 x