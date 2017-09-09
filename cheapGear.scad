difference(){
    cheapGear(300,0.5,30);
    cheapGear(250,0.5,25);
}
module cheapGear (nteeth,teethDepth,rad){
    polygon(
            [for(ang=[0:360/nteeth:360],ord=[0,360/(nteeth*2)])
                (ord==0)?[rad*sin(ang),rad*cos(ang)]:[(rad+teethDepth)*sin(ang+ord),(rad+teethDepth)*cos(ang+ord)]
            ]
);
}