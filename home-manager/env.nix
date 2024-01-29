{ pkgs
, username
}:

{
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  defaults delete -g ApplePressAndHoldEnabled
  PATH = "/etc/profiles/per-user/${username}/bin:$PATH";
}
