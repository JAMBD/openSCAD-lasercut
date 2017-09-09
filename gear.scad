gear(2,0.5,49,1.5,0.1);
translate([-17,0]){
linGear(2,0.5,20,5,0.1);
}

module linGear(pitch,ratio,nTeeth,depth,gap){
    rad=(pitch*nTeeth)/(2*PI);
    deminkowski((gap < 0)){
			union(){
				for(ang=[-nTeeth/2*pitch:pitch:pitch*nTeeth/2]){
						translate([0,ang]){
							polygon([[-depth/2,-(pitch-pitch/4)/2],[0,-(pitch-pitch/4)/2],[pitch*ratio,-pitch/8],[pitch*ratio,pitch/8],[0,(pitch-pitch/4)/2],[-depth/2,(pitch-pitch/4)/2]]);
						}
				}
                translate([-depth/2,0]){
                    square([depth,(nTeeth+1)*pitch],center = true);
                }
			}
			circle(r=abs(gap),$fn=20);
		}
    }
    

module gear(pitch,ratio,nTeeth,hole,gap){
	rad=(pitch*nTeeth)/(2*PI);
	difference(){
		if(hole > rad){
			circle(r=hole,$fn=100,center=true);
		}
		deminkowski((gap < 0)){
			union(){
				for(ang=[0:360/(rad*2*PI/pitch):360]){
					rotate(ang){
						translate([rad-pitch*ratio/2,0]){
							polygon([[-rad,0],[0,-(pitch-pitch/4)/2],[pitch*ratio,-pitch/8],[pitch*ratio,pitch/8],[0,(pitch-pitch/4)/2]]);
						}
					}
				}
				circle(r=rad-pitch*ratio/2,$fn=100,center=true);
			}
			circle(r=abs(gap),$fn=20);
		}
		if(hole<=rad){
			circle(r=hole,$fn=100,center=true);
		}
	}

}
module deminkowski(en) {
    if(en){
        minkowski() { // Stage 1
            children(0);
            children(1);
        }
    }else{
        difference(){
            children(0);
            minkowski(){
                difference(){
                    minkowski() { // Stage 1
                        children(0);
                        children(1);
                    }
                    children(0);
                }
                children(1);
            }
        }
    }
}
