difference() {
    union(){
        difference(){
            cylinder(r=40, h=80);
            translate([-42, -2, -1]) {
                cube([42, 42, 82]);
            }
        }

        cube([40, 40, 80]);

        translate([-40, -40, 0]) {
            cube([40, 40, 80]);
        }
    }
    translate([10, -10, 50]) {
        scale([0.5, 0.5, 0.5]) {
                union(){
                difference(){
                    cylinder(r=40, h=80);
                    translate([-42, -2, -1]) {
                        cube([42, 42, 82]);
                    }
                }

                cube([40, 40, 80]);

                translate([-40, -40, 0]) {
                    cube([40, 40, 80]);
                }
            }
        }
    }
    translate([0, 15, 0 ]) {
        cube([40, 40, 80]);
    }
    translate([-55, -40, 0 ]) {
        cube([40, 40, 80]);
    }
    translate([-40, -5, 0 ]) {
        cube([45, 45, 80]);
    }
    translate([35, -20, 0 ]) {
        cube([40, 40, 80]);
    }
    translate([-15, -75, 0]) {
        cube([40, 40, 80]);
    }
}