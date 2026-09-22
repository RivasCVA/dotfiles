# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
# tip: replace %m in .oh-my-zsh/themes/daveverwer.zsh-theme to a custom name
ZSH_THEME="daveverwer"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# mise
eval "$(mise activate zsh)"

# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"

# go
export GOPRIVATE=github.com/RivasCVA/*

# local bin
export PATH="$HOME/.local/bin:$PATH"
