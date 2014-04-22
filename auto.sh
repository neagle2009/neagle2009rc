#!/bin/bash

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
if [ ! -d $vimdir ] ;then
    mkdir "${vimdir}"
fi

hideBinDir="$HOME/.bin"
if [ -d "${hideBinDir}" ] ;then
    mkdir "${hideBinDir}"
fi

cp -r "${dir}/plugin" "${vimdir}/plugin"
