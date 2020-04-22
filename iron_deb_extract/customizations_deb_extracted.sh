#!/bin/sh
echo "SW - IRON browser CUSTOMIZATION SCRIPT"
#############
# SWIRON CUSTOMIZATION SCRIPT  jonmod 180514a 
#############

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

mkdir -p $1/usr/bin
chmod 755 $1/usr/share/iron/chrome-wrapper
chown root $1/usr/share/iron/chrome-sandbox
chmod 4755 $1/usr/share/iron/chrome-sandbox

TODAYDATE=$(date +'%y%m%d')
mv -n "./$1/control" "$1""/""$1""_""$TODAYDATE""_control.txt"

# needs extras: libnss3 libgconf-2-4

#--------------------------------------------------------------------------------------------------------------------------------

#!/bin/sh
cat > $1/usr/bin/iron-puppy.sh << EOF
#!/bin/sh
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=31.0.0.171"
xhost +local:puppy
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/iron_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy /usr/share/iron/chrome-wrapper --user-data-dir=/home/puppy/iron_puppy_user_data_dir --disk-cache-dir=/home/puppy/iron_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --disable-translate --always-authorize-plugins "\$@"
EOF
chmod 755 $1/usr/bin/iron-puppy.sh

cat > $1/usr/share/applications/iron_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=SRWare Iron puppy -repo2sfs changes.dat
Comment=SRWare Iron-Browser
Exec=iron-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iron_product_logo.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=IronSW
StartupNotify=false
EOF2

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/iron-puppy-home.sh << EOF61
#!/bin/sh
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=31.0.0.171"
xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/iron
mkdir -p /mnt/home/downloads_linux/.cache/iron
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/iron_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy /usr/share/iron/chrome-wrapper --user-data-dir=/mnt/home/downloads_linux/.data/iron --disk-cache-dir=/mnt/home/downloads_linux/.cache/iron --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --disable-translate --always-authorize-plugins --disk-cache-size=10000000 --media-cache-size=10000000 "\$@"
EOF61
chmod 755 $1/usr/bin/iron-puppy-home.sh

cat > $1/usr/share/applications/iron-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=SRWare Iron puppy -home(C:) EXTERNAL repo2sfs
Comment=SRWare Iron-Browser
Exec=iron-puppy-home.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iron_product_logo.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=IronSW
StartupNotify=false
EOF62
fi

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/iron-puppy-sda1.sh << EOF31
#!/bin/sh
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=31.0.0.171"
xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/iron
mkdir -p /mnt/sda1/downloads_linux/.cache/iron
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/iron_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy /usr/share/iron/chrome-wrapper --user-data-dir=/mnt/sda1/downloads_linux/.data/iron --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/iron --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --disable-translate --always-authorize-plugins --disk-cache-size=10000000 --media-cache-size=10000000 "\$@"
EOF31
chmod 755 $1/usr/bin/iron-puppy-sda1.sh

cat > $1/usr/share/applications/iron-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=SRWare Iron puppy -sda1(C:) EXTERNAL repo2sfs
Comment=SRWare Iron-Browser
Exec=iron-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iron_product_logo.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=IronSW
StartupNotify=false
EOF32
fi


################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/iron-puppy-sdb1.sh << EOF41
#!/bin/sh
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=31.0.0.171"
xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/iron
mkdir -p /mnt/sdb1/downloads_linux/.cache/iron
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/iron_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy /usr/share/iron/chrome-wrapper --user-data-dir=/mnt/sdb1/downloads_linux/.data/iron --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/iron --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --disable-translate --always-authorize-plugins --disk-cache-size=10000000 --media-cache-size=10000000 "\$@"
EOF41
chmod 755 $1/usr/bin/iron-puppy-sdb1.sh

cat > $1/usr/share/applications/iron-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=SRWare Iron puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Comment=SRWare Iron-Browser
Exec=iron-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iron_product_logo.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=IronSW
StartupNotify=false
EOF42
fi

echo "DONE with CUSTOMAZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "