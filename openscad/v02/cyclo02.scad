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
use <cyclo02_cyclodial_disc.scad>
use <cyclo02_input_shaft.scad>
use <cyclo02_outer_case.scad>
use <cyclo02_output_discs.scad>

module puttogether(loc_res = 32) {
    // 5010 BLDC motor
    *translate([0, 0, 0])
    bldc5010_motor(show = 0, loc_res = 2*loc_res);
    *translate([0, 0, -4.5])
    bldc5010_magnet_holder_5mm_v1_0(loc_res = loc_res);
    
    translate([0, 0, 19]) {
        // from below: two ball bearings + output disc
        translate([0, 0, 1])
        ballbearing27x20x4();
                
        translate([0, 0, -1])
        ballbearing55x45x6();
        translate([0, 0, 1])
        output_disc1(show_bearings = 1, loc_res = loc_res);
        
        // 6 mm square input shaft
        translate([0, 0, 0])
        input_shaft_hub(loc_res = loc_res);
        
        // 1st cycloidal disc with ball bearing
        translate([1, 0, 6])
        ballbearing18x12x4();
        translate([1, 0, 5.5])
        rotate([0, 0, 0])
        input_shaft_disc1(loc_res = loc_res);
        translate([1, 0, 10.5])
        rotate([180, 0, 0])
        input_shaft_disc1(loc_res = loc_res);
        translate([0, 0, 6])
        cyclodial_disc1(loc_res = loc_res);
        
        // 2nd cycloidal disc with ball bearing
        translate([-1, 0, 11])
        ballbearing18x12x4();
        translate([-1, 0, 10.5])
        rotate([0, 0, 180])
        input_shaft_disc1(loc_res = loc_res);
        translate([-1, 0, 15.5])
        rotate([180, 0, 180])
        input_shaft_disc1(loc_res = loc_res);
        translate([-2, 0, 11])
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
        
        // outer case
        translate([0, 0, 1.5])
        outer_roller_bearings(loc_res = loc_res);
        translate([0, 0, 19.5])
        outer_case_top(loc_res = loc_res);
        translate([0, 0, -1])
        outer_case_middle(loc_res = loc_res);
        translate([0, 0, -19])
        outer_case_bottom(col = "Red", loc_res = loc_res);
        
    }
}

// show
difference() {
    puttogether();
    // look inside
    translate([-60, 0, -10])
    cube(60);
}
// print
*output_disc1(show_bearings = 0, loc_res = 128); // 1 x
*input_shaft_hub(loc_res = 128); // 1 x
*input_shaft_disc1(loc_res = 128); // 4 x
*input_shaft_disc2(loc_res = 128); // 1 x
*output_disc2(loc_res = 128); // 1 x
*outer_case_top(loc_res = 128); // 1 x
*outer_case_middle(loc_res = 128); // 1 x
*outer_case_bottom(loc_res = 128); // 1 x
