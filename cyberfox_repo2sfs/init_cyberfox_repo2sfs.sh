#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download opera from here : https://cyberfox.8pecxstudios.com/cyberfox-linux/  , example link https://download1.operacdn.com/pub/opera/desktop/53.0.2907.37/linux/opera-stable_53.0.2907.37_amd64.deb "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=Cyberfox-52.7.4.en-US.linux-x86_64.deb
MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
#wget https://www.slimjetbrowser.com/release/$MYFILENAME
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
#mkdir -p /tmp/repo2sfs
#cp DEBIAN/control /tmp/repo2sfs/$MYFILENAME_control.txt
../repo2sfs_custom $1
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs
