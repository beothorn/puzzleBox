module combinationLockSupportPart(
    supportWidth,
    supportLength,
    supportHeight,
    mainColumnsWidth,
    peekHoleDiameter
){
    difference(){
        insideAppertureRadius = supportWidth/2;
        
        cube([supportLength,supportWidth, supportHeight]);
        
        translate([mainColumnsWidth, (supportWidth/2) - (peekHoleDiameter/2),0]){
            cube([supportLength,peekHoleDiameter,10]);
        }
    }
}

module combinationLockSupport(
    extraSpacing,
    ringCount,
    ringDiameter,
    ringHeight,
    peekHoleDiameter,
    mainColumnsWidth
){
    supportWidth = ringDiameter*0.6;
    union(){   
        
        wholeRingPlusExtraSupport = ringDiameter + (ringDiameter *0.3);
        supportSectionHeight = ringHeight;
        supportPlusSpace = ringHeight+supportSectionHeight+extraSpacing;
        
        for(i=[0:ringCount]) {
            translate([0,0,-i*supportPlusSpace]){
                combinationLockSupportPart(
                    supportWidth, 
                    wholeRingPlusExtraSupport , 
                    supportSectionHeight, 
                    mainColumnsWidth, 
                    peekHoleDiameter
                );
            }
        }
        //main Wall Left Column
        mainWallHeight = ringCount*supportPlusSpace;
        translate([0,0, -mainWallHeight ]){
            cube([mainColumnsWidth,mainColumnsWidth,mainWallHeight]);
        }
        //main Wall Right Column
        translate([0, supportWidth-mainColumnsWidth, -mainWallHeight ]){//light to see symbols
            cube([mainColumnsWidth,mainColumnsWidth,mainWallHeight]);
        }
        //Upper lid
        translate([peekHoleDiameter*2+mainColumnsWidth,0,0]){
            cube([wholeRingPlusExtraSupport-peekHoleDiameter*2- mainColumnsWidth,supportWidth,supportSectionHeight]);
        }
        //Internal wall to hide center hole
        translate([peekHoleSpace,0,-(supportSectionHeight+extraSpacing)]){
           cube([0.1,supportWidth,supportSectionHeight+extraSpacing]);
        }
    } 
}


/*
extraSpacing = 0.1;

ringCount = 6;
ringDiameter = 15;
ringHeight = 0.5;

mainColumnsWidth = 0.5;

centralHoleDiameter = 1;
lockApertureWidth = 0.5;
lockApertureDeepness = 0.5;
peekHoleDiameter = 1;

combinationLockSupport(
    extraSpacing,
    ringCount,
    ringDiameter,
    ringHeight,
    1,
    mainColumnsWidth
);
*/