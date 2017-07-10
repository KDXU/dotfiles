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

# rbenv
if [ -e "$HOME/.rbenv" ]; then
  eval "$(rbenv init - zsh)"
fi
# kiex
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source $HOME/.kiex/scripts/kiex.bash
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/geru/work/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/geru/work/google-cloud-sdk/path.zsh.inc'; fi
