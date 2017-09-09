use<gear.scad>;

%difference(){
    circle(r=30,$fn=100);
    circle(r=1.5,$fn=50);    
    translate([19.1,0]){
         circle(r=3/2,$fn=50);
    }
    translate([-19.1,0]){
         circle(r=3/2,$fn=50);
    }
    translate([0,19.1]){
         circle(r=3/2,$fn=50);
    }
    translate([0,-19.1]){
         circle(r=3/2,$fn=50);
    }
}

rotate(6){
	gear(3,0.5,30,3/2,0.2);
}

gear(3,0.5,50,30,-0.1);

translate([0,19.1]){
	gear(3,0.5,10,3/2,0.2);
}

translate([19.1,0]){
	gear(3,0.5,10,3/2,0.2);
}

translate([0,-19.1]){
	gear(3,0.5,10,3/2,0.2);
}

translate([-19.1,0]){
	gear(3,0.5,10,3/2,0.2);
}
