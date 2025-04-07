$fa = 1;
$fs = 0.5;
$fn = 100;

screw_hole_difference = 90.6 - 14;
screw_hole_radius = 1.5;
vertical_support_width = 6;
support_thickness = 3;
horizontal_support_width = 6;
bracket_length = ((screw_hole_difference - 2 * screw_hole_radius) + 2 *vertical_support_width)/2;
bracket_height = 35;
drive_spacing = 10;
first_drive_z_offset = 2.5;


module bevel_tr() {
    difference(){
        translate([0, 0, -2]){
            cube([4, 4, 8]);
        }
        translate([0, 0, -4]){
            cylinder(r=3, h=20);
        }
    }
}

module bevel_br() {
    difference(){
        translate([-3, -1, -2]){
           cube([4, 4, 8]);
        }
        translate([-3, 3, -4]) {
            cylinder(r=3, h=20);
        }
    }
}

module bracket_side() {
    difference() {
        union(){
            difference() { // Bracket body.
                cube([bracket_length, bracket_height, support_thickness]);
                // Cut out.
                translate ([-1, horizontal_support_width, -1]) {
                    cube([
                        bracket_length + 1 - vertical_support_width,
                        bracket_height - 2 * horizontal_support_width,
                        2*support_thickness
                    ]);
                }
            }
            
            { // Inner bevels.
                translate([bracket_length - vertical_support_width - 3, bracket_height - horizontal_support_width - 3, 0]){
                    bevel_tr();
                }
                translate([bracket_length - vertical_support_width, horizontal_support_width, 0]){
                    bevel_br();
                }
            }
        }
        
        { // Outer bevels.
            translate([0, 0, 3]){
                cube([bracket_length, bracket_height, 10]);
            }
            translate([0, 0, -10]){
                cube([bracket_length, bracket_height, 10]);
            }
            translate([bracket_length - 3, bracket_height - 3, 0]){
                bevel_tr();
            }
            translate([bracket_length, 0, 0]){
                bevel_br();
            }
        }
        
        // Screw holes.
        translate([bracket_length - vertical_support_width / 2, 0, 0]) {
            for(i=[0:3]){
                translate([0, first_drive_z_offset + i * drive_spacing, 2]) {
                    cylinder(r=screw_hole_radius*1.5, h=2);
                }
                translate([0, first_drive_z_offset + i * drive_spacing, -4]) {
                    cylinder(r=screw_hole_radius, h=8);
                }
            }
        }
        
        // Bind cut-out.
        translate([bracket_length - 2*(vertical_support_width + 2), -0.5, -1*support_thickness/2]){
            cube([vertical_support_width, bracket_height + 1, 3]);
        }
    }
}

bracket_side();
mirror([1,0,0]){
    bracket_side();
}