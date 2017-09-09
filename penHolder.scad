use<lasercut.scad>
$thickness=2.85;
$flat = true;
$num = 0;
module side(){
    difference(){
        union(){
            hull(){
                translate([100-(57+$thickness*2)/2,5]){
                    square([100,20],center = true);
                }
                translate([$thickness,-$thickness]){
                    square([57+$thickness*4,9.5+$thickness*6],center = true);
                }
            }
        }
        for (a=[-1:1]){
            translate([a*$thickness*5-$thickness/4,9.5/2+$thickness/2]){
                square([2.5*$thickness,$thickness],center = true);
            }
        }
        for (a=[4:7]){
            translate([a*$thickness*5-$thickness/4,9.5/2+$thickness/2]){
                square([2.5*$thickness,$thickness],center = true);
            }
        }
        translate([57/2+$thickness,0]){
            square([$thickness*2,9.5+$thickness],center = true);
        }
        translate([-57/2-$thickness,0]){
            square([$thickness*2,9.5+$thickness],center = true);
        }
        translate([57/2+$thickness+$thickness,0]){
            square([$thickness*2,9.5+2*$thickness],center = true);
        }
        translate([-57/2-$thickness-$thickness,0]){
            square([$thickness*2,9.5+2*$thickness],center = true);
        }
    }
}
module screw(){
    difference(){
        square([44.5+$thickness*4,9.5+$thickness*2],center = true);
        translate([35/2,0,0]){
            circle(r=2.5,center=true,$fn=100);
        }
        translate([-35/2,0,0]){
            circle(r=2.5,center=true,$fn=100);
        }
        translate([44.5/2+$thickness/2,(9.5+$thickness*2)/2]){
            square([$thickness,$thickness*1],center=true);
        }
        translate([44.5/2+$thickness/2,-(9.5+$thickness*2)/2]){
            square([$thickness,$thickness*1],center=true);
        }
        translate([-44.5/2-$thickness/2,(9.5+$thickness*2)/2]){
            square([$thickness,$thickness*1],center=true);
        }
        translate([-44.5/2-$thickness/2,-(9.5+$thickness*2)/2]){
            square([$thickness,$thickness*1],center=true);
        }
        translate([-$thickness*1.5 - (44.5-$thickness*3)/4,9.5/2+$thickness]){
            square([(44.5-$thickness*3)/2,$thickness*2],center=true);
        }
        translate([$thickness*1.5 + (44.5-$thickness*3)/4,9.5/2+$thickness]){
            square([(44.5-$thickness*3)/2,$thickness*2],center=true);
        }
    }
}
assembly($num,$flat){
laserCutLayer(trans=[44.5/2+$thickness/2,0,0],rot=[0,90,0],thickness=$thickness,flatten = $flat){
    side();
}
laserCutLayer(trans=[-44.5/2-$thickness/2,0,0],rot=[0,90,0],thickness=$thickness,flatten = $flat){
    side();
}

laserCutLayer(trans=[0,0,57/2+$thickness/2],thickness=$thickness,flatten = $flat){
    screw();
}
laserCutLayer(trans=[0,0,-57/2-$thickness/2],thickness=$thickness,flatten = $flat){
    screw();
}
laserCutLayer(trans=[(44.7/2+11.8/2)/2,9.5/2+$thickness/2+$thickness*2,-60],rot=[0,0,0],thickness=$thickness,flatten = $flat){
    translate([0,4]){
        difference(){
            union(){
                square([15,$thickness*3+8],center=true);
                translate([0,-($thickness*3+8)/2-5/2]){
                    square([4,$thickness+5],center=true);
                }
                translate([0,-($thickness*3+8)/2-5/2-$thickness]){
                    square([4*3,5],center=true);
                }
            }
            polygon([[0,0],[15,$thickness*3+8],[-15,$thickness*3+8]]);
            translate([-15/4,-$thickness*1.5]){
                square([15/2,$thickness],center=true);
            }
        }
    }
}
*laserCutLayer(trans=[(44.7/2+11.8/2)/2,9.5/2+$thickness/2+$thickness*2,-60],rot=[0,-60,0],thickness=$thickness,flatten = $flat){
    difference(){
        union(){
            square([12,$thickness*3],center=true);
            translate([0,$thickness/2+8]){
                difference(){
                    square([25,16],center=true);
                    translate([0,10]){
                        circle(r = 12,$fn=100);
                    }
                }
            }
        }
        translate([10,1.5]){
            circle(r=1.2,$fn=100);
        }
        hull(){
            translate([-10,3.5]){
                circle(r=1.2,$fn=100);
            }
            translate([-13,1.5]){
                circle(r=1.2,$fn=100);
            }
        }
        translate([0,-$thickness]){
            square([7,3],center = true);
        }
        translate([0,2.5/2+$thickness/2+0.5]){
            square([7,2.5],center = true);
        }
        translate([0,-8/2+$thickness/2+0.5]){
            square([3,8],center = true);
        }
    }
}

laserCutLayer(trans=[(44.7/2+11.8/2)/2,9.5/2+$thickness/2+$thickness*2,-85],rot=[90,0,0],thickness=$thickness,flatten = $flat){
    difference(){
        square([15,70],center = true);
        translate([0,5]){
            translate([15/4,20]){
                    square([15/2,$thickness],center = true);
            }
            translate([15/2,0]){
                hull(){
                    translate([-1,0]){
                        circle(r=1.5,$fn=15);
                    }
                    translate([1,0]){
                        circle(r=1.5,$fn=15);
                    }
                }
            }
            translate([-15/2,0]){
                hull(){
                    translate([-1,0]){
                        circle(r=1.5,$fn=15);
                    }
                    translate([1,0]){
                        circle(r=1.5,$fn=15);
                    }
                }
            }
            translate([15/4,-20]){
                    square([15/2,$thickness],center = true);
            }
        }
    }
 }
*laserCutLayer(trans=[(44.7/2+11.8/2)/2,9.5/2+$thickness/2+$thickness*2,-85],rot=[90,0,0],thickness=$thickness,flatten = $flat){
    difference(){
        square([15,70],center = true);
        translate([0,5]){
            translate([0,20]){
                rotate([0,0,60]){
                    square([12,$thickness],center = true);
                }
            }
            translate([0,-20]){
                rotate([0,0,-60]){
                    square([12,$thickness],center = true);
                }
            }
        }
    }
}
laserCutLayer(trans=[0,9.5/2+$thickness/2,0],rot=[90,0,0],thickness=$thickness,flatten  = $flat){
    difference(){
        translate([0,(57+$thickness*2)/2-100+50/2]){
            square([44.5,100 + 50],center=true);
        }
        translate([0,57/2+$thickness/2]){
            square([$thickness*3,$thickness],center=true);
        }
        translate([0,-57/2-$thickness*1.5]){
            square([$thickness*3,$thickness*3],center=true);
        }
        translate([-44.7/2+$thickness*1.5,-57/2-$thickness*2]){
            square([$thickness*3,$thickness*2],center=true);
        }
        translate([44.7/2-$thickness*1.5,-57/2-$thickness*2]){
            square([$thickness*3,$thickness*2],center=true);
        }
        translate([0,57/2+$thickness/2]){
            square([$thickness*3,$thickness],center=true);
        }
        translate([0,-60]){
            translate([0,13.7]){
                circle(r=1.5,$fn=100);
            }
            translate([0,-13.7]){
                circle(r=1.5,$fn=100);
            }
            square([11.8,22.8],center=true);
        }
        translate([(44.7/2+11.8/2)/2,-110]){
            translate([0,-5/2-$thickness/2]){
                square([5,5],center=true);
            }
            hull(){
                square([4,$thickness],center=true,$fn=100,center=true);
                translate([0,10]){
                square([4,$thickness],center=true,$fn=100,center=true);
                }
            }
            translate([0,40]){
                translate([0,10 + 5/2+$thickness/2]){
                    square([5,5],center=true);
                }
                hull(){
                square([4,$thickness],center=true,$fn=100,center=true);
                    translate([0,10]){
                square([4,$thickness],center=true,$fn=100,center=true);
                    }
                }
            }
        }
        translate([-(44.7/2+11.8/2)/2,-110]){
            translate([0,-5/2-$thickness/2]){
                square([5,5],center=true);
            }
            hull(){
                square([4,$thickness],center=true,$fn=100,center=true);
                translate([0,10]){
                square([4,$thickness],center=true,$fn=100,center=true);
                }
            }
            translate([0,40]){
                translate([0,10 + 5/2+$thickness/2]){
                    square([5,5],center=true);
                }
                hull(){
                square([4,$thickness],center=true,$fn=100,center=true);
                    translate([0,10]){
                square([4,$thickness],center=true,$fn=100,center=true);
                    }
                }
            }
        }
    }
    translate([44.5/2+$thickness/2,0]){
        for (a=[-1:1]){
            translate([0,a*$thickness*5]){
                square([$thickness,2*$thickness],center = true);
                translate([$thickness,-$thickness/4]){
                    square([$thickness,2.5*$thickness],center = true);
                }
            }
        }
        for (a=[-7:-4]){
            translate([0,a*$thickness*5]){
                square([$thickness,2*$thickness],center = true);
                translate([$thickness,-$thickness/4]){
                    square([$thickness,2.5*$thickness],center = true);
                }
            }
        }
    }
    translate([-44.5/2-$thickness/2,0]){
        for (a=[-1:1]){
            translate([0,a*$thickness*5]){
                square([$thickness,2*$thickness],center = true);
                translate([-$thickness,-$thickness/4]){
                    square([$thickness,2.5*$thickness],center = true);
                }
            }
        }
        for (a=[-7:-4]){
            translate([0,a*$thickness*5]){
                square([$thickness,2*$thickness],center = true);
                translate([-$thickness,-$thickness/4]){
                    square([$thickness,2.5*$thickness],center = true);
                }
            }
        }
    }
}
}
%difference(){
    cube([44.5,9.5,57],center = true);

    translate([35/2,0,0]){
        cylinder(r=2.5,70,center=true,$fn=100);
    }

    translate([-35/2,0,0]){
        cylinder(r=2.5,70,center=true,$fn=100);
    }
}