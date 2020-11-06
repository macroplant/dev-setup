

cd ~/Library/Fonts && {
	wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf';
	wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf';
	wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf';
	wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf';
cd -; }

cd ~ && {
	brew install romkatv/powerlevel10k/powerlevel10k
	mv -f .zshrc .zshrc-old-1 2> /dev/null || true

	p10k configure;

	echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
	echo '[[ -s ${HOME}/repos/dochub/.bash ]] && source ${HOME}/repos/dochub/.bash' >>! ~/.zshrc
	echo '[[ -s ${HOME}/repos/iexplorer/.bash ]] && source ${HOME}/repos/iexplorer/.bash' >>! ~/.zshrc
	echo '[[ -s ${HOME}/repos/macroplant-rails2/.bash ]] && source ${HOME}/repos/macroplant-rails2/.bash' >>! ~/.zshrc

	# Load pyenv automatically by appending
	echo 'eval "$(pyenv init -)"' >>! ~/.zshrc


	# The next line updates PATH for the Google Cloud SDK.
	echo "if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi" >>! ~/.zshrc
	# The next line enables shell command completion for gcloud.
	echo "if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi" >>! ~/.zshrc
cd -; }
