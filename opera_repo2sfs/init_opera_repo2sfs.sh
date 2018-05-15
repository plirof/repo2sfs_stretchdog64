#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download opera from here : https://www.opera.com/el/computer/linux "
echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=slimjet_amd64.deb
MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
wget https://www.slimjetbrowser.com/release/$MYFILENAME
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
../repo2sfs $MYFILENAME
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs
