#!/usr/bin/env python
import os

BASE_DIR = os.path.dirname(os.path.realpath(__file__))

def copy_file(filename, dest):
    src = BASE_DIR + '/' + filename
    if os.path.exists(os.path.expanduser(dest)):
        print(filename + ' already exists. ', end='')
        copy_anyway = input('Copy anyway? [y/N] ')
        if copy_anyway not in ['y', 'Y']:
            return

    print('Copying ' + filename)
    os.system('cp -r ' + src + ' ' + dest)

def install_vundle():
    if os.path.exists('/home/taron/.vim/bundle/Vundle.vim'):
        print("Vundle dir already exists, skipping")
    else:
        os.system('git clone https://github.com/VundleVim/Vundle.vim.git '
        '~/.vim/bundle/Vundle.vim')

def copy_vimrc():
    # need vundle to install plugins
    install_vundle()

    # copy vimrc into place
    copy_file('vimrc', '~/.vimrc')

    # install plugins in vimrc
    os.system('vim +PluginInstall +qall')

if __name__ == "__main__":
    # vim
    copy_vimrc()

    # shells
    copy_file('zshrc', '~/.zshrc')

    copy_file('gitconfig', '~/.gitconfig')
    copy_file('nethackrc', '~/.nethackrc')

    copy_file('Xresources', '~/.Xresources')
    copy_file('urxvt', '~/.urxvt')

    # wms
    os.system('mkdir -p ~/.config')
    copy_file('compton.conf', '~/.compton.conf')
    copy_file('bspwm', '~/.config/bspwm')
    copy_file('sxhkd', '~/.config/sxhkd')
    copy_file('polybar', '~/.config/polybar')
    copy_file('dunst', '~/.config/dunst')
