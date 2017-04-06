export ZSH=/Users/kyoko/.oh-my-zsh

ZSH_THEME="cute-theme"

source $ZSH/oh-my-zsh.sh

BULLETTRAIN_PROMPT_CHAR="🐹 "

source ~/.zplug/init.zsh
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zaw'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug check || zplug install


autoload -Uz chpwd_recent_dirs cdr add-zsh-hook is-at-least
if is-at-least 4.3.10; then
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
fi

zplug load

HISTFILE=~/.zsh_historyx
HISTSIZE=10000
SAVEHIST=10000

setopt no_beep  # 補完候補がないときなどにビープ音を鳴らさない。
setopt transient_rprompt  # コマンド実行後は右プロンプトを消す
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


function zaw-src-gitdir () {
    _dir=$(git rev-parse --show-cdup 2>/dev/null)
    if [ $? -eq 0 ]
    then
        candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
                                                   '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )
    fi

    actions=("zaw-src-gitdir-cd")
    act_descriptions=("change directory in git repos")
}

function zaw-src-gitdir-cd () {
    BUFFER="cd $1"
    zle accept-line
}

zaw-register-src -n gitdir zaw-src-gitdir
