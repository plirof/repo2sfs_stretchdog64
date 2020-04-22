#!/bin/sh
echo "seamonkey browser CUSTOMIZATION SCRIPT (FIREFOX BASED)"
#############
# seamonkey CUSTOMIZATION SCRIPT  jonmod 180514a 
#############
#chmod 4755 $1/usr/lib/x86_64-linux-gnu/seamonkey/seamonkey_sandbox
#jonmod 180514a
#latest seamonkey amd64 https://www.seamonkeyproject.org/en-US/seamonkey/new/

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

mkdir -p "$1/opt"
touch "./$1/$1.txt"
echo "NOW COPY"
mv "$1/seamonkey" "$1/opt/seamonkey"
echo "END COPY----------------------------------------------"
mkdir -p $1/usr/bin
mkdir -p $1/usr/share/applications
cp -n ./seamonkey_default_sda1_prefs.js $1/usr/bin/seamonkey_default_sda1_prefs.js
cp -n ./seamonkey_default_sdb1_prefs.js $1/usr/bin/seamonkey_default_sdb1_prefs.js
cp -n ./seamonkey_default_home_prefs.js $1/usr/bin/seamonkey_default_home_prefs.js
# needs extras: libnss3 libgconf-2-4




cat > $1/usr/bin/seamonkey-puppy.sh << EOF
#!/bin/sh
xhost +local:puppy
sudo -u puppy /opt/seamonkey/seamonkey
EOF
chmod 755 $1/usr/bin/seamonkey-puppy.sh

cat > $1/usr/share/applications/seamonkey-puppy-changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=seamonkey puppy -repo2sfs changes.dat
Exec=seamonkey-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/seamonkey.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=seamonkey
StartupNotify=true
EOF2

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/seamonkey-puppy-home.sh << EOF61
#####   home #####################################################

xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/seamonkey
mkdir -p /mnt/home/downloads_linux/.cache/seamonkey
cp -n /usr/bin/seamonkey_default_home_prefs.js /mnt/home/downloads_linux/.data/seamonkey/prefs.js
#sudo -u puppy /opt/seamonkey/seamonkey --user-data-dir=/mnt/home/downloads_linux/.data/seamonkey --disk-cache-dir=/mnt/home/downloads_linux/.cache/seamonkey --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "\$@"
sudo -u puppy /opt/seamonkey/seamonkey -profile "/mnt/home/downloads_linux/.data/seamonkey" "\$@"
EOF61
chmod 755 $1/usr/bin/seamonkey-puppy-home.sh

cat > $1/usr/share/applications/seamonkey-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=seamonkey puppy -home(C:) EXTERNAL repo2sfs
Exec=seamonkey-puppy-home.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/seamonkey.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=seamonkey
StartupNotify=true
EOF62
fi
################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/seamonkey-puppy-sda1.sh << EOF31
#####   SDA1 #####################################################

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/seamonkey
mkdir -p /mnt/sda1/downloads_linux/.cache/seamonkey
cp -n /usr/bin/seamonkey_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/seamonkey/prefs.js
#sudo -u puppy /opt/seamonkey/seamonkey --user-data-dir=/mnt/sda1/downloads_linux/.data/seamonkey --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/seamonkey --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "\$@"
sudo -u puppy /opt/seamonkey/seamonkey -profile "/mnt/sda1/downloads_linux/.data/seamonkey" "\$@"
EOF31
chmod 755 $1/usr/bin/seamonkey-puppy-sda1.sh

cat > $1/usr/share/applications/seamonkey-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=seamonkey puppy -sda1(C:) EXTERNAL repo2sfs
Exec=seamonkey-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/seamonkey.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=seamonkey
StartupNotify=true
EOF32
fi

################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/seamonkey-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/seamonkey
mkdir -p /mnt/sdb1/downloads_linux/.cache/seamonkey
cp -n /usr/bin/seamonkey_default_sdb1_prefs.js /mnt/sdb1/downloads_linux/.data/seamonkey/prefs.js
#sudo -u puppy /opt/seamonkey/seamonkey --user-data-dir=/mnt/sdb1/downloads_linux/.data/seamonkey --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/seamonkey --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "\$@"
sudo -u puppy /opt/seamonkey/seamonkey -profile "/mnt/sda1/downloads_linux/.data/seamonkey" "\$@"
EOF41
chmod 755 $1/usr/bin/seamonkey-puppy-sdb1.sh

cat > $1/usr/share/applications/seamonkey-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=seamonkey puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=seamonkey-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/seamonkey.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=seamonkey
StartupNotify=true
EOF42
fi


################### ROOT #########################################################
cat > $1/usr/bin/seamonkey-root.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export seamonkey_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
/opt/seamonkey/seamonkey
EOF
chmod 755 $1/usr/bin/seamonkey-root.sh

cat > $1/usr/share/applications/seamonkey-root-changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=seamonkey ROOT -repo2sfs changes.dat
Exec=seamonkey-root.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/seamonkey.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=seamonkey
StartupNotify=true
EOF2


echo "DONE with CUSTOMIZATION of $1/ ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "