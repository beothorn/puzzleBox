use <combinationlock/combinationLockSupport.scad>
use <combinationlock/combinationLockRings.scad>
use <combinationlock/centralPart.scad>

extraSpacing = 0.1;

ringCount = 5;
ringDiameter = 5;
ringHeight = 0.5;

mainColumnsWidth = 0.5;

centralHoleDiameter = 1;
lockApertureWidth = 0.5;
lockApertureDeepness = 0.5;
peekHoleDiameter = 1;

combinationLockSupport(
    extraSpacing,
    ringCount+1,
    ringDiameter,
    ringHeight,
    peekHoleDiameter,
    mainColumnsWidth
);

suportWidth = ringDiameter* 0.6;
translate([mainColumnsWidth, (-(ringDiameter/2))+(suportWidth/2)  ,-(ringHeight*2+extraSpacing)]){
    combinationLockRings(
        ringCount,
        ringDiameter,
        ringHeight,
        extraSpacing,
        centralHoleDiameter,
        lockApertureWidth,
        lockApertureDeepness,
        peekHoleDiameter
    );
}