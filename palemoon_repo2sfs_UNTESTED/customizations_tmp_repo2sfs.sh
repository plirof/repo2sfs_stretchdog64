#!/bin/sh
echo "ERROR firefox based - PALEMOON browser CUSTOMIZATION SCRIPT"
#############
# palemoon CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#chmod 4755 /tmp/repo2sfs/usr/lib/x86_64-linux-gnu/palemoon/palemoon_sandbox
#jonmod 180514a
#latest palemoon amd64 https://www.palemoon.com/el/computer/linux
mkdir -p /tmp/repo2sfs/usr/bin
# needs extras: libnss3 libgconf-2-4


#!/bin/sh

cat > /tmp/repo2sfs/usr/bin/palemoon-puppy << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export palemoon_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#su - puppy -c "/usr/bin/palemoon  --user-data-dir=/home/puppy/palemoon_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "palemoon --user-data-dir=/home/puppy/.data/palemoon_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/palemoon_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
EOF
chmod 755 /tmp/repo2sfs/usr/bin/palemoon-puppy

cat > /tmp/repo2sfs/usr/share/applications/palemoon_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=palemoon puppy -repo2sfs changes.dat
Exec=palemoon-puppy
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/palemoon.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=palemoon
StartupNotify=true
EOF2


cat > /tmp/repo2sfs/usr/bin/palemoon-puppy-sda1 << EOF31
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/palemoon
mkdir -p /mnt/sda1/downloads_linux/.cache/palemoon
#su - puppy -c "/usr/bin/palemoon  --user-data-dir=/home/puppy/palemoon_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "palemoon --user-data-dir=/mnt/sda1/downloads_linux/.data/palemoon --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/palemoon --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF31
chmod 755 /tmp/repo2sfs/usr/bin/palemoon-puppy-sda1

cat > /tmp/repo2sfs/usr/share/applications/palemoon-puppy-sda1.desktop << EOF32
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




cat > /tmp/repo2sfs/usr/bin/palemoon-puppy-sdb1 << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/palemoon
mkdir -p /mnt/sdb1/downloads_linux/.cache/palemoon
#su - puppy -c "/usr/bin/palemoon  --user-data-dir=/home/puppy/palemoon_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "palemoon --user-data-dir=/mnt/sdb1/downloads_linux/.data/palemoon --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/palemoon --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF41
chmod 755 /tmp/repo2sfs/usr/bin/palemoon-puppy-sdb1

cat > /tmp/repo2sfs/usr/share/applications/palemoon-puppy-sdb1.desktop << EOF42
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

echo "DONE with CUSTOMIZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "