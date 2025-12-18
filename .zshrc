# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#fpath+=($HOME/.zsh/pure)
#autoload -Uz promptinit
#promptinit
#prompt pure
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(asdf aws git kubectl kubectx)

source $ZSH/oh-my-zsh.sh

# User configuration
export TERM="xterm-256color"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zsh_aliases

function pico_load() {
  sudo openocd -f interface/cmsis-dap.cfg -f target/rp2040.cfg -c "adapter speed 5000" -c "program $1 verify reset exit"
}

export AWS_PAGER=''
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"
export PATH="$PATH:/home/f0xtek/.ebcli-virtual-env/executables"

# Created by `pipx` on 2024-11-06 11:37:04
export PATH="$PATH:$HOME/.local/bin:${KREW_ROOT:-$HOME/.krew}/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add Pulumi to the PATH
export PATH=$PATH:/home/f0xtek/.pulumi/bin

# prompt stuff
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-staged-changes true

# Change markers
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'

# Ahead / behind
zstyle ':vcs_info:git:*' use-simple true
zstyle ':vcs_info:git:*' max-exports 2

# Format parts:
# %b = branch
# %u = unstaged
# %c = staged
# %a = action (rebase, merge)
# %p = patches (unused here)
# %m = misc (unused)
# %r/%S = remote info
zstyle ':vcs_info:git:*' formats '%b%u%c'
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'

precmd() {
  vcs_info
}

LAST_CMD=""

preexec() {
  LAST_CMD="${1%% *}"
}

aws_context() {
  case "$LAST_CMD" in
    aws|terraform|cdk)
      [[ -n "$AWS_PROFILE" || -n "$AWS_DEFAULT_REGION" || -n "$AWS_REGION" ]] || return

      local profile="${AWS_PROFILE:-default}"
      #local region="${AWS_DEFAULT_REGION:-$AWS_REGION}"
      local region="${AWS_DEFAULT_REGION:-${AWS_REGION:-$(aws configure get region 2>/dev/null)}}"

      [[ -n "$region" ]] \
        && echo " [aws:${profile}/${region}]" \
        || echo " [aws:${profile}]"
    ;;
  esac
}

if [[ "$TERM" != "dumb" ]]; then
  RESET='%f'

  PATH_COLOR='%F{blue}'

  GIT_BRANCH_CLEAN='%F{green}'
  GIT_UNSTAGED='%F{yellow}'   # orange-ish
  GIT_STAGED='%F{cyan}'

  GIT_AHEAD='%F{green}'
  GIT_BEHIND='%F{red}'

  AWS_COLOR='%F{cyan}'
else
  RESET=''
  PATH_COLOR=''
  GIT_BRANCH_CLEAN=''
  GIT_UNSTAGED=''
  GIT_STAGED=''
  GIT_AHEAD=''
  GIT_BEHIND=''
  AWS_COLOR=''
fi


git_ahead_behind() {
  command git rev-parse --abbrev-ref @{upstream} >/dev/null 2>&1 || return

  local ahead behind
  ahead=$(command git rev-list --count @{upstream}..HEAD 2>/dev/null)
  behind=$(command git rev-list --count HEAD..@{upstream} 2>/dev/null)

  [[ "$ahead" -gt 0 ]] && echo -n " ${GIT_AHEAD}↑${ahead}${RESET}"
  [[ "$behind" -gt 0 ]] && echo -n " ${GIT_BEHIND}↓${behind}${RESET}"
}

git_prompt() {
  [[ -z "$vcs_info_msg_0_" ]] && return

  local branch="${vcs_info_msg_0_%%[*+]}"
  local rest="${vcs_info_msg_0_#$branch}"

  echo -n " ("

  # Branch name colour
  if [[ "$rest" == *"*"* || "$rest" == *"+"* ]]; then
    echo -n "${GIT_BRANCH_CLEAN}${branch}${RESET}"
  else
    echo -n "${GIT_BRANCH_CLEAN}${branch}${RESET}"
  fi

  # Unstaged
  [[ "$rest" == *"*"* ]] && echo -n "${GIT_UNSTAGED}*${RESET}"

  # Staged
  [[ "$rest" == *"+"* ]] && echo -n "${GIT_STAGED}+${RESET}"

  # Ahead / behind
  git_ahead_behind

  echo -n ")"
}

setopt PROMPT_SUBST
PROMPT=$'${PATH_COLOR}%~${RESET}$(git_prompt)${AWS_COLOR}$(aws_context)${RESET}\n%# '

