use<lasercut.scad>
dnum = 0;
dflat = false;
$thickness=3.0;
$SM = 3.0;
$flat = dflat;
$num = dnum;
$kerf = 0.1;
$loop=0.6;

module ssquare($size){
    square($size,true);
    translate([$size[0]/2,$size[1]/2]){
        circle(r=$loop,$fn=50);
    }
    translate([-$size[0]/2,$size[1]/2]){
        circle(r=$loop,$fn=50);
    }
    translate([-$size[0]/2,-$size[1]/2]){
        circle(r=$loop,$fn=50);
    }
    translate([$size[0]/2,-$size[1]/2]){
        circle(r=$loop,$fn=50);
    }
}

assembly($num,$flat){
    laserCutLayer(
        trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
        difference(){
            minkowski(){
                hull(){
                    square([40,92],true);
                    translate([20+15,15]){
                        circle(r=15,$fn=100);
                    }
                    translate([-20-15,15]){
                        circle(r=15,$fn=100);
                    }
                }
                circle(r=2.5,$fn = 100);
            }
            translate([20+15,15]){
                circle(r=3,$fn=100);
            }
            translate([-20-15,15]){
                circle(r=3,$fn=100);
            }
            translate([0,25]){
                ssquare([20-$kerf,$thickness-$kerf]);
            }
            translate([0,-25]){
                ssquare([20-$kerf,$thickness-$kerf]);
            }
            translate([10,40]){
                circle(r=1.5,$fn=50);
            }
            translate([10,-40]){
                circle(r=1.5,$fn=50);
            }
            translate([-10,-40]){
                circle(r=1.5,$fn=50);
            }
            translate([-10,40]){
                circle(r=1.5,$fn=50);
            }
            translate([-13,0]){
                circle(r=1.5,$fn=50);
            }
            translate([13,0]){
                circle(r=1.5,$fn=50);
            }
        }
    }
    laserCutLayer(
        trans=[0,40,-$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
        difference(){
            hull(){
                translate([10,0]){
                    circle(r=5,$fn=50);
                }
                translate([-10,0]){
                    circle(r=5,$fn=50);
                }
            }
            translate([10,0]){
                circle(r=1.5,$fn=50);
            }
            translate([-10,0]){
                circle(r=1.5,$fn=50);
            }
        }
    }
    laserCutLayer(
        trans=[0,25,10-$thickness/2],
        rot=[0,90,90],
        thickness=$thickness,
        flatten = $flat){
        difference(){
           square([20,33],true);
            translate([10,5+10]){
                ssquare([$thickness*2,10]);
            }
            translate([10,-5-10]){
                ssquare([$thickness*2,10]);
            }
            
            translate([-10,0]){
                circle(r=26.7/2,$fn=100);
            }
        }
    }
}