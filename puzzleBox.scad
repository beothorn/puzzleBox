module buildAll(){

    module combinationRing(pos){
        translate(pos){
            difference() {
            
                $fs=0.1; //mm
                cylinder(d=4, h=0.4, center=true);
                cylinder(d=2, h=0.5, center=true);
            }
        }
    }
    
    combinationRing([0,0,5]);
    combinationRing([0,0,2]);
}

buildAll();