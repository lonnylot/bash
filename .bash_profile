# ReSRV's Bash Environemnt

# ALIASED SHORTCUTS
alias refresh='. ~/.bash_profile'
alias subl='open -a "Sublime Text"'
alias bash='subl ~/.bash_profile'
alias hosts='subl /etc/hosts'
alias ll='ls -lhaG'

#Colors
txtblk='\[\033[0;30m\]' # Black - Regular
txtred='\[\033[0;31m\]' # Red
txtgrn='\[\033[0;32m\]' # Green
txtylw='\[\033[0;33m\]' # Yellow
txtblu='\[\033[0;34m\]' # Blue
txtpur='\[\033[0;35m\]' # Purple
txtcyn='\[\033[0;36m\]' # Cyan
txtwht='\[\033[0;37m\]' # White

bldblk='\[\033[1;30m\]' # Black - Bold
bldred='\[\033[1;31m\]' # Red
bldgrn='\[\033[1;32m\]' # Green
bldylw='\[\033[1;33m\]' # Yellow
bldblu='\[\033[1;34m\]' # Blue
bldpur='\[\033[1;35m\]' # Purple
bldcyn='\[\033[1;36m\]' # Cyan
bldwht='\[\033[1;37m\]' # Whiteca

txtrst='\[\033[0m\]'    # Text Reset

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


# function parse_git_branch {
#   if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit (working directory clean)" ]]; then
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1)/"
#   fi
# }

# function parse_git_dirty {
#   if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]]; then
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1*)/"
#   fi
#}

#$bldred\$(parse_git_dirty)
export PS1="$bldgrn$USER:$bldcyn\$PWD $bldgrn\$(ps1_git_branch) ⚡  $bldcyn"
