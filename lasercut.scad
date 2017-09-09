laserScale = 1;
$flatten = false;
$childNum = 1;
assembly($childNum,$flatten){
for($i=[0:4]){
    assembly($childNum,$flatten){
        laserCutLayer([$i*2.6,0,0], [0,90,0],2.6,$flatten){
            circle(r=5+5*$i,center = true);
        }
        
    }
}
}

module pass(){
    children();
}

pass()assembly($childNum,$flatten)circle(r=10);

module assembly(childNum=0,flatten=true){
   // echo($parent_modules);
   // echo(parent_module(1));
    for(i=[0:$children-1]){
        if(i==childNum || !flatten){
            children(i);
        }
    }
}

module laserCutLayer(trans = [0,0,0],rot = [0,0,0],thickness=2.6, flatten = false,visible = true){
    if(visible){
        if(flatten){
            scale([laserScale,laserScale,laserScale]){
                children();
            }
        }else{
            translate(trans){
                rotate(rot){
                    translate([0,0,-thickness/2]){
                        linear_extrude(height=thickness){
                            children();
                        }
                    }
                }
            }
        }
    }else{
        %children();
    }
}