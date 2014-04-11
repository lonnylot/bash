# ReSRV's Bash Environemnt

# ALIASED SHORTCUTS
alias refresh='. /Users/llaski/.bash_profile'
alias sites='cd /srv/Sites'
alias subl='open -a "Sublime Text"'
alias bash='subl ~/.bash_profile'
alias hosts='subl /etc/hosts'
alias nginxconf='subl /usr/local/etc/nginx'
alias nginxerrorlog='subl /usr/local/Cellar/nginx/1.4.7/logs/error.log'
alias nginx-restart='sudo nginx -s stop; sudo nginx;'
alias ll='ls -lla'

#Additions
export PATH=/Users/llaski/bin:/usr/local/bin:/usr/local/sbin:/bin:$PATH

#Colors
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # Whiteca

txtrst='\e[0m'    # Text Reset

function ps1_git_branch {
  # return branch name
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " ("${ref#refs/heads/}"$(ps1_git_dirty))"
}
function ps1_git_dirty {
  # Returns "*" if the current git branch is dirty.
  # echo -n ""
  # DISABLED FOR PERFORMANCE
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}


function parse_git_branch {
  if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit (working directory clean)" ]]; then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1)/"
  fi
}

function parse_git_dirty {
  if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]]; then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1*)/"
  fi
}

#$bldred\$(parse_git_dirty)
export PS1="$bldgrn$USER:$bldcyn\$PWD $bldgrn\$(ps1_git_branch) ⚡  $bldcyn"