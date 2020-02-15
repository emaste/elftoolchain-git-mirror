#!/bin/sh

cd $(dirname $0)
dir=$(pwd)

SVN2GIT=$dir/svn2git/svn-all-fast-export

# sync svn repo
svnsync sync file://$dir/svn-repo

# git conversion
$SVN2GIT --fast-import-timeout 3600 --add-metadata-notes \
    --rules rules \
    --identity-map identity.map \
    svn-repo
