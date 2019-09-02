#(cat ~/.cache/wal/sequences &)


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
####export ZSH="/home/agenttiny200/.oh-my-zsh"
####echo $ZSH

###### Terminal set up
# looks
# Theme:base16-london-tube.minttyrc

# Text:
# Font:Consola, 11pt
# Leading: 0,Bold:font,Underline:font
# Show bold as font
# Show bold as color
# Allow blinking
# Font smoothing
# Default

# Window:
# Default size: columns: 100 Rows: 26

# Starting message
#if [ "$(whoami)" = "u0_a336" ]; then
    figlet Hello
    figlet agenttiny
#else
#    figlet Hello agenttiny
    if [ -f /usr/bin/neofetch ];
	then
		neofetch --ascii_distro Arch;
    else
	echo 
	echo You are currently $USER
	echo
	echo Current devices set up with this method:
	echo -yudhistira
	echo -u0_a336
	echo -epicurean
	echo -drona
	echo
	echo
	echo
    fi
#fi


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="takashiyoshida"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs'
else
  export EDITOR='emacs'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

################################################################################################### 

# https://www.youtube.com/watch?v=qPG5UrqOLUk
setxkbmap -option ctrl:swapcaps

###################################################################################################
# functions
### cs function
# alias ls='ls --ignore-backups' # removes ~ backup files.  seems to make file names whitewashed too.

alias ls='ls --color -h --group-directories-first'

function cs () {
    cd $1
    ls
    }


###################################################################################################
# Universal commands
alias drives='df -h'
alias usage='du -h -d1'
alias la='ls -al'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
#alias upgrading='sudo apt-get update -y && sudo apt-get upgrade -y'
alias powerh='sudo shutdown -h now'
alias powerr='sudo shutdown -r now'
alias install_texts="fc-cache -f -v"
alias dolphin="dolphin . &"
alias eZshrc='emacs ~/.zshrc'
alias eBashAliases='emacs ~/.bash_aliases'
alias sZshrc='source ~/.zshrc'
alias sBashAliases='source ~/.bash_aliases'
alias settingtheworkdirectoryforzshrc='cd $DROPBOX'    # Used to set starting point for zshrc
settingtheworkdirectoryforzshrc
alias myPlayground="cs $DROPBOX/projects"
alias clearPacmanLock="sudo rm /var/lib/pacman/db.lck"
alias snakes="conda activate snakes"
alias endSnakes="conda deactivate"
alias alarmTone="vlc /media/music/Christopher\ Tin\ -\ Sogno\ di\ Volare\ \(The\ Dream\ of\ Flight\)\ \(Civilization\ VI\ Main\ Theme\).mp3 && date"
alias alarmTime="termdown --no-figlet -T"

termCount() {
    alarmTime "$1" "$2" && alarmTone
}

alias going="thesisWork && make"
alias photoCopy="mv -iv /run/media/sntagore/9016-4EF8/DCIM/100CANON/* ./"
alias jobSearch="cs $DROPBOX/journal_etc/papers/2019/"
alias myDrives="cs /media"
alias myStorage="cs /media/storageSite/"


###################################################################################################
# Universal git backup commands
alias gitDot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


###################################################################################################
# Locations
alias myDropbox='cs $DROPBOX'
alias myJournal='cs $DROPBOX/latex\ journal/'
alias myProjects='cs $DROPBOX/projects'
alias myScripts='cs $DROPBOX/projects/scripts'
alias winDocuments='cs ~/Documents'
#alias ncbiDownload='cs /media/PhD/Users/shayo/ncbi'
#alias win_shayon='cs /media/PhD/Users/shayo'
alias myDownloads='cs ~/Downloads/'
alias myPrograms="cs ~/Programs"
alias thesisWork='cs "$DROPBOX/latex journal/resources/QE_paper-Shayon/md-masters_thesis"'
alias maintainScripts='cs $DROPBOX/projects/scripts/system-set-up'
alias myInvesting='cs $DROPBOX/projects/scripts/syste\
m-set-up'
#alias myStartUp='cs /mnt/c/Users/shayo/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup'
#alias myDesktop="cs /mnt/c/Users/shayo/Desktop"

#### emacs
alias MJUploadinit='cp -r ~/.emacs.d/config $DROPBOX/Work/emacs/elpa-26.1/;
cp ~/.emacs.d/init.el $DROPBOX/Work/emacs/elpa-26.1/MJInit.el;
cp -r ~/.emacs.d/snippets $DROPBOX/Work/emacs/elpa-26.1/' # Upload

alias MJDownloadinit='cp -r $DROPBOX/Work/emacs/elpa-26.1/config ~/.emacs.d/;
cp $DROPBOX/Work/emacs/elpa-26.1/MJInit.el ~/.emacs.d/init.el; 
cp -r $DROPBOX/Work/emacs/elpa-26.1/snippets ~/.emacs.d/' # Download
# alias emacs="emacs -nw"
alias emacs="emacsclient -nw"
# alias e="emacs "
alias e="emacsclient -nw"

#### emacs locations
alias MJInit="cd ~/.emacs.d" # Location
alias MJSnippets="cs ~/.emacs.d/snippets" # Location

#### temp locations
alias classLSM3241='cs $DROPBOX/Work/lsm3241-19-sem2'

## These commands were used for QE documents
alias myThesisfolder="cs $DROPBOX/latex\ journal/resources/QE_paper-Shayon"
# alias myQEpresentation="cs '$DROPBOX/latex journal/resources/QE_paper-Shayon/QE-presentation conditional pass'"

# ssh
alias pi="ssh sntagore@192.168.1.87"



###################################################################################################
# Universal backing-up

alias downloadZshrcMJ='cp $DROPBOX/projects/scripts/terminal-basics/zshrcMJ_v2 ~/.zshrc' # takes from dropbox
alias uploadZshrcMJ='cp ~/.zshrc $DROPBOX/projects/scripts/terminal-basics/zshrcMJ_v2' # adds to dropbox
alias downloadSsh='cp $DROPBOX/projects/scripts/ssh_config_v1 ~/.ssh/config'
alias uploadSsh='cp ~/.ssh/config $DROPBOX/projects/scripts/ssh_config_v1'




###################################################################################################
###################################################################################################
######## Drona
## init
## Complex commands
# Locations
###################################################################################################
###################################################################################################
######## Epicurus
## init file
## Complex commands
## Locations
###################################################################################################
###################################################################################################
######## phone settings

alias phonemyDropbox="cs /data/data/com.termux/files/home/storage/shared/Android/data/com.dropbox.android/files/u655535373/scratch"
alias phoneDownloadZshrc="cp -i /data/data/com.termux/files/home/storage/shared/Android/data/com.dropbox.android/files/u655535373/scratch/projects/scripts/zshrc_v2 ~/.zshrc"
alias phoneUploadZshrc="cp -i ~/.zshrc /data/data/com.termux/files/home/storage/shared/Android/data/com.dropbox.android/files/u655535373/scratch/projects/scripts/zshrc_v2"
alias phoneeLabBook="emacs /data/data/com.termux/files/home/storage/shared/Android/data/com.dropbox.android/files/u655535373/scratch/latex\ journal/notebook\ v4.0/00-labbookv4.md"
alias phoneUploadEmacsD="cp -r /data/data/com.termux/files/home/.emacs.d /data/data/com.termux/files/home/storage/shared/Android/data/com.dropbox.android/files/u655535373/scratch/projects/scripts/termux/"
alias phoneDownloadEmacsD="cp -r /data/data/com.termux/files/home/storage/shared/Android/data/com.dropbox.android/files/u655535373/scratch/projects/scripts/termux/.emacs.d/ /data/data/com.termux/files/home/"
alias phoneUploadALL="u0UploadZshrc & u0UploadEmacsD"
alias phoneDownloadALL="u0DownloadZshrc & u0DownloadEmacsD"

# echo termux
# confirm the above works then delete below
#alias dTermuxzshrc='cp -i ~/downloads/zshrc_v2 ~/.zshrc'




###################################################################################################
###################################################################################################
######## Yudhistira



###################################################################################################
# Bioinformatics

# need to sratoolkit
export PATH="$PATH:/mnt/d/Dropbox/Work/programs/bowtie/bowtie2-2.3.4.3/"

# Picard tools
#PICARD='/mnt/d/Dropbox/Work/programs/picard_2.18.27/picard.jar'  # first time install: this line only needs to be run once.  will save a bit of time loading.
alias picard="java -jar $PICARD"

# fastqc
alias fastqc="/mnt/d/Dropbox/Work/programs/FastQC/fastqc"

# kallisto
#alias kallisto="/mnt/d/Dropbox/Work/programs/kallisto_linux-v0.45.0/kallisto"



###################################################################################################
# github websites

# #echo 'completed'
# # Install Ruby Gems to ~/gems
# export GEM_HOME="$HOME/gems"
# export PATH="$HOME/gems/bin:$PATH"



###################################################################################################
# getting R packages to work

# R
### windows R
alias eRPackages="e $DROPBOX/projects/scripts/system-set-up/install_R_packages"



###################################################################################################
# financial aliases
###################################################################################################
# pandoc

#alias beamering="pandoc --pdf-engine=lualatex --template=template.latex -t beamer -o slides.pdf 01-Main.md"
alias beamering="pandoc --pdf-engine=lualatex -t beamer -o slides.pdf 01-Main.md"
alias resumeing="pandoc --pdf-engine=lualatex -o trial-something.pdf cv_4.tex"

source ~/.temp-aliases
export PATH=${PATH}:$DROPBOX/Work/programs/edirect

emacs --daemon &































(cat ~/.cache/wal/sequences &)

# added by Miniconda3 4.2.12 installer
export PATH="/home/sntagore/anaconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sntagore/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sntagore/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sntagore/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sntagore/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<




function cdb() {
    USAGE="Usage: cdb [-c|-g|-d|-l] [bookmark]" ;
    if  [ ! -e ~/.cd_bookmarks ] ; then
        mkdir ~/.cd_bookmarks
    fi

    case $1 in
        # create bookmark
        -c) shift
            if [ ! -f ~/.cd_bookmarks/$1 ] ; then
                echo "cd `pwd`" > ~/.cd_bookmarks/"$1" ;
            else
                echo "Try again! Looks like there is already a bookmark '$1'"
            fi
            ;;
        # goto bookmark
        -g) shift
            if [ -f ~/.cd_bookmarks/$1 ] ; then 
                source ~/.cd_bookmarks/"$1"
            else
                echo "Mmm...looks like your bookmark has spontaneously combusted. What I mean to say is that your bookmark does not exist." ;
            fi
            ;;
        # delete bookmark
        -d) shift
            if [ -f ~/.cd_bookmarks/$1 ] ; then 
                rm ~/.cd_bookmarks/"$1" ;
            else
                echo "Oops, forgot to specify the bookmark" ;
            fi    
            ;;
        # list bookmarks
        -l) shift
            ls -l ~/.cd_bookmarks/ ;
            ;;
         *) echo "$USAGE" ;
            ;;
    esac
}


export PATH="/home/sntagore/anaconda3/bin:$PATH"