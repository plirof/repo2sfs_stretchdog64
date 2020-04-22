#!/bin/sh
echo "UNTESTED (maybe have dependecies)  IRIDIUM browser CUSTOMIZATION SCRIPT"
#############
# iridium-browser CUSTOMIZATION SCRIPT  jonmod 180514a 
#############

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

#chmod 755 $1/usr/bin/iridium-browser-puppy
mkdir -p $1/usr/bin
mkdir -p $1/usr/lib/iridium-browser/
mkdir -p $1/usr/share/applications/
chmod 4755 $1/usr/lib/x86_64-linux-gnu/iridium-browser/iridium-browser_sandbox
cp ./chrome-sandbox__iridium-browser_58 "$1/usr/lib/iridium-browser/chrome-sandbox"
chmod 4755 $1/usr/lib/iridium-browser/chrome-sandbox
#read -p "Done. Remember to create the puppy user. Press Enter: "



#!/bin/sh
#jonmod 180514a
#latest iridium-browser amd64 https://www.iridium-browser.com/el/computer/linux
mkdir -p $1/usr/bin
# needs extras: libnss3 libgconf-2-4


#!/bin/sh

cat > $1/usr/bin/iridium-browser-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export iridium-browser_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#sudo -u puppy /usr/bin/iridium-browser  --user-data-dir=/home/puppy/iridium-browser_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy iridium-browser --user-data-dir=/home/puppy/.data/iridium-browser_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/iridium-browser_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-features=TranslateUI --always-authorize-plugins --media-cache-size=10000000 "$@"
EOF
chmod 755 $1/usr/bin/iridium-browser-puppy.sh

cat > $1/usr/share/applications/iridium-browser_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=iridium-browser puppy -repo2sfs changes.dat
Exec=iridium-browser-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iridium-browser.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=iridium-browser
StartupNotify=true
EOF2

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/iridium-browser-puppy-home.sh << EOF61
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/iridium-browser
mkdir -p /mnt/home/downloads_linux/.cache/iridium-browser
sudo -u puppy iridium-browser --user-data-dir=/mnt/home/downloads_linux/.data/iridium-browser --disk-cache-dir=/mnt/home/downloads_linux/.cache/iridium-browser --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=31.0.0.171 "$@"
EOF61
chmod 755 $1/usr/bin/iridium-browser-puppy-home.sh

cat > $1/usr/share/applications/iridium-browser-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=iridium-browser puppy -home EXTERNAL repo2sfs
Exec=iridium-browser-puppy-home.sh
Comment=Browser saves to home
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iridium-browser.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=iridium-browser
StartupNotify=true
EOF62
fi

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/iridium-browser-puppy-sda1.sh << EOF31
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/iridium-browser
mkdir -p /mnt/sda1/downloads_linux/.cache/iridium-browser
#sudo -u puppy /usr/bin/iridium-browser  --user-data-dir=/home/puppy/iridium-browser_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy iridium-browser --user-data-dir=/mnt/sda1/downloads_linux/.data/iridium-browser --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/iridium-browser --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "$@"
EOF31
chmod 755 $1/usr/bin/iridium-browser-puppy-sda1.sh

cat > $1/usr/share/applications/iridium-browser-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=iridium-browser puppy -sda1(C:) EXTERNAL repo2sfs
Exec=iridium-browser-puppy-sda1.sh
Comment=Browser saves to sda1 C:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iridium-browser.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=iridium-browser
StartupNotify=true
EOF32
fi


################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/iridium-browser-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/iridium-browser
mkdir -p /mnt/sdb1/downloads_linux/.cache/iridium-browser
#sudo -u puppy /usr/bin/iridium-browser  --user-data-dir=/home/puppy/iridium-browser_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy iridium-browser --user-data-dir=/mnt/sdb1/downloads_linux/.data/iridium-browser --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/iridium-browser --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "$@"
EOF41
chmod 755 $1/usr/bin/iridium-browser-puppy-sdb1.sh

cat > $1/usr/share/applications/iridium-browser-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=iridium-browser puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=iridium-browser-puppy-sdb1.sh
Comment=Browser saves to sdb1 usb flash or maybe D:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iridium-browser.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=iridium-browser
StartupNotify=true
EOF42
fi

echo "DONE with CUSTOMIZATION of $1 ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "