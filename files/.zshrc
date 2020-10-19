# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ansible command-not-found common-aliases docker docker-compose git pass thefuck zsh-autosuggestions)

source "$ZSH/oh-my-zsh.sh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=de_DE.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="code ~/.oh-my-zsh"

zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

unsetopt share_history

compinit
_comp_options+=(globdots)

# p10k conf
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

source "$HOME/.aliases"

# overwrite p10k settings
POWERLEVEL9K_TRANSIENT_PROMPT=same-dir

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	# =========================[ Line #1 ]=========================
	time                    # current time
	ip                      # ip address and bandwidth usage for a specified network interface
	public_ip               # public IP address
	vpn_ip                  # virtual private network indicator
	# proxy                 # system-wide http/https/ftp proxy
	# wifi                  # wifi speed
	# =========================[ Line #2 ]=========================
	newline                 # \n
	os_icon                 # os identifier
	context                 # user@hostname
	dir                     # current directory
	vcs                     # git status
	# =========================[ Line #3 ]=========================
	newline                 # \n
	# prompt_char           # prompt symbol
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
	# =========================[ Line #1 ]=========================
	status                  # exit code of the last command
	command_execution_time  # duration of the last command
	background_jobs         # presence of background jobs
	direnv                  # direnv status (https://direnv.net/)
	asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
	virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
	anaconda                # conda environment (https://conda.io/)
	pyenv                   # python environment (https://github.com/pyenv/pyenv)
	goenv                   # go environment (https://github.com/syndbg/goenv)
	nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
	nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
	nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
	# node_version          # node.js version
	# go_version            # go version (https://golang.org)
	# rust_version          # rustc version (https://www.rust-lang.org)
	# dotnet_version        # .NET version (https://dotnet.microsoft.com)
	# php_version           # php version (https://www.php.net/)
	# laravel_version       # laravel php framework version (https://laravel.com/)
	# java_version          # java version (https://www.java.com/)
	# package               # name@version from package.json (https://docs.npmjs.com/files/package.json)
	rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
	rvm                     # ruby version from rvm (https://rvm.io)
	fvm                     # flutter version management (https://github.com/leoafarias/fvm)
	luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
	jenv                    # java version from jenv (https://github.com/jenv/jenv)
	plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
	phpenv                  # php version from phpenv (https://github.com/phpenv/phpenv)
	haskell_stack           # haskell version from stack (https://haskellstack.org/)
	kubecontext             # current kubernetes context (https://kubernetes.io/)
	terraform               # terraform workspace (https://www.terraform.io)
	aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
	aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
	azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
	gcloud                  # google cloud cli account and project (https://cloud.google.com/)
	google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
	nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
	ranger                  # ranger shell (https://github.com/ranger/ranger)
	nnn                     # nnn shell (https://github.com/jarun/nnn)
	vim_shell               # vim shell indicator (:sh)
	midnight_commander      # midnight commander shell (https://midnight-commander.org/)
	nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
	vi_mode                 # vi mode (you don't need this if you've enabled prompt_char)
	# load                  # CPU load
	# disk_usage            # disk usage
	# ram                   # free RAM
	# swap                  # used swap
	todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
	timewarrior             # timewarrior tracking status (https://timewarrior.net/)
	taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
	battery                 # internal battery
	# example               # example user-defined segment (see prompt_example function below)
)

# left prompt first line

# configure ip segments foreground and background colours
POWERLEVEL9K_IP_BG_COLOUR='006'
POWERLEVEL9K_IP_FG_COLOUR='000'

# match either ethernet or wifi interfaces
POWERLEVEL9K_IP_INTERFACE='(e|w).*'
# only show ip address
POWERLEVEL9K_IP_CONTENT_EXPANSION='$P9K_IP_IP'

POWERLEVEL9K_IP_BACKGROUND=${POWERLEVEL9K_IP_BG_COLOUR}
POWERLEVEL9K_IP_FOREGROUND=${POWERLEVEL9K_IP_FG_COLOUR}

