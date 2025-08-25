PS3="Which firmware to build: "

select keeb in s60ph s60
do
    echo "Selected keeb: $keeb"
    break
done

echo "Clearing old files"
rm -r ~/qmk_firmware/keyboards/simplykeeb &> /dev/null

echo "Copy folders"
cp -a simplykeeb ~/qmk_firmware/keyboards

echo "Building firmwares"
qmk compile -kb simplykeeb/$keeb -km default