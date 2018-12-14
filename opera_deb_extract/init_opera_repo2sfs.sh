#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download opera from here : https://www.opera.com/el/computer/linux  , example link https://download1.operacdn.com/pub/opera/desktop/53.0.2907.37/linux/opera-stable_53.0.2907.37_amd64.deb "
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
rm -rf $1.extracted
uextract $1
./customizations_deb_extracted.sh "$1.extracted"
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs


#BUILDDIR="."
#rm -rf $BUILDDIR
#mkdir $BUILDDIR
TODAYDATE=$(date +'%y%m%d')

#SQUASH="$1.squashfs"
#rm -f $SQUASH
#mksquashfs $BUILDDIR $SQUASH
mksquashfs $1.extracted $1_auto_v01_$TODAYDATE.squashfs