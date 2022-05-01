include <keeb/positions.scad>
include <0 - Variables.scad>

difference(){
    union(){
        difference(){
            linear_extrude(hsBoardHeight)
            import("keeb/outline.dxf");

            linear_extrude(hsBoardHeight)
            offset(r = -hsSocketInsetSize)
            import("keeb/outline.dxf");
        }
        
        translate([0,0,hsBoardHeight - hsSocketRestHeight])
        linear_extrude(hsSocketRestHeight)
        offset(r = -hsSocketInsetSize)
        import("keeb/plate.dxf");

        linear_extrude(hsBoardHeight - hsSocketRestHeight)
        import("keeb/plate.dxf");
    }

    genScrewHoles();
}

module genScrewHoles(){
    for(screw = screwPositions){
        translate([screw[0],screw[1],0])
        linear_extrude(hsBoardHeight)
        circle(d = screwDiameter);
    }
}
