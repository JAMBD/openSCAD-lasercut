use<lasercut.scad>
$thickness=2.72;
$flat = true;
$num = 3;
$rad = 17;
$offset = $rad/3*2;
$rnd = 1;
module ring(r=10,dm=0.1){
    difference(){
        circle(r=r+dm,$fn=100);
        circle(r=r-dm,$fn=100);
    }
}
module holes(){
    for($i=[0:120:360-1]){
        rotate([0,0,$i]){
            translate([$offset,0]){
                circle(1.3,$fn=100);
            }
        }
    }
}
module pattern(){
    ring(r=$rad,$fn=100);
    //difference(){
        intersection(){
            circle(r=$rad,$fn=100);
            for($i=[0:60:360-1]){
                rotate([0,0,$i]){
                    translate([$offset,0]){
                        rotate([0,0,120]){
                            translate([-$offset,0]){
                                ring(r=$rad,$fn=100);
                            }
                        }
                        rotate([0,0,0]){
                            translate([2*$offset,0]){
                                ring(r=$rad,$fn=100);
                            }
                        }
                    }
                }
            }
        }
        for($i=[0:60:360-1]){
            rotate([0,0,$i]){
                translate([$rad/1.5,0]){
                    circle(3.3/2,$fn=100);
                }
            }
        }
        circle(r=1.5,$fn=100);
    //}
}
module case(){
    difference(){
        union(){
            for($i=[0:120:360-1]){
                rotate([0,0,$i]){
                    translate([$offset,0]){
                        difference(){
                            circle($rad/1.5+3,$fn=100);
                        }
                    }
                }
            }
        }
    }
    
}
module outer(){
    difference(){
        hull(){
            for($i=[0:120:360-1]){
                rotate([0,0,$i]){
                    translate([$offset,0]){
                        difference(){
                            circle($rad+5,$fn=100);
                        }
                    }
                }
            }
        }
        hull(){
            for($i=[0:120:360-1]){
                rotate([0,0,$i]){
                    translate([$offset,0]){
                        difference(){
                            circle($rad,$fn=100);
                        }
                    }
                }
            }
        }
    }
    for($i=[0:120:360-1]){
        rotate([0,0,$i+60]){
            translate([18.5,0]){
                circle(4,$fn=100);
            }
        }
    }
}
module marker(){
    translate([20,20]){
        circle(r=0.1,$fn=10);
    }
    
    translate([20,-20]){
        circle(r=0.1,$fn=10);
    }
}
assembly($num,$flat){
    #laserCutLayer(
        trans=[0,0,-$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
        for($i=[0:120:360-1]){
            rotate([0,0,$i]){
                translate([$offset+0.15,0]){
                    difference(){
                        ring(r=$rad/1.5-0.3,dm=1.55,$fn=100);
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
            marker();
        for($i=[0:120:360-1]){
            rotate([0,0,$i]){
                translate([$offset,0]){
                    difference(){
                        ring(r=5,dm=1.9,$fn=100);
                    }
                }
            }
        }
        for($i=[0:120:360-1]){
            rotate([0,0,$i+60]){
                translate([$offset*2,0]){
                    difference(){
                        ring(r=5,dm=1.9,$fn=100);
                    }
                }
            }
        } 
    }
    
    laserCutLayer(
        trans=[0,0,-$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
        difference(){
            offset(r=$rnd +0.07,$fn=50){
                offset(r=-$rnd,$fn=50){
                    case();
                }
            }
            holes();
        }
    }
    laserCutLayer(
        trans=[0,0,0],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            marker();
            offset(r=$rnd +0.07,$fn=50){
                offset(r=-$rnd,$fn=50){
                for($i=[0:120:360-1]){
                    rotate([0,0,$i]){
                        translate([$offset,0]){
                            difference(){
                                circle($rad,$fn=100);
                                pattern();
                            }
                        }
                    }
                }
            }
        }
    }
}