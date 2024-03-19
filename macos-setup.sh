#! /usr/bin/env bash

# Applies system and application defaults.

printf "%s\n" "System - Disable boot sound effects."
sudo nvram SystemAudioVolume=" "

printf "%s\n" "System - Disable automatic termination of inactive apps."
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

printf "%s\n" "System - Expand save panel by default."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

printf "%s\n" "System - Disable 'Are you sure you want to open this application?' dialog."
defaults write com.apple.LaunchServices LSQuarantine -bool false

printf "%s\n" "System - Increase window resize speed for Cocoa applications."
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

printf "%s\n" "System - Disable window resume system-wide."
defaults write NSGlobalDomain NSQuiAlwaysKeepsWindows -bool false

printf "%s\n" "System - Disable auto-correct."
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

printf "%s\n" "System - Disable smart quotes (not useful when writing code)."
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

printf "%s\n" "System - Disable smart dashes (not useful when writing code)."
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

printf "%s\n" "System - Require password immediately after sleep or screen saver begins."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

printf "%s\n" "System - Avoid creating .DS_Store files on network volumes."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "%s\n" "System - Automatically restart if system freezes."
sudo systemsetup -setrestartfreeze on

printf "%s\n" "System - Set language and text formats"
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_CA"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# printf "%s\n" "System - Disable software updates."
# sudo softwareupdate --schedule off

printf "%s\n" "Keyboard - Automatically illuminate built-in MacBook keyboard in low light."
defaults write com.apple.BezelServices kDim -bool true

printf "%s\n" "Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes."
defaults write com.apple.BezelServices kDimTime -int 300

printf "%s\n" "Keyboard - Enable keyboard access for all controls."
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

printf "%s\n" "Keyboard - Set a fast keyboard repeat rate."
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

printf "%s\n" "Keyboard - Disable press-and-hold for keys in favor of key repeat."
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

printf "%s\n" "Bluetooth - Increase sound quality for headphones/headsets."
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

printf "%s\n" "Dock - Automatically hide and show."
defaults write com.apple.dock autohide -bool true

printf "%s\n" "Dock - Remove the auto-hiding delay and animation."
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

printf "%s\n" "Dock - Don’t show Dashboard as a Space."
defaults write com.apple.dock "dashboard-in-overlay" -bool true

printf "%s\n" "Dock - Set dock size."
defaults write com.apple.dock tilesize -int 64

printf "%s\n" "Dock - Change minimize effect."
defaults write com.apple.dock mineffect -string "scale"

printf "%s\n" "Dock - Minimize windows into application icon."
defaults write com.apple.dock minimize-to-application -bool true

printf "%s\n" "Dock - Don’t show recent applications in Dock."
defaults write com.apple.dock show-recents -bool false

printf "%s\n" "iCloud - Save to disk by default."
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

printf "%s\n" "Finder - Use list view in all Finder windows by default."
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

printf "%s\n" "Finder - Show the $HOME/Library folder."
chflags nohidden $HOME/Library

printf "%s\n" "Finder - Show the Volumes folder."
sudo chflags nohidden /Volumes

printf "%s\n" "Finder - Show filename extensions."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "%s\n" "Finder - Disable the warning when changing a file extension."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

printf "%s\n" "Finder - Show path bar."
defaults write com.apple.finder ShowPathbar -bool true

printf "%s\n" "Finder - Show status bar."
defaults write com.apple.finder ShowStatusBar -bool true

printf "%s\n" "Finder - Display full POSIX path as window title."
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

printf "%s\n" "Finder - Use list view in all Finder windows."
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

printf "%s\n" "Finder - Allow text selection in Quick Look."
defaults write com.apple.finder QLEnableTextSelection -bool true

printf "%s\n" "Safari - Enable debug menu."
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

printf "%s\n" "Safari - Enable the Develop menu and the Web Inspector."
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

printf "%s\n" "Safari - Add a context menu item for showing the Web Inspector in web views."
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

printf "%s\n" "Safari - Disable sending search queries to Apple.."
defaults write com.apple.Safari UniversalSearchEnabled -bool false

printf "%s\n" "Chrome - Prevent native print dialog, use system dialog instead."
defaults write com.google.Chrome DisablePrintPreview -boolean true

printf "%s\n" "TextEdit - Use plain text mode for new documents."
defaults write com.apple.TextEdit RichText -int 0

printf "%s\n" "TextEdit - Open and save files as UTF-8 encoding."
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

printf "%s\n" "Disk Utility - Enable debug menu."
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

printf "%s\n" "Printer - Expand print panel by default."
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

printf "%s\n" "Printer - Automatically quit printer app once the print jobs complete."
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

printf "%s\n" "Game Center - Disable Game Center."
defaults write com.apple.gamed Disabled -bool true

printf "%s\n" "Game Center - Kill affected applications."
for app in "Activity Monitor" \
"Address Book" \
"Calendar" \
"cfprefsd" \
"Contacts" \
"Dock" \
"Finder" \
"Google Chrome Canary" \
"Google Chrome" \
"Mail" \
"Messages" \
"Opera" \
"Photos" \
"Safari" \
"SizeUp" \
"Spectacle" \
"SystemUIServer" \
"Terminal" \
"Transmission" \
"Tweetbot" \
"Twitter" \
"iCal"; do
killall "${app}" &> /dev/null || true
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
