# Copies local configs to configs git repo

REPO=`pwd`

#pip
pip freeze > "$REPO/pip/pip.list"

#ipython
rm -rf "$REPO/macOS/.ipython/profile_default/startup/*"
cp -R "$HOME/.ipython/profile_default/startup" "$REPO/macOS/.ipython/profile_default/"
rm -rf "$REPO/macOS/.ipython/.DS_Store" "$REPO/macOS/.ipython/profile_default/.DS_Store"

#ssh
cp -R "$HOME/.ssh" "$REPO/macOS/" # && rm -rf "$REPO/macOS/.ssh/id_rsa" "$REPO/macOS/.ssh/id_rsa.pub" "$REPO/macOS/.ssh/.DS_Store" "$REPO/macOS/.ssh/keys"

#iterm
cp -R "$HOME/Library/Preferences/com.googlecode.iterm2.plist" "$REPO/macOS/.iterm/"

#bash/zsh
cp "$HOME/.bash_profile" "$REPO/bash/"
cp "$HOME/.zshrc" "$REPO/bash/"

#git
cp "$HOME/.gitconfig" "$REPO/git/.gitconfig"

#vim
cp "$HOME/.vimrc" "$REPO/vim/"

#homebrew
rm -f "$REPO/macOS/Brewfile"
brew bundle dump --file="$REPO/macOS/Brewfile"

#scripts
cp -R "$HOME/dev/scripts/" "$REPO/scripts/" && rm -rf "$REPO/scripts/*.pyc"

#tmux
cp "$HOME/.tmux.conf" "$REPO/tmux/"
cp "$HOME/.tmux.conf.local" "$REPO/tmux/"

