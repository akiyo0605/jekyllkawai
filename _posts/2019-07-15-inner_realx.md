``` {.ruby}
#!/usr/bin/env ruby 

[kawai@asura0 bin]$ cat inner_relax

require 'fileutils'
require 'scanf'
def adjust_poscar(poscar, xdiv, ydiv)
  conts = File.readlines(poscar)
  p xlength = conts[2].scanf("%f %f %f")
  p conts[2].gsub!(xlength[0].to_s, (xlength[0]*(1.0+xdiv.to_f/100.0)).to_s)
  p ylength = conts[3].scanf("%f %f %f")
  p conts[3].gsub!(ylength[1].to_s, (ylength[1]*(1.0+ydiv.to_f/100.0)).to_s)
  File.write 'POSCAR_tmp', conts.join
end

```

line: result

5: 基本的なファイル操作を集めたモジュールです。

8: 全ての行が読み込まれ、配列として返される。

10:
文字列の中で正規表現のパターンにマッチした部分をすべて指定の文字列に置換します。

    p templates_dir = File.join(ENV['HOME'],'bin','vasp_templates_new')
    p xdivs = (ARGV[0] || '0').split(' ')
    p ydivs = (ARGV[1] || '0').split(' ')
    xdivs.each do |xdiv|
      ydivs.each do |ydiv|
        p dir = 'inner_relax_'+xdiv+'_'+ydiv
        FileUtils.rm_r(dir, force: true)
        FileUtils.mkdir(dir)
        adjust_poscar('POSCAR', xdiv, ydiv)
        FileUtils.cp('POSCAR_tmp', File.join(dir,'POSCAR'), verbose: true)
        files = Dir.glob(File.join(templates_dir,'*'))
        files.each do |file|
          FileUtils.cp(file, dir, verbose: true)
        end
      end
    end

\[line: result\]

1: "/home/kawai/bin/vasp~templatesnew~" に結合される

2: \["0"\]

3: \["0"\]

6: "inner~relax00~"

7: 真のときは削除中に発生した StandardError を無視します。

10: cp POSCAR~tmp~ inner~relax00~/POSCAR

verbose: true すべての警告を出力する

memo for kawai ikeda
====================

数値まで出す slab medel 欠陥エネルギー定義 al,cuの流会

\[kawai@asura0 inner~relax00~\]\$ auto~submit~ inner~relax00~/
*home/kawai*.vasp~submitjobs~.txt inner~relax00~/ "run~relax1st~.sh"
Your job 13224 ("test") has been submitted

\#&lt;MatchData "Your job 13224" 1:"13224"&gt; "13224"
"run~relax2nd~.sh" Your job 13225 ("test") has been submitted

\#&lt;MatchData "Your job 13225" 1:"13225"&gt; "13225" "run~fix50~.sh"
Your job 13226 ("test") has been submitted

\#&lt;MatchData "Your job 13226" 1:"13226"&gt; "13226" "run~fix100~.sh"
Your job 13227 ("test") has been submitted

\#&lt;MatchData "Your job 13227" 1:"13227"&gt; "13227"

粒界エネルギー
==============

配位数が減る不安定な状態になり，その分だけエネルギー が上昇する.
つまり，粒界が存在する物質は，粒界が存在しない物質よりもエネルギーが
高くなる. そのエネルギーの差のことを粒界エネルギーと呼ぶ.

slab
====

第一原理計算で単純な表面エネルギーを求めるのは容易である.完全結晶の上下に真空層を置き，
ある方位を持った表面を2枚作る.
これは，周期的境界条件を課した時，厚板のような 形状となることから slab
モデルと呼ばれる. そのような系のエネルギーと，原子数をそろえた
完全結晶のそれとの差から表面積で割れば，
表面エネルギーが算出できる.

memo
====

下にあるdocs boundary introの中にotsukiの論文
第３節の小駅海面　snすず，ティン
アルミと鈴の小駅海面エネルギーを使ってる　それがどのくらいの影響か
それを読んでわからないところをまとめる． snを1個入れて計算

課題
====

3315の計算

boundary/docs/introの中にある大槻さんの３章の論文を読んで
粒界エネルギーを理解する

-   アルミと鈴の固一液界面エネルギーを使ってそれがどれくらいの影響なのか？
-   それを読んでわからないところをピックアップ
-   できたらsnを1個入れて計算する

-sn zn（すず，ティン） eam~analysisを入れる~

O32コピーして読む jekyll

inner~relax~ '-15 -17 -19' '0'
==============================

