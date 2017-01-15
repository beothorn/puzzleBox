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

module combinationLockSupport(
    extraSpacing,
    ringCount,
    ringDiameter,
    supportWidth,
    ringHeight,
    mainColumnsWidth,
    supportLength
){
    union(){   
        
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
        translate([peekHoleSpace,0,-(supportSectionHeight+extraSpacing)]){
            cube([mainColumnsWidth,supportWidth,supportSectionHeight+extraSpacing]);
        }
    } 
}

/*
extraSpacing = 0.1;

ringCount = 6;
ringDiameter = 5;
ringHeight = 0.5;

supportWidth = 3;
supportLength = 6;   

mainColumnsWidth = 0.5;

centralHoleDiameter = 1;
lockApertureWidth = 0.5;
lockApertureDeepness = 0.5;
peekHoleDiameter = 1;

combinationLockSupport(
    extraSpacing,
    ringCount,
    ringDiameter,
    supportWidth,
    ringHeight,
    mainColumnsWidth,
    supportLength
);
*/