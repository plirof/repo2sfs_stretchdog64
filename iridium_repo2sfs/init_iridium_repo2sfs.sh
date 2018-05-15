#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download iridium from here : https://iridiumbrowser.de/downloads/debian  , example link https://downloads.iridiumbrowser.de/deb/ "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=iridium-browser_current_amd64.deb
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
wget https://downloads.iridiumbrowser.de/deb/$MYFILENAME
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
../repo2sfs_custom $MYFILENAME
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs
