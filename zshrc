# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# antibody plugins
source <(antibody init)
antibody bundle denysdovhan/spaceship-prompt

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
ZSH_THEME="spaceship"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# This will highlight the patterns you specify in a color of your choice.
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

export EDITOR='nvim'
export LC_ALL=pt_PT.UTF-8
export LANG=pt_PT.UTF-8

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(z catimg osx git svn pow debian nginx sublime brew brew-cask ssh-agent composer gem vagrant knife knife_ssh node npm ruby rvm titanium alloy pure zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $ZSH/functions
source $ZSH/aliases

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/pc/android-sdk-macosx/tools:/usr/local/mysql/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
PATH=$PATH:/Applications/VirtualBox.app/Contents/MacOS
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
. `brew --prefix`/etc/profile.d/z.sh

### Generic Colouriser
source "`brew --prefix`/etc/grc.bashrc"

PERL_MB_OPT="--install_base \"/Users/pc/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/pc/perl5"; export PERL_MM_OPT;

# Some options for our Zsh history.
# These will set our history to allow a ton more entires, ignore duplicate commands,
# and ignore some of the commands we don’t need a history of.
# This is useful because if you want to search for that command you
# ran a few weeks ago, you can do that a lot easier.
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# thefuck (https://github.com/nvbn/thefuck) alias
eval "$(thefuck --alias)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# AZK HOST
export AZK_BALANCER_HOST=dev.cterm.io

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# call nvm use automatically whenever you enter a directory that contains
# an .nvmrc file with a string telling nvm which node to use
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
