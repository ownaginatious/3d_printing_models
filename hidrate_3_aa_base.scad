include <BOSL/constants.scad>
use <BOSL/masks.scad>

$fn = 100;

difference() {
    // Main body.
    cylinder(r=40, h=55);
    
    // Cut-out
    translate([0, 0, 25]) {
        cylinder(d=75, h=60);
        
        // Indentation before batteries.
        fillet(size=[70, 40, 10], fillet=5) {
            cube([70, 40, 10], center=true);
        }
        
        // Battery compartment.
        cube([60, 34, 40], center=true);
    }
    
    // Edge rounging.
    mirror(v=[0,0,1]){
        fillet_cylinder_mask(r=40, fillet=10);
    }
    translate([0, 0, 55]) {
        fillet_cylinder_mask(r=40, fillet=10);
    }
    
    // Remove sharpness from top edge.
    translate([0, 0, 50]) {
        cylinder(r=42, h=55);
    }
}
