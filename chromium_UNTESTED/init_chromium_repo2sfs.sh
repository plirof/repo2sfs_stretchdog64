# From www.googleapis.com  -chrome version 20200322
# You MUST enter LATERS_BUILD version


echo "For older GLibC builds check here : (main link) https://www.chromium.org/getting-involved/download-chromium    "
echo "Check here for latest debian build (file LAST_CHANGE inside linux_x64 folder ) : https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2FLAST_CHANGE?generation=1585112888926871&alt=media"
echo "eg for latest build 783842 : https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64/783842/"
echo "all OS builds are here :https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html"
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"
LATEST_BUILD="783842"
MYFILENAME="Linux_x64_"$LATEST_BUILD"_chrome-linux"$(date +%F)".zip"

#WGET_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F"$LATEST_BUILD"%2Fchrome-linux.zip?generation=1585112877406284&alt=media"
WGET_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F"$LATEST_BUILD"%2Fchrome-linux.zip?alt=media"

#MYFILENAME_DRIVER=chromium-driver_69.0.3497.92-1~deb9u1_amd64
#MYVERSION=_18.0.5.0_20180426_repo2sfs_v01

echo "----------------------------------"
echo "MYFILENAME========= $MYFILENAME"
echo "WGET_URL==$WGET_URL"
echo "----------------------------------"


echo "+++++++++++++ DOWNLOADING DEBs (chrome version 20200322+++++++++++++++"

wget -O "$MYFILENAME" "$WGET_URL"




#echo "+++++++++++++ DOWNLOADING DEBs (OLD -not updated)+++++++++++++++"
#wget  "http://security.debian.org/debian-security/pool/updates/main/c/chromium-browser/"$MYFILENAME".deb"
#wget  "http://security.debian.org/debian-security/pool/updates/main/c/chromium-browser/"$MYFILENAME_DRIVER".deb"
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
