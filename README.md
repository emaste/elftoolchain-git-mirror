# ELF Tool Chain svn->git mirror tools

## Usage
```
sh setup.sh
sh mirror.sh
```
The conversion is output as a bare git repo in the elftoolchain.git directory.

## svnsync
See [Mirror a Subversion repository Micro Howto](http://www.microhowto.info/howto/mirror_a_subversion_repository.html)
for reference.

## svn2git
Local copy of svn2git obtained with:
```
git subtree add --prefix svn2git https://github.com/svn-all-fast-export/svn2git master
```

## License
The included svn2git is GPLv3; see svn2git/LICENSE.  The scripts and
configuration files for the ELF Tool Chain conversion are
[CC0](https://creativecommons.org/publicdomain/zero/1.0/legalcode).
