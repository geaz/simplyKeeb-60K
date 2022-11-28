include <keeb/positions.scad>
include <0 - Variables.scad>
  
difference() {
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
            linear_extrude(ledRestHeight)
            offset(wallThickness-restInsetSize)
            import("keeb/outline.dxf");
            
            linear_extrude(ledRestHeight)
            offset(-ledRestWidth-restInsetSize)
            import("keeb/outline.dxf");
       }        
    }
            
    genProMicroHole();
    genTrrsHole();
}
//genTestScrewPosts();

module genProMicroHole(){
    translate([proMicroPosition[0],proMicroPosition[1]+proMicroLength,0])
    rotate([0,0,proMicroPosition[2]])
    linear_extrude(0.5)
    square([usbWidth, 20], center = true);
   
    translate([proMicroPosition[0],proMicroPosition[1]+proMicroLength-9.2,0])
    rotate([0,0,proMicroPosition[2]])
    linear_extrude(1)
    square([usbWidth, 20], center = true); 
}

module genTrrsHole(){
    if(withTrrs){
        translate([trrsPosition[0]+2,trrsPosition[1]-7.85,0])
        rotate([0,0,trrsPosition[2]])  
        linear_extrude(1)
        square([trrsWidth*2, trrsLength*2], center = true);
    }
}

module genTestScrewPosts(){
    for(screw = screwPositions){
        translate([screw[0],screw[1],0])
        linear_extrude(bottomLayerHeight)
        circle(d = screwPostDiameter);
    }
}