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
