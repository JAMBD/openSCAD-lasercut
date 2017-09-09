use<lasercut.scad>
$thickness=6.11;
$thickness2=4.32;
$flat = true;
$num = 3;
module rim($code=[]){
    difference(){
        minkowski(){
            difference(){
                circle(r=20,$fn=30);
                for($i=[1:360/20:359]){
                    rotate([0,0,$i]){
                        translate([0,25]){
                            circle(r=6,$fn=20);
                        }
                    }
                }
            }
            circle(r=0.5,$fn = 10);
        }
        square([$thickness,6+14*2],center=true);
        circle(r=14,$fn=100);
    }
    for($j=[0:1:len($code)-1]){
        for($i=$code[$j]){
            rotate([0,0,$i]){
                translate([0,14]){
                    circle(r=2,$fn=20);
                }
            }
        }
    }
}
module inner($code=[]){
    difference(){    
        circle(r=13.9,$fn=100);
        
        for($j=[0:1:len($code)-1]){
            for($i=$code[$j]){
                rotate([0,0,$i]){
                    translate([0,14]){
                        circle(r=2.1,$fn=40);
                    }
                }
            }
        }
        square([20,1.8],center=true);
        translate([0,14]){
            square([$thickness,12],center=true);
        }
        translate([0,-14]){
            square([$thickness,12],center=true);
        }
    }
}
module mask(){
    translate([-13.55,-6]){
        circle(r=6,$fn=50);
    }
    translate([0,-6]){
        circle(r=6,$fn=50);
    }
    translate([-13.55/2,-10-2.7]){
        difference(){
            square(20,center=true);
            translate([0,10.8]){
                circle(r=2,$fn=50);
            }
        }
    }
}
module outerLock($code=[]){
    difference(){
        translate([0,14+3]){
            hull(){
                circle(r=3,$fn=80);
                translate([7*($thickness),0]){
                    circle(r=3,$fn=80);
                }
            }
        }
        translate([0,14+3]){
            square([7*($thickness),8+20]);
        }
    }
}
module innerLock($code=[]){
    difference(){
        union(){
            circle(r=13.55,$fn=80);
            square([7*($thickness),13.55]);
            translate([7*($thickness),0]){
                circle(r=13.55,$fn=80);
            }
        }
        translate([0,-20]){
            square([7*($thickness),8+20]);
        }
        mask();
        minkowski(){
            translate([7*($thickness),-20]){
                difference(){
                    square([20,40]);
                    translate([0,20]){
                        rotate([0,0,180]){
                            mask();
                        }
                    }
                }
            }
            circle(r=0.05,$fn=10);
        }
        for($i=$code){
            translate([($thickness)*$i,11.3]){
                square([$thickness+0.01,3]);
            }
        }
    }
}
$codes=[[],[],[[50]],[],[270],[],[]];
$codesb=[
[[50:1:70],[50-90]],
[[60],[180:1:270],[50-90]],
[[30:1:80],[50+220:1:70+220],[50-90],[50-90:-1:-80]],
[[30],[80:1:100],[60+220]],
[[30:1:50],[100],[30+220:1:80+220],[180:-1:180-40]],
[[30+220],[80+220:1:100+220],[140]],
[[30+220:1:50+220],[100+220],[140:-1:110]]
];
$sidea= [-1,-2];
$sideb=[5,4,3,2];
for($i=[0:1:6]){
    $laserCutLayer(trans=[$i*($thickness)+$thickness/2,0,0],rot=[0,90,0],thickness=$thickness,flatten=$flat,visible=($i+10==$num)||!$flat){
        rim($codes[$i]);
    }
    laserCutLayer(trans=[$i*($thickness)+$thickness/2,0,0],rot=[0,90,0],thickness=$thickness,flatten = $flat,visible=($i+20==$num)||!$flat){
        inner($codesb[$i]);
    }
}
laserCutLayer(trans=[0,0,0],rot=[0,0,0],thickness=$thickness,flatten = $flat,visible=$num==0||!$flat){
    innerLock($sidea);
}
laserCutLayer(trans=[7*($thickness),0,0],rot=[0,0,180],thickness=$thickness,flatten = $flat,visible=$num==1||!$flat){
    innerLock($sideb);
}
laserCutLayer(trans=[7*($thickness),0,0],rot=[0,0,180],thickness=$thickness,flatten = $flat,visible=$num==2||!$flat){
    outerLock();
}
laserCutLayer(trans=[0,0,0],rot=[0,0,0],thickness=$thickness,flatten = $flat,visible=$num==3||!$flat){
    outerLock();
}