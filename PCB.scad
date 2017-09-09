for(i=[0:19]){
	translate([0,i*2.54]){
		square([1.15,1.4],center = true);
	}
}

for(i=[0:19]){
	translate([30.48,i*2.54]){
		square([1.15,1.4],center = true);
	}
}