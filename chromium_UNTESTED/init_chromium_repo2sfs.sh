#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download chromium from here : http://security.debian.org/debian-security/pool/updates/main/c/chromium-browser/  , https://packages.debian.org/stretch/amd64/chromium/download  , example link http://security.debian.org/debian-security/pool/updates/main/c/chromium-browser/chromium_68.0.3440.75-1~deb9u1_amd64.deb "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
MYFILENAME=chromium_68.0.3440.75-1~deb9u1_amd64
MYFILENAME_DRIVER=chromium-driver_68.0.3440.75-1~deb9u1_amd64
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01
echo "+++++++++++++ DOWNLOADING DEBs+++++++++++++++"
wget  "http://security.debian.org/debian-security/pool/updates/main/c/chromium-browser/"$MYFILENAME".deb"
wget  "http://security.debian.org/debian-security/pool/updates/main/c/chromium-browser/"$MYFILENAME_DRIVER".deb"
#wget "http://security.debian.org/debian-security/pool/updates/main/c/chromium-browser/chromium_68.0.3440.75-1~deb9u1_amd64.deb"

echo "+++++++++++++ GETTING SPECIFIC FILES FROM DEBs and COPYING to ./ (they will be moved by the customization script)+++++++++++++++"
mkdir -p /tmp/repo2sfs
mkdir -p /tmp/repo2sfs/usr/bin
mkdir -p /tmp/repo2sfs/usr/share/applications/
#dpkg-deb -e $MYFILENAME.deb		#extract the DEBIAN folder to the current directory
echo "+++++++++++++ HANDLING $MYFILENAME +++++++++++++++"
dpkg-deb -x $MYFILENAME.deb	"./"$MYFILENAME"_UNZIP"	#extract the DEBIAN folder to the current directory
dpkg-deb -e $MYFILENAME.deb	"./"$MYFILENAME"_UNZIP"	#extract the DEBIAN folder to the current directory
cp $MYFILENAME"_UNZIP/control" "./"$MYFILENAME"_control.txt"

echo "+++++++++++++ $MYFILENAME_DRIVER +++++++++++++++"
dpkg-deb -x $MYFILENAME_DRIVER".deb" ./$MYFILENAME_DRIVER"_UNZIP"	#extract the DEBIAN folder to the current directory
dpkg-deb -e $MYFILENAME_DRIVER".deb" ./$MYFILENAME_DRIVER"_UNZIP"	#extract the DEBIAN folder to the current directory
cp $MYFILENAME_DRIVER"_UNZIP/usr/bin/chromedriver" "./chromedriver"
cp $MYFILENAME_DRIVER"_UNZIP/control" "./"$MYFILENAME_DRIVER"_control.txt"

echo "+++++++++++++ executing repo2sfs_custom +++++++++++++++"
../repo2sfs_custom $MYFILENAME.deb
#mv $MYFILENAME.squashfs $MYFILENAME_$MYVERSION.squashfs
