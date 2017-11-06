# !/bin/bash
# -"- coding: utf-8 -"-
# @filename:Debian_Ubuntu_Deepin_Install.sh
# @date: 11/06/2017 23:22:20
# @author: Crow
# @description:

cd ~
mkdir .vim_old
mv -r .vim* .vim_old
git clone git@github.com:Evil-crow/Crow-Vim.git
mkdir .vim
mv Crow-vim/* .vim
mv .vim/.vimrc .
git clone git@github.com:Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
sudo apt-get install llvm cmake python-devel clang
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
echo "Wait a minute for YCM"
rm ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm*
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm
mv .vim/ycm* .
mv ycm_extra_c_conf.py .ycm_extra_c_conf.py
mv ycm_extra_cpp_conf.py .ycm_extra_cpp_cong.py
echo "You're so near to Success!"
echo "Please open your Vim and \"PluginInstall\""

