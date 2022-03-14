#!/bin/sh
echo "UNTESTED (maybe have dependecies)  Chromium browser CUSTOMIZATION SCRIPT"
#############
# chromium-stable CUSTOMIZATION SCRIPT  jonmod 200327
#############

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

#chmod 755 $1/usr/bin/chromium-stable-puppy
#mkdir -p $1/usr/bin
#mkdir -p $1/usr/lib/chromium-stable/
#mkdir -p $1/usr/share/applications/
#chmod 4755 $1/usr/lib/x86_64-linux-gnu/chromium-stable/chromium-stable_sandbox
#cp ./chromium-sandbox__chromium-stable_58 "$1/usr/lib/chromium-stable/chromium-sandbox"
#chmod 4755 $1/usr/lib/chromium-stable/chromium-sandbox
#read -p "Done. Remember to create the puppy user. Press Enter: "



TODAYDATE=$(date +'%y%m%d')
mv -n "./$1/control" "$1""/""$1""_""$TODAYDATE""_control.txt"

#!/bin/sh

cat > $1/usr/bin/chromium-stable-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export chromium-stable_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
sudo chown root /opt/chromium/chromium-sandbox
sudo chmod 4755 /opt/chromium/chromium-sandbox
#sudo -u puppy /usr/bin/chromium-stable  --user-data-dir=/home/puppy/chromium-stable_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy chromium-stable --user-data-dir=/home/puppy/.data/chromium-stable_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/chromium-stable_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-features=TranslateUI --always-authorize-plugins --media-cache-size=10000000 "\$@"
EOF
chmod 755 $1/usr/bin/chromium-stable-puppy.sh

cat > $1/usr/share/applications/chromium-stable_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=chromium-stable puppy -repo2sfs changes.dat
Exec=chromium-stable-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/chromium-stable.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=chromium-stable
StartupNotify=true
EOF2

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/chromium-stable-puppy-home.sh << EOF61
#!/bin/sh
sudo chown root /opt/chromium/chromium-sandbox
sudo chmod 4755 /opt/chromium/chromium-sandbox
xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/chromium-stable
mkdir -p /mnt/home/downloads_linux/.cache/chromium-stable
sudo -u puppy chromium-stable --user-data-dir=/mnt/home/downloads_linux/.data/chromium-stable --disk-cache-dir=/mnt/home/downloads_linux/.cache/chromium-stable --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=31.0.0.171 "\$@"
EOF61
chmod 755 $1/usr/bin/chromium-stable-puppy-home.sh

cat > $1/usr/share/applications/chromium-stable-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=chromium-stable puppy -home EXTERNAL repo2sfs
Exec=chromium-stable-puppy-home.sh
Comment=Browser saves to home
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/chromium-stable.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=chromium-stable
StartupNotify=true
EOF62
fi

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/chromium-stable-puppy-sda1.sh << EOF31
#!/bin/sh
sudo chown root /opt/chromium/chromium-sandbox
sudo chmod 4755 /opt/chromium/chromium-sandbox
xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/chromium-stable
mkdir -p /mnt/sda1/downloads_linux/.cache/chromium-stable
#sudo -u puppy /usr/bin/chromium-stable  --user-data-dir=/home/puppy/chromium-stable_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy chromium-stable --user-data-dir=/mnt/sda1/downloads_linux/.data/chromium-stable --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/chromium-stable --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "\$@"
EOF31
chmod 755 $1/usr/bin/chromium-stable-puppy-sda1.sh

cat > $1/usr/share/applications/chromium-stable-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=chromium-stable puppy -sda1(C:) EXTERNAL repo2sfs
Exec=chromium-stable-puppy-sda1.sh
Comment=Browser saves to sda1 C:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/chromium-stable.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=chromium-stable
StartupNotify=true
EOF32
fi


################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/chromium-stable-puppy-sdb1.sh << EOF41
#!/bin/sh
sudo chown root /opt/chromium/chromium-sandbox
sudo chmod 4755 /opt/chromium/chromium-sandbox
xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/chromium-stable
mkdir -p /mnt/sdb1/downloads_linux/.cache/chromium-stable
#sudo -u puppy /usr/bin/chromium-stable  --user-data-dir=/home/puppy/chromium-stable_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy chromium-stable --user-data-dir=/mnt/sdb1/downloads_linux/.data/chromium-stable --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/chromium-stable --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 "\$@"
EOF41
chmod 755 $1/usr/bin/chromium-stable-puppy-sdb1.sh

cat > $1/usr/share/applications/chromium-stable-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=chromium-stable puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=chromium-stable-puppy-sdb1.sh
Comment=Browser saves to sdb1 usb flash or maybe D:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/chromium-stable.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=chromium-stable
StartupNotify=true
EOF42
fi

echo "DONE with CUSTOMIZATION of $1 ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "