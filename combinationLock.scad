include <combinationRing.scad>

module combinationLockSupportPart(
    supportWidth,
    supportLength,
    supportHeight
){
    difference(){
        insideAppertureRadius = supportWidth/2;
        
        cube([supportLength,supportWidth, supportHeight]);
        insideAppertureOffset = (supportWidth-insideAppertureRadius)/2;
        translate([insideAppertureOffset, insideAppertureOffset,0]){
            cube([supportLength,insideAppertureRadius,10]);
        }
        translate([insideAppertureOffset*2, insideAppertureOffset,0]){
            cube([insideAppertureRadius,insideAppertureRadius,10]);
        }
    }
}

module combinationLockSupport(){
    union(){
        extraSpacing = 0.1;
        ringCount = 5;
        ringDiameter = 5;
        supportWidth = 3;
        ringHeight = 0.5;
        mainColumnsWidth = 0.5;
        supportLength = 6;        
        
        wholeRingPlusExtraSupport = ringDiameter + (ringDiameter *0.3);
        supportSectionHeight = ringHeight;
        supportPlusSpace = ringHeight+supportSectionHeight+extraSpacing;
        
        peekHoleSpace = (ringDiameter/2) ;
        
        for(i=[0:ringCount]) {
            translate([0,0,-i*supportPlusSpace]){
                combinationLockSupportPart(supportWidth, wholeRingPlusExtraSupport , supportSectionHeight);
            }
        }
        mainWallHeight = ringCount*supportPlusSpace;
        translate([0,0, -mainWallHeight ]){
            cube([((supportWidth/2)/2),mainColumnsWidth,mainWallHeight]);
        }
        translate([0, supportWidth-mainColumnsWidth, -mainWallHeight ]){//light to see symbols
            cube([((supportWidth/2)/2),mainColumnsWidth,mainWallHeight]);
        }
        translate([peekHoleSpace,0,0]){
            cube([wholeRingPlusExtraSupport-peekHoleSpace,supportWidth,supportSectionHeight]);
        }
    } 
}

module combinationLockRings(){
    
    /*
    never use 90 or the puzzle breaks because there will
    be a hole where a symbol was supposed to be
    */
    holeAngles = [90,180,30,180,270];
    for(i=[1:5]) {
        translate([0,0,(-i*(0.6+0.5))+0.55]){
            combinationRing(
                hasAHole = (i != 5),
                holeAngle = holeAngles[i-1],
                ringDiameter = 5,
                ringHeight = 0.5,
                centralHoleDiameter = 1,
                lockApertureWidth = 0.5,
                lockApertureDeepness = 0.5,
                peekHoleDiameter = 1
            );
        }
    }
}

combinationLockSupport();

translate([((3/2)/2),-1,0]){
    combinationLockRings();
}