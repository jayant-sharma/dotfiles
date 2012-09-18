#!/bin/csh -f

set FILE=$HOME/Dropbox/work_dotfiles.tar.bz2

tar -cjf ${FILE} `find . -maxdepth 1 -mindepth 1 \
                         -name ".*" \
                         -not -name ".ssh" \
                         -not -name "*bak" \
                         -not -name "*cache*" \
                         -not -iname "*authority*" \
                         -not -name ".Trash" \
                         -not -name ".mozilla" \
                         -not -name ".adobe" \
                         -not -name ".macromedia" \
                         -not -name ".snapshot" \
                         -not -name ".thumbnails" \
                         -not -name ".fontconfig" \
                         -not -name ".nautilus" \
                         -not -name ".subversion" \
                         -not -name ".dropbox*" \
                         -not -name ".dbus*" \
                         -not -name ".gimp*" \
                         -not -name ".java*" \
                         -not -name ".metacity*" \
                         -not -name ".nx" \
                         -not -name "*history"`