POWERLEVEL9K_PUBLIC_IP_BACKGROUND=${POWERLEVEL9K_IP_BG_COLOUR}
POWERLEVEL9K_PUBLIC_IP_FOREGROUND=${POWERLEVEL9K_IP_FG_COLOUR}

# show which VPN ip address has been assigned
unset POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION
POWERLEVEL9K_VPN_IP_BACKGROUND=${POWERLEVEL9K_IP_BG_COLOUR}
POWERLEVEL9K_VPN_IP_FOREGROUND=${POWERLEVEL9K_IP_FG_COLOUR}

# left prompt second line

# configure os_icon colours
POWERLEVEL9K_OS_ICON_BACKGROUND='214'
POWERLEVEL9K_OS_ICON_FOREGROUND='000'
POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=""

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='011'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='000'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='001'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='255'

# configure custom dir classes
POWERLEVEL9K_DIR_CLASSES=(
	'~/dokumente/projects/agdsn(|/*)'	AGDSN_LONG			''
	'~/dokumente/projects/work(|/*)'	WORK_LONG				''
	'~/dokumente/projects/*'					PROJECTS_LONG		''
	'~/projects/agdsn(|/*)'						AGDSN						''
	'~/projects/work(|/*)'						WORK						''
	'~/projects/*'										PROJECTS				''
	'~/*'															HOME_SUBFOLDER	''
	'~'																HOME						''
	# '*'															DEFAULT					''
)

# configure colours for custom dir classes
POWERLEVEL9K_DIR_HOME_BACKGROUND='027'
POWERLEVEL9K_DIR_HOME_ANCHOR_FOREGROUND='015'
POWERLEVEL9K_DIR_HOME_NOT_WRITABLE_BACKGROUND='009'
POWERLEVEL9K_DIR_HOME_NOT_WRITABLE_ANCHOR_FOREGROUND='011'

POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='045'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='000'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_SHORTENED_FOREGROUND='000'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_ANCHOR_FOREGROUND='016'

typeset -g POWERLEVEL9K_DIR_{AGDSN,AGDSN_LONG}_BACKGROUND='019'
typeset -g POWERLEVEL9K_DIR_{AGDSN,AGDSN_LONG}_FOREGROUND='250'
typeset -g POWERLEVEL9K_DIR_{AGDSN,AGDSN_LONG}_SHORTENED_FOREGROUND='245'
typeset -g POWERLEVEL9K_DIR_{AGDSN,AGDSN_LONG}_ANCHOR_FOREGROUND='015'
typeset -g POWERLEVEL9K_DIR_{AGDSN,AGDSN_LONG}_NOT_WRITABLE_BACKGROUND='019'
typeset -g POWERLEVEL9K_DIR_{AGDSN,AGDSN_LONG}_NOT_WRITABLE_FOREGROUND='201'
typeset -g POWERLEVEL9K_DIR_{AGDSN,AGDSN_LONG}_NOT_WRITABLE_SHORTENED_FOREGROUND='165'
typeset -g POWERLEVEL9K_DIR_{AGDSN,AGDSN_LONG}_NOT_WRITABLE_ANCHOR_FOREGROUND='207'

typeset -g POWERLEVEL9K_DIR_{WORK,WORK_LONG}_BACKGROUND='076'
typeset -g POWERLEVEL9K_DIR_{WORK,WORK_LONG}_FOREGROUND='000'
typeset -g POWERLEVEL9K_DIR_{WORK,WORK_LONG}_SHORTENED_FOREGROUND='235'
typeset -g POWERLEVEL9K_DIR_{WORK,WORK_LONG}_ANCHOR_FOREGROUND='016'
typeset -g POWERLEVEL9K_DIR_{WORK,WORK_LONG}_NOT_WRITABLE_BACKGROUND='076'
typeset -g POWERLEVEL9K_DIR_{WORK,WORK_LONG}_NOT_WRITABLE_FOREGROUND='124'
typeset -g POWERLEVEL9K_DIR_{WORK,WORK_LONG}_NOT_WRITABLE_SHORTENED_FOREGROUND='088'
typeset -g POWERLEVEL9K_DIR_{WORK,WORK_LONG}_NOT_WRITABLE_ANCHOR_FOREGROUND='196'

