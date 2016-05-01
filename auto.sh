#! /bin/bash

zipfile="master.zip"
wget -O "${zipfile}" -c 'https://github.com/neagle2009/neagle2009rc/archive/master.zip' || exit
if [ ! -f "${zipfile}" ] ;then
    echo "not found file ${zipfile}"
    exit
fi

unzip "${zipfile}"

dir="neagle2009rc-master"
cat ${dir}/bashrc_public >> ~/.bashrc
cat ${dir}/vimrc/vimrc >> ~/.vimrc
vimdir="$HOME/.vim"

if [ ! -d "$vimdir" ] ;then
    mkdir "${vimdir}"
fi

hideBinDir="$HOME/.bin"
if [ -d "${hideBinDir}" ] ;then
    mkdir "${hideBinDir}"
fi

cp -r "${dir}/vimrc/plugin" "${vimdir}/plugin"

# del 
rm -rf "${dir}"
rm "$0"

##download cdargs
wget -c 'https://github.com/cbxbiker61/cdargs/archive/master.zip'
wget -c 'http://neagle.qiniudn.com/neagle/2014/11/29/cdargs-bash.sh'
