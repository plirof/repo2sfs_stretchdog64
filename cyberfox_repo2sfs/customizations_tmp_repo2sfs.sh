#!/bin/sh
echo "ERROR firefox based - CYBERFOX browser CUSTOMIZATION SCRIPT"
#############
# cyberfox CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#chmod 4755 /tmp/repo2sfs/usr/lib/x86_64-linux-gnu/cyberfox/cyberfox_sandbox
#jonmod 180514a
#latest cyberfox amd64 https://cyberfox.8pecxstudios.com/cyberfox-linux/

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=true
SDB1SCRIPTS=true

mkdir -p /tmp/repo2sfs/usr/bin
# needs extras: libnss3 libgconf-2-4
/tmp/repo2sfs/usr/bin/
cp -n ./cyberfox_default_sda1_prefs.js /tmp/repo2sfs/usr/bin/cyberfox_default_sda1_prefs.js
cp -n ./cyberfox_default_sdb1_prefs.js /tmp/repo2sfs/usr/bin/cyberfox_default_sdb1_prefs.js

#!/bin/sh

cat > /tmp/repo2sfs/usr/bin/cyberfox-puppy << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export cyberfox_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
su -l puppy -c "cyberfox --user-data-dir=/home/puppy/.data/cyberfox_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/cyberfox_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
EOF

chmod 755 /tmp/repo2sfs/usr/bin/cyberfox-puppy

cat > /tmp/repo2sfs/usr/share/applications/cyberfox_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=cyberfox puppy -repo2sfs changes.dat
Exec=cyberfox-puppy
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/cyberfox.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=cyberfox
StartupNotify=true
EOF2


################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/cyberfox-puppy-sda1 << EOF31
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/cyberfox
mkdir -p /mnt/sda1/downloads_linux/.cache/cyberfox
cp -n /usr/bin/cyberfox_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/cyberfox/prefs.js

#su - puppy -c "/usr/bin/cyberfox  --user-data-dir=/home/puppy/cyberfox_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c 'cyberfox -profile "/mnt/sda1/downloads_linux/.data/cyberfox" \$1'
EOF31

chmod 755 /tmp/repo2sfs/usr/bin/cyberfox-puppy-sda1

cat > /tmp/repo2sfs/usr/share/applications/cyberfox-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=cyberfox puppy -sda1(C:) EXTERNAL repo2sfs
Exec=cyberfox-puppy-sda1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/cyberfox.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=cyberfox
StartupNotify=true
EOF32

fi

################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/cyberfox-puppy-sdb1 << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/cyberfox
mkdir -p /mnt/sdb1/downloads_linux/.cache/cyberfox
cp -n /usr/bin/cyberfox_default_sdb1_prefs.js /mnt/sdb1/downloads_linux/.data/cyberfox/prefs.js
#su - puppy -c "/usr/bin/cyberfox  --user-data-dir=/home/puppy/cyberfox_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#su -l puppy -c "cyberfox --user-data-dir=/mnt/sdb1/downloads_linux/.data/cyberfox --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/cyberfox --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
su -l puppy -c 'cyberfox -profile "/mnt/sdb1/downloads_linux/.data/cyberfox" \$1'

EOF41
chmod 755 /tmp/repo2sfs/usr/bin/cyberfox-puppy-sdb1

cat > /tmp/repo2sfs/usr/share/applications/cyberfox-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=cyberfox puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=cyberfox-puppy-sdb1
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/cyberfox.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=cyberfox
StartupNotify=true
EOF42
fi

echo "DONE with CUSTOMIZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "