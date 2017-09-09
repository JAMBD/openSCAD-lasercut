use<lasercut.scad>
dnum = 0;
dflat = false;
$thickness=6.2;
$SM = 3.0;
$flat = dflat;
$num = dnum;
$kerf = 0.1;
$loop=0.6;

$depth = 50;
$height = 115;
$width = 200;
$ang = 45;
$wheelLift = 18;
$bearingBack = -22-$thickness;
$baseHeight = -40;
$topPlateHeight = 40;
$motorOffset=44.5;
$batterySize = [114,23,39];
$spokeOffset = 72;
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

module fjoin($len=10,$s=0,$len2=-1){
    if($s==0){
        ssquare([$thickness,$len-$kerf*2]);
    }else{
        if($len2 < 0){
            translate([0,$len]){
                ssquare([$thickness,$len]);
            }
            translate([0,-$len]){
                ssquare([$thickness,$len]);
            }
        }else{
            translate([0,$len/2+$len2/2]){
                ssquare([$thickness,$len2]);
            }
            translate([0,-$len/2-$len2/2]){
                ssquare([$thickness,$len2]);
            }
        }
    }
}

module longPlate(){
    difference(){
        hull(){
            translate([0,$width/2]){
                rotate([0,0,-$ang]){
                    square([$thickness,$height],true);
                }
            }
            translate([0,-$width/2]){
                rotate([0,0,$ang]){
                    square([$thickness,$height],true);
                }
            }
        }
        translate([-5,0]){
            hull(){
                translate([0,10]){
                    circle(r=5,$fn=100);
                }
                translate([0,-10]){
                    circle(r=5,$fn=100);
                }
            }
        }
        translate([-$topPlateHeight,0]){
            ssquare([$thickness,55-$kerf]);
            
            translate([$thickness/2,0]){
                ssquare([17,5]);
            }
            translate([-$thickness/2+12.5+2,0]){
                ssquare([4,8]);
            }
        }
        
        translate([-$baseHeight,45]){
            ssquare([$thickness,50-$kerf]);
            
            rotate([0,0,180]){
                translate([$thickness/2,0]){
                    ssquare([17,3]);
                }
                translate([-$thickness/2+12.5+2,0]){
                    ssquare([2.5,5.5]);
                }
            }
        }
        translate([-$baseHeight,-45]){
            ssquare([$thickness,50-$kerf]);
            
            rotate([0,0,180]){
                translate([$thickness/2,0]){
                    ssquare([17,3]);
                }
                translate([-$thickness/2+12.5+2,0]){
                    ssquare([2.5,5.5]);
                }
            }
        }
        
        translate([-cos($ang)*$bearingBack,-sin($ang)*$bearingBack -$width/2]){
            rotate([0,0,$ang]){
                ssquare([$thickness,25-$kerf]);
            }
        }
        translate([0,$width/2]){
            rotate([0,0,-$ang]){
                translate([0,$height/4]){
                    ssquare([$thickness,$height/2-20-$kerf]);
                    translate([$thickness/2,0]){
                        ssquare([17,5]);
                    }
                    translate([-$thickness/2+12.5+2,0]){
                        ssquare([4,8]);
                    }
                }
            }
        }
        translate([0,$width/2]){
            rotate([0,0,-$ang]){
                translate([0,-$height/4]){
                    ssquare([$thickness,$height/2-20-$kerf]);
                    translate([$thickness/2,0]){
                        ssquare([17,5]);
                    }
                    translate([-$thickness/2+12.5+2,0]){
                        ssquare([4,8]);
                    }
                }
            }
        }
        translate([-cos($ang)*$bearingBack,sin($ang)*$bearingBack +$width/2]){
            rotate([0,0,-$ang]){
                ssquare([$thickness,25-$kerf]);
            }
        }
        translate([0,-$width/2]){
            rotate([0,0,$ang]){
                translate([0,$height/4]){
                    ssquare([$thickness,$height/2-20-$kerf]);
                    translate([$thickness/2,0]){
                        ssquare([17,5]);
                    }
                    translate([-$thickness/2+12.5+2,0]){
                        ssquare([4,8]);
                    }
                }
            }
        }
        translate([0,-$width/2]){
            rotate([0,0,$ang]){
                translate([0,-$height/4]){
                    ssquare([$thickness,$height/2-20-$kerf]);
                    translate([$thickness/2,0]){
                        ssquare([17,5]);
                    }
                    translate([-$thickness/2+12.5+2,0]){
                        ssquare([4,8]);
                    }
                }
            }
        }
    }
}

