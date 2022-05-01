include <keeb/positions.scad>
include <0 - Variables.scad>

difference(){
    union(){    
        linear_extrude(plateHeight)
        import("keeb/plate.dxf");
        
        genScrewPosts();
    }

    genScrewHoles();
}


module genScrewHoles(){
    for(screw = screwPositions){
        translate([screw[0],screw[1],-plateHeight])
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