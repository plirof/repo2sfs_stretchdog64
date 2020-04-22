#!/bin/sh
echo "waterfox browser CUSTOMIZATION SCRIPT (FIREFOX BASED)"
#############
# waterfox CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#chmod 4755 $1/usr/lib/x86_64-linux-gnu/waterfox/waterfox_sandbox
#jonmod 180514a
#latest waterfox amd64 https://www.waterfoxproject.org/en-US/waterfox/new/

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

mkdir -p "$1/opt"
touch "./$1/$1.txt"
echo "NOW COPY"
mv "$1/waterfox" "$1/opt/waterfox"
echo "END COPY----------------------------------------------"
mkdir -p $1/usr/bin
mkdir -p $1/usr/share/applications
cp -n ./waterfox_default_sda1_prefs.js $1/usr/bin/waterfox_default_sda1_prefs.js
cp -n ./waterfox_default_sdb1_prefs.js $1/usr/bin/waterfox_default_sdb1_prefs.js
cp -n ./waterfox_default_home_prefs.js $1/usr/bin/waterfox_default_home_prefs.js
# needs extras: libnss3 libgconf-2-4




cat > $1/usr/bin/waterfox-puppy.sh << EOF
#!/bin/sh
xhost +local:puppy
sudo -u puppy /opt/waterfox/waterfox
EOF
chmod 755 $1/usr/bin/waterfox-puppy.sh

cat > $1/usr/share/applications/waterfox_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=waterfox puppy -repo2sfs changes.dat
Exec=waterfox-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/waterfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=waterfox
StartupNotify=true
EOF2

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/waterfox-puppy-home.sh << EOF61
#####   home #####################################################

xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/waterfox
mkdir -p /mnt/home/downloads_linux/.cache/waterfox
cp -n /usr/bin/waterfox_default_home_prefs.js /mnt/home/downloads_linux/.data/waterfox/prefs.js
sudo -u puppy /opt/waterfox/waterfox -profile "/mnt/home/downloads_linux/.data/waterfox" "$@"
EOF61
chmod 755 $1/usr/bin/waterfox-puppy-home.sh

cat > $1/usr/share/applications/waterfox-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=waterfox puppy -home(C:) EXTERNAL repo2sfs
Exec=waterfox-puppy-home.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/waterfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=waterfox
StartupNotify=true
EOF62
fi
################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/waterfox-puppy-sda1.sh << EOF31
#####   SDA1 #####################################################

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/waterfox
mkdir -p /mnt/sda1/downloads_linux/.cache/waterfox
cp -n /usr/bin/waterfox_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/waterfox/prefs.js
sudo -u puppy /opt/waterfox/waterfox -profile "/mnt/sda1/downloads_linux/.data/waterfox" "$@"
EOF31
chmod 755 $1/usr/bin/waterfox-puppy-sda1.sh

cat > $1/usr/share/applications/waterfox-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=waterfox puppy -sda1(C:) EXTERNAL repo2sfs
Exec=waterfox-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/waterfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=waterfox
StartupNotify=true
EOF32
fi

################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/waterfox-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/waterfox
mkdir -p /mnt/sdb1/downloads_linux/.cache/waterfox
cp -n /usr/bin/waterfox_default_sdb1_prefs.js /mnt/sdb1/downloads_linux/.data/waterfox/prefs.js
sudo -u puppy /opt/waterfox/waterfox -profile "/mnt/sda1/downloads_linux/.data/waterfox" "$@"
EOF41
chmod 755 $1/usr/bin/waterfox-puppy-sdb1.sh

cat > $1/usr/share/applications/waterfox-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=waterfox puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=waterfox-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/waterfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=waterfox
StartupNotify=true
EOF42
fi



echo "DONE with CUSTOMIZATION of $1/ ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "