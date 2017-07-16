# Copies local configs to configs git repo

HOME="/Users/adahan"
REPO="$HOME/dev/repositories/configs"

#ipython
rm -rf "$REPO/macOS/.ipython/profile_default/startup/*"
cp -R "$HOME/.ipython/profile_default/startup" "$REPO/macOS/.ipython/profile_default/"
#ssh
cp -R "$HOME/.ssh" "$REPO/macOS/"
rm "$REPO/macOS/.ssh/id_rs*"
#iterm
cp -R "$HOME/Library/Preferences/com.googlecode.iterm2.plist" "$REPO/macOS/.iterm/"
#bash
cp "$HOME/.bash_profile" "$REPO/bash/"
cp "$HOME/.zshrc" "$REPO/bash/"
#git
cp "$HOME/.gitconfig" "$REPO/git/"
#vim
cp "$HOME/.vimrc" "$REPO/vim"
