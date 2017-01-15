include <combinationRing.scad>

module combinationLockRings(
    ringCount,
    ringDiameter,
    ringHeight,
    extraSpacing,
    centralHoleDiameter,
    lockApertureWidth,
    lockApertureDeepness,
    peekHoleDiameter
){    
    /*
    never use 90 or the puzzle breaks because there will
    be a hole where a symbol was supposed to be
    */
    holeAngles = [
        90,
        180,
        30,
        180,
        30,
        30,
        180,
        270,
        30,
        180,
        180,
        270,
        180,
        270];
    
    supportPlusSpace = ringHeight*2+extraSpacing;
    
    for(i=[1:ringCount]) {
        translate([0,0,(-i*supportPlusSpace)+ringHeight]){
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
};