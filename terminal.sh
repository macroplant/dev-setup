

cd ~ && {
	brew tap homebrew/cask-fonts
	brew install antigen

	brew cask install font-meslo-nerd-font
	brew cask install font-noto-nerd-font

	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	brew install romkatv/powerlevel10k/powerlevel10k
	mv -f .zshrc .zshrc-old-1 2> /dev/null || true

	p10k configure;

	echo "
source $HOME/antigen.zsh
export NVM_AUTO_USE=true
antigen bundle aws
antigen bundle brew
antigen bundle ember-cli
antigen bundle git
antigen bundle github
antigen bundle lukechilds/zsh-nvm
antigen bundle node
antigen bundle osx
antigen bundle rails
antigen bundle ruby
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
[[ -s ${HOME}/repos/dochub/.bash ]] && source ${HOME}/repos/dochub/.bash
[[ -s ${HOME}/repos/iexplorer/.bash ]] && source ${HOME}/repos/iexplorer/.bash
[[ -s ${HOME}/repos/macroplant-rails2/.bash ]] && source ${HOME}/repos/macroplant-rails2/.bash

if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

alias ls='ls -G'
alias ll='ls -lG'
" >>! ~/.zshrc
	echo 'eval "$(pyenv init -)"' >>! ~/.zshrc

cd -; }