module wheelPlate(){
    difference(){
        hull(){
            translate([0,$motorOffset-7]){
                circle(r=$depth/2,$fn=50);
            }
            translate([$depth/2+$thickness,$height/2-4]){
                circle(r=4,$fn=50);
            }
            translate([-$depth/2-$thickness,$height/2-4]){
                circle(r=4,$fn=50);
            }
            translate([-$depth/2-$thickness,-$height/2+4]){
                circle(r=4,$fn=50);
            }
            translate([$depth/2+$thickness,-$height/2+4]){
                circle(r=4,$fn=50);
            }
            square([$depth,$height],true);
        }
        circle(r=4,$fn=50);
        translate([0,$motorOffset]){
            rotate([0,0,-90]){
                motorHoles();
            }
        }
        translate([$depth/2,$height/2]){
            ssquare([$thickness-$kerf,20]);
        }
        translate([$depth/2,0]){
            ssquare([$thickness-$kerf,20]);
        }
        translate([$depth/2,-$height/2]){
            ssquare([$thickness-$kerf,20]);
        }
        translate([-$depth/2,$height/2]){
            ssquare([$thickness-$kerf,20]);
        }
        translate([-$depth/2,0]){
            ssquare([$thickness-$kerf,20]);
        }
        translate([-$depth/2,-$height/2]){
            ssquare([$thickness-$kerf,20]);
        }
        translate([-$depth/2,-$height/4]){
            circle(r=2.5,$fn=30);
        }
        translate([-$depth/2,$height/4]){
            circle(r=2.5,$fn=30);
        }
        translate([$depth/2,-$height/4]){
            circle(r=2.5,$fn=30);
        }
        translate([$depth/2,$height/4]){
            circle(r=2.5,$fn=30);
        }
    }
}

module bearingPlate(){
    difference(){
        square([$depth+$thickness,50],true);
        translate([0,$motorOffset-7]){
            circle(r=35/2,$fn=50);
        }
        circle(r=4,$fn=50);
        translate([$depth/2,25]){
            ssquare([$thickness,25]);
        }
        translate([$depth/2,-25]){
            ssquare([$thickness,25]);
        }
        translate([-$depth/2,-25]){
            ssquare([$thickness,25]);
        }
        translate([-$depth/2,25]){
            ssquare([$thickness,25]);
        }
    }
}
$holdr = 8;
module wheel(){
    difference(){
        circle(r=175/2,$fn=100);
        circle(r=62,$fn=100);
        for(i=[0:60:360]){
            rotate([0,0,i]){
                translate([0,$spokeOffset]){
                    circle(r=1.5,$fn=30);
                }
            }
        }
        for(i=[0:3:360]){
            rotate([0,0,i]){
                translate([0,175/2]){
                    circle(r=1.5,$fn=30);
                }
            }
        }
    }
}
module wheelGear(){
    rotate([0,0,90]){
        import("outer.dxf");
    }
    difference(){
        offset(r=-8,$fn=30){
            offset(r=8,$fn=30){
                circle(r=75,$fn=100);
                for(i=[0:60:360]){
                    rotate([0,0,i]){
                        translate([0,$spokeOffset]){
                            circle(r=$holdr,$fn=30);
                        }
                    }
                }
            }
        }
        circle(r=60,$fn=100);
        for(i=[0:60:360]){
            rotate([0,0,i]){
                translate([0,$spokeOffset]){
                    circle(r=1.5,$fn=30);
                }
            }
        }
    }
}

module wheelHub(){
    difference(){
        offset(r=-5,$fn=20){
            offset(r=5,$fn=20){
                for(i=[0:60:360]){
                    rotate([0,0,i]){
                        hull(){
                            circle(r=10,$fn=50);
                            translate([0,$spokeOffset]){
                                circle(r=4,$fn=50);
                            }
                        }
                        translate([0,$spokeOffset]){
                            circle(r=$holdr,$fn=50);
                        }
                    }
                }
            }
        }
        circle(r=2.5,$fn=30);
        for(i=[0:60:360]){
            rotate([0,0,i]){
                translate([0,$spokeOffset]){
                    circle(r=1.5,$fn=30);
                }
            }
        }
    }
}

module smallGear(){
    rotate([0,0,90]){
         difference(){
            union(){
                import("sml.dxf");
                translate([-$motorOffset,0]){
                    circle(r=6/2,$fn=80);
                }
            }
            offset(r=-$kerf){
                translate([-$motorOffset,0]){
                    difference(){
                        circle(r=5.99/2,$fn=80);
                        translate([3.5+5.47-5.99/2,0]){
                            square([7,7],true);
                        }
                    }
                }
            }
        }
    }
}

