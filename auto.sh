#! /bin/bash
ZIP_FILE="neagle2009rc-master.zip"
UNZIP_FOLDER=`basename "${ZIP_FILE}" ".zip"`
ONLINE_FILE="https://github.com/neagle2009/neagle2009rc/archive/master.zip"
SELF=$0

function installZsh() {
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    test -f /bin/zsh && chsh -s /bin/zsh
    cp -r "${UNZIP_FOLDER}/zshrc" $HOME/.zshrc
}

function getOnlinFile() {
    wget -O "${ZIP_FILE}" -c "${ONLINE_FILE}"
    if [ ! -f "${ZIP_FILE}" ] ;then
        echo "not found file ${ZIP_FILE}"
        exit
    fi
    unzip "${ZIP_FILE}"
}

function installConfigFile() {

    #1. dircolor config
    colorFile="$HMOE/.dircolors"
    if [ ! -f "${colorFile}" ] ;then
        cat ${UNZIP_FOLDER}/dir_colors >> ${colorFile}
    fi

    #2. install public bin
    hideBinDir="$HOME/.bin"
    if [ -d "${hideBinDir}" ] ;then
        mkdir "${hideBinDir}"
    fi

    #3. install vim config
    cat ${UNZIP_FOLDER}/vimrc/vimrc >> $HOME/.vimrc
    vimdir="$HOME/.vim"
    if [ ! -d "$vimdir" ] ;then
        mkdir "${vimdir}"
    fi
    cp -r "${UNZIP_FOLDER}/vimrc/plugin" "${vimdir}/plugin"
}

function cleanTrash() {
    rm -rf "${UNZIP_FOLDER}"
    rm "${SELF}"
}

function downloadCdargs() {
    zipCdargsFile="cdargs.zip"
    wget -c 'https://github.com/cbxbiker61/cdargs/archive/master.zip' -O ${zipCdargsFile}
    unzip ${zipCdargsFile}
    wget -c 'http://neagle.qiniudn.com/neagle/2014/11/29/cdargs-bash.sh'
}

function installVundle() {
    vimrcfile="$HOME/.vimrc"
    vimrc=`cat ${vimrcfile}`
    bundleVimrc=`cat ./vim_plugin_test/bundle.txt`
    grep -q 'call vundle#begin()' ~/.vimrc || (echo "${bundleVimrc}${vimrc}" > $vimrcfile)
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    vim +PluginInstall ctrlp.vim +qall
    vim +PluginInstall ctags.vim +qall
}

getOnlinFile
installConfigFile
#installZsh
downloadCdargs
installVundle

cleanTrash
