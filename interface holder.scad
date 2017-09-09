difference(){
translate([0,17.5,-3.25])
union(){
difference(){
	cube(size = [50,45,25],center=true);
	translate([0,5,6])
	cube(size = [40,45,25],center=true);
	translate([0,30,10])
	rotate([-45,0,0])
	cube(size = [60,40,30],center=true);
	rotate([90,0,0])
	translate([-10,3,10])
	cylinder(r = 3,h = 20,$fn=30);
	rotate([90,0,0])
	translate([10,3.2,10])
	cylinder(r = 3.2,h = 20,$fn=30);
	translate([-6.5,12,-15])
	cylinder(r = 1.5,h = 30,$fn=30);
	translate([6.5,12,-15])
	cylinder(r = 1.5,h = 30,$fn=30);
	rotate([0,90,0])
	translate([13,12,-6])
	cylinder(r = 1.5,h = 12,$fn=30);
}
difference(){
translate([10,-10,-5])
cube(size = [20,20,15],center=true);
translate([0,3,0])
rotate([-45,0,0])
translate([8.5,-8,5])
cube(size = [25,20,15],center=true);
translate([10,-4.5,-5])
cylinder(r = 1.3,h = 20,$fn=30);
}
translate([0,12,-5])
difference(){
	cube([10,10,10],center=true);
	translate([0,15,5])
	rotate([90,0,0])
	cylinder(r = 3.2,h = 30,$fn=30);
	translate([0,0,4.5])
	rotate([90,0,90])
	cube([3,5,25],center=true);
}
}
translate([10,10.3,0])
rotate([90,90,0])
union(){
	cylinder(r = 3.2,h = 15.13,$fn=30);	
	translate([-4.75,-6.25,0])
	cube(size = [9.5,12.5,12],center=fase);
}
}