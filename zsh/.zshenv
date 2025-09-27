# Only source .zprofile so all shells see PATH
if [ -f "$HOME/.zprofile" ]; then
  . "$HOME/.zprofile"
fi
