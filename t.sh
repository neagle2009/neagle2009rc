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

installVundle
