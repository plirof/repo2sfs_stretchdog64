#change MYFILENAME and MYVERSION to help renaming
echo "1st download SWIron from here : http://www.srware.net/downloads/iron64.deb  , Links can be found from forum eg https://www.srware.net/forum/viewtopic.php?f=18&t=21239"
echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=iron64.deb
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01

#first delete older files/folders
rm -rf $MYFILENAME
rm -rf $MYFILENAME.extracted

wget http://www.srware.net/downloads/$MYFILENAME


uextract $MYFILENAME
./customizations_deb_extracted.sh "$MYFILENAME.extracted"
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
##########../repo2sfs_custom $MYFILENAME

TODAYDATE=$(date +'%y%m%d')

#SQUASH="$1.squashfs"
#rm -f $SQUASH
#mksquashfs $BUILDDIR $SQUASH
#mksquashfs $MYFILENAME.extracted $MYFILENAME_auto_v01_$TODAYDATE.squashfs
mksquashfs $MYFILENAME.extracted "$MYFILENAME""_auto_v01_"$TODAYDATE".squashfs"


#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs
