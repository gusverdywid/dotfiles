#!/usr/bin/env bash
# Reference: https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Show all files including the hidden ones (dot files)
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show all files ext
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true
# Show path at the bottom
defaults write com.apple.finder "ShowPathbar" -bool true
# Set search scope to current folder
# Possible values: "SCcf" - current folder; "SCsp" - previous search scope; "SCev" - whole mac
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
killall Finder

# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Enable resuming / restoring windows after quitting
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true

# Disable automatic termination of inactive apps
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Never go into computer sleep mode
# sudo systemsetup -setcomputersleep Off > /dev/null

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# # Disable hibernation (speeds up entering sleep mode)
# sudo pmset -a hibernatemode 0

# # Remove the sleep image file to save disk space
# sudo rm /private/var/vm/sleepimage
# # Create a zero-byte file instead…
# sudo touch /private/var/vm/sleepimage
# # …and make sure it can’t be rewritten
# sudo chflags uchg /private/var/vm/sleepimage

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################
# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right-click
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Disable “natural” (Lion-style) scrolling
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
# defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
# defaults write NSGlobalDomain KeyRepeat -int 1
# defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Asia/Jakarta" > /dev/null

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

defaults write com.apple.dock "autohide" -bool true
defaults write com.apple.dock "orientation" -string "bottom"
defaults write com.apple.dock "tilesize" -int "56"
defaults write com.apple.dock "minimize-to-application" -bool true
killall Dock

# Dragging with 3-fingers
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool true
defaults write com.apple.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerDrag" -bool true
# 3-fingers swipe gestures need to be disabled for 3-fingers dragging
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerHorizSwipeGesture" -int "0"
defaults write com.apple.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerHorizSwipeGesture" -int "0"
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerVertSwipeGesture" -int "0"
defaults write com.apple.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerVertSwipeGesture" -int "0"

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool true
defaults write com.apple.AppleBluetoothMultitouch.trackpad "Clicking" -bool true

defaults write com.apple.AppleMultitouchTrackpad "ActuateDetents" -bool true
defaults write com.apple.AppleMultitouchTrackpad "ForceSuppressed" -bool false
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerTapGesture" -int "0"

# Cursor speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float "0.875"

# Clicking on scrollbar jumps to the spot instead of next page
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true

# Double-click title bar
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Maximize"

# Ask to keep changes when closing docs
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

# Force-click to peek
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true

# Switch pages with 2-fingers swipe left or right
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
