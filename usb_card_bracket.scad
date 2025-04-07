difference(){
    linear_extrude(1){
        polygon([[0, 0], [0, -3.06], [4.69, -3.06], [7.53, 0], [108, 0], [111.86, 5], [117, 5], [118, 5.2], [118, 13.8], [117, 14],
        [111.86, 14], [108, 18.99], [9.62 , 18.99], [5.93, 15.93], [0, 15.93]]);
    }
    for(i=[0:3]){
        translate([18.75 + i * (8.13 + 5.92), 1.75, -5]){
            cube([8.5, 16, 10]);
        }
    }
}

translate([13, 0, -9]) {
    cube([78, 1, 9]);
}

module support_structure(){
    rotate([0, 90, 0]){
        linear_extrude(1){
            polygon([[0, 0], [0, 18.99], [9, 0]]);
        }
    }
}


translate([13, 0, 0]){
    support_structure();
}

translate([81.84, 0, 0]){
    support_structure();
}

translate([90, 0, 0]){
    support_structure();
}