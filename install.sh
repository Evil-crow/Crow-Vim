# !/bin/bash
# -"- coding: utf-8 -"-
# @filename:install.sh
# @date: 12/07/2017 21:40:31
# @author: Crow
# @description:

# This script will be used to install Crow-vim

# get the information about OS
function get_OS(  )
{
    local packmanager=`which yum`
    if [ -n "$packmanager" ];then
        OS="RedHat"
    else
        OS="Debian"
    fi
    if [ "$OS" = "RedHat" ];then 
        local packmanager=`which dnf`
        if [ -n "$packmanager" ];then
            OS="Fedora"
        else
            OS="CentOs"
        fi
    fi 
    echo $OS 
}

# Prepare the environment for installiton
function prepare_env(  )
{
    if [ "$OS" = "Fedora" ];then
        sudo dnf install automake gcc gcc-c++ kernel-devel cmake clang 
        sudo dnf install python-devel python3-devel
    elif [ "$OS" = "Debian" ];then
        sudo apt-get install build-essential cmake clang 
        sudo apt-get install python-dev python3-dev
    elif [ "$OS" = "CentOs" ];then
        sudo yum install automake gcc gcc-c++ kernel-devel cmake clang 
        sudo yum install python-devel python3-devel    
    else
        echo "Error ** :This system haven't been supported!"
    fi 
}

#Prepare for Vim
function prepare_vim(  )
{
    mkdir ~/.old_vim 
    mv ~/.vim* ~/.old_vim             # Clean all the vim you had used
    mv ~/Crow-Vim ~/.vim
    mv ~/.vim/vimrc ~/.vimrc 
    cd ~/.vim/bundle/
    git clone git@github.com:VundleVim/Vundle.vim.git
    cd ~/.vim/bundle
    git clone git@github.com:Valloric/YouCompleteMe.git
    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
}

#This function is used to complie YouCompleteMe
function complier_ycm(  )
{
    select CHOICE in C\# Go JavaScript Cfamily Rust Exit
    do
        case $CHOICE in
        "C#") echo "C#" ; cd ~/.vim/bundle/YouCompleteMe ; ./install.py --cs-completer ; echo "Next Step" ; break ;;
        "Go") echo "Go" ; cd ~/.vim/bundle/YouCompleteMe ; ./install.py --go-completer ; echo "Next Step" ; break ;;
        "JavaScript") echo "JavaScript" ; cd ~/.vim/bundle/YouCompleteMe ; ./install.py --js-completer ; echo "Next Step" ; break ;;
        "Cfamily") echo "C/C++" ; cd ~/.vim/bundle/YouCompleteMe ; ./install.py --clang-completer ; echo "Next Step" ; break ;; 
        "Rust") echo "Rust" ; cd ~/.vim/bundle/YouCompleteMe ; ./install.py --rust-completer ; echo "Next Step" ; break ;;
        *) echo "Unknow" ;;
        esac
    done
}

#Deal with something about ycm
function deal_something(  )
{
    mv ~/.vim/ycm_extra_c_conf.py  ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_c_conf.py
    mv ~/.vim/ycm_extra_cpp_conf.py  ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_cpp_conf 
}

function install(  )
{
    get_OS
    prepare_env
    prepare_vim
    complier_ycm
    deal_something 
}

install 

cd ~/.vim

vim article -c "PluginInstall" -c "q" -c "q"

rm article
