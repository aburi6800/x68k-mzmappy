# X68K-MZMAPPY

[ Engligh | [日本語](README_ja.md) ]

<br>

## Overview

This is a port of Mappy for the MZ-80K, released by Denpa Shimbun in 1984, to the SHARP X68000.  (under construction)  
This project is an attempt to use X-BASIC to create a game in as standard an environment as possible.  
However, due to the very slow execution speed of the interpreter, a C compiler will be used to convert the BASIC program to C source, create an executable file, and execute it.  

<br>

## ScreenShots

Title  

<img src="Images/screen_1.png">

<br>

MZ-80K Mode  

<img src="Images/screen_2.png">

<br>

MZ-700 Mode  

<img src="Images/screen_3.png">

<br>

MZ-700+PCG Mode  

<img src="Images/screen_4.png">

<br>

## Startup

- Runs on X68000, Requires `OPMDRV2` or `OPMDRV3`.
- Put the following files in the `dist` directory in the same directory.
    - mzmappy.x
    - bg.dat
    - sprite-txt.dat
    - sprite-pcg.dat
- From `COMMAND.X`, execute `mzmappy.x`.

<br>

## How to play

Joystick only.

- Directional keys: left/right movement
- Button: Door open/close, game start
- ESC key: Exit

<br>

## Compile from BASIC Source

### When using X68000 XC

- Copy the project directory to any drive in the X68000 environment.
- For example, if the x68k-mzmappy directory is on drive A, do the following :

```
A:\>cd x68k-mzmappy\src
A:\x68k-mzmappy\src\>cc /W /Fx..\dist\mzmappy.x mzmappy.bas
```

- mzmzppy.x will be created in the dist directory, so run it.

<br>

### When using [elf2x68k](https://github.com/yunkya2/elf2x68k)

- Change the current directory to the directory of this project.
- Compile with the following command.

```
$ cd src
$ m68k-xelf-bas -o ../dist/mzmappy.x mzmappy.bas
```

> If you are using VSCode, you can perform the same operation by executing the task "Make Binary from X-BASIC".

- Copy the set of files in the dist directory to the X68000 environment and run it.

<br>

## Thanks to

This project was developed using the following software and applications.  
Special thanks to the authors.

- [XM6 TypeG](http://retropc.net/pi/xm6/index.html) (by Mr. PI.)
- [elf2x68k](https://github.com/yunkya2/elf2x68k) (by yunkya2)
- [Lovely Composer](https://doc1oo.github.io/LovelyComposerDocs/en/index.html) (by doc100)
