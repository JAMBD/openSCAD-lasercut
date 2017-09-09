use<lasercut.scad>
$thickness=4.25;
$flat = true;
$num = 0;

assembly($num,$flat){
    laserCutLayer( trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                circle(r=11.5,$fn=100);
                circle(r=5.9/2,$fn=100);
            }
        }
    laserCutLayer( trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                circle(r=70,$fn=100);
                for($i=[0:360/5:359]){
                    rotate([0,0,$i]){
                        translate([0,45]){
                            circle(r=32/2,$fn=100);
                        }
                    }
                }
                for($i=[0:360/4:359]){
                    rotate([0,0,$i]){
                        translate([0,17.5]){
                            circle(r=11.5,$fn=100);
                        }
                    }
                }
                for($i=[0:360/3:359]){
                    rotate([0,0,$i]){
                        translate([0,-65]){
                            square([10,$thickness],true);
                        }
                    }
                }
            }
    }
    laserCutLayer( trans=[0,0,$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                circle(r=70,$fn=100);
                for($i=[0:360/4:359]){
                    rotate([0,0,$i]){
                        translate([0,17.5]){
                            circle(r=11.5,$fn=100);
                        }
                    }
                }
                for($i=[0:360/3:359]){
                    rotate([0,0,$i]){
                        translate([0,-65]){
                            square([10,$thickness],true);
                        }
                    }
                }
            }
    }
}