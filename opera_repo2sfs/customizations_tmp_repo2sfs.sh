#!/bin/sh
echo "OPERA browser CUSTOMIZATION SCRIPT"
#############
# OPERA CUSTOMIZATION SCRIPT  jonmod 180514a 
#############

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=true
SDB1SCRIPTS=true

chmod 4755 /tmp/repo2sfs/usr/lib/x86_64-linux-gnu/opera/opera_sandbox
#jonmod 180514a
#latest opera amd64 https://www.opera.com/el/computer/linux
mkdir -p /tmp/repo2sfs/usr/bin
# needs extras: libnss3 libgconf-2-4


#!/bin/sh

cat > /tmp/repo2sfs/usr/bin/opera-puppy << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export opera_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#su - puppy -c "/usr/bin/opera  --user-data-dir=/home/puppy/opera_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "opera --user-data-dir=/home/puppy/.data/opera_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/opera_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
EOF
chmod 755 /tmp/repo2sfs/usr/bin/opera-puppy

cat > /tmp/repo2sfs/usr/share/applications/opera_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=Opera puppy -repo2sfs changes.dat
Exec=opera-puppy
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/opera.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Opera
StartupNotify=true
EOF2

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/opera-puppy-sda1.sh << EOF31
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/opera
mkdir -p /mnt/sda1/downloads_linux/.cache/opera
#su - puppy -c "/usr/bin/opera  --user-data-dir=/home/puppy/opera_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "opera --user-data-dir=/mnt/sda1/downloads_linux/.data/opera --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/opera --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF31
chmod 755 /tmp/repo2sfs/usr/bin/opera-puppy-sda1.sh

cat > /tmp/repo2sfs/usr/share/applications/opera-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=Opera puppy -sda1(C:) EXTERNAL repo2sfs
Exec=opera-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/opera.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Opera
StartupNotify=true
EOF32
fi

################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/opera-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/opera
mkdir -p /mnt/sdb1/downloads_linux/.cache/opera
#su - puppy -c "/usr/bin/opera  --user-data-dir=/home/puppy/opera_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "opera --user-data-dir=/mnt/sdb1/downloads_linux/.data/opera --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/opera --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF41
chmod 755 /tmp/repo2sfs/usr/bin/opera-puppy-sdb1.sh

cat > /tmp/repo2sfs/usr/share/applications/opera-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=Opera puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=opera-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/opera.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Opera
StartupNotify=true
EOF42
fi

echo "DONE with CUSTOMIZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "