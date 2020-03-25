#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download seamonkey from here : https://www.seamonkey-project.org/releases/  , example link https://archive.mozilla.org/pub/seamonkey/releases/2.53.1/linux-x86_64/en-US/seamonkey-2.53.1.en-US.linux-x86_64.tar.bz2 "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=seamonkey-2.53.1.en-US.linux-x86_64.tar.bz2
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
#wget https://www.slimjetbrowser.com/release/$MYFILENAME
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
uextract $1
./customizations_tar.bz2.sh "$1.extracted"
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs


#BUILDDIR="."
#rm -rf $BUILDDIR
#mkdir $BUILDDIR

TODAYDATE=$(date +'%y%m%d')
#SQUASH="$1.squashfs"
#rm -f $SQUASH
#mksquashfs $BUILDDIR $SQUASH
mksquashfs $1.extracted $1_auto_v01_$TODAYDATE.squashfs