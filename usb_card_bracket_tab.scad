difference(){
    cube([18.7, 12.5, 5]);
    translate([0, 1, 0]){
        cube([18.7, 12.5, 4]);
    }
    translate([13.7, 4, 0]){
        cube([5, 5, 5]);
    }
}