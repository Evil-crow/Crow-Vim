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
        sudo dnf install automake gcc gcc-c++ kernel-devel cmake
        sudo dnf install python-devel python3-devel
    elif [ "$OS" = "Debian" ];then
        sudo apt-get install build-essential cmake
        sudo apt-get install python-dev python3-dev
    elif [ "$OS" = "CentOs" ];then
        sudo yum install automake gcc gcc-c++ kernel-devel cmake
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
    language="C# Go JavaScript C/C++ Rust Exit"
    select CHOICE in ${langage}
    do
        case $CHOICE in
        "C#") echo "C#" ; python ~/.vim/bundle/YouCompleteMe/install.py --cs-completer ;;
        "Go") echo "Go" ; python ~/.vim/bundle/YouCompleteMe/install.py --go-completer ;;
        "JavaScript") echo "JavaScript" ; python ~/.vim/bundle/YouCompleteMe/install.py --js-completer ;;
        "C/C++") echo "C/C++" ; python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang ;; 
        "Rust") echo "Rust" ; python ~/.vim/bundle/YouCompleteMe/install.py --rust-completer ;;
        "Exit") echo "Next Step" ; break ;;
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

# Advertise for myself
function print_information(  )
{
    echo ""
    echo "Well,thanks for you choose Crow-Vim,thank you very much"
    echo "I have devote my much time for this .vimrc"
    echo "I'm glad that you like it"
    echo "and if you have any suggestion foe this vimrc"
    echo " Well, please tell me by issue,thank you very much"
    echo "Have a good time with Crow-Vim"
    echo ""
}

#Something at last
function about_ycmd(  )
{
    echo ""
    echo "If you want to use the ycmd completely"
    echo "Well ,you must customd it by yourself"
    echo "Also ,you can call me ,and I'll help you "
    echo "my e-mail is : evilcrow486@gmail.com"
    echo "my github evil-crow,"
    echo ""
}
function install(  )
{
    get_OS
    prepare_env
    prepare_vim
    complier_ycm
    deal_something 
    print_information 
    about_ycmd 
}

install 
