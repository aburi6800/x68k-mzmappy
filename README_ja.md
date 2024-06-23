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

## BASICソースからのコンパイル

- X68000のXCを使用する場合は、以下のようにします:

```
A:>cc sprtest.bas
```
