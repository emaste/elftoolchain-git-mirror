#!/bin/sh
# Set up ELF Tool Chain svn mirror for svn2git
# Ref: http://www.microhowto.info/howto/mirror_a_subversion_repository.html

set -e

cd $(dirname $0)
dir=$(pwd)

if [ ! -e svn2git/svn-all-fast-export ]; then
	if ! which qmake >/dev/null; then
		echo "qmake required to build svn2git" >&2
		exit 1
	fi
	echo "building svn2git"
	cd svn2git
	qmake && make
	cd ..
	echo
fi

if [ -d svn-repo ]; then
	echo "svnsync directory $dir/svn-repo exists"
else
	echo "Creating directory $dir/svn-repo for svnsync"

	svnadmin create svn-repo
	echo '#!/bin/sh' > svn-repo/hooks/pre-revprop-change
	chmod 755 svn-repo/hooks/pre-revprop-change
	svnsync init "file://$dir/svn-repo" \
	    svn://svn.code.sf.net/p/elftoolchain/code
fi
