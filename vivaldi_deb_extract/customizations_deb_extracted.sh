#!/bin/sh
echo "vivaldi browser CUSTOMIZATION SCRIPT (Chromium BASED)"
#############
# vivaldi CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#jonmod 180514a
#latest vivaldi amd64 https://vivaldi.com/download/

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

#mkdir -p "$1/opt"
TODAYDATE=$(date +'%y%m%d')
mv -n "./$1/control" "$1""/""$1""_""$TODAYDATE""_control.txt"
chmod 4755 $1/opt/vivaldi/vivaldi_sandbox

#mkdir -p $1/usr/bin
#mkdir -p $1/usr/share/applications

# needs extras: libnss3 libgconf-2-4




cat > $1/usr/bin/vivaldi-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export vivaldi_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#su -l puppy -c "/opt/vivaldi/vivaldi --user-data-dir=/home/puppy/.data/vivaldi_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/vivaldi_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
su -l puppy -c "vivaldi-stable --user-data-dir=/home/puppy/.data/vivaldi_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/vivaldi_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
EOF
chmod 755 $1/usr/bin/vivaldi-puppy.sh

cat > $1/usr/share/applications/vivaldi_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=vivaldi puppy -repo2sfs changes.dat
Exec=vivaldi-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/vivaldi/product_logo_32.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=vivaldi
StartupNotify=true
Comment=Access the Internet
EOF2

################### home #########################################################
if [ $homeSCRIPTS == true ]
then
cat > $1/usr/bin/vivaldi-puppy-home.sh << EOF61
#####   home #####################################################

xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/vivaldi
mkdir -p /mnt/home/downloads_linux/.cache/vivaldi
cp -n /usr/bin/vivaldi_default_home_prefs.js /mnt/home/downloads_linux/.data/vivaldi/prefs.js
#su -l puppy -c "/opt/vivaldi/vivaldi --user-data-dir=/mnt/home/downloads_linux/.data/vivaldi --disk-cache-dir=/mnt/home/downloads_linux/.cache/vivaldi --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
su -l puppy -c "vivaldi-stable --user-data-dir=/mnt/home/downloads_linux/.data/vivaldi --disk-cache-dir=/mnt/home/downloads_linux/.cache/vivaldi --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF61
chmod 755 $1/usr/bin/vivaldi-puppy-home.sh

cat > $1/usr/share/applications/vivaldi-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=vivaldi puppy -home(C:) EXTERNAL repo2sfs
Exec=vivaldi-puppy-home.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/vivaldi/product_logo_32.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=vivaldi
StartupNotify=true
Comment=Access the Internet
EOF62
fi

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/vivaldi-puppy-sda1.sh << EOF31
#####   SDA1 #####################################################

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/vivaldi
mkdir -p /mnt/sda1/downloads_linux/.cache/vivaldi
cp -n /usr/bin/vivaldi_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/vivaldi/prefs.js
#su -l puppy -c "/opt/vivaldi/vivaldi --user-data-dir=/mnt/sda1/downloads_linux/.data/vivaldi --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/vivaldi --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
su -l puppy -c "vivaldi-stable --user-data-dir=/mnt/sda1/downloads_linux/.data/vivaldi --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/vivaldi --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF31
chmod 755 $1/usr/bin/vivaldi-puppy-sda1.sh

cat > $1/usr/share/applications/vivaldi-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=vivaldi puppy -sda1(C:) EXTERNAL repo2sfs
Exec=vivaldi-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/vivaldi/product_logo_32.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=vivaldi
StartupNotify=true
Comment=Access the Internet
EOF32
fi

################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/vivaldi-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/vivaldi
mkdir -p /mnt/sdb1/downloads_linux/.cache/vivaldi
cp -n /usr/bin/vivaldi_default_sdb1_prefs.js /mnt/sdb1/downloads_linux/.data/vivaldi/prefs.js
#su -l puppy -c "/opt/vivaldi/vivaldi --user-data-dir=/mnt/sdb1/downloads_linux/.data/vivaldi --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/vivaldi --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
su -l puppy -c "vivaldi-stable --user-data-dir=/mnt/sdb1/downloads_linux/.data/vivaldi --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/vivaldi --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF41
chmod 755 $1/usr/bin/vivaldi-puppy-sdb1.sh

cat > $1/usr/share/applications/vivaldi-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=vivaldi puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=vivaldi-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/vivaldi/product_logo_32.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=vivaldi
StartupNotify=true
Comment=Access the Internet
EOF42
fi



echo "DONE with CUSTOMIZATION of $1/ ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "