/*
/* スプライトとBGのテストプログラム
/*
screen 0, 2, 1, 1 /* 表示画面サイズ 256x256,グラフィック画面 512x512 256色,高解像度
sp_init() /* スプライト画面初期化
sp_clr() /* 全スプライトパターンクリア
sp_disp(1) /* スプライト画面表示
sp_on() /* 全プレーンのスプライト表示
sprite_pallet() /* スプライトパレット定義
sprite_pattern() /* スプライトパターン定義
bg_pattern() /* BGパターン定義
/* 定数
int C_BG_WIDTH = 54
int C_DISP_WIDTH = 32
/* 変数
int i, j
int mp_x = 48 /* マッピーX座標
int mp_y = 28 /* マッピーY座標
int mp_vx = 0 /* マッピーX移動量
int mp_vy = 0 /* マッピーY移動量
int mp_cd = 64 /* マッピーキャラクターパターン番号
int mp_cond = 0 /* マッピーの状態
int vx = 0 /* 仮
int vy = 0 /* 仮
int en_type(8) /* 敵の種類(1=ミューキーズ,2=ニャームコ,3=ご先祖様
int en_x(8) /* 敵X座標
int en_y(8) /* 敵Y座標
int en_cp(8) /* 敵キャラクターパターン番号
int en_cond(8) /* 敵の状態
int tp_x(8) /* トランポリンX座標
int tp_y(8) /* トランポリンY座標
int tp_h(8) /* トランポリン耐久度
int tp_cond(8) /* トランポリンの状態
int st = 0 /* スティック入力値
int bg_x = 0 /* BG面の表示位置
/*
/* スタートデモ
/*
bg_fill(0, pat_dat(0, 0, 1, &H0))
bg_fill(1, pat_dat(0, 0, 1, &H0))
for i =0 to 31
  bg_put(0, i, 30, pat_dat(0, 0, 1, &H4A))
  bg_put(0, i, 31, pat_dat(0, 0, 1, &H4A))
next
bg_print(4, 9, "NOW ON GO TO THE STORY!")
bg_set(0, 0, 1)
bg_set(1, 1, 1)
sp_move(1, spr_x(6),  spr_y(28), 76) /* ニャームコ左
sp_move(2, spr_x(10), spr_y(28), 71) /* ミューキーズ左
sp_move(3, spr_x(13), spr_y(28), 71) /* ミューキーズ左
sp_move(4, spr_x(16), spr_y(28), 71) /* ミューキーズ左
sp_move(5, spr_x(24), spr_y(28), 65) /* マッピー
for i = 0 to 12999
next
erase_all()
/*
/* ゲーム初期化
/*
dim char offscr(54*29)
/*              1               2               3               4               5               6               7               8               9               A               B               C               D               E  
/*23456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDE
/*          0                                       1                                       2                                       3                                       4                                       5
/*          0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3
offscr = {  0,  0,  0, 78, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 77,  0,  0,  0
         ,  0,  0, 78, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 77,  0,  0
         ,  0, 78, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 77,  0
         , 78, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 77
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0, 30, 94,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0, 53,121,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,138,133,  0, 30, 84,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,123,121,  0,148,144,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,130,153,  0, 30, 94,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0, 53,121,  0,187,147,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0, 53,121,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0, 53, 59,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0, 53,121,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0, 30, 94,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,135,153,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0, 82, 94,  0,135,153,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,130, 46,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0, 30, 94,  0,130, 46,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,151,171,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,150,178,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,141,149,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,138,133,  0,  0, 64, 64,  0,  0,151,171,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 64, 64,  0,  0,140,152,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,130,153,  0,  0, 64, 64,  0,  0,150,178,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
         ,  0, 67, 52, 52, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 52, 52, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 52, 52, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 52, 52, 67,  0
         ,  0, 67, 64, 64, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 64, 64, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 64, 64, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 64, 64, 67,  0
}
/* BGに54x29の1画面分を描画(BG#0)
bg_set(0, 0, 0)
bg_set(1, 1, 0)
for i = 0 to 28
  for j = 0 to 53
    bg_put(0, j, i+3, pat_dat(0, 0, 1, offscr(i*54 + j)))
  next
next
/* BGにトランポリン描画
tp_x(0) = 2
tp_y(0) = 30
tp_x(1) = 18
tp_y(1) = 30
tp_x(2) = 34
tp_y(2) = 30
tp_x(3) = 50
tp_y(3) = 30
for i = 0 to 8
  if tp_x(i) > 0 then {
    tp_h(0) = 3
    tp_cond(0) = 0
    bg_put(0, tp_x(i)    , tp_y(i), pat_dat(0, 0, 1, &H34))
    bg_put(0, tp_x(i) + 1, tp_y(i), pat_dat(0, 0, 1, &H34))
  }
next
/* スコアなどを描画(BG#1)
bg_print(5, 0, "1UP")
bg_print(11, 0, "HI-SCORE")
bg_print(22, 0, "MP")
bg_print(27, 0, "R")
bg_print(9, 1, "0")
bg_print(14, 1, "20000")
bg_print(23, 1, "1")
bg_print(27, 1, "1")
bg_x = 22
bg_scroll(0, bg_x * 8, 0)
bg_set(0, 0, 1)
bg_set(1, 1, 1)
/* 敵配置
en_type(0) = 2
en_x(0) = 37
en_y(0) = 12
en_cp(0) = 70
en_cond(0) = 0
/*
en_type(1) = 1
en_x(1) = 10
en_y(1) = 16
en_cp(1) = 76
en_cond(1) = 0
/*
/* メインルーチン
/*
while strig(1) = 0
  move_mappy()
  move_enemy()
  /* BG面スクロール
  if mp_x - bg_x < C_DISP_WIDTH / 2 and bg_x > 0 then {
    bg_x = bg_x - 1
  }
  if mp_x - bg_x > C_DISP_WIDTH / 2 and bg_x < (C_BG_WIDTH - C_DISP_WIDTH) then {
    bg_x = bg_x + 1
  }
  bg_scroll(0, bg_x * 8, 0)
endwhile
width 96
end
/*
/* マッピー移動
/*
func move_mappy()
  if mp_cond = 0 then {
    move_mappy_floor()
  } else if mp_cond = 1 then {
    move_mappy_toupdown()
  } else if mp_cond = 2 then {
    move_mappy_updown()
  } else if mp_cond = 3 then {
    move_mappy_tofloor()
  }
  /* 座標変更
  mp_x = mp_x + mp_vx
  mp_y = mp_y + mp_vy
  if mp_x < 0 then mp_x = 0
  if mp_x > C_BG_WIDTH - 2 then mp_x = C_BG_WIDTH - 2
  /* キャラクタ表示
  sp_move(0, spr_x(mp_x), spr_y(mp_y), mp_cd)
endfunc
/*
/* マッピー床移動
/*
func move_mappy_floor()
  int vdata
/*
  mp_vy = 0
  mp_vx = 0
  st = stick(1)
  if st = 4 then {
    /* 左入力
    mp_cd = 65
    mp_vx = - 1
    /* BG判定
    vdata = vpeek(mp_x + mp_vx, mp_y + 1)
    if vdata = 64 then {
      mp_vy = - 1
      mp_cond = 1 /* トランポリンに乗る
    }
  } else if st = 6 then {
    /* 右入力
    mp_cd = 64
    mp_vx = 1
    /* BG判定
    vdata = vpeek(mp_x + mp_vx + 1, mp_y + 1)
    if vdata = 64 then {
      mp_vy = - 1
      mp_cond = 1 /* トランポリンに乗る
    }
  }
endfunc
/*
/* マッピー上下移動移行
/*
func move_mappy_toupdown()
  mp_vy = 1
  mp_cd = 66
  mp_cond = 2
endfunc
/*
/* マッピー上下移動
/*
func move_mappy_updown()
  mp_vx = 0
  /* 移動先チェック
  if vpeek(mp_x, mp_y + mp_vy) <> 64 then {
    mp_vy= -1
  }
  if vpeek(mp_x, mp_y + mp_vy) <> 64 then {
    mp_vy = 1
  }
  /* 入力チェック
  if (mp_vy = -1) and ((mp_y - 8) mod 4 = 0) then {
    st = stick(1)
    if st = 4 then {
      /* 左入力
      if vpeek(mp_x - 1, mp_y + 1) = 0 then {
        mp_cond = 3
        mp_vx = -1
        mp_vy = - 1
      } else {
        mp_vy = 1
      }
    } else if st = 6 then {
      /* 右入力
      if vpeek(mp_x + 2, mp_y + 1) = 0 then {
        mp_cond = 3
        mp_vx = 1
        mp_vy = - 1
      } else {
        mp_vy = 1
      }
    }
  }
endfunc
/*
/* マッピー床移動移行
/*
func move_mappy_tofloor()
  mp_vy = 1
  if mp_vx = -1 then {
    mp_cd = 65
  } else {
    mp_cd = 64
  }
  mp_cond = 0
endfunc
/*
/* 敵移動
/*
func move_enemy()
  for i = 0 to 7
    if en_type(i) = 1 then {
      move_nyamco(i)
    }
    if en_type(i) = 2 then {
      move_myukies(i)
    }
  next
endfunc
/*
/* ニャームコ移動
/*
func move_nyamco(num;int)
  /* 固定で置いておく
  sp_move(10 + num, spr_x(en_x(num)), spr_y(en_y(num)), en_cp(num))
endfunc
/*
/* ミューキーズ移動
/*
func move_myukies(num;int)
  /* 固定で置いておく
  sp_move(10 + num, spr_x(en_x(num)), spr_y(en_y(num)), en_cp(num))
endfunc
/*
/* 仮想画面X座標からスプライト表示X座標を取得
/* in:
/*   int  txt_x 仮想画面X座標(テキスト)
/* out:
/*   int        スプライト表示X座標(表示範囲外のときは-16)
/*
func int spr_x(txt_x;int)
  int spr_x
  spr_x = (txt_x - bg_x) * 8
  if (spr_x < -16) or (spr_x > 255) then {
    spr_x = -16
  } 
  return(spr_x)
endfunc
/*
/* テキストY座標からスプライト表示Y座標を取得
/* in:
/*   int  txt_y 仮想画面Y座標(テキスト)
/* out:
/*   int        スプライト表示Y座標(表示範囲外のときは-16)
/*
func int spr_y(txt_y;int)
  int spr_y
  spr_y = (txt_y) * 8
  if (spr_y < -16) or (spr_y > 255) then {
    spr_y = -16
  }
  return(spr_y)
endfunc
/*
/* BG面・スプライト消去
/* in:
/*   なし
/* out:
/*   なし
/*
func erase_all()
  bg_fill(0, pat_dat(0, 0, 1, &H0))
  bg_fill(1, pat_dat(0, 0, 1, &H0))
  for i=0 to 127
    sp_set(i, 0, 0, pat_dat(0, 0, 1, 0))
  next
endfunc
/*
/* 仮想画面の指定座標のデータを取得する
/* in:
/*   int  x  仮想画面X座標
/*   int  y  仮想画面Y座標
/* out:
/*   char    指定座標の仮想画面データ
/*
func char vpeek(x;int, y;int)
  char data
  data = offscr(((y - 3) * C_BG_WIDTH) + x)
  return(data)
endfunc
/*
/* 英数字表示
/* in:
/*   char x      BG面のX座標(0～63)
/*   char y      BG面のY座標(0～63)
/*   str  value  表示する文字列
/* out:
/*   なし
/*
func bg_print(x;char, y;char, value;str)
  int p
  char data
  while value[p] <> 0
    data = 0
    /* 数値
    if value[p] >= '0' and value[p] <='9' then {
      data = value[p] - 16
    }
    /* 英字
    if value[p] >= 'A' and value[p] <= 'Z' then {
      data = value[p] - 64
    }
    /* 特殊文字
    if value[p] = '-' then {
      data = 42
    }
    if value[p] = '.' then {
      data = 46
    }
    if value[p] = '!' then {
      data = 97
    }
    bg_put(1, x + p, y, pat_dat(0, 0, 1, data))
    p = p +1
  endwhile
endfunc
/*
/* パターンデータ取得
/* in:
/*   char vr 垂直反転(0:通常、1:垂直反転)
/*   char hr 水平反転(0:通常、1:水平反転)
/*   char pb パレットブロック(1～15)
/*   char cd パターンコード(0～255)
/* out:
/*   int     パターンデータ
/*
func int pat_dat(vr;char, hr;char, pb;char, cd;char)
  return(vr*32768 + hr*16384 + pb*256 + cd)
endfunc
/*
/* スプライト定義(16x16)
/* No64～で定義
/*
func sprite_pattern()
  dim char c(255)
  /*
  /* マッピー右
  c={&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(64, c)
  /*
  /* マッピー左
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(65, c)
  /* マッピー正面
  c={&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(66, c)
  /*
  /* ミューキーズ右
  c={&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(70, c)
  /*
  /* ミューキーズ左
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(71, c)
  /*
  /* ニャームコ右
  c={&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(75, c)
  /*
  /* ニャームコ左
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(76, c)
endfunc
/*
/* バックグラウンドの設定
/* No0～255でキャラクターコードに対応する番号で定義
/*
func bg_pattern()
  dim char c(63)
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
  sp_def(0, c, 0)
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
  sp_def(1, c, 0)
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
  sp_def(2, c, 0)
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
  sp_def(3, c, 0)
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
  sp_def(4, c, 0)
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
  sp_def(5, c, 0)
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
  sp_def(6, c, 0)
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
  sp_def(7, c, 0)
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
  sp_def(8, c, 0)
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
  sp_def(9, c, 0)
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
  sp_def(10, c, 0)
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
  sp_def(11, c, 0)
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
  sp_def(12, c, 0)
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
  sp_def(13, c, 0)
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
  sp_def(14, c, 0)
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
  sp_def(15, c, 0)
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
  sp_def(16, c, 0)
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
  sp_def(17, c, 0)
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
  sp_def(18, c, 0)
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
  sp_def(19, c, 0)
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
  sp_def(20, c, 0)
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
  sp_def(21, c, 0)
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
  sp_def(22, c, 0)
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
  sp_def(23, c, 0)
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
  sp_def(24, c, 0)
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
  sp_def(25, c, 0)
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
  sp_def(26, c, 0)
  /* (パワードア左パーツ)
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
  }
  sp_def(30, c, 0)
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
  sp_def(32, c, 0)
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
  sp_def(33, c, 0)
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
  sp_def(34, c, 0)
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
  sp_def(35, c, 0)
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
  sp_def(36, c, 0)
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
  sp_def(37, c, 0)
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
  sp_def(38, c, 0)
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
  sp_def(39, c, 0)
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
  sp_def(40, c, 0)
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
  sp_def(41, c, 0)
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
  sp_def(42, c, 0)
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
  sp_def(46, c, 0)
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
  sp_def(52, c, 0)
  /* (ドア左の縦線)
  c={&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
  }
  sp_def(53, c, 0)
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
  sp_def(59, c, 0)
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
  sp_def(64, c, 0)
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
  sp_def(67, c, 0)
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
  sp_def(74, c, 0)
  /* ▲
  c={&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&H0
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_def(77, c, 0)
  /* ▲
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF
    ,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF
    ,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&HF
    ,&H0,&HF,&HF,&HF,&HF,&HF,&HF,&HF
    ,&HF,&HF,&HF,&HF,&HF,&HF,&HF,&HF
  }
  sp_def(78, c, 0)
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
  sp_def(82, c, 0)
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
  sp_def(84, c, 0)
  /* (パワードア右パーツ)
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
  }
  sp_def(94, c, 0)
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
  sp_def(97, c, 0)
  /* (ドア右の縦線)
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
  }
  sp_def(121, c, 0)
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
  sp_def(123, c, 0)
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
  sp_def(130, c, 0)
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
  sp_def(132, c, 0)
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
  sp_def(133, c, 0)
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
  sp_def(135, c, 0)
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
  sp_def(138, c, 0)
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
  sp_def(140, c, 0)
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
  sp_def(141, c, 0)
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
  sp_def(143, c, 0)
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
  sp_def(144, c, 0)
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
  sp_def(147, c, 0)
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
  sp_def(148, c, 0)
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
  sp_def(149, c, 0)
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
  sp_def(150, c, 0)
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
  sp_def(151, c, 0)
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
  sp_def(152, c, 0)
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
  sp_def(153, c, 0)
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
  sp_def(171, c, 0)
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
  sp_def(178, c, 0)
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
  sp_def(187, c, 0)
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
  sp_def(239, c, 0)
endfunc
/*
/* パレットの設定
/* とりあえずパレットブロック1だけ定義
/*
func sprite_pallet()
  sp_color(0,0,1)
  sp_color(1,21140,1)
  sp_color(2,32,1)
  sp_color(3,62,1)
  sp_color(4,1024,1)
  sp_color(5,1984,1)
  sp_color(6,1056,1)
  sp_color(7,2046,1)
  sp_color(8,32768,1)
  sp_color(9,63488,1)
  sp_color(10,32800,1)
  sp_color(11,63550,1)
  sp_color(12,33792,1)
  sp_color(13,65472,1)
  sp_color(14,44394,1)
  sp_color(15,65534,1)
endfunc
