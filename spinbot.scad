difference(){
cube([40,60,15],center = true);

translate([15,25,0]){
cylinder(30,r=1.5,center = true,$fn=100);
}

translate([5,25,0]){
cylinder(30,r=1.5,center = true,$fn=100);
}

translate([-15,25,0]){
cylinder(30,r=1.5,center = true,$fn=100);
}

translate([-5,25,0]){
cylinder(30,r=1.5,center = true,$fn=100);
}


rotate([0,90,0]){
	cylinder(50,r=3.55,center = true,$fn=100);
}

translate([0,20,0]){
rotate([0,90,0]){
	cylinder(50,r=4.05,center = true,$fn=100);
}
}
translate([0,27,0]){
	cube([45,40,1],center = true);
}
translate([0,27,0]){
	cube([1,40,20],center = true);
}
}