#! /bin/bash
function getBashrcName() {
    echo ${NEAGLERC_URL}
    return
    if [ "$(uname)" == "Darwin" ]; then
        echo ".profile" 
        return 
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo ".bashrc" 
        return
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
        echo ".bashrc" 
        return
    fi
        echo ".bashrc" 
        return
}
profileRc="$HOME/`getBashrcName`"

# download AND unzip
zipfile="neagle2009rc-master.zip"
wget -O "${zipfile}" -c 'https://github.com/neagle2009/neagle2009rc/archive/master.zip' || exit
if [ ! -f "${zipfile}" ] ;then
    echo "not found file ${zipfile}"
    exit
fi
unzip "${zipfile}"

### config bash 
neaglerc2009Dir="neagle2009rc-master"
cat ${neaglerc2009Dir}/bashrc_public >> ${profileRc}
colorFile="$HMOE/.dircolors"
if [ ! -f "${colorFile}" ] ;then
    cat ${neaglerc2009Dir}/dir_colors >> ${colorFile}
fi

hideBinDir="$HOME/.bin"
if [ -d "${hideBinDir}" ] ;then
    mkdir "${hideBinDir}"
fi

### config vim
cat ${neaglerc2009Dir}/vimrc/vimrc >> ~/.vimrc
vimdir="$HOME/.vim"
if [ ! -d "$vimdir" ] ;then
    mkdir "${vimdir}"
fi
cp -r "${neaglerc2009Dir}/vimrc/plugin" "${vimdir}/plugin"


### del file 
rm -rf "${neaglerc2009Dir}"
rm "$0" #delete self

##download cdargs
zipCdargsFile="cdargs.zip"
wget -c 'https://github.com/cbxbiker61/cdargs/archive/master.zip' -O ${zipCdargsFile}
unzip ${zipCdargsFile}
wget -c 'http://neagle.qiniudn.com/neagle/2014/11/29/cdargs-bash.sh'

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
test -f /bin/zsh && chsh -s /bin/zsh
echo 'ZSH_THEME="amuse" ' >> ~/.zsh
