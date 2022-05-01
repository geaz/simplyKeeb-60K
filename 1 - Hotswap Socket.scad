include <0 - Variables.scad>

genSocket();

module genSocket() {
    difference(){
        // Socket
        linear_extrude(socketHeight)
        offset(r = (socketSize - mxSize)/2)
        import("keeb/hole.dxf");
        
        // Wire Slots
        translate([-socketHeight, 5, 1])
        linear_extrude(1)
        square([9, diodeWireDia], center = true);
        
        translate([-5.25, 2.5, 1])
        linear_extrude(1)
        square([2.5, diodeWireDia], center = true);
        
        // Wire Holes
        linear_extrude(socketHeight)
        translate([-6.5, 2.5, 0])
        circle(d = diodeWireDia); 
        
        linear_extrude(socketHeight)
        translate([-6.5, 5, 0])
        circle(d = diodeWireDia);
        
        // Diode Hole
        linear_extrude(socketHeight)
        translate([-3, 5, 0])
        square([diodeWidth, diodeThickness], center = true);
        
        linear_extrude(socketHeight)
        gen2dSwitchFootprint();
    }
}

module gen2dSwitchFootprint(){
    translate([-5, 0, 0])
    circle(d = switchPinsDia);

    translate([5, 0, 0])
    circle(d = switchPinsDia);

    circle(d = switchSocketDia);

    translate([-3.8, 2.5, 0])
    gen2dPinHole(pinThicknessL);

    translate([2.5, 5, 0])
    gen2dPinHole(pinThicknessR);
}

module gen2dPinHole(pinThickness){
    midPoint = pinWidth/2 - pinThickness/2;

    // Center the hole
    translate([-pinWidth/2 + pinThickness/2, 0, 0]) {
        translate([midPoint, 0, 0])
        square([pinWidth - pinThickness, pinThickness], center = true);

        circle(d = pinThickness);

        translate([pinWidth - pinThickness, 0, 0])
        circle(d = pinThickness);
    }
}