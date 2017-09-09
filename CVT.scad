use<gear.scad>
use<cheapGear.scad>

ringRad=30;
ringWid=5;
buttonRad=8;

%difference(){
    
    cheapGear(300,0.5,ringRad+ringWid/2-0.5);
    cheapGear(300,0.5,ringRad-ringWid/2);
}

%difference(){
    circle(r=ringRad+ringWid/2,$fn=100);
    circle(r=ringRad-ringWid/2,$fn=100);
}

%translate([ringRad,0,1]){
    circle(r=buttonRad,$fn=100);
}
translate([0,0,0]){
    intersection(){
        translate([ringRad,0,0]){
            circle(r=buttonRad,$fn=100);
        }
        circle(r=ringRad-ringWid/2,$fn=100);
    }
}

translate([0,0,0]){
    difference(){
        translate([ringRad,0,0]){
            circle(r=buttonRad,$fn=100);
        }
        circle(r=ringRad+ringWid/2,$fn=100);
    }
}

%translate([0,0,1]){
    difference(){
        circle(r=57,$fn=100);
        hull(){
            translate([13,0]){
                circle(r=8,$fn=100);
            }
            translate([43,0]){
                circle(r=8,$fn=100);
            }
        }
    }
}