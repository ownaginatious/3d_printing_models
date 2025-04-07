cube([20, 60, 10]);
for(i=[0:6]){
    translate([1, 3 + 8 * i, 10]){
        cube([4, 4, 2]);
    }
}