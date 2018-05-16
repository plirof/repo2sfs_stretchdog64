#!/bin/sh
echo "waterfox browser CUSTOMIZATION SCRIPT (FIREFOX BASED)"
#############
# waterfox CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#chmod 4755 /tmp/repo2sfs/usr/lib/x86_64-linux-gnu/waterfox/waterfox_sandbox
#jonmod 180514a
#latest waterfox amd64 https://www.waterfoxproject.org/en-US/waterfox/new/
mkdir -p /tmp/repo2sfs/usr/bin
cp -n ./waterfox_default_sda1_prefs.js /tmp/repo2sfs/usr/bin/waterfox_default_sda1_prefs.js
cp -n ./waterfox_default_sdb1_prefs.js /tmp/repo2sfs/usr/bin/waterfox_default_sdb1_prefs.js
# needs extras: libnss3 libgconf-2-4




cat > /tmp/repo2sfs/usr/bin/waterfox-puppy << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export waterfox_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#su -l puppy -c "waterfox --user-data-dir=/home/puppy/.data/waterfox_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/waterfox_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
su -l puppy -c "waterfox"
EOF
chmod 755 /tmp/repo2sfs/usr/bin/waterfox-puppy

cat > /tmp/repo2sfs/usr/share/applications/waterfox_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=waterfox puppy -repo2sfs changes.dat
Exec=waterfox-puppy
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/waterfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=waterfox
StartupNotify=true
EOF2


cat > /tmp/repo2sfs/usr/bin/waterfox-puppy-sda1 << EOF31
#####   SDA1 #####################################################

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/waterfox
mkdir -p /mnt/sda1/downloads_linux/.cache/waterfox
cp -n /usr/bin/waterfox_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/waterfox/prefs.js
#su -l puppy -c "waterfox --user-data-dir=/mnt/sda1/downloads_linux/.data/waterfox --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/waterfox --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
su -l puppy -c 'waterfox -profile "/mnt/sda1/downloads_linux/.data/waterfox" \$1'
EOF31
chmod 755 /tmp/repo2sfs/usr/bin/waterfox-puppy-sda1

cat > /tmp/repo2sfs/usr/share/applications/waterfox-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=waterfox puppy -sda1(C:) EXTERNAL repo2sfs
Exec=waterfox-puppy-sda1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/waterfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=waterfox
StartupNotify=true
EOF32




cat > /tmp/repo2sfs/usr/bin/waterfox-puppy-sdb1 << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/waterfox
mkdir -p /mnt/sdb1/downloads_linux/.cache/waterfox
cp -n /usr/bin/waterfox_default_sdb1_prefs.js /mnt/sdb1/downloads_linux/.data/waterfox/prefs.js
#su -l puppy -c "waterfox --user-data-dir=/mnt/sdb1/downloads_linux/.data/waterfox --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/waterfox --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
su -l puppy -c 'waterfox -profile "/mnt/sda1/downloads_linux/.data/waterfox" \$1'
EOF41
chmod 755 /tmp/repo2sfs/usr/bin/waterfox-puppy-sdb1

cat > /tmp/repo2sfs/usr/share/applications/waterfox-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=waterfox puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=waterfox-puppy-sdb1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/waterfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=waterfox
StartupNotify=true
EOF42


cat > /tmp/repo2sfs/usr/bin/waterfox-puppy-sda1 << EOF31




echo "DONE with CUSTOMIZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "