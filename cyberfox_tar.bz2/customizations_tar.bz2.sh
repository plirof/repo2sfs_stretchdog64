#!/bin/sh
echo "cyberfox browser CUSTOMIZATION SCRIPT (FIREFOX BASED)"
#############
# cyberfoxfox CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#chmod 4755 $1/usr/lib/x86_64-linux-gnu/cyberfox/cyberfox_sandbox
#jonmod 180514a
#latest cyberfox amd64 https://www.cyberfoxproject.org/en-US/cyberfox/new/

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

mkdir -p "$1/opt"
touch "./$1/$1.txt"
echo "NOW COPY"
mv "$1/cyberfox" "$1/opt/cyberfox"
echo "END COPY----------------------------------------------"
mkdir -p $1/usr/bin
mkdir -p $1/usr/share/applications
cp -n ./cyberfox_default_sda1_prefs.js $1/usr/bin/cyberfox_default_sda1_prefs.js
cp -n ./cyberfox_default_sdb1_prefs.js $1/usr/bin/cyberfox_default_sdb1_prefs.js
cp -n ./cyberfox_default_home_prefs.js $1/usr/bin/cyberfox_default_home_prefs.js
# needs extras: libnss3 libgconf-2-4




cat > $1/usr/bin/cyberfox-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export cyberfox_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
sudo -u puppy /opt/cyberfox/cyberfox
EOF
chmod 755 $1/usr/bin/cyberfox-puppy.sh

cat > $1/usr/share/applications/cyberfox_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=cyberfox puppy -repo2sfs changes.dat
Exec=cyberfox-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/cyberfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=cyberfox
StartupNotify=true
EOF2

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/cyberfox-puppy-home.sh << EOF61
#####   home #####################################################

xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/cyberfox
mkdir -p /mnt/home/downloads_linux/.cache/cyberfox
cp -n /usr/bin/cyberfox_default_home_prefs.js /mnt/home/downloads_linux/.data/cyberfox/prefs.js
sudo -u puppy /opt/cyberfox/cyberfox -profile "/mnt/home/downloads_linux/.data/cyberfox" "\$@"
EOF61
chmod 755 $1/usr/bin/cyberfox-puppy-home.sh

cat > $1/usr/share/applications/cyberfox-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=cyberfox puppy -home(C:) EXTERNAL repo2sfs
Exec=cyberfox-puppy-home.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/cyberfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=cyberfox
StartupNotify=true
EOF62
fi
################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/cyberfox-puppy-sda1.sh << EOF31
#####   SDA1 #####################################################

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/cyberfox
mkdir -p /mnt/sda1/downloads_linux/.cache/cyberfox
cp -n /usr/bin/cyberfox_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/cyberfox/prefs.js
sudo -u puppy /opt/cyberfox/cyberfox -profile "/mnt/sda1/downloads_linux/.data/cyberfox" "\$@"
EOF31
chmod 755 $1/usr/bin/cyberfox-puppy-sda1.sh

cat > $1/usr/share/applications/cyberfox-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=cyberfox puppy -sda1(C:) EXTERNAL repo2sfs
Exec=cyberfox-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/cyberfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=cyberfox
StartupNotify=true
EOF32
fi

################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/cyberfox-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/cyberfox
mkdir -p /mnt/sdb1/downloads_linux/.cache/cyberfox
cp -n /usr/bin/cyberfox_default_sdb1_prefs.js /mnt/sdb1/downloads_linux/.data/cyberfox/prefs.js
sudo -u puppy /opt/cyberfox/cyberfox -profile "/mnt/sda1/downloads_linux/.data/cyberfox" "\$@"
EOF41
chmod 755 $1/usr/bin/cyberfox-puppy-sdb1.sh

cat > $1/usr/share/applications/cyberfox-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=cyberfox puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=cyberfox-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/cyberfox.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=cyberfox
StartupNotify=true
EOF42
fi



echo "DONE with CUSTOMIZATION of $1/ ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "