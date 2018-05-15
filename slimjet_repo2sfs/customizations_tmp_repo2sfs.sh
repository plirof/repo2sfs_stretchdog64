#!/bin/sh
#############
# SLIMJET CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#latest slimjet amd64 https://www.slimjetbrowser.com/release/slimjet_amd64.deb
mkdir -p /tmp/repo2sfs/usr/bin
# needs extras: libnss3 libgconf-2-4


#!/bin/sh

cat > /tmp/repo2sfs/usr/bin/slimjet-puppy << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export SLIMJET_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#su - puppy -c "/usr/bin/slimjet  --user-data-dir=/home/puppy/slimjet_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "flashpeak-slimjet --user-data-dir=/home/puppy/.data/slimjet_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/slimjet_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
EOF
chmod 755 /tmp/repo2sfs/usr/bin/slimjet-puppy

cat > /tmp/repo2sfs/usr/share/applications/slimjet.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=Slimjet puppy -repo2sfs changes.dat
Exec=slimjet-puppy
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/slimjet.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Slimjet
StartupNotify=true
EOF2


cat > /tmp/repo2sfs/usr/bin/slimjet-puppy-sda1 << EOF31
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/slimjet
mkdir -p /mnt/sda1/downloads_linux/.cache/slimjet
#su - puppy -c "/usr/bin/slimjet  --user-data-dir=/home/puppy/slimjet_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "flashpeak-slimjet --user-data-dir=/mnt/sda1/downloads_linux/.data/slimjet --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/slimjet --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF31
chmod 755 /tmp/repo2sfs/usr/bin/slimjet-puppy-sda1

cat > /tmp/repo2sfs/usr/share/applications/slimjet-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=Slimjet puppy -sda1(C:) EXTERNAL repo2sfs
Exec=slimjet-puppy-sda1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/slimjet.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Slimjet
StartupNotify=true
EOF32




cat > /tmp/repo2sfs/usr/bin/slimjet-puppy-sdb1 << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/slimjet
mkdir -p /mnt/sdb1/downloads_linux/.cache/slimjet
#su - puppy -c "/usr/bin/slimjet  --user-data-dir=/home/puppy/slimjet_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "flashpeak-slimjet --user-data-dir=/mnt/sdb1/downloads_linux/.data/slimjet --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/slimjet --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF41
chmod 755 /tmp/repo2sfs/usr/bin/slimjet-puppy-sdb1

cat > /tmp/repo2sfs/usr/share/applications/slimjet-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=Slimjet puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=slimjet-puppy-sdb1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/slimjet.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Slimjet
StartupNotify=true
EOF42

echo "DONE with CUSTOMAZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "