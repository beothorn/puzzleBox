include <combinationLockSupport.scad>
include <combinationLockRings.scad>

extraSpacing = 0.1;

ringCount = 5;
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
    ringCount+1,
    ringDiameter,
    supportWidth,
    ringHeight,
    mainColumnsWidth,
    supportLength
);

translate([((supportWidth/2)/2),-1,-(ringHeight*2+extraSpacing)]){
    combinationLockRings(
        ringDiameter,
        ringHeight,
        centralHoleDiameter,
        lockApertureWidth,
        lockApertureDeepness,
        peekHoleDiameter
    );
}