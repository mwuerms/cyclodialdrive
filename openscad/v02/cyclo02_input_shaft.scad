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
