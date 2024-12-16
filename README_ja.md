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

- X68000用の実行ファイルとなっています。
- `OPMDRV2`、または`OPMDRV3`が必要です。
- `dist`ディレクトリにある以下のファイルを、同じディレクトリに入れてください。
    - mzmappy.x
    - bg.dat
    - sprite-txt.dat
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

### X68000のXCを使用する場合

- X68000環境の任意のドライブに、プロジェクトのディレクトリをコピーします。
- 例えばAドライブにx68k-mzmappyディレクトリがある場合、以下のようにします。

```
A:\>cd x68k-mzmappy\src
A:\x68k-mzmappy\src\>cc /W /Fx..\dist\mzmappy.x mzmappy.bas
```

- distディレクトリにmzmzppy.xが作成されますので、実行します。

<br>

### [elf2x68k](https://github.com/yunkya2/elf2x68k)を利用する場合

- Windowsの場合は、WSL2環境で使用します。
- カレントディレクトリをこのプロジェクトのディレクトリに変更します。
- 以下コマンドでコンパイルします。

```
$ cd src
$ m68k-xelf-bas -o ../dist/mzmappy.x mzmappy.bas
```

> VSCodeをお使いの場合は、タスクの「Make Binary from X-BASIC」を実行しても同様の操作ができます。
> なお、Windows環境のドライブにプロジェクトが存在する場合は、WSL2からVSCodeを起動し、/mnt配下にあるWindowsドライブの対象プロジェクトを開いたうえでタスクを実行してください。

- distディレクトリにあるファイル一式をX68000環境にコピーし、実行します。

<br>

## 謝辞

このプロジェクトは以下のソフトウェア、アプリケーションを利用し開発しています。  
作者の方々へ感謝いたします。

- [XM6 TypeG](http://retropc.net/pi/xm6/index.html) (PI.氏)
- [elf2x68k](https://github.com/yunkya2/elf2x68k) (yunkya2氏)
- [Lovely Composer](https://doc1oo.github.io/LovelyComposerDocs/jp/index.html) (doc100氏)
