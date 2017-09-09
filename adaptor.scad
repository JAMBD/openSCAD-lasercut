
translate([81.3,80.8,0]){
rotate([0,0,120.5]){
translate([-2,-1.2,-15.875]){
	difference(){
	cube(size=[4,27,31.75],center=false);
	rotate([-19,0,0]){
		translate([-0.5,-20,28]){
			cube(size=[5,50,31.75],center=false);
		}
	}
	rotate([27,0,0]){
		translate([-0.5,-10,-29.5]){
			cube(size=[5,50,31.75],center=false);
		}
	}
	}
}
}
}
difference(){
translate([81.3,80.8,0]){
translate([-2,-1.15,-15.875]){
	cube(size=[4,9,31.75],center=false);
}
}
translate([81.3,80.8,0]){
rotate([0,0,120.5]){
translate([-2,-1.2,-15.875]){
	rotate([-19,0,0]){
		translate([-10,-20,28]){
			cube(size=[20,50,31.75],center=false);
		}
	}
	rotate([27,0,0]){
		translate([-10,-10,-29.5]){
			cube(size=[20,50,31.75],center=false);
		}
	}
}
}
}
}

translate([7.6,80.8,0]){
rotate([0,0,240.5]){
translate([-2,-1.2,-15.875]){
	difference(){
	cube(size=[4,28,31.75],center=false);
	rotate([-19,0,0]){
		translate([-0.5,-20,28.5]){
			cube(size=[5,50,31.75],center=false);
		}
	}
	rotate([27,0,0]){
		translate([-0.5,-10,-30]){
			cube(size=[5,50,31.75],center=false);
		}
	}
	}
}
}
}
difference(){
translate([7.6,80.8,0]){
translate([-2,-1.15,-15.875]){
	cube(size=[4,9,31.75],center=false);
}
}
translate([7.6,80.8,0]){
rotate([0,0,240.5]){
translate([-2,-1.2,-15.875]){
	
	rotate([-19,0,0]){
		translate([-7.5,-20,28.5]){
			cube(size=[15,50,31.75],center=false);
		}
	}
	rotate([27,0,0]){
		translate([-7.5,-10,-30]){
			cube(size=[15,50,31.75],center=false);
		}
	}
}
}
}
}

//translate([44.1,86.98,0]){
//	cube(size=[66.2,10.16,50],center=true);
//}
translate([85.1,5.1,0]){
rotate([0,0,49.5]){
translate([-2,1.8,-15.875]){
	difference(){
	cube(size=[4,34,31.75],center=false);
	rotate([-19,0,0]){
		translate([-0.5,-20,30]){
			cube(size=[5,50,31.75],center=false);
		}
	}
	rotate([27,0,0]){
		translate([-0.5,-10,-32]){
			cube(size=[5,50,31.75],center=false);
		}
	}
	}
}
}
}

translate([5.1,5.1,0]){
rotate([0,0,-49.5]){
translate([-2,1.8,-15.875]){
	difference(){
	cube(size=[4,34,31.75],center=false);
	rotate([-19,0,0]){
		translate([-0.5,-20,30]){
			cube(size=[5,50,31.75],center=false);
		}
	}
	rotate([27,0,0]){
		translate([-0.5,-10,-32]){
			cube(size=[5,50,31.75],center=false);
		}
	}
	}
}
}
}

translate([85.1,5.1,0]){
	difference(){
		cylinder(h=31.75,r=3.25, $fn=90,center=true);
		cylinder(h=32,r=1.84, $fn=90,center=true);
	}
}
translate([5.1,5.1,0]){
	difference(){
		cylinder(h=31.75,r=3.25, $fn=90,center=true);
		cylinder(h=32,r=1.84, $fn=90,center=true);
	}
}
translate([81.3,90.8,0]){
	difference(){
		cylinder(h=31.75,r=3.25, $fn=90,center=true);
		cylinder(h=32,r=1.84, $fn=90,center=true);
	}
}

translate([7.6,90.8,0]){
	difference(){
		cylinder(h=31.75,r=3.25, $fn=90,center=true);
		cylinder(h=32,r=1.84, $fn=90,center=true);
	}
}



translate([36.21,31.44,2]){
//translate([0,0,0]){
translate([0,0,0]){
	difference(){
		cylinder(h=5.0,r=7.5, $fn=90,center=true);
		cylinder(h=5.2,r=1.84, $fn=90,center=true);
	}
}
translate([17.78,0,0]){
	difference(){
		cylinder(h=5.0,r=7.5, $fn=90,center=true);
		cylinder(h=5.2,r=1.84, $fn=90,center=true);
	}
}
translate([0,33.02,0]){
	difference(){
		cylinder(h=5.0,r=7.5, $fn=90,center=true);
		cylinder(h=5.2,r=1.84, $fn=90,center=true);
	}
}
translate([17.78,33.02,0]){
	difference(){
		cylinder(h=5.0,r=7.5, $fn=90,center=true);
		cylinder(h=5.2,r=1.84, $fn=90,center=true);
	}
}
difference(){
translate([8.89,16.51,0]){
cube(size=[22.86,38.1,2], center = true);

}translate([0,0,0]){
		cylinder(h=5.2,r=1.84, $fn=90,center=true);
}
translate([17.78,0,0]){
		cylinder(h=5.2,r=1.84, $fn=90,center=true);
}
translate([0,33.02,0]){
		cylinder(h=5.2,r=1.84, $fn=90,center=true);
}
translate([17.78,33.02,0]){
		cylinder(h=5.2,r=1.84, $fn=90,center=true);
}
}
}
