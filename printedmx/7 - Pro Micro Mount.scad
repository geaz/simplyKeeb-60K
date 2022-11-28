include <0 - Variables.scad>

genProMicroSlot();

module genProMicroSlot(){
    union(){
        difference(){
            linear_extrude(bottomLayerHeight-floorHeight)
            square([proMicroWidth/2, proMicroSlotThickness], center = true);
            
            translate([0,proMicroSlotThickness-(proMicroSlotDepth*1.5),proMicroSlotZOffset-floorHeight])
            linear_extrude(proMicroThickness)
            square([proMicroWidth, proMicroSlotDepth], center = true); 
        } 
        
        difference(){
            translate([0,-4.5,bottomLayerHeight-floorHeight-2])
            linear_extrude(2)
            square([proMicroWidth/2, 6], center = true);
            
            translate([0,-4.5,bottomLayerHeight-floorHeight-2])
            linear_extrude(2)
            circle(d = proMicroScrewDiameter);
        }
    }
}