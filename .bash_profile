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
    export PATH="$(brew --prefix php@7.1)/bin:$PATH"

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

#   Git aliases
#   -------------------------------------------------------------------

#   write a commit message    
    function gc() {
      git commit -m "$*"
    } 

#   git add everything then commit
    function gagc() {
      git add .
      git commit -m "$*"
    } 

#   Opens the github page for the current git repo/branch in your browser
    function gh() {
      giturl=$(git config --get remote.origin.url)
      if [ "$giturl" == "" ]
        then
         echo "Not a git repository or no remote.origin.url set"
         exit 1;
      fi

      giturl=${giturl/git\@github\.com\:/https://github.com/}
      giturl=${giturl/\.git/\/tree/}
      branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
      branch="(unnamed branch)"     # detached HEAD
      branch=${branch##refs/heads/}
      giturl=$giturl$branch
      open $giturl
    }

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

#   Check Moon Phase
    alias moon='curl -s http://wttr.in/Moon'    

#   Watch Star Wars
    alias starWars='telnet towel.blinkenlights.nl'

#   NPM 
    alias npmListGlobal='npm list -g --depth=0'

#   Homebrew-cask
    export HOMEBREW_CASK_OPTS='--appdir=/Applications'
    
#   Added by the Heroku Toolbelt
    export PATH="/usr/local/heroku/bin:$PATH"

#	Bash completions
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
    
    [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#   Open browser and submit PR for current branch against master 
    pr () {
        local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
        local branch=`git name-rev --name-only HEAD`
        echo "...creating pull request for branch \"$branch\" in \"$repo\""
        open https://github.com/$repo/pull/new/$branch?expand=1
    }

#   NVM
#   source $(brew --prefix nvm)/nvm.sh
    # if test "$(which brew)"; then

    #   NVM_INSTALL=$(brew --prefix nvm)

    #   if [ -d "$NVM_INSTALL" ]; then
    #     export NVM_DIR="$HOME/.nvm"
    #     . "$NVM_INSTALL/nvm.sh"
    #   fi
    # fi 

#   Load .bashrc
    source ~/.bashrc

#   Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#   Ups Vagrant Autocomplete   
    uv () {
      cd ~/Sites/uv/www/$1/wp-content/themes/$(echo $1 | cut -c 11-)
    }

    uv_complete() {
        local cur=${COMP_WORDS[COMP_CWORD]}
        COMPREPLY=( $(compgen -W "$(ls ~/Sites/uv/www/)" -- $cur) )
    }
    complete -F uv_complete uv
