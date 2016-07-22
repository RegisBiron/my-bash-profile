#   Add Git to Bash 
    parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }

    export PS1="\[\e[38;5;32m\]___________________ |\[\e[0m\] \[\e[0;33m\]\w\[\e[0m\]\[\e[38;5;32m\] @ \u\[\e[0m\]\[\e[0;35m\]\$(parse_git_branch)\[\e[0m\]\[\e[38;5;32m\] \n$\[\e[0m\] "
    export PS2="$ "

#   Set Path
#   ------------------------------------------------------------------
    export PATH=/usr/local/bin:$PATH
    export PATH=/usr/local/sbin:$PATH
    export PATH="$(brew --prefix php56)/bin:$PATH"

#   MAMP MySQL
#   export PATH=$PATH:/Applications/MAMP/Library/bin/

#   RBENV
#   ------------------------------------------------------------------
    export PATH="$HOME/.rbenv/shims:$PATH"
    RBENV_ROOT=/usr/local/var/rbenv
    
    if which rbenv > /dev/null; 
        then eval "$(rbenv init -)"; 
    fi

    eval "$(rbenv init -)"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder AppleShowAllFiles YES'
    alias finderHideHidden='defaults write com.apple.finder AppleShowAllFiles NO'
    alias spacerTile="defaults write com.apple.dock persistent-apps -array-add '{'tile-type'='spacer-tile';}'"

#   Hub
    alias git=hub

#   MAMP MySQL
    alias mampMysql='/Applications/MAMP/Library/bin/mysql --host=localhost -uroot -proot'

#   Make and cd into directory
    function mcd() {
        mkdir -p "$1" && cd "$1";
    }

#   Clear Icon Cache
    alias clearIconCache='sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \; && sudo find /private/var/folders/ -name com.apple.iconservices -exec rm -rf {} \;'

#   Reset wifi
    alias wifi='sudo ifconfig en0 down && sudo ifconfig en0 up'

#   Check Local Weather    
    alias weather='curl -s http://wttr.in/Boston | head -7 | tail -5'

#   Watch Star Wars
    alias starWars='telnet towel.blinkenlights.nl'

#   Homebrew-cask
    export HOMEBREW_CASK_OPTS='--appdir=/Applications'
    
#   Added by the Heroku Toolbelt
    export PATH="/usr/local/heroku/bin:$PATH"

#	Bash completions
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi

#   Open browser and submit PR for current branch against master 
    pr () {
        local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
        local branch=`git name-rev --name-only HEAD`
        echo "...creating pull request for branch \"$branch\" in \"$repo\""
        open https://github.com/$repo/pull/new/$branch
    }

#   NVM
#   source $(brew --prefix nvm)/nvm.sh
    if test "$(which brew)"; then

      NVM_INSTALL=$(brew --prefix nvm)

      if [ -d "$NVM_INSTALL" ]; then
        export NVM_DIR="$HOME/.nvm"
        . "$NVM_INSTALL/nvm.sh"
      fi
    fi
    
#   Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
