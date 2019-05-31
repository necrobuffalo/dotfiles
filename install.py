#!/usr/bin/env python3
import os

BASE_DIR = os.path.dirname(os.path.realpath(__file__))

FILE_MAP = {
    'vimrc': '~/.vimrc',
    'nvim': '~/.config/nvim',
    'zprofile': '~/.zprofile',
    'zshrc': '~/.zshrc',
    'gitconfig': '~/.gitconfig',
    'nethackrc': '~/.nethackrc',
    'Xresources': '~/.Xresources',
    'urxvt': '~/.urxvt',
    'compton.conf': '~/.compton.conf',
    'bspwm': '~/.config/bspwm',
    'sxhkd': '~/.config/sxhkd',
    'polybar': '~/.config/polybar',
    'dunst': '~/.config/dunst',
    'git_template': '~/.git_template',
}

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

    # install plugins in vimrc
    os.system('vim +PluginInstall +qall')


def install_plug():
    if os.path.exists(os.path.expanduser('~/.local/share/nvim/site/autoload/plug.vim')):
        print("vim-plug already installed, skipping")
    else:
        os.system('curl -fLo ~/.local/share/nvim/site/autoload/plug.vim '
                  '--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')

    # install nvim plugins
    os.system('nvim +PlugInstall +qall')


if __name__ == "__main__":
    os.system('mkdir -p ~/.config')

    for key, value in FILE_MAP.items():
        copy_file(key, value)

    # vim
    install_vundle()
    # nvim
    install_plug()
