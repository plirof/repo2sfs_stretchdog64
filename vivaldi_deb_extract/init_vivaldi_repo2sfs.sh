#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download vivaldi DEB from here : https://vivaldi.com/download/  , example link https://downloads.vivaldi.com/stable/vivaldi-stable_1.15.1147.42-1_amd64.deb "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=vivaldi-stable_2.1.1337.36-1_amd64.deb
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
#wget https://www.slimjetbrowser.com/release/$MYFILENAME
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