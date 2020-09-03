#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download PALEMOON from here : https://software.opensuse.org/download.html?project=home:stevenpusser&package=palemoon  , example link https://download.opensuse.org/repositories/home:/stevenpusser/Debian_9.0/amd64/palemoon_27.9.1~repack-1_amd64.deb "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
#MYFILENAME=palemoon_28.2.2~repack-1_amd64.deb
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
#wget https://www.slimjetbrowser.com/release/$MYFILENAME
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
uextract $1
./customizations_deb_extracted.sh $1".extracted"
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs
TODAYDATE=$(date +'%y%m%d')
mksquashfs $1".extracted" $1"_auto_v01_"$TODAYDATE".squashfs"
