use<lasercut.scad>
dnum = 0;
dflat = false;
$thickness=6.15;
$flat = dflat;
$num = dnum;
$kerf = 0.1;

module ssquare($size){
    square($size,true);
    translate([$size[0]/2,$size[1]/2]){
        circle(r=1,$fn=50);
    }
    translate([-$size[0]/2,$size[1]/2]){
        circle(r=1,$fn=50);
    }
    translate([-$size[0]/2,-$size[1]/2]){
        circle(r=1,$fn=50);
    }
    translate([$size[0]/2,-$size[1]/2]){
        circle(r=1,$fn=50);
    }
}

module holder(){
    translate([-7.5,0]){
        difference(){
            union(){
                square([15,20],true);
                translate([$thickness/2,0]){
                    square([15+$thickness-2,10],true);
                }
            }
            circle(r=6.86/2,$fn=30);
        }
    }
}

module inner(){
    translate([-30/2,0]){
        difference(){
            union(){
                square([30,46-$thickness+$kerf],true);
                translate([$thickness/2,0]){
                    square([30+$thickness-2,10],true);
                }
                translate([-15,0]){
                    square([10,46+$thickness+$kerf-2],true);
                }
            }
            hull(){
                translate([-5,0]){
                    circle(r=7.2/2,$fn=30);
                }
                translate([-20,0]){
                    circle(r=7.2/2,$fn=30);
                }
            }
        }
    }
}

module holderLong(){
    translate([-30/2,0]){
        difference(){
            union(){
                square([30,20],true);
                translate([$thickness/2,0]){
                    square([30+$thickness-2,10],true);
                }
            }
            translate([-7,0]){
                circle(r=6.86/2,$fn=30);
            }
        }
    }
}

