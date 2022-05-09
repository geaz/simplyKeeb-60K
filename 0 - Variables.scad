$fn = 64;

switchHoleClearance =       0.1; // Widens the switch plate holes by the given amount.
printClearance =            0.2; // Clearance necessary for printed parts to fit better. Used for points where one printed part is inserted in another one.

smallSocketClearance =      0.7; // Hotswap Socket Clearance for holes below a size of 1.5mm. 
                                 // Because 3d printers are not that accurate at this size, it is necessary to have a bigger clearance.
                                 // Recommended: "printClearance + Line Width (Slicer)" for PETG it may be necessary to add even more clearance, because of the material expansion.

//
// It should not be necessary to edit one of the followin variables:
//

mxSize =                    14;
mxDistanceToBoard =         5;

pinThicknessR =             0.5   + smallSocketClearance;
pinThicknessL =             0.3   + smallSocketClearance;
pinWidth =                  1.2   + smallSocketClearance;

socketSize =                16;
socketHeight =              2;
switchSocketDia =           4.2   + printClearance;
switchPinsDia =             1.5   + smallSocketClearance;

diodeWidth =                4     + printClearance;
diodeThickness =            2     + printClearance;
diodeWireDia =              0.4   + smallSocketClearance;

restInsetSize =             1     + printClearance;

hsBoardHeight =             1.5;
hsSocketInsetSize =         (socketSize - mxSize)/2 + printClearance;
hsSocketRestHeight =        1;
hsBoardRestHeight =         hsBoardHeight + printClearance;

plateHeight =               2;
plateRestHeight =           plateHeight + printClearance;

topLayerHeight =            mxDistanceToBoard + (socketHeight - hsSocketRestHeight);
middleLayerHeight =         4;
bottomLayerHeight =         6.5;
wallThickness =             3;
floorHeight =               1.5;

bottomLayerScrewHeight =    bottomLayerHeight+middleLayerHeight-hsBoardHeight;

ledRestHeight =             1;
ledRestWidth =              10    + printClearance;

trrsWidth =                 6.15  + printClearance;
trrsLength =                12.1  + printClearance;
trrsHeight =                5     + printClearance;
trrsSlotThickness =         1;

proMicroWidth =             19    + printClearance;
proMicroLength =            34    + printClearance;
proMicroThickness =         2     + printClearance;
proMicroSlotDepth =         1.5;
proMicroSlotZOffset =       2;
proMicroSlotThickness =     3;
proMicroScrewDiameter =     2.5   + printClearance;

usbWidth =                  10    + printClearance;
usbHeight =                 3.5   + printClearance;

screwHoleDiameter =         3;
screwInsertDiameter =       3.2;
screwPlatePostDiameter =    5;
screwPostDiameter =         6;