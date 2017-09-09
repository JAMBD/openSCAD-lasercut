$gr = 18.2;
$ntooth = 126;
$ar = 6.9;

difference(){

union(){

circle(r=$gr,$fn=100);

for($ang=[0:360/$ntooth:360]){
	rotate($ang){
		translate([$gr-1,0]){
			polygon([[0,-1],[2,0],[0,1]]);
		}
	}
}

}
circle(r=6.9,$fn=100);

for($ang=[0:360/3:360]){
	rotate($ang){
		translate([0,($gr+$ar)/2]){
			circle(r=2.23/2,$fn=100);
		}
	}
}

}