module side(){
    translate([-7.5,0]){
        difference(){
            union(){
                square([15,80],true);
                translate([-15/2,0]){
                    difference(){
                        circle(r=38,$fn=100);
                        translate([100,0]){
                            square([200,200],true);
                        }
                    }
                }
                translate([$thickness/2,0]){
                    square([15+$thickness-2,10],true);
                }
                translate([$thickness/2,30]){
                    square([15+$thickness-2,10],true);
                }
                translate([$thickness/2,-30]){
                    square([15+$thickness-2,10],true);
                }
            }
            translate([-15/2,0]){
                circle(r=5/2-$kerf,$fn=30);
            }
            
            translate([-22.5,20]){
                square([10-$kerf,$thickness-$kerf],true);
            }
            translate([-22.5,-20]){
                square([10-$kerf,$thickness-$kerf],true);
            }
        }
    }
}
module holderSide(){
    difference(){
        hull(){
            translate([-40,0]){
                square([10,40],true);
            }
            circle(r=20/2,$fn=100);
        }
        circle(r=14/2,$fn=100);
        translate([-40-$thickness,0]){
            square([$thickness*2,20],true);
        }
    }
}
assembly($num,$flat){
   laserCutLayer(
        trans=[0,0,$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
        difference(){
            union(){
                hull(){
                    translate([0,35,0]){
                        square([100,70],true);
                    }
                    circle(r=50,$fn=100);
                }
                hull(){
                    translate([50-5,65]){
                        square([10,10],true);
                    }
                    translate([50-5+1.5,80]){
                        circle(r=3,$fn=50);
                    }
                }
            }
            translate([49.5,78]){
                circle(r=1.5,$fn=30);
            }
            circle(r=5/2,$fn=50);
            translate([$thickness,60,0]){
                square([$thickness-$kerf,10-$kerf],true);
            }
            translate([50-$thickness,60,0]){
                square([$thickness-$kerf,10-$kerf],true);
            }
        }
   }
   laserCutLayer(
        trans=[0,0,$thickness*2],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
        difference(){
            union(){
                circle(r=50,$fn=200);
                hull(){
                    translate([-20,20.0]){
                        square([40,10],true);
                    }
                    translate([-6,90.0]){
                        circle(r=6,$fn=50);
                    }
                }
            }
            translate([-12.5,90]){
                circle(r=2,$fn=20);
            }
            circle(r=14/2,$fn=50);
            translate([20,-0]){
                square([$thickness-$kerf,10-$kerf],true);
            }
            translate([-20,-0]){
                square([$thickness-$kerf,10-$kerf],true);
            }
            translate([0,23]){
                square([10-$kerf,$thickness-$kerf],true);
            }
            translate([30,23]){
                square([10-$kerf,$thickness-$kerf],true);
            }
            translate([-30,23]){
                square([10-$kerf,$thickness-$kerf],true);
            }
            translate([0,-23]){
                square([10-$kerf,$thickness-$kerf],true);
            }
            translate([30,-23]){
                square([10-$kerf,$thickness-$kerf],true);
            }
            translate([-30,-23]){
                square([10-$kerf,$thickness-$kerf],true);
            }
        }
   }
   
   laserCutLayer(
        trans=[0,0,$thickness*3],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
        difference(){
            difference(){
                hull(){
                    translate([-20,20.0]){
                        square([40,10],true);
                    }
                    translate([-6,90.0]){
                        circle(r=6,$fn=50);
                    }
                }
            }
            circle(r=50,$fn=200);
            translate([-12.5,90]){
                circle(r=2,$fn=20);
            }
            circle(r=1.5,$fn=30);
        }
   }
   
   laserCutLayer(
        trans=[$thickness,60,$thickness*1.5],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
            holder();
   }
   laserCutLayer(
        trans=[50-$thickness,60,$thickness*1.5],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
            holder();
   }
   laserCutLayer(
        trans=[0,-23,$thickness*2.5],
        rot=[0,90,-90],
        thickness=$thickness,
        flatten = $flat){
            side();
   }
   laserCutLayer(
        trans=[0,23,$thickness*2.5],
        rot=[0,90,-90],
        thickness=$thickness,
        flatten = $flat){
            side();
   }
   laserCutLayer(
        trans=[0,23+$thickness,$thickness*2.5+15],
        rot=[0,90,-90],
        thickness=$thickness,
        flatten = $flat){
            holderSide();
   }
   laserCutLayer(
        trans=[0,-(23+$thickness),$thickness*2.5+15],
        rot=[0,90,-90],
        thickness=$thickness,
        flatten = $flat){
            holderSide();
   }
   laserCutLayer(
        trans=[-20,-0,$thickness*2.5],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
            inner();
   }
   laserCutLayer(
        trans=[20,-0,$thickness*2.5],
        rot=[0,90,0],
        thickness=$thickness,
        flatten = $flat){
            inner();
            difference(){
                translate([-30,0]){
                    square([30,40],true);
                }
                translate([-40,10]){
                    circle(r=1.5,$fn=30);
                }
                translate([-40,-10]){
                    circle(r=1.5,$fn=30);
                }
            }
   }
   laserCutLayer(
        trans=[0,-0,$thickness*2 + 60],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                hull(){
                    square([40,52+$thickness*2],true);
                    translate([-30,0]){
                        square([10,30],true);
                    }
                }
                translate([20,26+$thickness]){
                    square([20,$thickness*2],true);
                }
                translate([20,-26-$thickness]){
                    square([20,$thickness*2],true);
                }
                translate([-20,-26-$thickness]){
                    square([20,$thickness*2],true);
                }
                translate([-20,26+$thickness]){
                    square([20,$thickness*2],true);
                }
                circle(r=6.2/2,$fn=60);
                
                translate([10,0]){
                    square([$thickness-$kerf,10-$kerf],true);
                }
                translate([-30,0]){
                    square([$thickness-$kerf,10-$kerf],true);
                }
            }
   }
   laserCutLayer(
        trans=[10,-0,$thickness*1.5 + 60],
        rot=[0,-90,0],
        thickness=$thickness,
        flatten = $flat){
            holderLong();
   }
   laserCutLayer(
        trans=[-30,-0,$thickness*1.5 + 60],
        rot=[0,-90,0],
        thickness=$thickness,
        flatten = $flat){
            holderLong();
   }
   
   laserCutLayer(
        trans=[0,0,200],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                circle(r=10,$fn=100);
                circle(r=5/2,$fn=100);
            }
   }
   
   laserCutLayer(
        trans=[0,0,250],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                circle(r=73.1/2,$fn=100);
                circle(r=65.3/2,$fn=100);
            }
   }
   
   laserCutLayer(
        trans=[0,0,250-$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                circle(r=73.1/2,$fn=100);
                circle(r=20,$fn=100);
            }
   }
   laserCutLayer(
        trans=[0,0,300-$thickness],
        rot=[0,0,0],
        thickness=$thickness,
        flatten = $flat){
            difference(){
                circle(r=51.48/2,$fn=100);
                circle(r=38.21/2,$fn=100);
            }
   }
}