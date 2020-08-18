difference(){
    cylinder(d=26, h=10,$fn=500);
    translate([0, 0, 2]){
        cylinder(d=5.4, h=10,$fn=500);
    }
}
translate([1.6, -2.5, 0]){
    cube([4, 5, 10]);
}