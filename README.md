# X68K-MZMAPPY

[ Engligh | [日本語](README_ja.md) ]

<br>

## Overview

MAPPY for MZ-80K version on SHARP X68000.(under construction)  
An attempt to create a game in as standard an environment as possible using X-BASIC on the SHARP X68000.  
Since the execution speed on the interpreter is very slow, the BASIC program is converted to C source and an executable file is created using a C compiler.  

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

## Compile from BASIC Source

- if using X68000 XC, do the following:

```
A:>cc sprtest.bas
```
