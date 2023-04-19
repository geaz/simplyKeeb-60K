PS3="Which firmware to build: "

select keeb in s60ph s60
do
    echo "Selected keeb: $keeb"
    break
done

echo "Init submodules"
git submodule init
git submodule update 
cd vial-qmk
make git-submodule &> /dev/null

echo "Clearing old files"
rm -r ../keyboards/simplykeeb &> /dev/null

echo "Copy folders"
cp -a ../simplykeeb keyboards

echo "Building firmwares"
make "simplykeeb/${keeb}:default"