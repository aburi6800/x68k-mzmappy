# X68K-MZMAPPY

[ [Engligh](README.md) | 日本語 ]

<br>

## 概要

1984年に電波新聞社から発売された、MZ-80K用のマッピーを、SHARP X68000に移植したものです。  
(現在制作中)  
このプロジェクトは、X-BASICを使用し、できるだけ標準的な環境でゲームを作ろうという試みです。  
しかし、インタプリタでの実行速度が非常に遅いため、CコンパイラでBASICプログラムをCソースに変換・実行ファイルを作成し、実行します。  

<br>

## 画面

<br>

タイトル画面

<img src="Images/screen_1.png">

<br>

MZ-80Kモード

<img src="Images/screen_2.png">

<br>

MZ-700モード

<img src="Images/screen_3.png">

<br>

MZ-700+PCGモード

<img src="Images/screen_4.png">

<br>

## 起動方法

- X68000で実行します。`OPMDRV2`、または`OPMDRV3`が必要です。
- `dist`ディレクトリにある以下のファイルを、同じディレクトリに入れてください。
    - mzmappy.x
    - bg.dat
    - sprite.dat
    - sprite-pcg.dat
- `COMMAND.X`で、`mzmappy.x`を実行してください。

<br>

## 操作方法

ジョイスティック専用です。

- 方向キー：左右移動
- ボタン：ドア開閉、ゲームスタート
- ESCキー：終了

<br>

## BASICソースからのコンパイル

- X68000のXCを使用する場合は、以下のようにします:

```
A:>cc mzmappy.bas
```
