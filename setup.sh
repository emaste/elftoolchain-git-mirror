#!/bin/sh
# Set up ELF Tool Chain svn mirror for svn2git
# Ref: http://www.microhowto.info/howto/mirror_a_subversion_repository.html

cd $(dirname $0)
dir=$(pwd)

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
