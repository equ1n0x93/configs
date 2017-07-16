# Copies local configs to configs git repo

REPO="~/dev/repositories/configs"

#ipython
rm -rf "$REPO/macOS/.ipython/profile_default/startup/*"
cp -R "~/.ipython/profile_default/startup/*" "$REPO/macOS/.ipython/profile_default/startup/"
#ssh
cp -R "~/.ssh/*" "$REPO/macOS/.ssh/"
rm "$REPO/macOS/.ssh/id_rs*"
#iterm
cp -R "~/Library/Preferences/com.googlecode.iterm2.plist" "%REPO/macOS/.iterm/"
#bash
cp "~/.bash_profile" "$REPO/bash/"
cp "~/.zshrc" "$REPO/bash/"
#git
cp "~/.gitconfig" "$REPO/git/"

