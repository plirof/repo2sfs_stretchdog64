#!/bin/sh
echo "UNTESTED (maybe have dependecies)  chromium browser CUSTOMIZATION SCRIPT"
#############
# chromium-browser CUSTOMIZATION SCRIPT  jonmod 180514a 
#############

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=false
SDB1SCRIPTS=false
HOMESCRIPTS=true

#chmod 4755 /tmp/repo2sfs/usr/lib/chromium/chrome-sandbox

#cp -n /tmp/repo2sfs/usr/lib/chrome-linux/chrome_sandbox /tmp/repo2sfs/usr/lib/chromium/chrome-sandbox
#sudo chown root /tmp/repo2sfs/usr/lib/chrome-linux/chrome-sandbox
#sudo chmod 4755 /tmp/repo2sfs/usr/lib/chrome-linux/chrome-sandbox
#sudo chmod 4755 /tmp/repo2sfs/usr/lib/chrome-linux/chrome-wrapper

#original sandbox file (I think they are NOT used (thats why I cp to chrome-sandbox))
#sudo chown root /tmp/repo2sfs/usr/lib/chrome-linux/chrome_sandbox
#sudo chmod 4755 /tmp/repo2sfs/usr/lib/chrome-linux/chrome_sandbox

#read -p "Done. Remember to create the puppy user. Press Enter: "



#!/bin/sh
#jonmod 180514a
#latest chromium-browser amd64 https://www.chromium-browser.com/el/computer/linux
mkdir -p /tmp/repo2sfs/usr/bin
mkdir -p /tmp/repo2sfs/usr/lib
mkdir -p /tmp/repo2sfs/usr/share/applications/
# needs extras: libnss3 libgconf-2-4

echo "+++++++++++++ CUSTOMIZATION :  MOVING control and chromedriver +++++++++++++++"
mv "./chromedriver" "/tmp/repo2sfs/usr/bin/chromedriver"
mv ./*control.txt "/tmp/repo2sfs/"

cp -r ./libs_extra/x86_64-linux-gnu "/tmp/repo2sfs/usr/lib/x86_64-linux-gnu"

#!/bin/sh

cat > /tmp/repo2sfs/usr/bin/chromium-browser-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
#export chromium-browser_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=30.0.0.154  --media-cache-size=10000000"
xhost +local:puppy
#cp -n /usr/lib/chrome-linux/chrome_sandbox /usr/lib/chrome-linux/chrome-sandbox
ln -s /usr/lib/chrome-linux/chrome_sandbox /usr/lib/chrome-linux/chrome-sandbox
sudo chown root /usr/lib/chrome-linux/chrome-sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome-sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome-wrapper

#original sandbox file (I think they are NOT used (thats why I cp to chrome-sandbox))
sudo chown root /usr/lib/chrome-linux/chrome_sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome_sandbox

#sudo -u puppy /usr/bin/chromium-browser  --user-data-dir=/home/puppy/chromium-browser_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=30.0.0.154"
sudo -u puppy chromium --user-data-dir=/home/puppy/.data/chromium-browser_puppy_user_data_dir --disk-cache-dir=/home/puppy/.cache/chromium-browser_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=30.0.0.154 --disable-features=TranslateUI --always-authorize-plugins --media-cache-size=10000000 "\$@"
EOF
chmod 755 /tmp/repo2sfs/usr/bin/chromium-browser-puppy.sh

cat > /tmp/repo2sfs/usr/share/applications/chromium-browser_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name=chromium-browser puppy -repo2sfs changes.dat
Exec=chromium-browser-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/chromium.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=chromium
StartupNotify=true
EOF2

################### home #########################################################
if [ $HOMESCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/chromium-browser-puppy-home.sh << EOF61
#!/bin/sh

xhost +local:puppy
#cp -n /usr/lib/chrome-linux/chrome_sandbox /usr/lib/chrome-linux/chrome-sandbox
ln -s /usr/lib/chrome-linux/chrome_sandbox /usr/lib/chrome-linux/chrome-sandbox
sudo chown root /usr/lib/chrome-linux/chrome-sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome-sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome-wrapper

#original sandbox file (I think they are NOT used (thats why I cp to chrome-sandbox))
sudo chown root /usr/lib/chrome-linux/chrome_sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome_sandbox

mkdir -p /mnt/home/downloads_linux/.data/chromium-browser
mkdir -p /mnt/home/downloads_linux/.cache/chromium-browser

sudo -u puppy chromium --user-data-dir=/mnt/home/downloads_linux/.data/chromium-browser --disk-cache-dir=/mnt/home/downloads_linux/.cache/chromium-browser --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=31.0.0.154 "\$@"
EOF61
chmod 755 /tmp/repo2sfs/usr/bin/chromium-browser-puppy-home.sh

cat > /tmp/repo2sfs/usr/share/applications/chromium-browser-puppy-home.desktop << EOF62
[Desktop Entry]
Version=1.0
Name=chromium-browser puppy -home EXTERNAL repo2sfs
Exec=chromium-browser-puppy-home.sh
Comment=Browser saves to home usb flash or maybe D:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/chromium.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=chromium-browser
StartupNotify=true
EOF62
fi

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/chromium-browser-puppy-sda1.sh << EOF31
#!/bin/sh

xhost +local:puppy
#cp -n /usr/lib/chrome-linux/chrome_sandbox /usr/lib/chrome-linux/chrome-sandbox
ln -s /usr/lib/chrome-linux/chrome_sandbox /usr/lib/chrome-linux/chrome-sandbox
sudo chown root /usr/lib/chrome-linux/chrome-sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome-sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome-wrapper

#original sandbox file (I think they are NOT used (thats why I cp to chrome-sandbox))
sudo chown root /usr/lib/chrome-linux/chrome_sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome_sandbox

mkdir -p /mnt/sda1/downloads_linux/.data/chromium-browser
mkdir -p /mnt/sda1/downloads_linux/.cache/chromium-browser
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/chromium-browser_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy chromium --user-data-dir=/mnt/sda1/downloads_linux/.data/chromium-browser --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/chromium-browser --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=30.0.0.154 "\$@"
EOF31
chmod 755 /tmp/repo2sfs/usr/bin/chromium-browser-puppy-sda1.sh

cat > /tmp/repo2sfs/usr/share/applications/chromium-browser-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name=chromium-browser puppy -sda1(C:) EXTERNAL repo2sfs
Exec=chromium-browser-puppy-sda1.sh
Comment=Browser saves to sda1 C:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/chromium.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=chromium-browser
StartupNotify=true
EOF32
fi


################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/chromium-browser-puppy-sdb1.sh << EOF41
#!/bin/sh

xhost +local:puppy
#cp -n /usr/lib/chrome-linux/chrome_sandbox /usr/lib/chrome-linux/chrome-sandbox
ln -s /usr/lib/chrome-linux/chrome_sandbox /usr/lib/chrome-linux/chrome-sandbox
sudo chown root /usr/lib/chrome-linux/chrome-sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome-sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome-wrapper

#original sandbox file (I think they are NOT used (thats why I cp to chrome-sandbox))
sudo chown root /usr/lib/chrome-linux/chrome_sandbox
sudo chmod 4755 /usr/lib/chrome-linux/chrome_sandbox

mkdir -p /mnt/sdb1/downloads_linux/.data/chromium-browser
mkdir -p /mnt/sdb1/downloads_linux/.cache/chromium-browser
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/chromium-browser_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy chromium --user-data-dir=/mnt/sdb1/downloads_linux/.data/chromium-browser --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/chromium-browser --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins  --ppapi-flash-version=30.0.0.154 "\$@"
EOF41
chmod 755 /tmp/repo2sfs/usr/bin/chromium-browser-puppy-sdb1.sh

cat > /tmp/repo2sfs/usr/share/applications/chromium-browser-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name=chromium-browser puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Exec=chromium-browser-puppy-sdb1.sh
Comment=Browser saves to sdb1 usb flash or maybe D:
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/chromium.xpm
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=chromium-browser
StartupNotify=true
EOF42
fi

echo "DONE with CUSTOMIZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "