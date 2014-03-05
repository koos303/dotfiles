dotfiles
========

This repository is currently a work in progress, so I'm adjusting this readme more frequently. I use a MacBook Air as my development machine, so you might find some things in here that don't work in a standard Linux environment.

I used a lot of other .dotfiles repositories for my inspiration:
* https://github.com/cloverinteractive/dotfiles
* https://github.com/jtaby/dotfiles
* https://github.com/fdietz/dotfiles
* https://github.com/iain/dotfiles
* https://github.com/mathiasbynens/dotfiles
* https://github.com/ryanb/dotfiles

## Installation

This will copy most of the .dotfiles to your home directory.

    ./bootstrap
    
### OSX install steps

#### Prerequisites

* Install Xcode with the latest developer tools
* [iTerm2](http://www.iterm2.com/)
* [Homebrew](http://mxcl.github.io/homebrew/)
* [PowerLine Font](https://github.com/Lokaltog/powerline-fonts/)

#### Installing Homebrew recipes

    brew bundle ~/Brewfile

#### Installing Macvim and Powerline

    pip install --user git+git://github.com/Lokaltog/powerline
    brew install macvim --env-std --override-system-vim
    
#### Installing Oh My Zshell

    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

### Ruby on Rails
You may want to install these packages to do RoR development

    brew install qt4
    brew install imagemagick
    
## I <3 these programs

* [Flux](http://justgetflux.com/)
* [MenuMeters](http://www.ragingmenace.com/software/menumeters/)
* [Caffeine](https://itunes.apple.com/nl/app/caffeine/id411246225)
* [VLC](http://www.videolan.org/vlc/)
* [SequelPro](http://www.sequelpro.com/)
* [Spotify](https://www.spotify.com)
