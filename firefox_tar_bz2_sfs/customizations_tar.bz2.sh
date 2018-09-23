#!/bin/sh
echo "firefox browser CUSTOMIZATION SCRIPT (FIREFOX BASED)"
#############
# firefox CUSTOMIZATION SCRIPT  jonmod 180530a 
#############
#chmod 4755 $1/usr/lib/x86_64-linux-gnu/firefox/firefox_sandbox
#jonmod 180514a
#latest firefox amd64 https://www.firefoxproject.org/en-US/firefox/new/

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=true
SDA2SCRIPTS=true
SDB1SCRIPTS=true


mkdir -p "$1/opt"
touch "./$1/$1.txt"
echo "NOW COPY"
mv "$1/firefox" "$1/opt/firefox"
echo "END COPY----------------------------------------------"
mkdir -p $1/usr/bin
mkdir -p $1/usr/share/applications
cp -n ./firefox_default_sda1_prefs.js $1/usr/bin/firefox_default_sda1_prefs.js
cp -n ./firefox_default_sdb1_prefs.js $1/usr/bin/firefox_default_sdb1_prefs.js
cp -n ./firefox_default_sda2_prefs.js $1/usr/bin/firefox_default_sda2_prefs.js
# needs extras: libnss3 libgconf-2-4



################### Changes.dat home/puppy #############################################
cat > $1/usr/bin/firefox-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export firefox_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#su -l puppy -c "/opt/firefox/firefox --user-data-dir=/home/puppy/.data/firefox_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/firefox_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-translate --always-authorize-plugins --media-cache-size=10000000 \$1"
su -l puppy -c "/opt/firefox/firefox"
EOF
chmod 755 $1/usr/bin/firefox-puppy.sh

cat > $1/usr/share/applications/firefox_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=firefox puppy -repo2sfs changes.dat
Exec=firefox-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default16.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=firefox
StartupNotify=true
EOF2

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/firefox-puppy-sda1.sh << EOF31
#####   SDA1 #####################################################

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/firefox
mkdir -p /mnt/sda1/downloads_linux/.cache/firefox
cp -n /usr/bin/firefox_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/firefox/prefs.js
#su -l puppy -c "/opt/firefox/firefox --user-data-dir=/mnt/sda1/downloads_linux/.data/firefox --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/firefox --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
su -l puppy -c '/opt/firefox/firefox -profile "/mnt/sda1/downloads_linux/.data/firefox" \$1'
EOF31
chmod 755 $1/usr/bin/firefox-puppy-sda1.sh

cat > $1/usr/share/applications/firefox-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=firefox puppy -sda1(C:) EXTERNAL repo2sfs
Exec=firefox-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default16.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=firefox
StartupNotify=true
EOF32
fi

################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > $1/usr/bin/firefox-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/sdb1/downloads_linux/.data/firefox
mkdir -p /mnt/sdb1/downloads_linux/.cache/firefox
cp -n /usr/bin/firefox_default_sdb1_prefs.js /mnt/sdb1/downloads_linux/.data/firefox/prefs.js
#su -l puppy -c "/opt/firefox/firefox --user-data-dir=/mnt/sdb1/downloads_linux/.data/firefox --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/firefox --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
su -l puppy -c '/opt/firefox/firefox -profile "/mnt/sdb1/downloads_linux/.data/firefox" \$1'
EOF41
chmod 755 $1/usr/bin/firefox-puppy-sdb1.sh

cat > $1/usr/share/applications/firefox-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=firefox puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=firefox-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default16.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=firefox
StartupNotify=true
EOF42
fi

################### SDA2 #########################################################
if [ $SDA2SCRIPTS == true ]
then
cat > $1/usr/bin/firefox-puppy-sda2.sh << EOF51
#####   sda2 #####################################################

xhost +local:puppy
mkdir -p /mnt/sda2/downloads_linux/.data/firefox
mkdir -p /mnt/sda2/downloads_linux/.cache/firefox
cp -n /usr/bin/firefox_default_sda2_prefs.js /mnt/sda2/downloads_linux/.data/firefox/prefs.js
#su -l puppy -c "/opt/firefox/firefox --user-data-dir=/mnt/sda2/downloads_linux/.data/firefox --disk-cache-dir=/mnt/sda2/downloads_linux/.cache/firefox --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-translate --always-authorize-plugins  --ppapi-flash-version=29.0.0.171 \$1"
su -l puppy -c '/opt/firefox/firefox -profile "/mnt/sda2/downloads_linux/.data/firefox" \$1'
EOF51
chmod 755 $1/usr/bin/firefox-puppy-sda2.sh

cat > $1/usr/share/applications/firefox-puppy-sda2.desktop << EOF52
[Desktop Entry]
Version=1.0
Name=firefox puppy -sda2(C:) EXTERNAL repo2sfs
Exec=firefox-puppy-sda2.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default16.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=firefox
StartupNotify=true
EOF52
fi



############## ROOT USER ##############
cat > $1/usr/share/applications/firefox_root.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=firefox ROOT changes.dat
Exec=/opt/firefox/firefox
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default16.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=firefox
StartupNotify=true
EOF2



echo "DONE with CUSTOMIZATION of $1/ ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "