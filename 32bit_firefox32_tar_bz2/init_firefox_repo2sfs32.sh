#change MYFILENAME and MYVERSION to help renaming
echo "1st MANUALLY download firefox from here : https://download.mozilla.org/?product=firefox-latest-ssl&os=linux&lang=el  , example link https://download-installer.cdn.mozilla.net/pub/firefox/releases/60.0.1/linux-x86_64/en-US/firefox-60.0.1.tar.bz2 "
#echo "INFO TEXT : when adked for EXTRA packages enter libnss3 libgconf-2-4"

#ENGLISH  32bit
#wget -O "firefox_latest.tar.bz2" "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux"
#GREEK 32bit
wget -O "firefox_latest.tar.bz2" "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux&lang=el"

uextract firefox_latest.tar.bz2
./customizations_tar.bz2.sh "firefox_latest.tar.bz2.extracted"
uextract "libatomic1_8.3.0-6_i386.deb"
cp -r "libatomic1_8.3.0-6_i386.deb.extracted/." "./firefox_latest.tar.bz2.extracted/"

TODAYDATE=$(date +'%y%m%d')

#ENGLISH
#mksquashfs firefox_latest.tar.bz2.extracted firefox_latest.tar.bz2_auto_v01_$TODAYDATE.squashfs
#GREEK
mksquashfs firefox_latest.tar.bz2.extracted firefox_latest.tar.bz2_GR_auto_v01_$TODAYDATE.squashfs