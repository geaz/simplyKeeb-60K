include <keeb/positions.scad>
include <0 - Variables.scad>
   
union() {
    difference() {
        difference(){
            linear_extrude(middleLayerHeight)
            offset(wallThickness-restInsetSize)
            import("keeb/outline.dxf");
            
            linear_extrude(middleLayerHeight)
            offset(-restInsetSize)
            import("keeb/outline.dxf");
        }    
        
        translate([0,0,middleLayerHeight-hsBoardRestHeight])
        linear_extrude(hsBoardRestHeight)        
        offset(printClearance)
        import("keeb/outline.dxf");
    }
    
    difference() {
        translate([0,0,-ledRestThickness])
        linear_extrude(ledRestThickness)
        offset(wallThickness-restInsetSize)
        import("keeb/outline.dxf");
        
        translate([0,0,-ledRestThickness])
        linear_extrude(ledRestThickness)
        offset(wallThickness-restInsetSize-ledRestWidth)
        import("keeb/outline.dxf");
        
        genProMicroHole();
        genTrrsHole();
   }        
}
//genTestScrewPosts();

module genProMicroHole(){
    translate([proMicroPosition[0],proMicroPosition[1]+proMicroLength,-1])
    rotate([0,0,proMicroPosition[2]])
    linear_extrude(1)
    square([usbWidth, 20], center = true);    
}

module genTrrsHole(){
    if(withTrrs){
        translate([trrsPosition[0],trrsPosition[1]-1,-1])
        rotate([0,0,trrsPosition[2]])  
        linear_extrude(1)
        square([trrsWidth, 10.3], center = true);
        
        translate([trrsPosition[0]-0.5,trrsPosition[1]+1,-1])
        rotate([0,0,trrsPosition[2]])  
        linear_extrude(0.5)
        square([trrsWidth, trrsLength], center = true);
    }
}

module genTestScrewPosts(){
    for(screw = screwPositions){
        translate([screw[0],screw[1],0])
        linear_extrude(bottomLayerHeight)
        circle(d = screwPostDiameter);
    }
}