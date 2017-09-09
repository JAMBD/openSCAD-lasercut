difference(){
	square([15,60],center=true);
	circle(r=6.65/2,$fn=100);
	translate([0,19.9]){
		circle(r=7.9/2,$fn=100);
	}
	translate([0,9.25]){
		circle(r=3.9/2,$fn=100);
	}
	translate([0,-9.25]){
		circle(r=3.9/2,$fn=100);
	}
	translate([0,-19.9]){
		circle(r=7.9/2,$fn=100);
	}
}

translate([-7.5-3.9,30-2.6]){
	square([2.6,5.2],center=true);
}
translate([7.5+3.9,30-2.6]){
	square([2.6,5.2],center=true);
}
translate([-7.5-3.9,-30+2.6]){
	square([2.6,5.2],center=true);
}
translate([7.5+3.9,-30+2.6]){
	square([2.6,5.2],center=true);
}

translate([-7.5-1.3,0]){
	square([2.6,2.6],center=true);
}

translate([-7.5-1.3,30-1.3]){
	square([2.6,2.6],center=true);
}

translate([-7.5-1.3,-30+1.3]){
	square([2.6,2.6],center=true);
}

translate([7.5+1.3,0]){
	square([2.6,2.6],center=true);
}

translate([7.5+1.3,30-1.3]){
	square([2.6,2.6],center=true);
}

translate([7.5+1.3,-30+1.3]){
	square([2.6,2.6],center=true);
}