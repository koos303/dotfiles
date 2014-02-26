#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function installVundle() {
  # vim vundle
  if [ ! -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
  fi

  if [ ! -e ~/.vim/bundle/vundle ]; then
    echo "Installing vundle"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
  fi
}

function installPathogen() {
  if [ ! -d ~/.vim/autoload ]; then
    mkdir -p ~/.vim/autoload
  fi

  if [ ! -e ~/.vim/autoload/pathogen.vim ]; then
    echo "Installing pathogen"
    curl -Sso ~/.vim/autoload/pathogen.vim \
      https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
  fi
}

function checkTmpAndSwapDirs() {
  if [ ! -d ~/.vim/tmp ]; then
    mkdir -p ~/.vim/tmp
  fi

  if [ ! -d ~/.vim/swap ]; then
    mkdir -p ~/.vim/swap
  fi
}

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~

  checkTmpAndSwapDirs
  installVundle
  installPathogen

  echo "Update/Install plugins using vundle"
  vim -u ~/.vimrc.bundles +BundleInstall! +BundleClean +qall
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
