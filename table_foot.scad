difference() {
    translate ([-36, -36, 0]) {
        cube([72,72,60]);
    }
    translate ([-26, -26, 30]) {
        cube([52,52,30]);
    }
    
    translate([31, 31, 0]) {
        difference() {
            cube([6, 6, 60]);
            cylinder(r=5, h=60);
        }
    }

    translate ([-31, -31, 0]) {
        rotate([0, 0, 180]) {
            difference() {
                cube([6, 6, 60]);
                cylinder(r=5, h=60);
            }
        }
    }
    
    translate ([-31, 31, 0]) {
        rotate([0, 0, 90]) {
            difference() {
                cube([6, 6, 60]);
                cylinder(r=5, h=60);
            }
        }
    }
    
    translate ([31, -31, 0]) {
        rotate([0, 0, -90]) {
            difference() {
                cube([6, 6, 60]);
                cylinder(r=5, h=60);
            }
        }
    }
}