typeset -g POWERLEVEL9K_DIR_{PROJECTS,PROJECTS_LONG}_BACKGROUND='082'
typeset -g POWERLEVEL9K_DIR_{PROJECTS,PROJECTS_LONG}_FOREGROUND='059'
typeset -g POWERLEVEL9K_DIR_{PROJECTS,PROJECTS_LONG}_SHORTENED_FOREGROUND='065'
typeset -g POWERLEVEL9K_DIR_{PROJECTS,PROJECTS_LONG}_ANCHOR_FOREGROUND='054'
typeset -g POWERLEVEL9K_DIR_{PROJECTS,PROJECTS_LONG}_NOT_WRITABLE_BACKGROUND='091'
typeset -g POWERLEVEL9K_DIR_{PROJECTS,PROJECTS_LONG}_NOT_WRITABLE_FOREGROUND='076'
typeset -g POWERLEVEL9K_DIR_{PROJECTS,PROJECTS_LONG}_NOT_WRITABLE_SHORTENED_FOREGROUND='070'
typeset -g POWERLEVEL9K_DIR_{PROJECTS,PROJECTS_LONG}_NOT_WRITABLE_ANCHOR_FOREGROUND='082'

POWERLEVEL9K_DIR_BACKGROUND='091'
POWERLEVEL9K_DIR_FOREGROUND='184'
POWERLEVEL9K_DIR_SHORTENED_FOREGROUND='178'
POWERLEVEL9K_DIR_ANCHOR_FOREGROUND='190'
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND='124'
POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND='184'
POWERLEVEL9K_DIR_NOT_WRITABLE_SHORTENED_FOREGROUND='178'
POWERLEVEL9K_DIR_NOT_WRITABLE_ANCHOR_FOREGROUND='190'

# configure vcs colours
POWERLEVEL9K_VCS_FG_COLOUR='000'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=${POWERLEVEL9K_VCS_FG_COLOUR}
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='010'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=${POWERLEVEL9K_VCS_FG_COLOUR}
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='190'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=${POWERLEVEL9K_VCS_FG_COLOUR}
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='051'
POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND=${POWERLEVEL9K_VCS_FG_COLOUR}
POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND='166'
POWERLEVEL9K_VCS_LOADING_FOREGROUND=${POWERLEVEL9K_VCS_FG_COLOUR}
POWERLEVEL9K_VCS_LOADING_BACKGROUND='008'

# right prompt first line

POWERLEVEL9K_RIGHT_PROMPT_BG_COLOUR='238'
POWERLEVEL9K_RIGHT_PROMPT_FG_COLOUR='014'

typeset -g POWERLEVEL9K_STATUS_{OK,OK_PIPE}_BACKGROUND=${POWERLEVEL9K_RIGHT_PROMPT_BG_COLOUR}
typeset -g POWERLEVEL9K_STATUS_{OK,OK_PIPE}_FOREGROUND='010'
typeset -g POWERLEVEL9K_STATUS_{OK,OK_PIPE}_VISUAL_IDENTIFIER_EXPANSION='🗸'
typeset -g POWERLEVEL9K_STATUS_{ERROR,ERROR_PIPE}_BACKGROUND='001'
typeset -g POWERLEVEL9K_STATUS_{ERROR,ERROR_PIPE}_FOREGROUND='255'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=${POWERLEVEL9K_RIGHT_PROMPT_BG_COLOUR}
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='172'

POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=${POWERLEVEL9K_RIGHT_PROMPT_BG_COLOUR}
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=${POWERLEVEL9K_RIGHT_PROMPT_FG_COLOUR}

POWERLEVEL9K_DIRENV_BACKGROUND=${POWERLEVEL9K_RIGHT_PROMPT_BG_COLOUR}
POWERLEVEL9K_DIRENV_FOREGROUND='172'

POWERLEVEL9K_BATTERY_LOW_BACKGROUND='001'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='011'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='010'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='000'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='070'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='255'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND=${POWERLEVEL9K_RIGHT_PROMPT_BG_COLOUR}
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=${POWERLEVEL9K_RIGHT_PROMPT_FG_COLOUR}