\[kawai@asura0 3315\]\$ inner~relax~ '-15 -17 -19' '0'
"/home/kawai/bin/vasp~templatesnew~" \["-15", "-17", "-19"\] \["0"\]
"inner~relax-150~" \[19.8145937137, 0.0, 0.0\] " 16.842404656644998
0.0000000000 0.0000000000\n" \[0.0, 10.3035887311, 0.0\] " 0.0000000000
10.3035887311 0.0000000000\n" cp POSCAR~tmp~ inner~relax-150~/POSCAR cp
/home/kawai/bin/vasp~templatesnew~/KPOINTS~50~ inner~relax-150~ cp
/home/kawai/bin/vasp~templatesnew~/INCAR~relax~ inner~relax-150~ cp
/home/kawai/bin/vasp~templatesnew~/run~fix100~.sh inner~relax-150~ cp
/home/kawai/bin/vasp~templatesnew~/POTCAR inner~relax-150~ cp
/home/kawai/bin/vasp~templatesnew~/run~relax2nd~.sh inner~relax-150~ cp
/home/kawai/bin/vasp~templatesnew~/run~fix50~.sh inner~relax-150~ cp
/home/kawai/bin/vasp~templatesnew~/run~relax1st~.sh inner~relax-150~ cp
/home/kawai/bin/vasp~templatesnew~/KPOINTS~100~ inner~relax-150~ cp
/home/kawai/bin/vasp~templatesnew~/INCAR~fix~ inner~relax-150~
"inner~relax-170~" \[19.8145937137, 0.0, 0.0\] " 16.446112782371
0.0000000000 0.0000000000\n" \[0.0, 10.3035887311, 0.0\] " 0.0000000000
10.3035887311 0.0000000000\n" cp POSCAR~tmp~ inner~relax-170~/POSCAR cp
/home/kawai/bin/vasp~templatesnew~/KPOINTS~50~ inner~relax-170~ cp
/home/kawai/bin/vasp~templatesnew~/INCAR~relax~ inner~relax-170~ cp
/home/kawai/bin/vasp~templatesnew~/run~fix100~.sh inner~relax-170~ cp
/home/kawai/bin/vasp~templatesnew~/POTCAR inner~relax-170~ cp
/home/kawai/bin/vasp~templatesnew~/run~relax2nd~.sh inner~relax-170~ cp
/home/kawai/bin/vasp~templatesnew~/run~fix50~.sh inner~relax-170~ cp
/home/kawai/bin/vasp~templatesnew~/run~relax1st~.sh inner~relax-170~ cp
/home/kawai/bin/vasp~templatesnew~/KPOINTS~100~ inner~relax-170~ cp
/home/kawai/bin/vasp~templatesnew~/INCAR~fix~ inner~relax-170~
"inner~relax-190~" \[19.8145937137, 0.0, 0.0\] " 16.049820908097
0.0000000000 0.0000000000\n" \[0.0, 10.3035887311, 0.0\] " 0.0000000000
10.3035887311 0.0000000000\n" cp POSCAR~tmp~ inner~relax-190~/POSCAR cp
/home/kawai/bin/vasp~templatesnew~/KPOINTS~50~ inner~relax-190~ cp
/home/kawai/bin/vasp~templatesnew~/INCAR~relax~ inner~relax-190~ cp
/home/kawai/bin/vasp~templatesnew~/run~fix100~.sh inner~relax-190~ cp
/home/kawai/bin/vasp~templatesnew~/POTCAR inner~relax-190~ cp
/home/kawai/bin/vasp~templatesnew~/run~relax2nd~.sh inner~relax-190~ cp
/home/kawai/bin/vasp~templatesnew~/run~fix50~.sh inner~relax-190~ cp
/home/kawai/bin/vasp~templatesnew~/run~relax1st~.sh inner~relax-190~ cp
/home/kawai/bin/vasp~templatesnew~/KPOINTS~100~ inner~relax-190~ cp
/home/kawai/bin/vasp~templatesnew~/INCAR~fix~ inner~relax-190~

cat inner~relax-150~/run~relax2nd~.sh
=====================================

\[kawai@asura0 3315\]\$ cat inner~relax-150~/run~relax2nd~.sh
\#!/bin/csh \#\$ -cwd \#\$ -S /bin/sh -V \#\$ -pe vasp 8 \#\$ -N test

mkdir relax~1st~ cp POSCAR OUTCAR INCAR KPOINTS test.o13303 relax~1st~

cp CONTCAR POSCAR cp INCAR~relax~ INCAR mpirun -np 8
/usr/local/vasp/vasp.4.6.36/src/vasp~190210~

result of 3315
==============

\[kawai@asura0 3315\]\$ auto~finish~ "test.o13298" "mkdir fix~100~" "cp
POSCAR KPOINTS INCAR test.o13298 fix~100~" "ls fix~100~"
inner~relax-170~ \["test.po13296", "test.e13295", "test.pe13297",
"test.pe13298", "test.pe13296", "test.e13297", "test.pe13295",
"test.o13295", "test.o13297", "test.e13298", "test.po13298",
"test.po13297", "test.o13298", "test.o13296", "test.e13296",
"test.po13295"\] "test.o13302" "mkdir fix~100~" "cp POSCAR KPOINTS INCAR
test.o13302 fix~100~" "ls fix~100~" inner~relax-190~ \["test.po13300",
"test.o13299", "test.pe13302", "test.pe13299", "test.pe13300",
"test.o13301", "test.e13299", "test.po13302", "test.po13299",
"test.po13301", "test.pe13301", "test.e13300", "test.e13301",
"test.e13302", "test.o13302", "test.o13300"\] "test.o13306" "mkdir
fix~100~" "cp POSCAR KPOINTS INCAR test.o13306 fix~100~" "ls fix~100~"
inner~relax-150~ \["test.po13306", "test.o13304", "test.po13304",
"test.o13306", "test.po13303", "test.e13306", "test.e13304",
"test.o13305", "test.e13303", "test.po13305", "test.pe13305",
"test.pe13303", "test.pe13304", "test.pe13306", "test.o13303",
"test.e13305"\] \[kawai@asura0 3315\]\$ gets~allresults~ relax~1st~:=
\[\[-19.0, 0.0, -146.59354\], \[-17.0, 0.0, -146.78387\], \[-15.0, 0.0,
-146.76684\]\] ; relax~2nd~:= \[\[-19.0, 0.0, -146.59355\], \[-17.0,
0.0, -146.78387\], \[-15.0, 0.0, -146.76684\]\] ; fix~1st~:= \[\] ;
fix~50~:= \[\] ; fix~100~:= \[\[-19.0, 0.0, -146.59763\], \[-17.0, 0.0,
-146.80493\], \[-15.0, 0.0, -146.78054\]\] ; fix~150~:= \[\] ;
fix~200~:= \[\] ;

question
========
