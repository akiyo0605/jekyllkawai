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

readline(POSCAR)でPOSCARの中にあるLINEを１行ずつ読む．

conts\[2\]でユニットセルの１行目を出力し，xlength\[0\]の数値を書き換えて表示．

同様にcons\[3\]にも同じように処理をする．

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

HOMEのbinの中のvasp~templatesnewを結合する~．

ARGVがinner~relaxの引数~．ARGV\[0\], ARGV\[1\] inner~relax00~
であるここの０の数字のことを指している．

inner~relax00の０の部分をそれぞれ~，xdiv,ydivに代入して，pしている．

FileUtilsはLinuxにあるコマンドを使えるようにしているモジュール（ここで言うとrm~r~,
mkdirなど） force: 真を指定すると作業中すべての StandardError
を無視します。

inner~relaxの中にあるPOSCARtmpを新しく作ったinnerrelaxにコピーしてくる~．
verbose: 真を指定すると詳細を出力します。

files = Dir.glob(File.join(templates~dir~,'\*'))
でtemplates~dirの中身のすべてを~ 下のcpでdirにコピーしている．

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
