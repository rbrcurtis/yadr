# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias ll='ls -alGh'
alias du='du -h -d 2'

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
alias ae='vim $yadr/zsh/aliases.zsh' #alias edit
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D -w'
alias gdc='git diff --cached -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gp='git push -u'
alias gps='git push'
alias gpsh='git push'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gpgp='git pull && git push'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'
alias wget='wget --content-disposition'

# Zippin
alias gz='tar -zcvf'

# Ruby
alias c='rails c' # Rails 3
alias co='script/console --irb=pry' # Rails 2
alias ts='thin start'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
alias todo='open nvalt://find/todo'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
alias zs='zeus server'
alias zc='zeus console'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'

# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias dbtp='spring rake db:test:prepare'
alias dbm='spring rake db:migrate'
alias dbmr='spring rake db:migrate:redo'
alias dbmd='spring rake db:migrate:down'
alias dbmu='spring rake db:migrate:up'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# Other
#
alias awsume='. awsume'
alias notify='osx-notifier --message'
alias wip='git add . && git ca wip && git push -u'
alias wipnv='git add . && git ca wip --no-verify && git push -u'
alias wipnd='git add . && git ca "[no deploy] wip" && git push -u'
alias noop='echo >> package.json && git ca noop --no-verify && git push'

alias pip='pip3'
alias python=python3

gmp() {
  git add .
  git commit -am "${@}"
  git push -u
}

gmpnv() {
  git add .
  git commit -am "${@}" --no-verify
  git push -u
}

nerp() {
  echo "'${@}'"
}

removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

armageddon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    # docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

copy-volume() {
  docker volume rm $2 || true
  docker volume create $2 || true
  docker run --rm -it -v $1:/from:ro -v $2:/to alpine ash -c "cd /from ; cp -av . /to"
}

pc () {
  db=$1
  shift
	psql -h db.$db.janus-ai.com -U dbuser ebdb $@
}

pce() {
  echo "connecting to $RDS_HOSTNAME"
  PGPASSWORD=$RDS_PASSWORD psql -h $RDS_HOSTNAME -U $RDS_USERNAME $RDS_DB_NAME $@
}

screen-bg() {
  screen -dm -L -S $1 -- sh -c $2
}

function gs() {
    git stash push -u -m "zsh_stash_name_$1"
}

function gsa() {
    git stash apply $(git stash list | grep "zsh_stash_name_$1" | cut -d: -f1)
}

alias dev='export NAMESPACE=dev && awsume dev -o default && aws sts get-caller-identity > /dev/null || ssocreds -p dev && awsume dev -o default'

alias app='export NAMESPACE=app && awsume app && aws sts get-caller-identity > /dev/null || ssocreds -p app && awsume app'

alias shared='export NAMESPACE=default && ssocreds -p shared && awsume shared'

alias k='kubectl -n $NAMESPACE'
alias kg='k get'
alias kgp='k get pods'
alias kdp='k delete pod'
alias kp='k get pod -o yaml'

kl() {
  k logs $1; echo
}

ke() {
  k get events | grep $1; echo
}

kex() {
  k exec -it $1 -- bash
}

alias q='./bin/dist-bin.sh src/bin/search-query.ts'
alias dq='./bin/dist-bin.sh src/bin/dynamo-get-by-id.ts'
alias records='./bin/dist-bin.sh src/bin/records-for-contacts.ts'
alias merge='./bin/dist-bin.sh src/bin/contact-merge.ts'
alias rebuild='./bin/dist-bin.sh src/bin/contact-rebuild.ts --why manual'
alias dedup='./bin/dist-bin.sh src/bin/contact-dedup.ts --id'
alias after-save='./bin/dist-bin.sh src/bin/after-save.ts'
alias d='./bin/dist-bin.sh'

alias plain="sed $'s,\x1b\\[[0-9;]*[a-zA-Z],,g'"

alias next="yarn next"

alias watch='watch -c'

alias ffmpeg-normalize='ffmpeg-normalize -c:a libmp3lame -ext mp3'

tmosh() {
  /usr/local/bin/mosh --no-init $1 -- tmux new-session -ADs $(date -u +"%Y%m%d%H%M%S")
}
alias mosh='mosh --no-init'

alias talos='export CLUSTER=deft1 CONTROL_PLANE_IP=50.31.165.234 TALOSCONFIG=/home/ryan/Code/metal/deft1/talosconfig KUBECONFIG=/home/ryan/Code/metal/kubeconfig'

#alias code=cursor

alias attach='tmux attach-session'

alias claude='claude --dangerously-skip-permissions --model sonnet'
