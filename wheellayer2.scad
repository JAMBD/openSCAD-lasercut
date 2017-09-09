$gr = 18.2;
$ar = 6.9;


difference(){

circle(r=17.2,$fn=100);

circle(r=5.4,$fn=100);

for($ang=[0:360/3:360]){
	rotate($ang){
		translate([0,($gr+$ar)/2]){
			circle(r=2.43/2,$fn=100);
		}
	}
}

}