module base(){
    difference(){
        hull(){
            square([$batterySize[1]*2+$depth+$thickness*3,180],true);
            translate([($batterySize[1]*2+$depth+$thickness*3)/2+$thickness,90-4]){
                circle(r=4,$fn=50);
            }
            translate([-($batterySize[1]*2+$depth+$thickness*3)/2-$thickness,90-4]){
                circle(r=4,$fn=50);
            }
            translate([-($batterySize[1]*2+$depth+$thickness*3)/2-$thickness,-90+4]){
                circle(r=4,$fn=50);
            }
            translate([($batterySize[1]*2+$depth+$thickness*3)/2+$thickness,-90+4]){
                circle(r=4,$fn=50);
            }
        }
        translate([-($batterySize[1]*2+$depth+$thickness*2)/2,40]){
            ssquare([$thickness,20]);
        }
        translate([-($batterySize[1]*2+$depth+$thickness*2)/2,-40]){
            ssquare([$thickness,20]);
        }
        translate([-($batterySize[1]*2+$depth+$thickness*2)/2,0]){
            circle(r=1.5,$fn=30);
        }
        translate([-$depth/2,90]){
            ssquare([$thickness,40]);
        }
        translate([-$depth/2,45]){
            circle(r=1.5,$fn=30);
        }
        translate([-$depth/2,0]){
            ssquare([$thickness,40]);
        }
        translate([-$depth/2,-45]){
            circle(r=1.5,$fn=30);
        }
        translate([-$depth/2,-90]){
            ssquare([$thickness,40]);
        }
        translate([$depth/2,90]){
            ssquare([$thickness,40]);
        }
        translate([$depth/2,45]){
            circle(r=1.5,$fn=30);
        }
        translate([$depth/2,0]){
            ssquare([$thickness,40]);
        }
        translate([$depth/2,-45]){
            circle(r=1.5,$fn=30);
        }
        translate([$depth/2,-90]){
            ssquare([$thickness,40]);
        }
    }
}

module backPlate(){
    difference(){
        hull(){
            translate([0,70.5]){
                rotate([0,0,-$ang]){
                    square([$thickness,48],true);
                }
            }
            translate([$batterySize[2]/2+$thickness/2,0]){
                square([$thickness,180],true);
            }
            translate([0,-70.5]){
                rotate([0,0,$ang]){
                    square([$thickness,48],true);
                }
            }
        }
        translate([$batterySize[2]/2+$thickness/2,90]){
            ssquare([$thickness,80]);
        }
        translate([$batterySize[2]/2+$thickness/2,-90]){
            ssquare([$thickness,80]);
        }
        translate([$batterySize[2]/2+$thickness/2,0]){
            ssquare([$thickness,60]);
            rotate([0,0,180]){
                translate([$thickness/2,0]){
                    ssquare([17,3]);
                }
                translate([-$thickness/2+12.5+2,0]){
                    ssquare([2.5,5.5]);
                }
            }
        }
    }
}

module topPlate(){
    difference(){
        hull(){
            square([$depth,80],true);
            translate([$depth/2+$thickness,40-4]){
                circle(r=4,$fn=100);
            }
            translate([$depth/2+$thickness,-40+4]){
                circle(r=4,$fn=100);
            }
            translate([-$depth/2-$thickness,-40+4]){
                circle(r=4,$fn=100);
            }
            translate([-$depth/2-$thickness,40-4]){
                circle(r=4,$fn=100);
            }
        }
        translate([$depth/2,40]){
            ssquare([$thickness-$kerf,25]);
        }
        translate([-$depth/2,40]){
            ssquare([$thickness-$kerf,25]);
        }
        translate([-$depth/2,-40]){
            ssquare([$thickness-$kerf,25]);
        }
        translate([$depth/2,-40]){
            ssquare([$thickness-$kerf,25]);
        }
        translate([$depth/2,0]){
            circle(r=2.5,$fn=30);
        }
        translate([-$depth/2,0]){
            circle(r=2.5,$fn=30);
        }
        translate([0,0]){
            ssquare([32,11]);
        }
        translate([0,-20]){
            ssquare([20,13]);
        }
        translate([0,20]){
            circle(r=6,$fn=30);
        }
    }
}
module motorHoles(){
    circle(r=12/2,$fn=80);
    for($i=[0:60:359]){
        translate([7,0]){
            rotate([0,0,$i]){
                translate([0,30.5/2]){
                    circle(r=1.5,$fn=50);
                }
            }
        }
    }
}

