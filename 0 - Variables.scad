$fn = 64;

printClearance =            0.2;
smallHolePrintClearance =   0.7;

mxSize =                    14;
mxDistanceToBoard =         5;

pinThicknessR =             0.5   + smallHolePrintClearance;
pinThicknessL =             0.3   + smallHolePrintClearance;
pinWidth =                  1.2   + smallHolePrintClearance;

socketSize =                16;
socketHeight =              2;
switchSocketDia =           4     + printClearance;
switchPinsDia =             1.5   + smallHolePrintClearance;

diodeWidth =                4     + printClearance;
diodeThickness =            2     + printClearance;
diodeWireDia =              0.4   + smallHolePrintClearance;

restInsetSize =             1     + printClearance;

hsBoardHeight =             1.5;
hsSocketInsetSize =         (socketSize - mxSize + printClearance)/2;
hsSocketRestHeight =        1     + printClearance;
hsBoardRestHeight =         hsBoardHeight + printClearance;

plateHeight =               2;
plateRestHeight =           plateHeight + printClearance;

topLayerHeight =            mxDistanceToBoard - (hsBoardHeight + socketHeight - hsSocketRestHeight - hsBoardRestHeight);
middleLayerHeight =         3;
bottomLayerHeight =         6;
wallThickness =             3;
floorHeight =               1;

ledRestThickness =          1;
ledRestWidth =              10;

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

usbWidth =                  10    + printClearance;
usbHeight =                 3     + printClearance;

screwDiameter =             2     + printClearance;
screwPlatePostDiameter =    4;
screwPostDiameter =         5;