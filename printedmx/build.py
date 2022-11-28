import os
from decimal import Decimal
from shutil import which, rmtree

buildPath = "./.build"

print("HotKeep Generator V1")
print("created by Gerrit 'Geaz' Gazic")
print()

if which("openscad") is None:
    print("OpenSCAD was not found! Please make sure that it is in your PATH!")
    exit()

switchHoleClearance = Decimal(input("Enter your switch hole clearance [0.1] : ") or "0.1")
printClearance = Decimal(input("Enter your print clearance [0.2] : ") or "0.2")
smallSocketClearance = Decimal(input("Enter your small hole socket clearance (used for anything smaller than 1.5mm on the hotswap socket). [0.7] : ") or "0.7")

if os.path.isdir(buildPath):
    rmtree(buildPath)
os.mkdir(buildPath)

files = [
    {"input":"1 - Hotswap Socket.scad", "output":"1 - Hotswap Socket.stl" },    
    {"input":"2 - Hotswap Board.scad", "output":"2 - Hotswap Board.stl" },
    {"input":"3 - Plate.scad", "output":"3 - Plate.stl" },
    {"input":"4 - Top Layer.scad", "output":"4 - Top Layer.stl" },
    {"input":"5 - Middle Layer.scad", "output":"5 - Middle Layer.stl" },
    {"input":"6 - Bottom Layer.scad", "output":"6 - Bottom Layer.stl" },
    {"input":"7 - Pro Micro Mount.scad", "output":"7 - Pro Micro Mount.stl" }
]

with open('.build/params.txt', 'w') as f:
    f.write("switchHoleClearance={}\n".format(switchHoleClearance))
    f.write("printClearance={}\n".format(printClearance))
    f.write("smallSocketClearance={}\n".format(smallSocketClearance))

for i in files:
    print("Creating {} ...".format(i["output"]))
    os.system("openscad -q -D switchHoleClearance={} -D printClearance={} -D smallSocketClearance={} -o \"./{}/{}\" \"{}\"".format(switchHoleClearance, printClearance, smallSocketClearance, buildPath, i["output"], i["input"]))