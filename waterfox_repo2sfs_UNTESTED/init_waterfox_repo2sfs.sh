#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download waterfox from here : https://www.waterfoxproject.org/en-US/waterfox/new/  , example link https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-56.1.0.en-US.linux-x86_64.tar.bz2 "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=waterfox-56.1.0.en-US.linux-x86_64.tar.bz2
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
#wget https://www.slimjetbrowser.com/release/$MYFILENAME
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
../repo2sfs_custom $1
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs
