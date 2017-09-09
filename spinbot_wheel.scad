difference(){
	cylinder(2,r=10,center = true,$fn=100);
	cylinder(6,r=3,center = true,$fn=100);
}


difference(){
union(){
	cylinder(8,r=20,center = true,$fn=100);	
	translate([0,0,1.2]){
		cylinder(2,r=22,center = true,$fn=100);
	}
	translate([0,0,-3]){
		cylinder(2,r=22,center = true,$fn=100);
	}
}
	cylinder(10,r=7.1,center = true,$fn=100);
translate([0,0,3]){
difference(){
cylinder(2.1,r=23,center = true,$fn=100);
cylinder(12,r=17,center = true,$fn=100);
cylinder(2.1,r1=17,r2=18,$fn=100);
}
}
}
