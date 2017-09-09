use<lasercut.scad>
$thickness=4.25;
$thickness2=4.32;
$flat = false;
$depth = 6;
$num = 2;
module tpz($size=[1,1],$ang=0){
    difference(){
        square($size,true);
        translate([-$size[0]/2,$size[1]/2]){
            rotate([0,0,-$ang]){
                square([2*$size[0],$size[1]]);
            }
        }
        translate([-$size[0]/2,-$size[1]/2]){
            rotate([180,0,$ang]){
                square([2*$size[0],$size[1]]);
            }
        }
    }
    
}
assembly($num,$flat){
    $laserCutLayer(
        trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                circle(r=10.5,$fn=80);
                square([$thickness,10],true);
            }
    }
    #laserCutLayer(
        trans=[0,0,$thickness*1.5],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                circle(r=10,$fn=80);
                translate([10,0]){
                    square([20,20],true);
                }
            }
            difference(){
                translate([$thickness*0.5,0]){
                    tpz([$thickness*3,7],5);
                    translate([$thickness*1.5-1,0]){
                        tpz([2,7],5);
                    }
                }
                translate([$thickness/2,0]){
                    circle(r=1.5,$fn=40);
                }
                translate([$thickness*1.5,0]){
                    tpz([$thickness*2,3],5);
                }
            }
    }
    laserCutLayer(
        trans=[0,0,-$thickness*0.5],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
            translate([$thickness*($depth-2),0]){
                difference(){
                    circle(r=10,$fn=80);
                    translate([-10,0]){
                        square([20,20],true);
                    }
                }
            }
            translate([-$thickness*1.5,0]){
                difference(){
                    translate([$thickness*($depth)/2,0]){
                        square([$thickness*($depth+1),10],true);
                    }
                    tpz([$thickness*3,7],5);
                    translate([$thickness*1.5-1,0]){
                        tpz([2,7],5);
                    }
                }
            }
    }
}