#change MYFILENAME and MYVERSION to help renaming
echo "1st download skypeforlinux-64.deb from here : skypeforlinux-64.deb  , Links can be found from forum eg "
echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=skypeforlinux-64.deb
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
wget https://go.skype.com/$MYFILENAME
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
../repo2sfs_custom $MYFILENAME
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs
