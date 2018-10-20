#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download iridium from here : https://iridiumbrowser.de/downloads/debian  , example link https://downloads.iridiumbrowser.de/deb/ "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=iridium-browser_current_amd64.deb


#first delete older files/folders
rm -rf $MYFILENAME
rm -rf $MYFILENAME.extracted
wget https://downloads.iridiumbrowser.de/deb/$MYFILENAME

uextract $MYFILENAME
./customizations_deb_extracted.sh "$MYFILENAME.extracted"

#../repo2sfs_custom $MYFILENAME

TODAYDATE=$(date +'%y%m%d')
mksquashfs $MYFILENAME.extracted "$MYFILENAME""_auto_v01_"$TODAYDATE".squashfs"

