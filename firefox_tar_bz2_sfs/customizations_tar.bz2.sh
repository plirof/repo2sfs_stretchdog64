#!/bin/sh
echo "firefox browser CUSTOMIZATION SCRIPT (FIREFOX BASED)"
#############
# firefox CUSTOMIZATION SCRIPT  jonmod 201114- added pulseaudio
#############
#chmod 4755 $1/usr/lib/x86_64-linux-gnu/firefox/firefox_sandbox
#jonmod 180514a
#latest firefox amd64 https://www.firefoxproject.org/en-US/firefox/new/

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDA2SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

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
cp -n ./firefox_default_home_prefs.js $1/usr/bin/firefox_default_home_prefs.js
# needs extras: libnss3 libgconf-2-4



################### Changes.dat home/puppy #############################################
cat > $1/usr/bin/firefox-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export firefox_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171  --media-cache-size=10000000"
xhost +local:puppy
#sudo -u puppy /opt/firefox/firefox -no-remote --user-data-dir=/home/puppy/.data/firefox_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/firefox_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-features=TranslateUI --always-authorize-plugins --media-cache-size=10000000 "\$@"
#added pulseaudio run to enable sound
sudo -u puppy /usr/bin/pulseaudio &
sudo -u puppy /opt/firefox/firefox -no-remote
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


################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > $1/usr/bin/firefox-puppy-home.sh << EOF61
#!/bin/sh

xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/firefox
mkdir -p /mnt/home/downloads_linux/.cache/firefox
cp -n /usr/bin/firefox_default_home_prefs.js /mnt/home/downloads_linux/.data/firefox/prefs.js
#added pulseaudio run to enable sound
sudo -u puppy /usr/bin/pulseaudio &
sudo -u puppy /opt/firefox/firefox -no-remote -profile "/mnt/home/downloads_linux/.data/firefox" "\$@"
EOF61
chmod 755 $1/usr/bin/firefox-puppy-home.sh

cat > $1/usr/share/applications/firefox-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=firefox puppy -home EXTERNAL repo2sfs
Exec=firefox-puppy-home.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default16.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=firefox
StartupNotify=true
EOF62
fi


################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > $1/usr/bin/firefox-puppy-sda1.sh << EOF31


#####   SDA1 #####################################################

xhost +local:puppy
mkdir -p /mnt/sda1/downloads_linux/.data/firefox
mkdir -p /mnt/sda1/downloads_linux/.cache/firefox
cp -n /usr/bin/firefox_default_sda1_prefs.js /mnt/sda1/downloads_linux/.data/firefox/prefs.js
sudo -u puppy /opt/firefox/firefox -no-remote -profile "/mnt/sda1/downloads_linux/.data/firefox" "\$@"
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
sudo -u puppy /opt/firefox/firefox -no-remote -profile "/mnt/sdb1/downloads_linux/.data/firefox" "\$@"
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
sudo -u puppy /opt/firefox/firefox -no-remote -profile "/mnt/sda2/downloads_linux/.data/firefox" "\$@"
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


##############  pavucontrol-puppy.sh ###############
cat > $1/usr/bin/pavucontrol-puppy.sh << EOFpavucontrol
#####   sda2 #####################################################

#!/bin/sh
xhost +local:puppy
#sudo -u puppy /opt/firefox/firefox -no-remote --user-data-dir=/home/puppy/.data/firefox_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/firefox_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=29.0.0.171 --disable-features=TranslateUI --always-authorize-plugins --media-cache-size=10000000 "$@"
sudo -u puppy /usr/bin/pavucontrol
EOFpavucontrol
chmod 755 $1/usr/bin/pavucontrol-puppy.sh


cat > $1/usr/share/applications/pavucontrol-puppy.desktop << EOFpavucontrolDesktop
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=PulseAudio Volume Control (user PUPPY)
Exec=pavucontrol-puppy.sh
Icon=multimedia-volume-control
StartupNotify=true
Type=Application
Categories=AudioVideo;Audio;Mixer;GTK;
EOFpavucontrolDesktop




############## ROOT USER ##############
cat > $1/usr/share/applications/firefox_root.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=firefox ROOT changes.dat
Exec=/opt/firefox/firefox -no-remote
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