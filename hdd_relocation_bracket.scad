$fa = 1;
$fs = 0.5;
$fn = 100;

ssd_std_hole_spacing = 61.71;
ssd_group_spacing = 18.6;
relocation_spacing = 10;
ends_to_holes = 5;
bracket_length = ends_to_holes + 2 * ssd_std_hole_spacing + ssd_group_spacing + relocation_spacing / 2;

module ssd_holes() {
    cylinder(r=2, h=5);
    translate([ssd_std_hole_spacing, 0, 0]) {
        cylinder(r=2, h=5);
    }
}

module half_x_bracket() {    
    difference(){
        // Bracket body.
        cube([bracket_length, 12, 2]);
        
        // Holes.
        translate([relocation_spacing / 2, 0, -1]) {
            ssd_holes();
            translate([ssd_std_hole_spacing + ssd_group_spacing, 0, 0]) {
                ssd_holes();
            }
        }
        
        // Bevel.
        translate([bracket_length - 5, 7, -5]) {
            difference() {
                cube([6, 6, 12]);
                translate([0, 0, -1]) {
                    cylinder(r=5, h=14);
                }
            }
        }
    }
}

module half_y_bracket() {
    half_x_bracket();
    mirror([1,0,0]){
        half_x_bracket();
    }
}

difference() {
    union(){
        half_y_bracket();
        mirror([0, 1, 0]) {
            half_y_bracket();
        }
    }
    
    translate([-bracket_length - 1, -13, -2]){
        cube([bracket_length + 1, 26, 5]); 
    }
}

module supports() {
    translate([bracket_length - 13, -12, 2]){
        cube([5, 24, 8.5]);
    }

    translate([bracket_length - ssd_std_hole_spacing - 2, -12, 2]){
        cube([5, 24, 8.5]);
    }
}

supports();