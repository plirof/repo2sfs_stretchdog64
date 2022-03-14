#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download Chromium from here : http://ftp.us.debian.org/debian/pool/main/c/chromium/?C=M;O=D  , example link http://ftp.us.debian.org/debian/pool/main/c/chromium/chromium_99.0.4844.51-2_armhf.deb "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
#Enter the name of the latest Chromium file
MYFILENAME=chromium_99.0.4844.51-2_amd64.deb


#first delete older files/folders
##rm -rf $MYFILENAME
rm -rf $MYFILENAME.extracted
# if manually downloaded comment the wget command
##wget "http://ftp.us.debian.org/debian/pool/main/c/chromium/"$MYFILENAME

uextract libjsoncpp24_1.9.4-4_amd64.deb
uextract $MYFILENAME
cp -r ./libjsoncpp24_1.9.4-4_amd64.deb.extracted/* ./"$MYFILENAME.extracted"/
./customizations_deb_extracted.sh "$MYFILENAME.extracted"

#../repo2sfs_custom $MYFILENAME

TODAYDATE=$(date +'%y%m%d')
##mksquashfs $MYFILENAME.extracted "$MYFILENAME""_auto_v01_"$TODAYDATE".squashfs"

