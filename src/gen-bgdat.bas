/*
/* BGデータジェネレータ
/* (MZ80バージョン)
/*
/* Programmed 2024 by ABURI6800 (Hitoshi Iwai)
/* 
/* MIT License.
/* 
int f
str fname
str ans
dim char c(63)
/*
fname = "bg.dat"
/*
cls
print "カレントディレクトリに" ; fname ; "を作成します。"
print "既にあるファイルは上書きされます。"
input "よろしいですか (y/n)";ans
if (strlwr(ans) <> "y") then {
    print "処理を中止します。"
    end
}
/*
f = fopen(fname, "c")
bg_pattern()
fputc(255, f)
fclose(f)
print "終了しました。"
end
/*
func sp_write(n;char)
    fputc(n, f)
    fwrite(c, 64, f)
endfunc
/*
/* 以降はsprdeftool.basのエクスポートソースを取り込み、
/* 先頭の char c[63] の定義を削除、sp_def を sp_write に変換する。
/*
func bg_pattern()
  /* 空白
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(0)
  /* A
  c={&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(1)
  /* B
  c={&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(2)
  /* C
  c={&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(3)
  /* D
  c={&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(4)
  /* E
  c={&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(5)
  /* F
  c={&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(6)
  /* G
  c={&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&HF,&HF,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(7)
  /* H
  c={&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(8)
  /* I
  c={&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(9)
  /* J
  c={&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(10)
  /* K
  c={&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(11)
  /* L
  c={&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(12)
  /* M
  c={&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&HF,&H0,&H0,&HF,&HF,&H0
    ,&H0,&HF,&H0,&HF,&HF,&H0,&HF,&H0
    ,&H0,&HF,&H0,&HF,&HF,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(13)
  /* N
  c={&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&HF,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&HF,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&HF,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(14)
  /* O
  c={&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(15)
  /* P
  c={&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(16)
  /* Q
  c={&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&HF,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(17)
  /* R
  c={&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(18)
  /* S
  c={&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(19)
  /* T
  c={&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(20)
  /* U
  c={&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(21)
  /* V
  c={&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(22)
  /* W
  c={&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&HF,&HF,&H0,&HF,&H0
    ,&H0,&HF,&H0,&HF,&HF,&H0,&HF,&H0
    ,&H0,&HF,&HF,&H0,&H0,&HF,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(23)
  /* X
  c={&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(24)
  /* Y
  c={&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(25)
  /* Z
  c={&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(26)
  /* ┼
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
  }
  sp_write(27)
  /* ├(パワードア左パーツ)
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
  }
  sp_write(30)
  /* 0
  c={&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&HF,&HF,&H0
    ,&H0,&HF,&H0,&HF,&HF,&H0,&HF,&H0
    ,&H0,&HF,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(32)
  /* 1
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(33)
  /* 2
  c={&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(34)
  /* 3
  c={&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(35)
  /* 4
  c={&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(36)
  /* 5
  c={&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(37)
  /* 6
  c={&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(38)
  /* 7
  c={&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(39)
  /* 8
  c={&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(40)
  /* 9
  c={&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(41)
  /* -
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(42)
  /* .
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(46)
  /* (左と下の線)
  c={&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_write(50)
  /* (右と下の線)
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_write(51)
  /* -(グラフィック文字)
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(52)
  /* (閉じドア左の縦線)
  c={&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
  }
  sp_write(53)
  /* (左2ドット塗りつぶし)
  c={&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(55)
  /* (右半分塗りつぶし)
  c={&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
  }
  sp_write(59)
  /* (下の線)
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_write(60)
  /* (右の線)
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
  }
  sp_write(61)
  /* (右2ドット塗りつぶし)
  c={&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
  }
  sp_write(63)
  /* 空白
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(64)
  /* ?
  c={&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
  }
  sp_write(66)
  /* ■
  c={&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_write(67)
  /* ●(反転)
  c={&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_write(74)
  /* ┌(円)
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
  }
  sp_write(75)
  /* ┐(円)
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
  }
  sp_write(76)
  /* ?
  c={&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_write(77)
  /* ?
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_write(78)
  /* [
  c={&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(82)
  /* ]
  c={&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(84)
  /* ?
  c={&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(86)
  /* ┤(パワードア右パーツ)
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
  }
  sp_write(94)
  /* ┬
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
  }
  sp_write(95)
  /* !
  c={&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(97)
  /* &
  c={&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&HF,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(102)
  /* (
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(104)
  /* )
  c={&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(105)
  /* *
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(107)
  /* (上の線)
  c={&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(112)
  /* (左の線)
  c={&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(113)
  /* (左と上の線)
  c={&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(114)
  /* (右と上の線)
  c={&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
  }
  sp_write(115)
  /* ／
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(118)
  /* ＼
  c={&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
  }
  sp_write(119)
  /* (閉じドア右の縦線)
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
  }
  sp_write(121)
  /* (左半分塗りつぶし)
  c={&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
  }
  sp_write(123)
  /* コ
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(130)
  /* シ
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(132)
  /* イ
  c={&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(133)
  /* キ
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(135)
  /* マ
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(138)
  /* リ
  c={&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(140)
  /* モ
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(141)
  /* ラ
  c={&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(143)
  /* セ
  c={&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(144)
  /* ト
  c={&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(147)
  /* カ
  c={&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(148)
  /* ナ
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(149)
  /* ヒ
  c={&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(150)
  /* テ
  c={&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(151)
  /* サ
  c={&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(152)
  /* ン
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(153)
  /* レ
  c={&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(171)
  /* ゛
  c={&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(178)
  /* ッ
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_write(187)
  /* 縦のギザギザ
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
  }
  sp_write(238)
  /* 網掛け
  c={&HF,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&HF
    ,&HF,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&HF
    ,&HF,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&HF
    ,&HF,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&HF
  }
  sp_write(239)
endfunc