assembly($num,$flat){
    *laserCutLayer(
        trans=[$depth/2,0,0],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
         longPlate();
    }
    laserCutLayer(
        trans=[-$depth/2,0,0],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
         longPlate();
    }
    laserCutLayer(
        trans=[-$depth/2-$batterySize[1]-$thickness,0,$batterySize[2]/2+$baseHeight+$thickness/2],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
         backPlate();
    }
    laserCutLayer(
        trans=[0,$width/2,0],
        rot=[-$ang,180,180],
        thickness=$thickness,
        flatten = $flat){
         wheelPlate();
    }
    laserCutLayer(
        trans=[0,-$width/2,0],
        rot=[$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
         wheelPlate();
    }
    laserCutLayer(
        trans=[0,-sin($ang)*$wheelLift -$width/2,cos($ang)*$wheelLift],
        rot=[$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
         wheel();
    }
    laserCutLayer(
        trans=[0,-sin($ang)*($wheelLift+$thickness) -$width/2,cos($ang)*($wheelLift+$thickness)],
        rot=[$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
         wheelHub();
    }
    laserCutLayer(
        trans=[0,-sin($ang)*($wheelLift-$thickness) -$width/2,cos($ang)*($wheelLift-$thickness)],
        rot=[$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
            rotate([0,0,180]){
                wheelGear();
            }
    }
    laserCutLayer(
        trans=[0,-sin($ang)*($wheelLift-$thickness) -$width/2,cos($ang)*($wheelLift-$thickness)],
        rot=[$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
            rotate([0,0,180]){
                smallGear();
            }
    }
    *laserCutLayer(
        trans=[0,sin($ang)*$wheelLift+$width/2,cos($ang)*$wheelLift],
        rot=[-$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
         wheel();
    }
    laserCutLayer(
        trans=[0,sin($ang)*($wheelLift-$thickness)+$width/2,cos($ang)*($wheelLift-$thickness)],
        rot=[-$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
            smallGear();
    }
    *laserCutLayer(
        trans=[0,sin($ang)*($wheelLift+$thickness)+$width/2,cos($ang)*($wheelLift+$thickness)],
        rot=[-$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
         wheelHub();
    }
    *laserCutLayer(
        trans=[0,sin($ang)*($wheelLift-$thickness)+$width/2,cos($ang)*($wheelLift-$thickness)],
        rot=[-$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
         wheelGear();
    }
    laserCutLayer(
        trans=[0,-sin($ang)*$bearingBack -$width/2,cos($ang)*$bearingBack],
        rot=[$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
                bearingPlate();
    }
    laserCutLayer(
        trans=[0,sin($ang)*$bearingBack+$width/2,cos($ang)*$bearingBack],
        rot=[-$ang,0,0],
        thickness=$thickness,
        flatten = $flat){
            rotate([0,0,180]){
                bearingPlate();
            }
    }
    laserCutLayer(
        trans=[0,0,$baseHeight],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
         base();
    }
    laserCutLayer(
        trans=[0,0,$topPlateHeight],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
         topPlate();
    }
    %translate([0,-$width/2,0]){
        rotate([$ang,0,0]){
            translate([0,0,-50]){
                cylinder(r=2.5,h=100,$fn=30);
            }
        }
    }
    %translate([0,$width/2,0]){
        rotate([-$ang,0,0]){
            translate([0,0,-50]){
                cylinder(r=2.5,h=100,$fn=30);
            }
        }
    }
    %translate([0,$width/2,0]){
        rotate([-$ang,0,0]){
            translate([0,-$motorOffset+7,-$thickness/2-69]){
                cylinder(r=37/2,h=69,$fn=30);
                translate([0,-7,69]){
                    cylinder(r=3,h=21,$fn=30);
                }
            }
        }
    }
    %translate([0,-$width/2,0]){
        rotate([$ang,0,0]){
            translate([0,$motorOffset-7,-$thickness/2-69]){
                cylinder(r=37/2,h=69,$fn=30);
                translate([0,7,69]){
                    cylinder(r=3,h=21,$fn=30);
                }
            }
        }
    }
    %translate([-$depth/2-$thickness/2-$batterySize[1]/2,0,$batterySize[2]/2+$baseHeight+$thickness/2]){
        rotate([0,0,90]){
            translate([0,0,0]){
                cube($batterySize,true);
            }
        }
    }
}