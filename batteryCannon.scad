difference(){
    square([35.3,40.2],true);
    translate([35.3/2,40.2/2]){
        square([5,5],true);
    }
    translate([-35.3/2,40.2/2]){
        square([5,5],true);
    }
    
    translate([0,-40.2/2]){
        square([10,20],true);
    }
}