use<lasercut.scad>
$thickness=6.1;
$flat = true;
$num = 3;
$off = 20;

module slide($data=[]){
    difference(){
        union(){
            square([100,100],true);
            square([80,100+24],true);
            translate([0,50+(12-$thickness)/2+$thickness]){
                square([90,12-$thickness],true);
            }
            translate([0,-(50+(12-$thickness)/2+$thickness)]){
                square([90,12-$thickness],true);
            }
        }
        translate([$off-$thickness*5,0]){
            square([$thickness*10,80],true);
        }
    }
    translate([$off-$thickness*4.5,0]){
        
        for($i=[0:1:len($data)-1]){
            translate([0,(-30+2.5)*$i+30-2.5]){
                for($j=[0:1:len($data[$i])-1]){
                    translate([-$thickness*5+$thickness+$j*$thickness,0]){
                        square([$thickness,10+2.5*$data[$i][$j]],true);
                    }
                }
                square([$thickness*9,10],true);
            }
        }
    }
}
$s1 = [ [1,1,0,1,0,2,0,1],
        [2,0,0,1,1,0,2,0],
        [1,0,2,1,0,0,1,1]];
$s2 = [ [2,0,1,1,0,2,1,1],
        [1,0,0,2,1,0,0,1],
        [2,1,0,2,0,1,0,2]];
assembly($num,$flat){
    laserCutLayer(
        trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                square([100,100],true);
                translate([$off-$thickness*0.5,30-2.5]){
                    square([$thickness,25],true);
                }
                translate([$off-$thickness*0.5,0]){
                    square([$thickness,25],true);
                }
                translate([$off-$thickness*0.5,-30+2.5]){
                    square([$thickness,25],true);
                }
                translate([$off+12,-30+2.5]){
                    circle(r=19.2/2,$fn=100);
                }
                translate([$off+12,30-2.5]){
                    circle(r=19.2/2,$fn=100);
                }
            }
        
    }
    #laserCutLayer(
        trans=[0,0,$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            slide($s2);
    }
    #laserCutLayer(
        trans=[0,0,-$thickness],
        rot=[180,0,0],
        thickness=$thickness,
        flatten = $flat){
            slide($s1);
    }
    laserCutLayer(
        trans=[$off-$thickness*0.5,0,$thickness*-1],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                square([$thickness*7,25],true);
                square([$thickness*5,10],true);
                square([$thickness,12.5],true);
                translate([$thickness*2,0]){
                    square([$thickness*1,15],true);
                }
                translate([-$thickness*2,0]){
                    square([$thickness*1,15],true);
                }
            }
    }
    laserCutLayer(
        trans=[0,100/2+$thickness/2,0],
        rot=[90,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                square([100,$thickness*5],true);
                square([80,$thickness*3],true);
                square([90,$thickness*2],true);
            }
    }
}