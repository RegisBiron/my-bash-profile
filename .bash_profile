export PS1="\[\e[38;5;49m\]___________________    | \w @ \h (\u) \n| =>\[\e[0m\] "
export PS2="| => "

#   Set Path
#    ------------------------------------------------------------------
    export PATH=/usr/local/bin:$PATH

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder AppleShowAllFiles YES'
    alias finderHideHidden='defaults write com.apple.finder AppleShowAllFiles NO'
    alias spacerTile="defaults write com.apple.dock persistent-apps -array-add '{'tile-type'='spacer-tile';}'"

#   MAMP MySQL
    alias mampMysql='/Applications/MAMP/Library/bin/mysql --host=localhost -uroot -proot'

#   Make and cd into directory
    function mcd() {
        mkdir -p "$1" && cd "$1";
    }

#   Clear Icon Cache
    alias clearIconCache='sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \; && sudo find /private/var/folders/ -name com.apple.iconservices -exec rm -rf {} \;'

#   Homebrew-cask
    export HOMEBREW_CASK_OPTS='--appdir=/Applications'
