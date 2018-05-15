#!/bin/sh

[ ! -f /usr/local/bin/unzipper ] && echo Unzipper not installed! && exit

SOURCE=$(ls *.bz2 2>/dev/null)
[ -z "$SOURCE" ] && echo Palemoon source package not found! && exit

rm -rf /tmp/build 2>/dev/null
mkdir -p /tmp/build/opt

echo In the next step, Unzipper will run.
echo  You will extract the Palemoon source into /tmp/build/opt, which is ready to use.
read -p "Press Enter to start: "

unzipper $SOURCE

MYPWD=$(pwd)	#save the build location

cd /tmp/build
mkdir -p usr/bin
ln -s /opt/palemoon/palemoon usr/bin/palemoon

for D in 16 32 48; do
	mkdir -p usr/share/icons/hicolor/${D}x${D}/apps
	ln -s /opt/palemoon/browser/chrome/icons/default/default${D}.png usr/share/icons/hicolor/${D}x${D}/apps/palemoon.png
done

mkdir -p usr/share/icons/hicolor/128x128/apps
ln -s /opt/palemoon/browser/icons/mozicon128.png usr/share/icons/hicolor/128x128/apps/palemoon.png

mkdir -p usr/share/applications
cat > usr/share/applications/palemoon.desktop << EOF
[Desktop Entry]
Version=1.0
Name=Pale Moon Web Browser
Comment=Browse the World Wide Web
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=palemoon
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=palemoon
Categories=Network;WebBrowser;Internet
StartupNotify=true
EOF

echo
read -p "Do you want to let Palemoon handle lots of MimeTypes? [y/n] " REPLY
if [ "$REPLY" = "y" ]; then
cat >> usr/share/applications/palemoon.desktop << EOF2
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
EOF2
fi

cd $MYPWD
SQUASHFILE=${SOURCE%.tar.bz2}.squashfs
mksquashfs /tmp/build $SQUASHFILE
echo
echo Done!
