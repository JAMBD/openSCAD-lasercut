difference(){
    translate([0,0]){
        square([101,12],center = true);
    }
    translate([76.6/2,0]){
        circle(r=1.6,center=true);
    }
    hull(){
        translate([-76.6/2+1,0]){
            circle(r=1.6,center=true);
        }
        translate([-76.6/2-1,0]){
            circle(r=1.6,center=true);
        }
    }
    translate([-101/2,6]){
        square([10,13],center=true);
    }
    translate([101/2,6]){
        square([10,13],center=true);
    }
}


