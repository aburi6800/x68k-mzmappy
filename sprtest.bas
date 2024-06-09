/*
/* MZ-MAPPY PRO68K
/*
/* Programmed 2024 by ABURI6800 (Hitoshi Iwai)
/* 
/* MIT License.
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
int C_GAME_STATUS_INIT = 0
int C_GAME_STATUS_TITLE = 1
int C_GAME_STATUS_OPENING = 2
int C_GAME_STATUS_ROUNDINIT = 3
int C_GAME_STATUS_START = 4
int C_GAME_STATUS_MAIN = 5
int C_GAME_STATUS_CLEAR = 6
int C_GAME_STATUS_MISS = 7
int C_GAME_STATUS_OVER = 8
int C_GAME_STATUS_QUIT = -1
dim char title_chr(32 * 6)
/*             0                                       1                                       2                                       3
/*             0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1
title_chr = {  0, 67, 67, 77, 78, 67, 67,   0,  0, 78, 67, 67, 77,  0,   0, 67, 67, 67, 67, 77,   0, 67, 67, 67, 67, 77,   0, 67, 67,  0, 67, 67
            ,114,112, 66, 86,112,115, 67,   0,118,112,112, 66, 67, 77, 114,112,112,112, 66, 67, 114,112,112,112, 66, 67, 114,115, 67,114,115, 67
            ,113,  0,  0,  0,  0, 61, 67, 118,  0, 59,123,  0, 66, 67, 113,  0, 67,  0, 61, 67, 113,  0, 67,  0, 61, 67, 113, 61, 67,113, 61, 67
            ,113,  0,  0,  0,  0, 61, 67, 113,  0, 59,123,  0, 61, 67, 113,  0, 67,  0, 61, 86, 113,  0, 67,  0, 61, 86, 113,  0,  0,  0, 61, 67
            ,113, 61, 77,118,113, 61, 67, 113,  0,  0,  0,  0, 61, 67, 113,  0,  0,  0,118,  0, 113,  0,  0,  0,118,  0, 113,  0,  0,  0, 61, 67
            , 50, 51,  0,  0, 50, 51,  0,  50, 51,112,112, 50, 51,  0,  50, 51,112,112,  0,  0,  50, 51,112,112,  0,  0, 112,112,112, 50, 51,  0
          }
dim char dr_chr(5, 11)  /* ドアのキャラクターパターン
dr_chr = {114,115,  0,  0  /* (0, 0〜11) オープン・左
         , 55, 61,  0,  0
         , 50, 51,  0,  0
         ,  0,  0,114,115  /* (1, 0〜11) オープン・右
         ,  0,  0,113, 63
         ,  0,  0, 50, 51
         ,  0, 53,121,  0  /* (2, 0〜11) 通常ドアクローズ・左
         ,  0,123,121,  0
         ,  0, 53,121,  0
         ,  0, 53,121,  0  /* (3, 0〜11) 通常ドアクローズ・右
         ,  0, 53, 59,  0
         ,  0, 53,121,  0
         ,  0, 30, 94,  0  /* (4, 0〜11) パワードアクローズ・左
         ,  0, 82, 94,  0
         ,  0, 30, 94,  0
         ,  0, 30, 94,  0  /* (5, 0〜11) パワードアクローズ・右
         ,  0, 30, 84,  0
         ,  0, 30, 94,  0
}
/* 変数
int i, j
int tick
int trg
int stk
dim char offscr(54*29)  /* オフスクリーン
int game_status = 0     /* ゲーム状態
int round = 0           /* ラウンド数
int score = 0           /* スコア
int hiscore = 20000     /* ハイスコア
int mp_left = 0         /* 残機数
int st = 0              /* スティック入力値
int tr_f = 0            /* トリガ入力フラグ(1=入力あり、0=なし)
int bg_x = 0            /* BG面の表示位置
/* マッピー
int mp_x = 48           /* マッピーX座標
int mp_y = 28           /* マッピーY座標
int mp_vx = 0           /* マッピーX移動量
int mp_vy = 0           /* マッピーY移動量
int mp_cd = 0           /* マッピーの向き(0=左、1=右)
int mp_cond = 0         /* マッピーの状態
/* 敵
int en_type(8)          /* 敵の種類(1=ミューキーズ,2=ニャームコ,3=ご先祖様)
int en_x(8)             /* 敵X座標
int en_y(8)             /* 敵Y座標
int en_cp(8)            /* 敵キャラクターパターン番号
int en_cond(8)          /* 敵の状態
/* トランポリン
int tp_x(8)             /* トランポリンX座標
int tp_y(8)             /* トランポリンY座標
int tp_h(8)             /* トランポリン耐久度
int tp_cond(8)          /* トランポリンの状態
/* ドア
int dr_x(10)            /* ドアX座標
int dr_y(10)            /* ドアY座標
int dr_dir(10)          /* ドアの種類(0=左ノブ、1=右ノブ)
int dr_cond(10)         /* ドアの状態(0=オープン、1=通常ドアクローズ、2=パワードアクローズ)
int dr_n                /* 操作対象ドア
/* 盗品
int it_x(9)             /* 盗品のX座標
int it_y(9)             /* 盗品のY座標
int it_cond(9)          /* 盗品の状態(0=取得済、1=通常、2=2倍)
int it_type(9)          /* 盗品の種類(1=カセット、2=テレビ、3＝マイコン、4=モナリサ、5=キンコ．)
/*
/* メインルーチン
/*
while game_status <> C_GAME_STATUS_QUIT
  switch game_status
    case 0 : game_init()      : break
    case 1 : game_title()     : break
    case 2 : game_opening()   : break
    case 3 : game_roundinit() : break
    case 4 : game_start()     : break
    case 5 : game_main()      : break
/*    case 6 : game_clear()     : break
/*    case 7 : game_miss()      : break
/*    case 8 : game_over()      : break
    default : break
  endswitch
endwhile
/* 終了処理
m_stop()
erase_all()
screen 2,0,1,0
end
/*
/* 操作入力
/*
func get_control()
  str ky
  ky = inkey$(0)
/*  if (ky >= "0" and ky <= "9") then {
/*    stk = val(ky)
/*  } else {
    stk = stick(1)
/*  }
  trg = strig(1)
/*  if (ky = " ") then {
/*    trg = 1
/*  }
  /* 終了チェック
/*  if (ky = chr$(27) and game_status = C_GAME_STATUS_TITLE) then {
  if (ky = chr$(27)) then {
      game_status = C_GAME_STATUS_QUIT
  }
endfunc
/*
/* ゲーム初期化
/*
func game_init()
  /* 設定初期化
  round = 1
  score = 0
  mp_left = 2
  /* サウンド初期化
  m_init()
  /* トラックシーケンスメモリ確保
  m_alloc(1, 100)
  m_alloc(2, 200)
  m_alloc(3, 1000)
  m_alloc(4, 100)
  m_alloc(5, 100)
  m_alloc(6, 100)
  /* trk1 : メインループウェイト用
  m_trk(1, "@1t180@l2o1v0rrrrrr")
  /* trk2 : オープニング
  m_trk(2, "@31t160l16o3v13f#8ga8f# g8ab8g a8b<c8>a b8<cd8>b <c8de8c d8ef#8a b8.a8ba8ba8br2")
  /* trk3 : メインBGM
  m_trk(3, "@31t180l8o4v13")
  m_trk(3, "|:c#ag#aa#4a4gagdg4.r")
  m_trk(3, "gf#ga4g4fgfdc4.r")
  m_trk(3, ">a<edc>a<edcr")
  m_trk(3, "agcfe16r16d16r16c16r16:|")
  m_trk(3, "|:5>a<ce:||:5>gb<d:|")
  m_trk(3, "l16>a.<cd8>b.<de8c.ef#8d.f#g8e.ga8f#.ab8")
  m_trk(3, "<c.>b<c>b<c>b<c>l8")
  m_trk(3, "|:c#ag#aa#4a4gagdg4.r")
  m_trk(3, "gf#ga4g4fgfdc4.r")
  m_trk(3, ">a<edc>a<edcr")
  m_trk(3, "agcfe16r16d16r16c16r16:|")
  m_trk(3, "agaa#agac<edc>g4.r gf#gagabr<c>bgara#r")
  m_trk(3, "agaa#agarf#g<ce16.d16e16.dd16c16d16r16")
  m_trk(3, "f#.d16.c16.d16.>b16.f#16.g16.a16.g16.agf#edg16.rg16.r")
  /* trk4 : エクステンド
  m_trk(4, "@31t180l8o5v13dc16>af#16<c#.d#.f2.")
  /* trk5 : ラウンドクリア
  m_trk(5, "@31t180l8o4v13ga16bg16er16dr.f#r16gr")
  /* trk6 : ミス
  m_trk(6, "@31t180l8o4v13e<c16>a#g16<c#c16>a#g16d#4&d#16dr2")
  /* ゲーム状態を変更
  game_status = C_GAME_STATUS_TITLE /* タイトル
endfunc
/*
/* タイトル
/*
func game_title()
  int i, j
  str s
  /* 画面消す
  erase_all()
  bg_set(0, 0, 0)
  bg_set(1, 1, 0)
  for i = 0 to 5
    for j = 0 to 31
      bg_put(1, j, 2 + i, pat_dat(0, 0, 1, title_chr(i * 32 + j)))
    next
  next
  s = "PUSH TRIGGER TO START !!"
  bg_print( 4, 12, s)
  s = "1ST EXTEND 20000PT"
  bg_print( 7, 15, s)
  s = "2ND EXTEND 70000PT"
  bg_print( 7, 18, s)
  s = "(C)NAMCO"
  bg_print(12, 22, s)
  s = "PROGRAM ARRANGED BY DEMPA"
  bg_print( 0, 26, s)
  s = "AND GAME ROMAN"
  bg_print(18, 27, s)
  s = "REPROGRAMMED BY ABURI GAMES 2024"
  bg_print( 0, 29, s)
  bg_set(0, 0, 1)
  bg_set(1, 1, 1)
  while trg = 0
    get_control()
    if (game_status = C_GAME_STATUS_QUIT) then {
      return()
    }
  endwhile
  /* ゲーム状態を変更
  game_status = C_GAME_STATUS_OPENING /* ゲームオープニング
endfunc
/*
/* ゲームオープニング
/*
func game_opening()
  str s
  erase_all()
  bg_set(0, 0, 0)
  bg_set(1, 1, 0)
  for i =0 to 31
    bg_put(1, i, 30, pat_dat(0, 0, 1, &H4A))
    bg_put(1, i, 31, pat_dat(0, 0, 1, &H4A))
  next
  s = "NOW ON GO TO THE STORY!"
  bg_print(4, 9, s)
  bg_set(0, 0, 1)
  bg_set(1, 1, 1)
  sp_move(1, spr_x(6),  spr_y(28), 75) /* ニャームコ左
  sp_move(2, spr_x(10), spr_y(28), 70) /* ミューキーズ左
  sp_move(3, spr_x(13), spr_y(28), 70) /* ミューキーズ左
  sp_move(4, spr_x(16), spr_y(28), 70) /* ミューキーズ左
  sp_move(5, spr_x(24), spr_y(28), 64) /* マッピー
  /* オープニング曲
  m_assign(1, 2) /* ch1 : trk2(オープニング)
  m_play(1)
  while m_stat(1) = 1
  endwhile
  /* ゲーム状態を変更
  game_status = C_GAME_STATUS_ROUNDINIT /* ラウンド初期化
endfunc
/*
/* ラウンド初期化
/*
func game_roundinit()
  /* ラウンドデータ設定
  switch round
    case 1 : game_roundinit_1() : break
    default : break
  endswitch
  /* ゲーム状態を変更
  game_status = C_GAME_STATUS_START /* ラウンドスタート
endfunc
/*
/* ラウンド1
/*
func game_roundinit_1()
  /*              1               2               3               4               5               6               7               8               9               A               B               C               D               E  
  /*23456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDE
  /*          0                                       1                                       2                                       3                                       4                                       5
  /*          0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   0   1   2   3
  offscr = {  0,  0,  0, 78, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 77,  0,  0,  0
           ,  0,  0, 78, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 77,  0,  0
           ,  0, 78, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 77,  0
           , 78, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 77
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64,239,239,239,239,239,239,239,239,239,239,239,239,239,239, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 64, 64, 67,  0
           ,  0, 67, 52, 52, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 52, 52, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 52, 52, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 52, 52, 67,  0
           ,  0, 67, 64, 64, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 64, 64, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 64, 64, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 64, 64, 67,  0
  }
  /* トランポリン
  tp_x(0) = 2
  tp_y(0) = 30
  tp_x(1) = 18
  tp_y(1) = 30
  tp_x(2) = 34
  tp_y(2) = 30
  tp_x(3) = 50
  tp_y(3) = 30
  /* ドア
  dr_x(0) = 10
  dr_y(0) = 7
  dr_dir(0) = 1   /* 右
  dr_cond(0) = 1  /* 通常ドアクローズ
  dr_x(1) = 42
  dr_y(1) = 7
  dr_dir(1) = 0   /* 左
  dr_cond(1) = 2  /* パワードアクローズ
  /*
  dr_x(2) = 10
  dr_y(2) = 11
  dr_dir(2) = 1   /* 右
  dr_cond(2) = 2  /* パワードアクローズ
  dr_x(3) = 26
  dr_y(3) = 11
  dr_dir(3) = 1   /* 右
  dr_cond(3) = 1  /* 通常ドアクローズ
  /*
  dr_x(4) = 42
  dr_y(4) = 15
  dr_dir(4) = 0   /* 左
  dr_cond(4) = 1  /* 通常ドアクローズ
  /*
  dr_x(5) = 10
  dr_y(5) = 19
  dr_dir(5) = 1   /* 右
  dr_cond(5) = 1  /* 通常ドアクローズ
  dr_x(6) = 26
  dr_y(6) = 19
  dr_dir(6) = 0   /* 左
  dr_cond(6) = 0  /* オープン
  /*
  dr_x(7) = 42
  dr_y(7) = 23
  dr_dir(7) = 0   /* 左
  dr_cond(7) = 2  /* パワードアクローズ
  /*
  dr_x(8) = 10
  dr_y(8) = 27
  dr_dir(8) = 1   /* 右
  dr_cond(8) = 2  /* パワードアクローズ
  dr_x(9) = 26
  dr_y(9) = 27
  dr_dir(9) = 0   /* 左
  dr_cond(9) = 1  /* 通常ドアクローズ
  /* 盗品
  it_type(0) = 1  /* カセット
  it_cond(0) = 1  /* 通常
  it_x(0) = 45
  it_y(0) = 8
  it_type(1) = 1  /* カセット
  it_cond(1) = 1  /* 通常
  it_x(1) = 22
  it_y(1) = 20
  it_type(2) = 2  /* テレビ
  it_cond(2) = 1  /* 通常
  it_x(2) = 28
  it_y(2) = 16
  it_type(3) = 2  /* テレビ
  it_cond(3) = 1  /* 通常
  it_x(3) = 39
  it_y(3) = 28
  it_type(4) = 3  /* マイコン
  it_cond(4) = 1  /* 通常
  it_x(4) = 8
  it_y(4) = 8
  it_type(5) = 3  /* マイコン
  it_cond(5) = 1  /* 通常
  it_x(5) = 30
  it_y(5) = 28
  it_type(6) = 4  /* モナリサ
  it_cond(6) = 1  /* 通常
  it_x(6) = 21
  it_y(6) = 12
  it_type(7) = 4  /* モナリサ
  it_cond(7) = 1  /* 通常
  it_x(7) = 6
  it_y(7) = 28
  it_type(8) = 5  /* キンコ．
  it_cond(8) = 1  /* 通常
  it_x(8) = 6
  it_y(8) = 16
  it_type(9) = 5  /* キンコ．
  it_cond(9) = 1  /* 通常
  it_x(9) = 46
  it_y(9) = 16
endfunc
/*
/* ラウンドスタート
/*
func game_start()
  str s
  /* マッピー
  mp_x = 48   /* マッピーX座標
  mp_y = 28   /* マッピーY座標
  mp_vx = 0   /* マッピーX移動量
  mp_vy = 0   /* マッピーY移動量
  mp_cd = 1   /* マッピーキャラクターパターン番号
  mp_cond = 0 /* マッピーの状態
  /* 敵配置
  en_type(0) = 2  /* ニャームコ
  en_x(0) = 37
  en_y(0) = 12
  en_cp(0) = 0    /* 左
  en_cond(0) = 0
  /*
  en_type(1) = 1  /* ミューキーズ
  en_x(1) = 10
  en_y(1) = 16
  en_cp(1) = 1    /* 右
  en_cond(1) = 0
  /* 画面消す
  erase_all()
  /* 画面描画
  bg_set(0, 0, 0)
  bg_set(1, 1, 0)
  /*   BG#1に屋敷描画
  for i = 0 to 28
    for j = 0 to 53
      bg_put(1, j, i+3, pat_dat(0, 0, 1, offscr(i*54 + j)))
    next
  next
  /*   BG#1にトランポリン描画
  for i = 0 to 8
    if tp_x(i) > 0 then {
      tp_h(0) = 3
      tp_cond(0) = 0
      bg_put(1, tp_x(i)    , tp_y(i), pat_dat(0, 0, 1, &H34))
      bg_put(1, tp_x(i) + 1, tp_y(i), pat_dat(0, 0, 1, &H34))
    }
  next
  /*   BG#1にドア描画
  for i = 0 to 10
    if dr_x(i) > 0 then {
      draw_door(i)
    }
  next
  /*   BG#0にスコアなどを描画
  s = "1UP"
  bg_print(5, 0, s)
  s = "HI-SCORE"
  bg_print(11, 0, s)
  s = "MP"
  bg_print(22, 0, s)
  s = "R"
  bg_print(27, 0, s)
  s = "0"
  bg_print(9, 1, s)
  s = "20000"
  bg_print(14, 1, s)
  s = "1"
  bg_print(23, 1, s)
  s = "1"
  bg_print(27, 1, s)
  /* BG初期位置セット
  bg_x = 22
  bg_scroll(1, bg_x * 8, 0)
  bg_set(0, 0, 1)
  bg_set(1, 1, 1)
  /* サウンド設定
  m_stop()
  m_assign(8, 1) /* ch8 : trk1(メインループウェイト用)
  m_assign(1, 3) /* ch1 : trk3(メインBGM)
  /* 経過時間リセット
  tick = 0
  /* ゲーム状態を変更
  game_status = C_GAME_STATUS_MAIN /* ラウンドスタート
endfunc
/*
/* メインルーチン
/*
func game_main()
  if (m_stat(1) = 0) then {
    m_play(1) /* メインBGM演奏
  }
  m_play(8)  /* ウェイト用の音符を鳴らす
  get_control()
  move_mappy()
  move_enemy()
  draw_item()
  /* BG#1スクロール
  if mp_x - bg_x < C_DISP_WIDTH / 2 and bg_x > 0 then {
    bg_x = bg_x - 1
  }
  if mp_x - bg_x > C_DISP_WIDTH / 2 and bg_x < (C_BG_WIDTH - C_DISP_WIDTH) then {
    bg_x = bg_x + 1
  }
  bg_scroll(1, bg_x * 8, 0)
  /* ウェイト
  while m_stat(8) = 1
  endwhile
  /* 経過時間加算
  tick = tick + 1
endfunc
/*
/* マッピー移動
/*
func move_mappy()
  switch mp_cond
    case 0 : move_mappy_floor() : break
    case 1 : move_mappy_toupdown() : break
    case 2 : move_mappy_updown() : break
    case 3 : move_mappy_tofloor() : break
    default : break
  endswitch
  /* 座標変更
  mp_x = mp_x + mp_vx
  mp_y = mp_y + mp_vy
  if mp_x < 0 then mp_x = 0
  if mp_x > C_BG_WIDTH - 2 then mp_x = C_BG_WIDTH - 2
  /* キャラクタ表示
  sp_move(0, spr_x(mp_x), spr_y(mp_y), mp_cd + 64)
endfunc
/*
/* マッピー床移動
/*
func move_mappy_floor()
  int vdata
/*
  mp_vy = 0
  mp_vx = 0
  if (stk = 4) then {
    /* 左入力
    mp_cd = 0
    mp_vx = - 1
    /* BG判定
    vdata = vpeek(mp_x - 1, mp_y + 1)
    if (vdata = 64) then {
      mp_vy = - 1
      mp_cond = 1 /* トランポリンに乗る
    } else if (vdata <> 0) then {
      mp_vx = 0
    }
  } else if (stk = 6) then {
    /* 右入力
    mp_cd = 1
    mp_vx = 1
    /* BG判定
    vdata = vpeek(mp_x + 2, mp_y + 1)
    if (vdata = 64) then {
      mp_vy = - 1
      mp_cond = 1 /* トランポリンに乗る
    } else if (vdata <> 0) then {
      mp_vx = 0
    }
  }
  if (trg > 0) then {
    if (tr_f = 0) then {
      tr_f = 1
      /* 操作対象ドア検索
      dr_n = search_door(mp_x, mp_y, mp_cd)
      if dr_n <> 255 then {
        if (dr_cond(dr_n) = 0) then {
          /* ドアクローズ
          dr_cond(dr_n) = 1
          /* マッピーがドアにかかっているか
          if (dr_dir(dr_n) <> mp_cd) then {
            if (iabs((dr_x(dr_n) + 1) - mp_x) < 3) then {
              mp_vx = 0
              if (mp_cd = 0) then {
                mp_x = mp_x - 4
              } else {
                mp_x = mp_x + 4
              }
            }
          } else {
            if (iabs((dr_x(dr_n) + 1) - (mp_x + 2 - (mp_cd * 4))) < 4) then {
              mp_vx = 0
              if (mp_cd = 0) then {
                mp_x = mp_x + 4
              } else {
                mp_x = mp_x - 4
              }
            }
          }
        } else {
          /* ドアオープン
          if (dr_cond(dr_n) = 1) then {
            /* 通常ドアオープン
            dr_cond(dr_n) = 0
          } else {
            /* パワードアオープン
            dr_cond(dr_n) = 0
            /* マイクロウェーブ発生
          }
          /* マッピーがドアにかかっているか
          if (iabs((dr_x(dr_n) + 1) - mp_x) < 3) and (dr_dir(dr_n) <> mp_cd) then {
            mp_vx = 0
            if (mp_cd = 0) then {
              mp_x = mp_x + 4
            } else {
              mp_x = mp_x - 4
            }
          }
        }
        draw_door(dr_n)
      }
    }
  } else {
    tr_f = 0
  }
endfunc
/*
/* マッピー上下移動移行
/*
func move_mappy_toupdown()
  mp_vy = 1
  mp_cd = 2
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
    if (stk = 4) then {
      /* 左入力
      if vpeek(mp_x - 1, mp_y + 1) = 0 then {
        mp_cond = 3
        mp_cd = 0
        mp_vx = -1
        mp_vy = - 1
      } else {
        mp_vy = 1
      }
    } else if (stk = 6) then {
      /* 右入力
      if vpeek(mp_x + 2, mp_y + 1) = 0 then {
        mp_cond = 3
        mp_cd = 1
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
/*  if mp_vx = -1 then {
/*    mp_cd = 0
/*  } else {
/*    mp_cd = 1
/*  }
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
  sp_move(10 + num, spr_x(en_x(num)), spr_y(en_y(num)), 75 + en_cp(num))
endfunc
/*
/* ミューキーズ移動
/*
func move_myukies(num;int)
  /* 固定で置いておく
  sp_move(10 + num, spr_x(en_x(num)), spr_y(en_y(num)), 70 + en_cp(num))
endfunc
/*
/* アイテム表示
/*
func draw_item()
  int i, j
  for i = 0 to 9
    /* 取得チェック
    if (it_cond(i) > 0) then {
      if (it_x(i) = mp_x and it_y(i) = mp_y) then {
        /* スコア加算
        score = score + (it_type(i) * 100 * it_cond(i))
        /* 取ったアイテムは取得済にする
        it_cond(i) = 0
        /* 一旦すべての2倍状態をキャンセルする
        for j = 0 to 9
          if (it_cond(j) > 0) then {
            it_cond(j) = 1
          }
        next
        /* 取ったアイテムと同じものがまだ残っている場合は、2倍状態にする
        if (i > 0) then {
          if (it_type(i - 1) = it_type(i) and it_cond(i - 1) > 0) then {
            it_cond(i - 1) = 2
          }
        }
        if (i < 9) then {
          if (it_type(i + 1) = it_type(i) and it_cond(i + 1) > 0) then {
            it_cond(i + 1) = 2
          }
        }
      }
      /* 表示
      if (it_cond(i) = 1) then {
        sp_move(30 + i, spr_x(it_x(i)), spr_y(it_y(i)), 90 + it_type(i) - 1)
      } else if (it_cond(i) = 2) then {
        if (tick mod 2 = 0) then {
          sp_move(30 + i, spr_x(it_x(i)), spr_y(it_y(i)), 90 + it_type(i) - 1)
        } else {
          sp_move(30 + i, spr_x(it_x(i)), spr_y(it_y(i)), 95)
        }
      }
    } else {
      sp_move(30 + i, -16, -16, 90 + it_type(i) - 1)
    }
  next
endfunc
/*
/* 操作対象ドア検索
/* in:
/*    int   x         キャラクターX座標
/*    int   y         キャラクターY座標
/*    int   d         キャラクターの向き(0=左、1=右)
/* out:
/*   int   操作対象ドアの配列番号(存在しない時は255)
/*
func int search_door(x;int, y;int, d;int)
  int i
  int door_n = 255
  int dist = 255
  int w_dist
  for i = 0 to 10 /* すべてのドアについて比較する
    if dr_y(i) = y - 1 then {
      w_dist = 255
      if (d = 0 and dr_dir(i) = 0 and dr_x(i) < x + 1) then w_dist = x + 1 - dr_x(i)
      if (d = 1 and dr_dir(i) = 0 and dr_x(i) > x - 1) then w_dist = dr_x(i) - x - 1
      if (d = 0 and dr_dir(i) = 1 and dr_x(i) < x - 1) then w_dist = x - 1 - dr_x(i)
      if (d = 1 and dr_dir(i) = 1 and dr_x(i) > x - 3) then w_dist = dr_x(i) - x - 3
      if (dist > w_dist) then {
        dist = abs(dr_x(i) - x)
        door_n = i
      }
    }
  next
  return(door_n)
endfunc
/*
/* ドア描画
/* in:
/*    int   dr_n      ドアの要素番号
/*
func draw_door(dr_n;int)
  int ix, iy, i, j
  /* パターン設定
  ix = (dr_cond(dr_n) * 2) + dr_dir(dr_n)
  /* 描画
  iy = 0
  for i = 0 to 2
    for j = 0 to 3 
      bg_put(1, dr_x(dr_n) + j, dr_y(dr_n) + i, pat_dat(0, 0, 1, dr_chr(ix, iy)))
      iy = iy + 1
    next 
  next
  /* 仮想画面への情報更新
  if (dr_cond(dr_n) = 0) then {
    /* dr_cond = 0 の時は開きドアなので仮想画面にゼロを設定
    vpoke(dr_x(dr_n) + 1, dr_y(dr_n) + 2, 0)
    vpoke(dr_x(dr_n) + 2, dr_y(dr_n) + 2, 0)
  } else {
    /* dr_cond = 1, 2 の時は閉じドアなので仮想画面に壁と同じ情報を設定
    vpoke(dr_x(dr_n) + 1, dr_y(dr_n) + 2, 67)
    vpoke(dr_x(dr_n) + 2, dr_y(dr_n) + 2, 67)
  }
endfunc
/*
/* 仮想画面X座標からスプライト表示X座標を取得
/* in:
/*    int   txt_x     仮想画面X座標(テキスト)
/* out:
/*    int   スプライト表示X座標(表示範囲外のときは-16)
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
/*    int   txt_y     仮想画面Y座標(テキスト)
/* out:
/*    int   スプライト表示Y座標(表示範囲外のときは-16)
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
/*    なし
/* out:
/*    なし
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
/*    int   x         仮想画面X座標
/*    int   y         仮想画面Y座標
/* out:
/*    char  指定座標の仮想画面データ
/*
func char vpeek(x;int, y;int)
  char data
  data = offscr(((y - 3) * C_BG_WIDTH) + x)
  return(data)
endfunc
/*
/* 仮想画面の指定座標にデータを設定する
/* in:
/*    int   x         仮想画面X座標
/*    int   y         仮想画面Y座標
/*    int   data      書き込むデータ
/* out:
/*    なし
/*
func char vpoke(x;int, y;int, data;int)
  offscr(((y - 3) * C_BG_WIDTH) + x) = data
endfunc
/* 絶対値算出(int型)
/* in:
/*    int   v         値
/* out:
/*    int   値の絶対値
func int iabs(v;int)
  if (v < 0) then {
    v = v * -1
  }
  return(v)
endfunc
/*
/* 英数字表示
/* in:
/*    char  x         BG面のX座標(0〜63)
/*    char  y         BG面のY座標(0〜63)
/*    str   value     表示する文字列
/* out:
/*    なし
/*
func bg_print(x;char, y;char, value;str)
  int p = 0
  char data
  char v
  while asc(mid$(value, p+1, 1)) <> 0
    data = 0
    v = asc(mid$(value, p+1, 1))
    /* 数値
    if (v >= '0' and v <= '9') then {
      data = v - 16
    }
    /* 英字
    if (v >= 'A' and v <= 'Z') then {
      data = v - 64
    }
    /* 特殊文字
    if v = '-' then {
      data = 42
    }
    if v = '.' then {
      data = 46
    }
    if v = '!' then {
      data = 97
    }
    if v = '(' then {
      data = 104
    }
    if v = ')' then {
      data = 105
    }
    bg_put(0, x + p, y, pat_dat(0, 0, 1, data))
    p = p + 1
  endwhile
endfunc
/*
/* パターンデータ取得
/* in:
/*    char  vr        垂直反転(0:通常、1:垂直反転)
/*    char  hr        水平反転(0:通常、1:水平反転)
/*    char  pb        パレットブロック(1〜15)
/*    char  cd        パターンコード(0〜255)
/* out:
/*    int   パターンデータ
/*
func int pat_dat(vr;char, hr;char, pb;char, cd;char)
  return(vr*32768 + hr*16384 + pb*256 + cd)
endfunc
/*
/* スプライト定義(16x16)
/* No64〜で定義
/*
func sprite_pattern()
  dim char c(255)
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
  sp_def(64, c)
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
  sp_def(70, c)
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
  sp_def(71, c)
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
  sp_def(75, c)
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
  sp_def(76, c)
  /*
  /* カセット
  c={&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&HF,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(90, c)
  /*
  /* テレビ
  c={&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(91, c)
  /*
  /* マイコン
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(92, c)
  /*
  /* モナリサ
  c={&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&HF,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(93, c)
  /*
  /* キンコ．
  c={&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0
    ,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
  }
  sp_def(94, c)
  /*
  /* ？？？？
  c={&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0,&H0,&HF,&HF,&HF,&HF,&HF,&H0,&H0
    ,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0
    ,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&HF,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&HF,&H0,&H0,&H0,&H0
    ,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0,&H0
    }
  sp_def(95, c)
endfunc
/*
/* バックグラウンドの設定
/* No0〜255でキャラクターコードに対応する番号で定義
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
  sp_def(50, c, 0)
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
  sp_def(51, c, 0)
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
  sp_def(53, c, 0)
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
  sp_def(55, c, 0)
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
  sp_def(60, c, 0)
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
  sp_def(61, c, 0)
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
  sp_def(63, c, 0)
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
  sp_def(66, c, 0)
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
  sp_def(77, c, 0)
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
  sp_def(86, c, 0)
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
  sp_def(104, c, 0)
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
  sp_def(105, c, 0)
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
  sp_def(112, c, 0)
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
  sp_def(113, c, 0)
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
  sp_def(114, c, 0)
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
  sp_def(115, c, 0)
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
  sp_def(118, c, 0)
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
  sp_def(119, c, 0)
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