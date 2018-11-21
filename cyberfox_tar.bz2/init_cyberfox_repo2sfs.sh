#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download opera from here : https://cyberfox.8pecxstudios.com/cyberfox-linux/  , example link https://download1.operacdn.com/pub/opera/desktop/53.0.2907.37/linux/opera-stable_53.0.2907.37_amd64.deb "

MYFILENAME=Cyberfox-52.7.4.en-US.linux-x86_64.deb
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