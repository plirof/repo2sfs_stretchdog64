# repo2sfs_stretchdog64
repo2sfs - custom squashfs creation scripts



## Currently supported with automatic download
 - firefox_tar_bz2_sfs  Browser
 - brave  Browser
 - Iridium Browser
 - SW Iron Browser
 - Slimjet Browser


## Currently supported with manual download
 - Cyberfox Browser
 - Opera Browser deb_extract
 - Palemoon Browser
 - vivaldi_deb_extract Browser
 - Waterfox Browser

## other browsers
Brave browser 
https://laptop-updates.brave.com/latest/dev/debian64
Midori Browser
http://midori-browser.org/download/debian/


## General info & paremeters

### CORS disable Chrome / Iron 61+ /etc
add --disable-web-security paramter to command line (note: you might also want to add --user-data-dir). >Iron 61: It will display a warning bar but CORS will be disabled