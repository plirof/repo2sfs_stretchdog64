#!/bin/sh
echo "PALEMOON browser CUSTOMIZATION SCRIPT (FIREFOX BASED)"
#############
# palemoon CUSTOMIZATION SCRIPT  jonmod 190111a 
#############
#chmod 4755 $1/usr/lib/x86_64-linux-gnu/palemoon/palemoon_sandbox
#jonmod 180514a
#latest palemoon amd64 https://www.palemoon.com/el/computer/linux
# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDA2SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

mkdir -p $1/usr/bin
mkdir -p $1/usr/share/applications
cp -n ./palemoon_default_home_prefs.js $1/usr/bin/palemoon_default_home_prefs.js

# needs extras: libnss3 libgconf-2-4
TODAYDATE=$(date +'%y%m%d')
mv -n "./$1/control" "$1""/""$1""_""$TODAYDATE""_control.txt"
rm "./$1/md5sums"
rm "./$1/prerm"
rm "./$1/postinst"


cat > $1/usr/bin/palemoon-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export palemoon_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#sudo -u puppy palemoon --user-data-dir=/home/puppy/.data/palemoon_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/palemoon_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-features=TranslateUI --always-authorize-plugins --media-cache-size=10000000 "$@"
sudo -u puppy palemoon -no-remote
EOF
chmod 755 $1/usr/bin/palemoon-puppy.sh

cat > $1/usr/share/applications/palemoon_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=palemoon puppy -repo2sfs changes.dat
Exec=palemoon-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/palemoon.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=palemoon
StartupNotify=true
EOF2
################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/palemoon-puppy-home.sh << EOF61
xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/palemoon
mkdir -p /mnt/home/downloads_linux/.cache/palemoon
cp -n /usr/bin/palemoon_default_home_prefs.js /mnt/home/downloads_linux/.data/palemoon/prefs.js
#sudo -u puppy palemoon --user-data-dir=/mnt/home/downloads_linux/.data/palemoon --disk-cache-dir=/mnt/home/downloads_linux/.cache/palemoon --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "$@"
sudo -u puppy palemoon -no-remote -profile "/mnt/home/downloads_linux/.data/palemoon" "$@"
EOF61

chmod 755 $1/usr/bin/palemoon-puppy-home.sh

cat > $1/usr/share/applications/palemoon-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=palemoon puppy -home EXTERNAL repo2sfs
Exec=palemoon-puppy-home.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/palemoon.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=palemoon
StartupNotify=true
EOF62
fi

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cp -n ./palemoon_default_sda1_prefs.js $1/usr/bin/palemoon_default_sda1_prefs.js	
cat > $1/usr/bin/palemoon-puppy-sda1 << EOF31


xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/palemoon
mkdir -p /mnt/sda1/downloads_linux/.cache/palemoon
cp -n /usr/bin/palemoon_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/palemoon/prefs.js
#sudo -u puppy palemoon --user-data-dir=/mnt/sda1/downloads_linux/.data/palemoon --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/palemoon --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "$@"
sudo -u puppy palemoon -no-remote -profile "/mnt/sda1/downloads_linux/.data/palemoon" "$@"
EOF31

chmod 755 $1/usr/bin/palemoon-puppy-sda1

cat > $1/usr/share/applications/palemoon-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=palemoon puppy -sda1(C:) EXTERNAL repo2sfs
Exec=palemoon-puppy-sda1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/palemoon.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=palemoon
StartupNotify=true
EOF32
fi


################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cp -n ./palemoon_default_sdb1_prefs.js $1/usr/bin/palemoon_default_sdb1_prefs.js
cat > $1/usr/bin/palemoon-puppy-sdb1 << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/palemoon
mkdir -p /mnt/sdb1/downloads_linux/.cache/palemoon
cp -n /usr/bin/palemoon_default_sdb1_prefs.js /mnt/sdb1/downloads_linux/.data/palemoon/prefs.js
#sudo -u puppy palemoon --user-data-dir=/mnt/sdb1/downloads_linux/.data/palemoon --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/palemoon --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "$@"
sudo -u puppy palemoon -no-remote -profile "/mnt/sda1/downloads_linux/.data/palemoon" "$@"
EOF41
chmod 755 $1/usr/bin/palemoon-puppy-sdb1

cat > $1/usr/share/applications/palemoon-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=palemoon puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=palemoon-puppy-sdb1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/palemoon.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=palemoon
StartupNotify=true
EOF42
fi

################### sda2 #########################################################
if [ $SDA2SCRIPTS == true ]
then
cp -n ./palemoon_default_sda2_prefs.js $1/usr/bin/palemoon_default_sda2_prefs.js	
cat > $1/usr/bin/palemoon-puppy-sda2 << EOF51


xhost +local:puppy
mkdir -p /mnt/sda2/downloads_linux/.data/palemoon
mkdir -p /mnt/sda2/downloads_linux/.cache/palemoon
cp -n /usr/bin/palemoon_default_sda2_prefs.js /mnt/sda2/downloads_linux/.data/palemoon/prefs.js
#sudo -u puppy palemoon --user-data-dir=/mnt/sda2/downloads_linux/.data/palemoon --disk-cache-dir=/mnt/sda2/downloads_linux/.cache/palemoon --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "$@"
sudo -u puppy palemoon -no-remote -profile "/mnt/sda2/downloads_linux/.data/palemoon" "$@"
EOF51

chmod 755 $1/usr/bin/palemoon-puppy-sda2

cat > $1/usr/share/applications/palemoon-puppy-sda2.desktop << EOF52
[Desktop Entry]
Version=1.0
Name=palemoon puppy -sda2 EXTERNAL repo2sfs
Exec=palemoon-puppy-sda2
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/palemoon.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=palemoon
StartupNotify=true
EOF52
fi



echo "DONE with CUSTOMIZATION of $1 ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "