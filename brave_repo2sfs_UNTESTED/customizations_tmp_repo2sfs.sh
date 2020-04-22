#!/bin/sh
echo "SW - brave browser CUSTOMIZATION SCRIPT"
#############
# SWbrave CUSTOMIZATION SCRIPT  jonmod 180514a 
#############

# set to true (lowercase)  if you want extra scripts/.desktop created
SDA1SCRIPTS=true
SDB1SCRIPTS=true

mkdir -p /tmp/repo2sfs/usr/bin
chmod 755 /tmp/repo2sfs/usr/lib/brave/brave
cp ./chrome-sandbox__iridium-browser_58 "/tmp/repo2sfs/usr/lib/brave/chrome-sandbox"
chown root /tmp/repo2sfs/usr/lib/brave/chrome-sandbox
chmod 4755 /tmp/repo2sfs/usr/lib/brave/chrome-sandbox

#adobe flash link main folder for brave FLASH files should be on /usr/lib/adobe-flashplugin/
mkdir -p /usr/lib/adobe-flashplugin/
#ln -s /usr/lib/adobe-flashplugin/ /usr/lib/pepperflashplugin-nonfree
ln -s /usr/lib/adobe-flashplugin/ /tmp/repo2sfs/usr/lib/pepperflashplugin-nonfree



# needs extras: libnss3 libgconf-2-4

#--------------------------------------------------------------------------------------------------------------------------------

#!/bin/sh
cat > /tmp/repo2sfs/usr/bin/brave-puppy.sh << EOF
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=30.0.0.134"
xhost +local:puppy
# temporary solve the no-sandbox error  (https://superuser.com/questions/1094597/enable-user-namespaces-in-debian-kernel#1122977)
echo 1 > /proc/sys/kernel/unprivileged_userns_clone
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/brave_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy /usr/lib/brave/brave --user-data-dir=/home/puppy/brave_puppy_user_data_dir --disk-cache-dir=/home/puppy/brave_puppy_user_cache_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins "$@"
EOF
chmod 755 /tmp/repo2sfs/usr/bin/brave-puppy.sh

cat > /tmp/repo2sfs/usr/share/applications/brave_changesdat.desktop << EOF2
[Desktop Entry]
Version=1.0
Name= brave puppy -repo2sfs changes.dat
Comment= brave-Browser
Exec=brave-puppy.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/brave.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=braveSW
StartupNotify=false
EOF2

################### SDA1 #########################################################
if [ $SDA1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/brave-puppy-sda1.sh << EOF31
#!/bin/sh
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=30.0.0.134"
xhost +local:puppy
# temporary solve the no-sandbox error  (https://superuser.com/questions/1094597/enable-user-namespaces-in-debian-kernel#1122977)
echo 1 > /proc/sys/kernel/unprivileged_userns_clone
mkdir -p /mnt/sda1/downloads_linux/.data/brave
mkdir -p /mnt/sda1/downloads_linux/.cache/brave
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/brave_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy /usr/lib/brave/brave --user-data-dir=/mnt/sda1/downloads_linux/.data/brave --disk-cache-dir=/mnt/sda1/downloads_linux/.cache/brave --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins --disk-cache-size=10000000 --media-cache-size=10000000 "$@"
EOF31
chmod 755 /tmp/repo2sfs/usr/bin/brave-puppy-sda1.sh

cat > /tmp/repo2sfs/usr/share/applications/brave-puppy-sda1.desktop << EOF32
[Desktop Entry]
Version=1.0
Name= brave puppy -sda1(C:) EXTERNAL repo2sfs
Comment= brave-Browser
Exec=brave-puppy-sda1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/brave.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=braveSW
StartupNotify=false
EOF32
fi


################### SDB1 #########################################################
if [ $SDB1SCRIPTS == true ]
then
cat > /tmp/repo2sfs/usr/bin/brave-puppy-sdb1.sh << EOF41
#!/bin/sh
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=30.0.0.134"
xhost +local:puppy
# temporary solve the no-sandbox error  (https://superuser.com/questions/1094597/enable-user-namespaces-in-debian-kernel#1122977)
echo 1 > /proc/sys/kernel/unprivileged_userns_clone
mkdir -p /mnt/sdb1/downloads_linux/.data/brave
mkdir -p /mnt/sdb1/downloads_linux/.cache/brave
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/brave_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
sudo -u puppy /usr/lib/brave/brave --user-data-dir=/mnt/sdb1/downloads_linux/.data/brave --disk-cache-dir=/mnt/sdb1/downloads_linux/.cache/brave --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins --disk-cache-size=10000000 --media-cache-size=10000000 "$@"
EOF41
chmod 755 /tmp/repo2sfs/usr/bin/brave-puppy-sdb1.sh

cat > /tmp/repo2sfs/usr/share/applications/brave-puppy-sdb1.desktop << EOF42
[Desktop Entry]
Version=1.0
Name= brave puppy -sdb1 (2nd DISK-USB) EXTERNAL repo2sfs
Comment= brave-Browser
Exec=brave-puppy-sdb1.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/brave.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=braveSW
StartupNotify=false
EOF42
fi


#!/bin/sh
cat > /tmp/repo2sfs/usr/bin/brave-root-no-sandbox.sh << EOF51
#!/bin/sh
#export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
export CHROMIUM_FLAGS="--ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so  --ppapi-flash-version=30.0.0.134"
#xhost +local:puppy
#sudo -u puppy /usr/bin/chromium  --user-data-dir=/home/puppy/brave_puppy_user_data_dir --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --ppapi-flash-version=26.0.0.137"
brave --no-sandbox --ppapi-flash-path=/usr/lib/adobe-flashplugin/libpepflashplayer.so --disable-features=TranslateUI --always-authorize-plugins \$1
EOF51
chmod 755 /tmp/repo2sfs/usr/bin/brave-root-no-sandbox.sh

cat > /tmp/repo2sfs/usr/share/applications/brave_root_changesdat.desktop << EOF52
[Desktop Entry]
Version=1.0
Name=brave ROOT no-sandbox -repo2sfs changes.dat
Comment=brave-Browser root --no-sandbox
Exec=brave-root-no-sandbox.sh
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/share/pixmaps/brave.png
Categories=Network;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; 
StartupWMClass=braveSW
StartupNotify=false
EOF52


rm -y /tmp/repo2sfs/usr/bin/g*
rm -y /tmp/repo2sfs/usr/lib/git-core
rm -y /tmp/repo2sfs/usr/lib/x86_64-linux-gnu/
rm -y /tmp/repo2sfs/usr/lib/tmpfiles.d/
rm -y /tmp/repo2sfs/usr/sbin/



echo "DONE with CUSTOMiZATION of /tmp/repo2sfs ........ "
#read -p "Done. Remember to create the puppy user. Press Enter: "