include <keeb/positions.scad>
include <0 - Variables.scad>

difference(){
union(){
    difference(){
        genBottomLayer();
        genTrrsHole();
        genProMicroHoles();
    }
    
    genTrrsSlot();
    genProMicroSlot();
    genScrewPosts();
}

genScrewHoles();
}

module genBottomLayer(){ 
    union(){
        difference(){
            linear_extrude(bottomLayerHeight)
            offset(wallThickness-restInsetSize)
            import("keeb/outline.dxf");
            
            linear_extrude(bottomLayerHeight)
            offset(-restInsetSize)
            import("keeb/outline.dxf");
        } 

        linear_extrude(floorHeight)
        import("keeb/outline.dxf");
    }
}

module genTrrsHole(){
    if(withTrrs){
        translate([trrsPosition[0],trrsPosition[1],0])
        rotate([0,0,trrsPosition[2]])
        translate([0,1,floorHeight])
        linear_extrude(trrsHeight)
        square([trrsWidth,trrsLength+2], center = true);
    }
}

module genTrrsSlot(){
    if(withTrrs){
        translate([trrsPosition[0],trrsPosition[1],0])
        rotate([0,0,trrsPosition[2]])        
        difference(){
            linear_extrude(trrsHeight*(2/3))
            square([trrsWidth+trrsSlotThickness*2,trrsLength+trrsSlotThickness*2], center = true); 

            translate([0,1,floorHeight])
            linear_extrude(trrsHeight)
            square([trrsWidth,trrsLength+2], center = true); 
        }
    }
}

module genProMicroHoles(){
    translate([proMicroPosition[0],proMicroPosition[1],0])
    rotate([0,0,proMicroPosition[2]]){
        translate([0,proMicroLength+proMicroSlotDepth,proMicroThickness+proMicroSlotZOffset-1])
        linear_extrude(usbHeight)
        square([usbWidth, 2*wallThickness], center = true);

        translate([0,proMicroLength+proMicroSlotDepth,proMicroSlotZOffset])
        linear_extrude(proMicroThickness)
        square([proMicroWidth, proMicroSlotDepth], center = true);    
    }
}

module genProMicroSlot(){
    translate([proMicroPosition[0],proMicroPosition[1]+proMicroSlotDepth,0])
    rotate([0,0,proMicroPosition[2]]){
        difference(){
            linear_extrude(bottomLayerHeight)
            square([proMicroWidth/2, proMicroSlotThickness], center = true);
            
            translate([0,proMicroSlotThickness-(proMicroSlotDepth*1.5),proMicroSlotZOffset])
            linear_extrude(proMicroThickness)
            square([proMicroWidth, proMicroSlotDepth], center = true);
            
            translate([0,proMicroSlotThickness,bottomLayerHeight-0.5])
            rotate([45,0,0])
            linear_extrude(proMicroSlotThickness)
            square([proMicroWidth, proMicroSlotThickness], center = true); 
        }        
    }
}

module genScrewHoles(){
    for(screw = screwPositions){
        translate([screw[0],screw[1],floorHeight])
        linear_extrude(bottomLayerScrewHeight)
        circle(d = screwDiameter);
    }
}

module genScrewPosts(){
    for(screw = screwPositions){
        translate([screw[0],screw[1],0])
        linear_extrude(bottomLayerScrewHeight)
        circle(d = screwPostDiameter);
    }
}