#!/bin/sh
echo "SLIMJET flashpeak browser CUSTOMIZATION SCRIPT"
#############
# SLIMJET CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#latest slimjet amd64 https://www.slimjetbrowser.com/release/slimjet_amd64.deb

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

mkdir -p $1/usr/bin
chown root $1/opt/slimjet/slimjet-sandbox
chmod 4755 $1/opt/slimjet/slimjet-sandbox
# needs extras: libnss3 libgconf-2-4

TODAYDATE=$(date +'%y%m%d')
mv -n "./$1/control" "$1""/""$1""_""$TODAYDATE""_control.txt"

#!/bin/sh

cat > $1/usr/bin/slimjet-puppy.sh << EOF
#!/bin/sh
#export SLIMJET_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#sudo -u puppy /usr/bin/slimjet  --user-data-dir=/home/puppy/slimjet_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy flashpeak-slimjet --user-data-dir=/home/puppy/.data/slimjet_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/slimjet_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-features=TranslateUI --always-authorize-plugins --media-cache-size=10000000 "$@"
EOF
chmod 755 $1/usr/bin/slimjet-puppy.sh

cat > $1/usr/share/applications/slimjet.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=Slimjet puppy -repo2sfs changes.dat
Exec=slimjet-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/slimjet.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Slimjet
StartupNotify=true
EOF2

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/slimjet-puppy-home.sh << EOF61
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/slimjet
mkdir -p /mnt/home/downloads_linux/.cache/slimjet
sudo -u puppy flashpeak-slimjet --user-data-dir=/mnt/home/downloads_linux/.data/slimjet --disk-cache-dir=/mnt/home/downloads_linux/.cache/slimjet --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=31.0.0.171 "$@"
EOF61
chmod 755 $1/usr/bin/slimjet-puppy-home.sh

cat > $1/usr/share/applications/slimjet-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=Slimjet puppy -home EXTERNAL repo2sfs
Exec=slimjet-puppy-home.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/slimjet.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Slimjet
StartupNotify=true
EOF62
fi

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/slimjet-puppy-sda1.sh << EOF31
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/slimjet
mkdir -p /mnt/sda1/downloads_linux/.cache/slimjet
#sudo -u puppy /usr/bin/slimjet  --user-data-dir=/home/puppy/slimjet_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy flashpeak-slimjet --user-data-dir=/mnt/sda1/downloads_linux/.data/slimjet --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/slimjet --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "$@"
EOF31
chmod 755 $1/usr/bin/slimjet-puppy-sda1.sh

cat > $1/usr/share/applications/slimjet-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=Slimjet puppy -sda1(C:) EXTERNAL repo2sfs
Exec=slimjet-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/slimjet.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Slimjet
StartupNotify=true
EOF32
fi

################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/slimjet-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/slimjet
mkdir -p /mnt/sdb1/downloads_linux/.cache/slimjet
#sudo -u puppy /usr/bin/slimjet  --user-data-dir=/home/puppy/slimjet_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy flashpeak-slimjet --user-data-dir=/mnt/sdb1/downloads_linux/.data/slimjet --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/slimjet --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "$@"
EOF41
chmod 755 $1/usr/bin/slimjet-puppy-sdb1.sh

cat > $1/usr/share/applications/slimjet-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=Slimjet puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=slimjet-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/slimjet.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Slimjet
StartupNotify=true
EOF42
fi

echo "DONE with CUSTOMAZATION of $1 ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "