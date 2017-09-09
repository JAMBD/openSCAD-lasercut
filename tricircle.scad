use<lasercut.scad>
$thickness=2.72;
$flat = true;
$num = 0;
$nsym = 6;
$over = 11;
$rad = 15;
$srad = 8;
$kerf = 0.10;
module rim(){
    offset(r=0.0){
        difference(){
            minkowski(){
                hull(){
                    children();
                }
                circle(r=2.5,$fn=20);
            }
            children();
        }
    }
}

module c1(){
    translate([0,$over]){
            difference(){
                 intersection(){
                    circle(r=$rad,$fn=300);
                    union(){
                        for($i=[0:1:$nsym-1]){
                            rotate([0,0,$i*360/$nsym]){
                                translate([$over*sin(120),$over*cos(120)-$over]){
                                    circle(r=$rad,$fn=300);
                                }
                            }
                        }
                    }
                }
                union(){
                    for($i=[1:1:$nsym-1]){
                        rotate([0,0,$i*360/$nsym]){
                            translate([$over*sin(120),$over*cos(120)-$over]){
                                circle(r=$rad,$fn=300);
                            }
                        }
                    }
                }
            }
        }
    }
module c2(){
    translate([0,$over]){
                 intersection(){
                    circle(r=$rad,$fn=300);
                        intersection_for($i=[0:1:1]){
                            rotate([0,0,$i*360/$nsym]){
                                translate([$over*sin(120),$over*cos(120)-$over]){
                                    circle(r=$rad,$fn=300);
                                }
                            }
                        }
                }
                
            }
    }
    module c3(){
    translate([0,$over]){
                 difference(){
                    circle(r=$rad,$fn=300);
                         for($i=[0:1:$nsym]){
                            rotate([0,0,$i*360/$nsym]){
                                translate([$over*sin(120),$over*cos(120)-$over]){
                                    circle(r=$rad,$fn=300);
                                }
                            }
                        }
                }
                
            }
    }

assembly($num,$flat){
    laserCutLayer(
        trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            offset(r=1+$kerf,$fn=30){
                offset(r=-1,$fn=30){
            rim(){
                translate([0,$over]){
                    circle(r=$rad,$fn=300);
                }
                translate([$over*sin(120),$over*cos(120)]){
                    circle(r=$rad,$fn=300);
                }
                translate([-$over*sin(120),$over*cos(120)]){
                    circle(r=$rad,$fn=300);
                }
            }
        }
    }
    }
    laserCutLayer(
        trans=[0,0,$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            
            offset(r=1+$kerf,$fn=30){
                offset(r=-1,$fn=30){
        difference(){
            hull(){
                rim(){
                    translate([0,$over]){
                        circle(r=$rad,$fn=300);
                    }
                    translate([$over*sin(120),$over*cos(120)]){
                        circle(r=$rad,$fn=300);
                    }
                    translate([-$over*sin(120),$over*cos(120)]){
                        circle(r=$rad,$fn=300);
                    }
                }
            }
            translate([0,$over]){
                    circle(r=$srad,$fn=300);
                }
                translate([$over*sin(120),$over*cos(120)]){
                    circle(r=$srad,$fn=300);
                }
                translate([-$over*sin(120),$over*cos(120)]){
                    circle(r=$srad,$fn=300);
                }
        }
    }
}
    }
    #laserCutLayer(
        trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            offset(r=1+$kerf,$fn=30){
                offset(r=-1,$fn=30){
                    c1();
                }
            }
    }
    laserCutLayer(
        trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            offset(r=1+$kerf,$fn=30){
                offset(r=-1,$fn=30){
                    c2();
                }
            }
    }
    laserCutLayer(
        trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            offset(r=1+$kerf,$fn=30){
                offset(r=-1,$fn=30){
                    c3();
                }
            }
    }
}