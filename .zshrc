#NEOVIM switcher
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias kickvim="NVIM_APPNAME=kickstart nvim"
alias fvim="NVIM_APPNAME=fvim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

##NVM Config
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# React Native
# -ANDROID 
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
# -RUBY 
export PATH="/Users/furkan/.rbenv/versions/2.7.5/bin:$PATH"
eval "$(rbenv init - zsh)"
export RUBY_CONFIGURE_OPTS="--with-zlib-dir=$(brew --prefix zlib) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml) --with-gdbm-dir=$(brew --prefix gdbm)"
export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
export LDFLAGS=-L/opt/homebrew/opt/openssl@1.1/lib
export CPPFLAGS=-I/opt/homebrew/opt/openssl@1.1/include
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"


# path for lunarvim
export PATH="/Users/furkan/.local/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
macos
zsh-autosuggestions
zsh-syntax-highlighting
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# User configuration
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# zsh prompt
export PS1='%n@%m:%~%(!.#.$)'


## ss function is used to switch between package managers (pnpm, npm, yarn)
ss() {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn "$@"
  elif [[ -f package-lock.json ]]; then
    command npm "$@"
  else
    command pnpm "$@"
  fi
}

# Aliases
alias c="clear"
alias nrs="npm start"
alias nrb="npm run build"
alias nrd="npm run dev"
alias v="code"
alias ssd="ss dev"
alias sss="ss start"
alias dev="cd  ~/Developer"
alias myblog="cd ~/Developer/myblog"
alias pjs="cd  ~/Developer/projects"
alias cweb="cd  ~/Developer/projects/cmt/cmt-next"
alias cmob="cd  ~/Developer/projects/cmt/cmt-rn/"
alias obs="cd /Users/furkan/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/macOSVault"
#access config files
alias karabiner="fvim ~/.config/karabiner.edn"
alias zshconfig="fvim ~/.zshrc"
# git 
alias gs="git status"
alias ga="git add ."
alias lg="lazygit"
# misc
alias weather="curl wttr.in/Istanbul"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc "$@"'
alias coderadio='vlc https://coderadio-admin.freecodecamp.org/public/coderadio/playlist'

# Display modes 
alias ontop='displayplacer "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1512x982 hz:120 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" "id:BDE46558-2CE7-4DDA-B285-0BBE4678AE68 res:1920x1080 hz:60 color_depth:8 enabled:true scaling:on origin:(-190,-1080) degree:0"'
alias onside='displayplacer "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1512x982 hz:120 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" "id:BDE46558-2CE7-4DDA-B285-0BBE4678AE68 res:1920x1080 hz:60 color_depth:8 enabled:true scaling:on origin:(-1920,-98) degree:0"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U select-word-style
select-word-style bash
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/furkan/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/furkan/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/furkan/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/furkan/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
# Puppeteer 
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
export PYENV_ROOT="$HOME/.pyenv" 
export PATH="$PYENV_ROOT/bin:$PATH" 
eval "$(pyenv init --path)" 
eval "$(pyenv init -)"


# bun completions
[ -s "/Users/furkan/.bun/_bun" ] && source "/Users/furkan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval $(thefuck --alias)
PATH=~/.console-ninja/.bin:$PATH
