use<lasercut.scad>
dnum = 0;
dflat = false;
$thickness=3;
$flat = dflat;
$num = dnum;
$kerf = 0.1;
assembly($num,$flat){
   #laserCutLayer(
        trans=[0,0,$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
offset(r=1.2,$fn=20){
    offset(r=-1.2,$fn=20){
        difference(){
            square([60,200],true);
            for(i=[-3:1:3]){
                translate([26.5/2,i*24]){
                    circle(r=8,$fn=100);
                }
                translate([-26.5/2,i*24]){
                    circle(r=8,$fn=100);
                }
                translate([26,24/2+i*24]){
                    circle(r=3.0/2,$fn=10);
                }
                translate([26,-24/2+i*24]){
                    circle(r=3.0/2,$fn=10);
                }
                translate([-26,24/2+i*24]){
                    circle(r=3.0/2,$fn=10);
                }
                translate([-26,-24/2+i*24]){
                    circle(r=3.0/2,$fn=10);
                }
            }
        }
     }
}
}
   laserCutLayer(
        trans=[0,0,$thickness*2],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
offset(r=1.2,$fn=20){
    offset(r=-1.2,$fn=20){
        difference(){
            square([60,200],true);
            for(i=[-3:1:3]){
                translate([26.5/2,i*24]){
                    circle(r=8,$fn=100);
                }
                translate([-26.5/2,i*24]){
                    circle(r=8,$fn=100);
                }
                translate([26,24/2+i*24]){
                    circle(r=3.0/2,$fn=10);
                }
                translate([26,-24/2+i*24]){
                    circle(r=3.0/2,$fn=10);
                }
                translate([-26,24/2+i*24]){
                    circle(r=3.0/2,$fn=10);
                }
                translate([-26,-24/2+i*24]){
                    circle(r=3.0/2,$fn=10);
                }
            }
            square([12,170],true);
        }
    }
}
}
}