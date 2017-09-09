use<lasercut.scad>
$thickness=3.0;
$kerf = 0.05;
$clearance = 0.5;
$flat = false;
$num = 1;
module servo(){
    translate([-40.6/2+10.1,0,36.6/2]){
        cube([40.6,19.8,36.6],center=true);
        translate([0,0,28.7-2.5/2-36.6/2]){
            cube([54.5,19.8,2.5],center=true);
        }
    }
}
module magnet(){
    translate([0,0,7.2]){
        translate([0,0,-7.2]){
            cylinder(r=10.0,h=7.2,$fn=90);
        }
        cylinder(r=2.0,h=8.10,$fn=40);
    }
}
module bearing(){
    difference(){
        cylinder(r=2.50,h=12.0,center = true,$fn=50);
        //cylinder(r=1.60,h=15.0,center = true,$fn=50);
    }
}
// main back
$rad = 11.5;
$fingerWidth = 1.8;
module leg(){
    module magArm(){
        difference(){
            union(){
                hull(){
                    translate([-30,-6]){
                        rotate([0,0,-10]){
                            square([10,15],center=true);
                        }
                    }
                    translate([-2,-3]){
                        square([10,38],center=true);
                    }
                    translate([2.5,-16]){
                        circle(r=4,$fn=30,center=true);
                    }
                }
                hull(){
                    translate([2.5,-16]){
                        circle(r=4,$fn=30,center=true);
                    }
                    translate([6.5,-24.5]){
                        circle(r=3,$fn=30,center=true);
                    }
                }
            }
            translate([-30,-6]){
                rotate([0,0,-10]){
                    translate([7.5-$thickness/2,0]){
                        square([$thickness,10],center=true);
                    }
                    translate([-2.5-$thickness/2,0]){
                        square([$thickness,10],center=true);
                    }
                    translate([7.5-$thickness/2+1.5+0.75,1.5]){
                        square([4,4],center=true);
                    }
                }
            }
            translate([0-$thickness/2,0.25]){
                square([$thickness,24.5],center=true);
            }
            translate([2.5,-16]){
                circle(r=2.50-$kerf,$fn=100);
            }
            translate([5,0]){
                square([10,20],center=true);
            }
            translate([5,0]){
                square([23,4.5],center=true);
            }
        }
    }
    module screwBlock(){
        difference(){
            square([15,12-$clearance*2],center=true);
            translate([1.5,0]){
                circle(r=1.5,$fn=20);
            }
            translate([7.5,(12-$clearance*2)/2]){
                square([5,$thickness*2-$kerf*2+$clearance],center = true);
            }
            translate([-7.5,(12-$clearance*2)/2]){
                square([5,$thickness*2-$kerf*2+$clearance],center = true);
            }
            translate([7.5,-(12-$clearance*2)/2]){
                square([5,$thickness*2-$kerf*2+$clearance],center = true);
            }
            translate([-7.5,-(12-$clearance*2)/2]){
                square([5,$thickness*2-$kerf*2+$clearance],center = true);
            }
        }
    }
    assembly($num,$flat){
        laserCutLayer(trans=[0,0,$thickness/2],rot=[0,0,90],thickness=$thickness,flatten  = $flat){
            difference(){
                translate([-3,0]){
                    square([38,12-$clearance*2],center=true);
                }
                circle(r=2,$fn=30);
                translate([15,(12-$clearance*2)/2]){
                    square([5,$thickness*2-$kerf*2+$clearance],center = true);
                }
                translate([-18,(12-$clearance*2)/2]){
                    square([12,$thickness*2-$kerf*2+$clearance],center = true);
                }
                translate([15,-(12-$clearance*2)/2]){
                    square([5,$thickness*2-$kerf*2+$clearance],center = true);
                }
                translate([-18,-(12-$clearance*2)/2]){
                    square([12,$thickness*2-$kerf*2+$clearance],center = true);
                }
            }
        }
        laserCutLayer(trans=[$thickness/2-6+$clearance,0,0],rot=[0,90,0],thickness=$thickness,flatten  = $flat){
            magArm();
        }
        #laserCutLayer(trans=[-$thickness/2+6-$clearance,0,0],rot=[0,90,0],thickness=$thickness,flatten  = $flat){
            magArm();
        }
        laserCutLayer(trans=[0,-5.40,35-$thickness/2],rot=[0,10,90],thickness=$thickness,flatten  = $flat){
            screwBlock();
        }
        laserCutLayer(trans=[0,-7,25.5-$thickness/2],rot=[0,10,90],thickness=$thickness,flatten  = $flat){
            screwBlock();
        
        }
        laserCutLayer(trans=[0,0,-$thickness/2],rot=[0,0,90],thickness=$thickness,flatten  = $flat){
            difference(){
                circle(r=5,$fn=30);
                circle(r=2,$fn=30);
            }
        }
    }
  
    translate([0,-16,-2.5]){
        rotate([0,90,0]){
            %bearing();
        }
    }
    translate([0,-2.5,40]){
        rotate([-10,0,0]){
            %bearing();
        }
    }
    translate([0,0,-7.2-3]){
        %magnet();
    }
}
translate([0,0,100]){
    rotate([0,180,0]){
        %servo();
    }
}
$leg();
for(i=[0:45:359]){
    rotate([0,0,i]){
        translate([0,-32-16,0]){
            rotate([30,0,0]){
                translate([0,16,2.5]){
                    leg();
                }
            }
        }
    }
}
$servoHeight=19.12;
$leverHeight = 34;

