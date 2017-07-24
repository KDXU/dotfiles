====================
@kdxu's cheet sheet
====================

zsh
----

:"^Z": beginning-of-line
:“^E”": end-of-line
:"^['": quote-line
:"^[-": neg-argument
:"^[B": backward-word
:"^[C": capitalize-word
:"^[D": kill-word
:"^[F": forward-word
:"^[L": down-case-word

tmux
----

bind-key は Ctrl-a

:c: 新規ウインドウ作成
:w: ウインドウの一覧選択
:v: コピーモード開始
:h: 前のペインに
:j: 次のペインに
:x: ペイン削除
:n: 前のウィンドウ
:C-j: 次のウインドウ
:&: ウィンドウ削除

vim
----

:G: ファイル末尾へ
:=: インデントを揃える
:^: 行頭へ移動
:$: 行末へ移動
:C-f: 一画面下へ
:C-b: 一画面上へ
:C-r: リドゥ
:I: 行頭から挿入モード
:w, b: 単語単位で移動
:f + word: 文字単位で移動
:%: 対応する閉じかっこへ
:tx: タブ閉じる
:tc: 新タブ
:t[0-9]: 指定タブへ移動
:tn: 次のタブ
:tp: 前のタブ
:r: 一文字置換

