/*
/* スプライトデータジェネレータ
/* (MZ80バージョン)
/*
/* Programmed 2024 by ABURI6800 (Hitoshi Iwai)
/* 
/* MIT License.
/* 
int f
str fname
str ans
dim char c(255)
/*
fname = "sprite-pcg.dat"
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
sprite_pattern()
fputc(255, f)
fclose(f)
print "終了しました。"
end
/*
func sp_write(n;char)
    fputc(n, f)
    fwrite(c, 256, f)
endfunc
/*
/* 以降はsprdeftool.basのエクスポートソースを取り込み、
/* 先頭の char c[255] の定義を削除、sp_def を sp_write に変換する。
/*
func sprite_pattern()
  /* マッピー左(1)
  c={
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&H1,&HF,&H1,
   +&H1,&H1,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&HF,
   +&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&HF,
   +&H1,&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&HF,
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,
   +&H1,&HF,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(64)
  /* マッピー左(2)
  c={
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&H1,&HF,&H1,
   +&H1,&H1,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&HF,
   +&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&HF,
   +&H1,&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&HF,
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&HF,&H1,
   +&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1
  }
  sp_write(65)
  /* マッピー右(1)
  c={
   +&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&HF,&H1,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,
   +&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&H1,&H1,
   +&HF,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,
   +&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,
   +&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&HF,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&HF,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(66)
  /* マッピー右(2)
  c={
   +&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&HF,&H1,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,
   +&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&H1,&H1,
   +&HF,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,
   +&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,
   +&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&HF,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&H1,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(67)
  /* マッピー正面(1)
  c={
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&H1,&HF,&H1,&H1,
   +&H1,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&H1,
   +&H1,&H1,&HF,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&HF,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1
  }
  sp_write(68)
  /* マッピー正面(2)
  c={
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&H1,&HF,&H1,&H1,
   +&H1,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&H1,
   +&H1,&H1,&HF,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&HF,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1
  }
  sp_write(69)
  /* マッピーミス(1)
  sp_write(70)
  /* マッピーミス(2)
  sp_write(71)
  /*
  /* ミューキーズ左(1)
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&HF,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&HF,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(72)
  /* ミューキーズ左(2)
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&HF,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&HF,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1
  }
  sp_write(73)
  /* ミューキーズ右(1)
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&HF,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&HF,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(74)
  /* ミューキーズ右(2)
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&HF,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&HF,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(75)
  /* ミューキーズ正面(1)
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(76)
  /* ミューキーズ正面(2)
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(77)
  /* ミューキーズ左気絶
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&HF,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&HF,&H1,&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&HF,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(78)
  /* ミューキーズ右気絶
  c={
    +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,
    +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,&HF,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&HF,
    +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&HF,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,
    +&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&HF,&H1,
    +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1
   }
   sp_write(79)
  /*
  /* ニャームコ左右(1)
  c={
   +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1
  }
  sp_write(80)
  /* ニャームコ左右(2)
  c={
   +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(81)
  /* ニャームコ左右(3)
  c={
    +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&H1,
    +&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,
    +&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
    +&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1
   }
  sp_write(82)
  /* ニャームコ左右(2)
  c={
    +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,
    +&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1
   }
   sp_write(83)
   /* ニャームコ正面(1)
  c={
    +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&HF,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,&HF,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1
   }
  sp_write(84)
  /* ニャームコ正面(2)
  c={
    +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&HF,&H1,&H1,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1
   }
  sp_write(85)
  /* ニャームコ気絶(1)
  c={
    +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1
  }
sp_write(86)
  /* ニャームコ気絶(2)
  c={
    +&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,
    +&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&H1,
    +&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
    +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(87)
  /*
  /* カセット
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,
   +&H1,&H1,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&H1,&H1,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&HF,&HF,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,
   +&HF,&H1,&HF,&H1,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_write(90)
  /* テレビ
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&H1,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&HF,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&H1,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&HF,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&HF,&H1,&HF,
   +&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&HF,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1
  }
  sp_write(91)
  /* マイコン
  c={
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&HF,&H1,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&HF,&H1,
   +&H1,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&HF,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&HF,&HF,&H1,
   +&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&H1,&HF,&H1,
   +&HF,&HF,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&H1,&HF,&HF,&H1,&HF,&HF,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,
   +&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_write(92)
  /* モナリサ
  c={
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&H1,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&H1,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&H1,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&HF,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(93)
  /* キンコ．
  c={
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,
   +&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,
   +&H1,&HF,&H1,&HF,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,
   +&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,
   +&H1,&HF,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,
   +&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H1
  }
  sp_write(94)
  /* ？？？？
  c={
   +&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&HF,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,&H1,&HF,&HF,&HF,&HF,&HF,&H1,&H1,
   +&HF,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,
   +&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&HF,&H1,&H1,
   +&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&HF,&H1,&H1,&H1,&H1,
   +&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1,&H1
  }
  sp_write(95)
endfunc
