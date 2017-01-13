module combinationRing(
    hasAHole,
    holeAngle,
    ringDiameter,
    ringHeight,
    centralHoleDiameter,
    lockApertureWidth,
    lockApertureDeepness,
    peekHoleDiameter
){        
    echo(holeAngle);
    ringRadius = ringDiameter/2;
    centralHoleRadius = centralHoleDiameter/2;
    translate([ringRadius,ringRadius,0]){
        difference() {
            cylinder(d=ringDiameter, h=ringHeight, $fs=0.1);
            translate([0,0,-0.5]){
                cylinder(d=centralHoleDiameter, h=10, $fs=0.1);
            }
            circleAngleCompensation = 0.3;
            translate([centralHoleRadius-circleAngleCompensation,-(lockApertureWidth/2),-0.5]){
                cube([lockApertureDeepness+circleAngleCompensation, lockApertureWidth,10]);
            }
            if(hasAHole){
                rotate([0,0,holeAngle]){
                    translate([0,centralHoleRadius + lockApertureDeepness + (peekHoleDiameter/2) ,-0.5]){
                        cylinder(d=peekHoleDiameter, h=10, $fs=0.1);
                    }
                }
            }
        }
    }
}

/*
combinationRing(
    hasAHole = true,
    holeAngle = 90,
    ringDiameter = 5,
    ringHeight = 0.5,
    centralHoleDiameter = 1,
    lockApertureWidth = 0.5,
    lockApertureDeepness = 0.5,
    peekHoleDiameter = 1
);
*/