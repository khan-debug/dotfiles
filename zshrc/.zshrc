##### FZF ALIASES #####
alias invim='nvim $(fzf -m --preview="bat --color=always {}")'
alias inano='nano $(fzf -m --preview="bat --color=always {}")'
alias ivim='nvim $(fzf -m --preview="bat --color=always {}")'
alias icode='code $(fzf -m --preview="bat --color=always {}")'
alias SC='cd ~/Dev/python/smartScheduler'
alias startmongo='podman start smartscheduler-mongodb'


##### PATH SETUP #####
export PATH="$HOME/.local/bin:$PATH"

# Homebrew (Linuxbrew)
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


##### FZF #####
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi


##### STARSHIP PROMPT #####
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi


##### ZSH PLUGINS #####
ZSH_CUSTOM="$HOME/.zsh"

# Autosuggestions
if [ -f "$ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Syntax highlighting (must be last)
if [ -f "$ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi


##### DIRENV #####
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi


##### CONDA #####
if [ -f "$HOME/miniconda3/bin/conda" ]; then
  __conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
  fi
  unset __conda_setup
fi