module circleBase(){
    difference(){
        circle(r=75,$fn=100);
        square([5.8,12.8],center=true);
        for(i=[0:45:359]){
            rotate([0,0,i]){
                translate([15,48]){
                    square([4,6],center=true);
                }
                translate([32,0]){
                    hull(){
                        translate([-1,0]){
                            circle(r=11,$fn=100,center=true);
                        }
                        circle(r=11,$fn=100,center=true);
                    }
                    translate([10.5,0]){
                        square([35,12],center=true);
                    }
                }
            }
        }
    }
}
module holes(){
    for(i=[0:45:359]){
        rotate([0,0,i+45/2]){
            rotate([0,0,0]){
                translate([60,0]){
                    circle(r=1.5,$fn=30);
                }
            }
        }
    }
    for(i=[0:90:359]){
        rotate([0,0,i+45/2]){
            translate([0,68]){
                square([20,$thickness],center=true);
            }
        }
    }
}
assembly($num-10,$flat){
    $hei = 58;
    //for(i=[0:90:359]){
    //    rotate([0,0,i+45/2]){
            $wid = 55;
            laserCutLayer(trans=[68,0,$hei/2+$thickness/2+$thickness],rot=[0,90,0],thickness=$thickness,flatten  = $flat){
                difference(){
                    union(){
                        translate([0,2]){
                            square([$hei,$wid],center=true);
                        }
                        translate([$hei/2,0]){
                            square([$thickness*6,20],center=true);
                        }
                        translate([-$hei/2,0]){
                            square([$thickness*2,20],center=true);
                        }
                    }
                    square([100,3],center=true);
                }
            }
        //}
    //}
    laserCutLayer(trans=[0,0,47],rot=[0,0,0],thickness=$thickness,flatten  = $flat){
        difference(){
            circle(r=65,$fn=100);
            circle(r=1.5,$fn=30);
            for(i=[0:120:359]){
                rotate([0,0,i]){
                    translate([0,23.5]){
                        circle(r=1.5,$fn=30);
                    }
                }
            }
            for(i=[0:7]){
                rotate([0,0,i*45]){
                    $inc = 5;
                    $rng = 80;
                    $exp = 4;
                    $dis = 32;
                    for(j=[0:$inc:$rng-$inc]){
                        hull(){
                            rotate([0,0,j+$inc]){
                                translate([0,35+(((pow($exp,(j+$inc)/$rng))-1)/$exp*$dis)]){
                                    circle(r=3.2,$fn=30);
                                }
                            }
                            rotate([0,0,j]){
                                translate([0,35+((pow($exp,(j/$rng))-1)/$exp*$dis)]){
                                    circle(r=3.2,$fn=30);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    laserCutLayer(trans=[0,0,47+17.1],rot=[0,0,0],thickness=$thickness,flatten  = $flat){
        difference(){
            circle(r=75,$fn=100);
            //47.5x10 holes
            //hoels offset 13.5
            //44
            translate([10,0]){
                square([40,20],center=true);
            }
            translate([-47.5/2+10,5 ]){
                circle(r=1.5,$fn=30);
            }
            translate([-47.5/2+10,-5]){
                circle(r=1.5,$fn=30);
            }
            translate([47.5/2+10,-5]){
                circle(r=1.5,$fn=30);
            }
            translate([47.5/2+10,5]){
                circle(r=1.5,$fn=30);
            }
            translate([0,56/2]){
                circle(r=3,$fn=40);
            }
            translate([0,-56/2]){
                circle(r=3,$fn=40);
            }
            holes();
        }
    }
    laserCutLayer(trans=[0,0,0],rot=[0,0,0],thickness=$thickness,flatten  = $flat){
        difference(){
            circleBase();
            holes();
            for(i=[0:45:359]){
                rotate([0,0,i]){
                    translate([0,48]){
                        square([32,3],center=true);
                    }
                    translate([0,20]){
                        square([12,10],center=true);
                    }
                }
            }
        }
    }
    laserCutLayer(trans=[0,0,$thickness],rot=[0,0,0],thickness=$thickness,flatten  = $flat){
        difference(){
            circleBase();
            for(i=[0:45:359]){
                rotate([0,0,i]){
                    translate([0,20]){
                        square([12,10],center=true);
                    }
                }
            }
            holes();
        }
    }
    laserCutLayer(trans=[0,0,-$thickness],rot=[0,0,0],thickness=$thickness,flatten  = $flat){
        difference(){
            circleBase();
            holes();
        }
    }
    laserCutLayer(trans=[0,0,47+$thickness],rot=[0,0,0],thickness=$thickness,flatten  = $flat){
        difference(){
            circle(r=65,$fn=100);
            circle(r=1.5,$fn=30);
            for(i=[0:120:359]){
                rotate([0,0,i]){
                    translate([0,23.5]){
                        circle(r=1.5,$fn=30);
                    }
                }
            }
        }
    }
}