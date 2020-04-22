#!/bin/sh
echo "ERROR firefox based - CYBERFOX browser CUSTOMIZATION SCRIPT"
#############
# cyberfox CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#chmod 4755 /tmp/repo2sfs/usr/lib/x86_64-linux-gnu/cyberfox/cyberfox_sandbox
#jonmod 180514a
#latest cyberfox amd64 https://cyberfox.8pecxstudios.com/cyberfox-linux/

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

mkdir -p /tmp/repo2sfs/usr/bin
# needs extras: libnss3 libgconf-2-4
/tmp/repo2sfs/usr/bin/
cp -n ./cyberfox_default_sda1_prefs.js /tmp/repo2sfs/usr/bin/cyberfox_default_sda1_prefs.js
cp -n ./cyberfox_default_sdb1_prefs.js /tmp/repo2sfs/usr/bin/cyberfox_default_sdb1_prefs.js
cp -n ./cyberfox_default_home_prefs.js /tmp/repo2sfs/usr/bin/cyberfox_default_home_prefs.js
#!/bin/sh

cat > /tmp/repo2sfs/usr/bin/cyberfox-puppy << EOF
#!/bin/sh
xhost +local:puppy
sudo -u puppy cyberfox "$@"
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

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/cyberfox-puppy-home.sh << EOF61
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/cyberfox
mkdir -p /mnt/home/downloads_linux/.cache/cyberfox
cp -n /usr/bin/cyberfox_default_home_prefs.js /mnt/home/downloads_linux/.data/cyberfox/prefs.js

sudo -u puppy cyberfox -profile "/mnt/home/downloads_linux/.data/cyberfox" "$@"
EOF61

chmod 755 /tmp/repo2sfs/usr/bin/cyberfox-puppy-home.sh

cat > /tmp/repo2sfs/usr/share/applications/cyberfox-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=cyberfox puppy -home(C:) EXTERNAL repo2sfs
Exec=cyberfox-puppy-home.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/cyberfox.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=cyberfox
StartupNotify=true
EOF62

fi

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/cyberfox-puppy-sda1 << EOF31
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/cyberfox
mkdir -p /mnt/sda1/downloads_linux/.cache/cyberfox
cp -n /usr/bin/cyberfox_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/cyberfox/prefs.js
sudo -u puppy cyberfox -profile "/mnt/sda1/downloads_linux/.data/cyberfox" "$@"
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
sudo -u puppy cyberfox -profile "/mnt/sdb1/downloads_linux/.data/cyberfox" "$@"

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