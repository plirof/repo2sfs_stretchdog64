#!/bin/sh
echo "UNTESTED (maybe have dependecies)  IRIDIUM browser CUSTOMIZATION SCRIPT"
#############
# iridium-browser CUSTOMIZATION SCRIPT  jonmod 180514a 
#############

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=true
SDB1SCRIPTS=true

#chmod 755 /tmp/repo2sfs/usr/bin/iridium-browser-puppy
chmod 4755 /tmp/repo2sfs/usr/lib/x86_64-linux-gnu/iridium-browser/iridium-browser_sandbox
cp ./chrome-sandbox__iridium-browser_58 "/tmp/repo2sfs/usr/lib/iridium-browser/chrome-sandbox"
chmod 4755 /tmp/repo2sfs/usr/lib/iridium-browser/chrome-sandbox
#read -p "Done. Remember to create the puppy user. Press Enter: "



#!/bin/sh
#jonmod 180514a
#latest iridium-browser amd64 https://www.iridium-browser.com/el/computer/linux
mkdir -p /tmp/repo2sfs/usr/bin
# needs extras: libnss3 libgconf-2-4


#!/bin/sh

cat > /tmp/repo2sfs/usr/bin/iridium-browser-puppy << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export iridium-browser_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#su - puppy -c "/usr/bin/iridium-browser  --user-data-dir=/home/puppy/iridium-browser_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "iridium-browser --user-data-dir=/home/puppy/.data/iridium-browser_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/iridium-browser_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
EOF
chmod 755 /tmp/repo2sfs/usr/bin/iridium-browser-puppy

cat > /tmp/repo2sfs/usr/share/applications/iridium-browser_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=iridium-browser puppy -repo2sfs changes.dat
Exec=iridium-browser-puppy
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iridium-browser.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=iridium-browser
StartupNotify=true
EOF2


################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/iridium-browser-puppy-sda1.sh << EOF31
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/iridium-browser
mkdir -p /mnt/sda1/downloads_linux/.cache/iridium-browser
#su - puppy -c "/usr/bin/iridium-browser  --user-data-dir=/home/puppy/iridium-browser_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "iridium-browser --user-data-dir=/mnt/sda1/downloads_linux/.data/iridium-browser --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/iridium-browser --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF31
chmod 755 /tmp/repo2sfs/usr/bin/iridium-browser-puppy-sda1.sh

cat > /tmp/repo2sfs/usr/share/applications/iridium-browser-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=iridium-browser puppy -sda1(C:) EXTERNAL repo2sfs
Exec=iridium-browser-puppy-sda1.sh
Comment=Browser saves to sda1 C:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iridium-browser.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=iridium-browser
StartupNotify=true
EOF32
fi


################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/iridium-browser-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/iridium-browser
mkdir -p /mnt/sdb1/downloads_linux/.cache/iridium-browser
#su - puppy -c "/usr/bin/iridium-browser  --user-data-dir=/home/puppy/iridium-browser_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
su -l puppy -c "iridium-browser --user-data-dir=/mnt/sdb1/downloads_linux/.data/iridium-browser --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/iridium-browser --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
EOF41
chmod 755 /tmp/repo2sfs/usr/bin/iridium-browser-puppy-sdb1.sh

cat > /tmp/repo2sfs/usr/share/applications/iridium-browser-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=iridium-browser puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=iridium-browser-puppy-sdb1.sh
Comment=Browser saves to sdb1 usb flash or maybe D:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/iridium-browser.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=iridium-browser
StartupNotify=true
EOF42
fi

echo "DONE with CUSTOMIZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "