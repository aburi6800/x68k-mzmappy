# X68K-MZMAPPY

MAPPY for MZ-80K version on SHARP X68000.

<br>

## Compile from BASIC Source

- On the host computer, do the following to generate the C source.

```
$ ./bas2c.py sprtest.bas
```

- Compile the C source; if using X68000 XC, do the following:

```
A:>cc /w sprtest.c
```
