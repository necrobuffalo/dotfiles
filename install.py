#!/usr/bin/env python3
import os

BASE_DIR = os.path.dirname(os.path.realpath(__file__))


def copy_file(filename, dest):
    src = BASE_DIR + '/' + filename
    if os.path.exists(os.path.expanduser(dest)):
        copy_anyway = input(filename + ' already exists. Copy anyway? [y/N] ')
        if copy_anyway not in ['y', 'Y']:
            return

    print('Copying ' + filename)
    os.system('cp -r ' + src + ' ' + dest)


def install_vundle():
    if os.path.exists(os.path.expanduser('~/.vim/bundle/Vundle.vim')):
        print("Vundle dir already exists, skipping")
    else:
        os.system('git clone https://github.com/VundleVim/Vundle.vim.git '
                  '~/.vim/bundle/Vundle.vim')


def install_plug():
    if os.path.exists(os.path.expanduser('~/.local/share/nvim/site/autoload/plug.vim')):
        print("vim-plug already installed, skipping")
    else:
        os.system('curl -fLo ~/.local/share/nvim/site/autoload/plug.vim '
                  '--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')


def copy_vimrc():
    # need vundle to install plugins
    install_vundle()

    # copy vimrc into place
    copy_file('vimrc', '~/.vimrc')
    # install plugins in vimrc
    os.system('vim +PluginInstall +qall')


def copy_nvimrc():
    # get vim-plug to install plugins
    install_plug()

    # copy nvim/init.vim into place
    copy_file('nvim', '~/.config/nvim')
    # install nvim plugins
    os.system('nvim +PlugInstall +qall')


if __name__ == "__main__":
    os.system('mkdir -p ~/.config')

    # vim
    copy_vimrc()

    # nvim
    copy_nvimrc()

    # shells
    copy_file('zshrc', '~/.zshrc')

    copy_file('gitconfig', '~/.gitconfig')
    copy_file('nethackrc', '~/.nethackrc')

    copy_file('Xresources', '~/.Xresources')
    copy_file('urxvt', '~/.urxvt')

    # wms
    copy_file('compton.conf', '~/.compton.conf')
    copy_file('bspwm', '~/.config/bspwm')
    copy_file('sxhkd', '~/.config/sxhkd')
    copy_file('polybar', '~/.config/polybar')
    copy_file('dunst', '~/.config/dunst')
