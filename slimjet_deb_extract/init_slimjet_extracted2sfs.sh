#change MYFILENAME and MYVERSION to help renaming
echo "INFO TEXT : get mp4 decoding lib from here :https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases"

MYFILENAME=slimjet_amd64.deb


rm -rf $MYFILENAME
rm -rf $MYFILENAME.extracted

wget https://www.slimjetbrowser.com/release/$MYFILENAME

uextract $MYFILENAME
./customizations_deb_extracted.sh "$MYFILENAME.extracted"

#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
#../repo2sfs_custom $MYFILENAME
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs

# add latest libffmpeg.so & codecs for MP4 
#unzip -o 0.44.1-linux-x64__chromium80.0.3987.87.zip -d $MYFILENAME.extracted/opt/slimjet/
###STOPPED WORKING AFTER Slimjet 33 ### unzip -o 0.55.0-linux-x64.zip -d $MYFILENAME.extracted/opt/slimjet/
# unzip -o 0.50.2-linux-x64.zip -d $MYFILENAME.extracted/opt/slimjet/  #0.50 had problems with netflix slimjet 28.0.3.0

cp libffmpeg.so.vivaldi-snapshot-ffmpeg-codecs-98.0.4710.4-1-x86_64 $MYFILENAME.extracted/opt/slimjet/libffmpeg.so
cp libwidevinecdm.so_191215 $MYFILENAME.extracted/opt/slimjet/libwidevinecdm.so
#cp libwidevinecdm.so_200212 $MYFILENAME.extracted/opt/slimjet/libwidevinecdm.so   #libwidevinecdm. had problems with netflix slimjet 28.0.3.0



TODAYDATE=$(date +'%y%m%d')
echo "$MYFILENAME""_auto_v01_"$TODAYDATE".squashfs"
#mksquashfs $MYFILENAME.extracted $MYFILENAME_auto_v01_$TODAYDATE.squashfs
mksquashfs $MYFILENAME.extracted "$MYFILENAME""_auto_v01_"$TODAYDATE".squashfs"
