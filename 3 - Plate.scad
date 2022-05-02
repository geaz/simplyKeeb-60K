include <keeb/positions.scad>
include <0 - Variables.scad>

difference(){
    union(){  
        if(switchHoleClearance>0){
            difference(){
                linear_extrude(plateHeight)
                import("keeb/outline.dxf");
                
                linear_extrude(plateHeight)
                offset(-switchHoleClearance)
                import("keeb/outline.dxf");
            }
        }
        
        linear_extrude(plateHeight)
        offset(-switchHoleClearance)
        import("keeb/plate.dxf");
        
        genScrewPosts();
        genBendPrevention();
    }

    genScrewHoles();
}


module genScrewHoles(){
    for(screw = screwPositions){
        translate([screw[0],screw[1],-(topLayerHeight-plateHeight)])
        linear_extrude(topLayerHeight)
        circle(d = screwDiameter);
    }
}

module genScrewPosts(){
    for(screw = screwPositions){
        translate([screw[0],screw[1],-(topLayerHeight-plateHeight)])
        linear_extrude(topLayerHeight-plateHeight)
        circle(d = screwPlatePostDiameter);
    }
}

module genBendPrevention(){
    for(post = bendPreventions){
        translate([post[0],post[1],-(topLayerHeight-plateHeight)])
        linear_extrude(topLayerHeight-plateHeight)
        square([30,2], center = true);
    }
}