difference(){
    translate([0,-3]){
        square([101,15],center = true);
    }
    translate([30.5,0]){
        circle(r=1.6,center=true);
    }
    hull(){
        translate([-30.5+1,0]){
            circle(r=1.6,center=true);
        }
        translate([-30.5-1,0]){
            circle(r=1.6,center=true);
        }
    }
    translate([-101/2,12/2+1]){
        square([20,24],center=true);
    }
    translate([101/2,12/2+1]){
        square([20,24],center=true);
    }
}


