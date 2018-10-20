#change MYFILENAME and MYVERSION to help renaming
echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
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

TODAYDATE=$(date +'%y%m%d')
echo "$MYFILENAME""_auto_v01_"$TODAYDATE".squashfs"
#mksquashfs $MYFILENAME.extracted $MYFILENAME_auto_v01_$TODAYDATE.squashfs
mksquashfs $MYFILENAME.extracted "$MYFILENAME""_auto_v01_"$TODAYDATE".squashfs"
