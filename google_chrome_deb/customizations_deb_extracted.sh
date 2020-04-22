#!/bin/sh
echo "UNTESTED (maybe have dependecies)  Google Chrome browser CUSTOMIZATION SCRIPT"
#############
# google-chrome-stable CUSTOMIZATION SCRIPT  jonmod 200327
#############

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

#chmod 755 $1/usr/bin/google-chrome-stable-puppy
#mkdir -p $1/usr/bin
#mkdir -p $1/usr/lib/google-chrome-stable/
#mkdir -p $1/usr/share/applications/
#chmod 4755 $1/usr/lib/x86_64-linux-gnu/google-chrome-stable/google-chrome-stable_sandbox
#cp ./chrome-sandbox__google-chrome-stable_58 "$1/usr/lib/google-chrome-stable/chrome-sandbox"
#chmod 4755 $1/usr/lib/google-chrome-stable/chrome-sandbox
#read -p "Done. Remember to create the puppy user. Press Enter: "



TODAYDATE=$(date +'%y%m%d')
mv -n "./$1/control" "$1""/""$1""_""$TODAYDATE""_control.txt"

#!/bin/sh

cat > $1/usr/bin/google-chrome-stable-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export google-chrome-stable_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
sudo chown root /opt/google/chrome/chrome-sandbox
sudo chmod 4755 /opt/google/chrome/chrome-sandbox
#sudo -u puppy /usr/bin/google-chrome-stable  --user-data-dir=/home/puppy/google-chrome-stable_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy google-chrome-stable --user-data-dir=/home/puppy/.data/google-chrome-stable_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/google-chrome-stable_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-features=TranslateUI --always-authorize-plugins --media-cache-size=10000000 \$@"
EOF
chmod 755 $1/usr/bin/google-chrome-stable-puppy.sh

cat > $1/usr/share/applications/google-chrome-stable_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=google-chrome-stable puppy -repo2sfs changes.dat
Exec=google-chrome-stable-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/google-chrome-stable.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=google-chrome-stable
StartupNotify=true
EOF2

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/google-chrome-stable-puppy-home.sh << EOF61
#!/bin/sh
sudo chown root /opt/google/chrome/chrome-sandbox
sudo chmod 4755 /opt/google/chrome/chrome-sandbox
xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/google-chrome-stable
mkdir -p /mnt/home/downloads_linux/.cache/google-chrome-stable
sudo -u puppy google-chrome-stable --user-data-dir=/mnt/home/downloads_linux/.data/google-chrome-stable --disk-cache-dir=/mnt/home/downloads_linux/.cache/google-chrome-stable --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=31.0.0.171 \$@"
EOF61
chmod 755 $1/usr/bin/google-chrome-stable-puppy-home.sh

cat > $1/usr/share/applications/google-chrome-stable-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=google-chrome-stable puppy -home EXTERNAL repo2sfs
Exec=google-chrome-stable-puppy-home.sh
Comment=Browser saves to home
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/google-chrome-stable.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=google-chrome-stable
StartupNotify=true
EOF62
fi

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/google-chrome-stable-puppy-sda1.sh << EOF31
#!/bin/sh
sudo chown root /opt/google/chrome/chrome-sandbox
sudo chmod 4755 /opt/google/chrome/chrome-sandbox
xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/google-chrome-stable
mkdir -p /mnt/sda1/downloads_linux/.cache/google-chrome-stable
#sudo -u puppy /usr/bin/google-chrome-stable  --user-data-dir=/home/puppy/google-chrome-stable_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy google-chrome-stable --user-data-dir=/mnt/sda1/downloads_linux/.data/google-chrome-stable --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/google-chrome-stable --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$@"
EOF31
chmod 755 $1/usr/bin/google-chrome-stable-puppy-sda1.sh

cat > $1/usr/share/applications/google-chrome-stable-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=google-chrome-stable puppy -sda1(C:) EXTERNAL repo2sfs
Exec=google-chrome-stable-puppy-sda1.sh
Comment=Browser saves to sda1 C:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/google-chrome-stable.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=google-chrome-stable
StartupNotify=true
EOF32
fi


################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/google-chrome-stable-puppy-sdb1.sh << EOF41
#!/bin/sh
sudo chown root /opt/google/chrome/chrome-sandbox
sudo chmod 4755 /opt/google/chrome/chrome-sandbox
xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/google-chrome-stable
mkdir -p /mnt/sdb1/downloads_linux/.cache/google-chrome-stable
#sudo -u puppy /usr/bin/google-chrome-stable  --user-data-dir=/home/puppy/google-chrome-stable_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy google-chrome-stable --user-data-dir=/mnt/sdb1/downloads_linux/.data/google-chrome-stable --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/google-chrome-stable --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$@"
EOF41
chmod 755 $1/usr/bin/google-chrome-stable-puppy-sdb1.sh

cat > $1/usr/share/applications/google-chrome-stable-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=google-chrome-stable puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=google-chrome-stable-puppy-sdb1.sh
Comment=Browser saves to sdb1 usb flash or maybe D:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/google-chrome-stable.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=google-chrome-stable
StartupNotify=true
EOF42
fi

echo "DONE with CUSTOMIZATION of $1 ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "