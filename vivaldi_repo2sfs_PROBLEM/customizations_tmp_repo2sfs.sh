#!/bin/sh
echo "VIVALDI browser CUSTOMIZATION SCRIPT"
#############
# vivaldi CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
chmod 4755 /tmp/repo2sfs/usr/lib/x86_64-linux-gnu/vivaldi/vivaldi_sandbox
#jonmod 180514a
#latest vivaldi amd64 https://www.vivaldi.com/el/computer/linux
mkdir -p /tmp/repo2sfs/usr/bin
# needs extras: libnss3 libgconf-2-4


#!/bin/sh

cat > /tmp/repo2sfs/usr/bin/vivaldi-puppy << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export vivaldi_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#su - puppy -c "/usr/bin/vivaldi  --user-data-dir=/home/puppy/vivaldi_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "vivaldi-stable --user-data-dir=/home/puppy/.data/vivaldi_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/vivaldi_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
EOF
chmod 755 /tmp/repo2sfs/usr/bin/vivaldi-puppy

cat > /tmp/repo2sfs/usr/share/applications/vivaldi_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=vivaldi puppy -repo2sfs changes.dat
Exec=vivaldi-puppy
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/vivaldi.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=vivaldi
StartupNotify=true
EOF2


cat > /tmp/repo2sfs/usr/bin/vivaldi-puppy-sda1 << EOF31
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/vivaldi
mkdir -p /mnt/sda1/downloads_linux/.cache/vivaldi
#su - puppy -c "/usr/bin/vivaldi  --user-data-dir=/home/puppy/vivaldi_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "vivaldi-stable --user-data-dir=/mnt/sda1/downloads_linux/.data/vivaldi --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/vivaldi --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF31
chmod 755 /tmp/repo2sfs/usr/bin/vivaldi-puppy-sda1

cat > /tmp/repo2sfs/usr/share/applications/vivaldi-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=vivaldi puppy -sda1(C:) EXTERNAL repo2sfs
Exec=vivaldi-puppy-sda1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/vivaldi.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=vivaldi
StartupNotify=true
EOF32




cat > /tmp/repo2sfs/usr/bin/vivaldi-puppy-sdb1 << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/vivaldi
mkdir -p /mnt/sdb1/downloads_linux/.cache/vivaldi
#su - puppy -c "/usr/bin/vivaldi  --user-data-dir=/home/puppy/vivaldi_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "vivaldi-stable --user-data-dir=/mnt/sdb1/downloads_linux/.data/vivaldi --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/vivaldi --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF41
chmod 755 /tmp/repo2sfs/usr/bin/vivaldi-puppy-sdb1

cat > /tmp/repo2sfs/usr/share/applications/vivaldi-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=vivaldi puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=vivaldi-puppy-sdb1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/vivaldi.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=vivaldi
StartupNotify=true
EOF42

echo "DONE with CUSTOMIZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "