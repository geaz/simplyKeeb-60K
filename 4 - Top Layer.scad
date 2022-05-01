include <0 - Variables.scad>

difference() {
    difference(){
        linear_extrude(topLayerHeight)
        offset(wallThickness-restInsetSize)
        import("keeb/outline.dxf");
        
        linear_extrude(topLayerHeight)
        offset(-restInsetSize)
        import("keeb/outline.dxf");
    }    
    
    translate([0,0,topLayerHeight-plateRestHeight])
    linear_extrude(plateRestHeight)
    import("keeb/outline.dxf");
}