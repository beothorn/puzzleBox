include <combinationRing.scad>

module combinationLockRings(
    ringDiameter,
    ringHeight,
    centralHoleDiameter,
    lockApertureWidth,
    lockApertureDeepness,
    peekHoleDiameter
){    
    /*
    never use 90 or the puzzle breaks because there will
    be a hole where a symbol was supposed to be
    */
    holeAngles = [90,180,30,180,270];
    for(i=[1:5]) {
        translate([0,0,(-i*(0.6+0.5))+0.55]){
            hasAHole = (i != 5);
            holeAngle = holeAngles[i-1];
            combinationRing(
                hasAHole,
                holeAngle,
                ringDiameter,
                ringHeight,
                centralHoleDiameter,
                lockApertureWidth,
                lockApertureDeepness,
                peekHoleDiameter
            );
        }
    }
}