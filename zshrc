if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh
export XDG_CONFIG_HOME=~/.config
### Virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh
fi

export ENHANCED_COMMAND=ed
export ENHANCED_FILTER=ENHANCED_FILTER=fzy:fzf:peco

autoload colors && colors
setopt prompt_subst

zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

zplug 'yous/vanilli.sh'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zaw'
zplug "plugins/git",   from:oh-my-zsh
zplug 'themes/sorin', from:oh-my-zsh, defer:0
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "rupa/z", use:"*.sh"
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "docker/compose", use:contrib/completion/zsh
zplug "modules/tmux",       from:prezto


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
  fi

# Then, source plugins and add commands to $PATH
zplug load

export CLICOLOR=1

export LIME_DIR_DISPLAY_COMPONENTS=2

HISTFILE=~/.zsh_historyx
HISTSIZE=10000
SAVEHIST=10000

# Better history searching with arrow keys
if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down
fi

setopt no_beep  # 補完候補がないときなどにビープ音を鳴らさない。
setopt hist_ignore_dups   # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_all_dups  # 重複したヒストリは追加しない
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_verify
setopt share_history  # シェルのプロセスごとに履歴を共有
setopt extended_history  # 履歴ファイルに時刻を記録
setopt append_history  # 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt auto_cd  # ディレクトリ名だけで移動
setopt auto_pushd  # cd したら pushd
setopt auto_list  # 補完候補が複数ある時に、一覧表示
setopt auto_menu  # 補完候補が複数あるときに自動的に一覧表示する
setopt list_packed
setopt list_types
setopt no_flow_control
setopt print_eight_bit
setopt pushd_ignore_dups
setopt rec_exact
setopt autoremoveslash
unsetopt list_beep
setopt complete_in_word  # カーソル位置で補完する。
setopt glob
setopt glob_complete  # globを展開しないで候補の一覧から補完する。
setopt extended_glob  # 拡張globを有効にする。
setopt mark_dirs   # globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。

# aliases
alias la='ls -a'
alias mkdir='mkdir -p'
alias tis='tig status'
alias so='source'
alias vim='nvim'
alias mixr='mix release'
alias mixd='mix deps.get'
alias mixc='mix compile'
alias mixcr='mix credo'
alias mixt='mix test'

# rbenv
if [ -e "$HOME/.rbenv" ]; then
  eval "$(rbenv init - zsh)"
fi

# rust
source $HOME/.cargo/env

#kerl
eval ". $HOME/kerl19/activate"
# kiex
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source $HOME/.kiex/scripts/kiex.bash
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/work/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/work/google-cloud-sdk/path.zsh.inc"; fi


function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

if is_exists 'figlet'; then
  echo "${fg_bold[blue]}"
  eval hostname -s | figlet $1
  echo "${reset_color}"
fi

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1
        if is_tmux_runnning; then
          echo $(eval "tmux -V")
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session
