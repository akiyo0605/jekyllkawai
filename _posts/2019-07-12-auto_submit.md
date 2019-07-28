``` {.ruby}
#!/usr/bin/env ruby
require "open3"
require 'colorize'
puts SUBMIT_JOBS_FILE = File.join(ENV['HOME'],".vasp_submit_jobs.txt")



```

line: result

1: プログラムを実行し、そのプロセスの標準入力・標準出力・
標準エラー出力にパイプをつなぎます。

2: コンソールに色つきで出力

3: File.joinでファイルを結合する

３行目よりSUBMIT~JOBSFILEにHOMEとvaspsubmitjobs~.textを繋げる

    #!/usr/bin/env ruby
    dirs = ARGV[0]
    if dirs == nil
      puts "vasp_auto_submit [DIR] : like 'inner_relax_-2_0' or 'inner_relax_*'"
      exit
    end

3: dirに何も無かったら，puts以下を出力する

dirsの中身が空なら"vasp~autosubmit~ \[DIR\] : like 'inner~relax-20~' or
'inner~relax\*~'" を表示する


    Dir.glob(dirs).each do |dir|
      next unless dir.include?('inner_relax')
      Dir.chdir(dir) do
        puts dir.red
        id = 0
        ["run_relax_1st.sh","run_relax_2nd.sh",
         "run_fix_50.sh","run_fix_100.sh"].each_with_index do |target, i|

          p target
          if i==0
            out, err, status = Open3.capture3("qsub #{target}") 
          else
            File.write target, File.read(target).gsub!('<JOBID>', id)
            out, err, status = Open3.capture3("qsub -hold_jid #{id} #{target}") 
          end
          puts out.green
          p m = out.match(/Your job (\d+)/)
          p id = m[1] 
          current_dir=Dir.pwd
          File.open(SUBMIT_JOBS_FILE, 'a') do |f|
            f.write id
            f.write ":\t :\t #{current_dir}\n"
          end
        end
      end
    end


Line: Result

5: File.joinで２つの要素を結合, env 環境変数を表す変数

9: 引数の配列 参照 ここではargvはinner~relaxに当たる~

16: next (unless 条件) 条件を満たさないときloop(each)を一つ飛ばす

21: each~withindexは要素の数だけブロックを繰り返し実行します~。

25: qsubはジョブを投下するコマンド

27: gsub! &lt;JOBID&gt;をidに変換する

28: -hold~lid~...jobが終わるまで待機？

Open3.capture3...指定されたコマンドを実行し、そのプロセスの標準出力と標準エラー、プロセスの終了ステータスを表すオブジェクトを返します。

最初のnext unless文でinner~relaxを含んでいなかったらloop文を出る~

含まれていたら，putsでそのディレクトリの名前を表示する．

(each~withindexメソッドは~、要素の数だけブロックを繰り返し実行します。繰り返しごとにブロック引数targetには各要素が入り、iには0、1、2、...と番号が入ります。)

pでtarget("run~relax1st~.sh","run~relax2nd~.sh",
run~fix50~.sh","run~fix100~.sh")を出力する.

if: iが0の場合，target(run~relax1st~)にジョブをキューに投下する．

else:
gsub!でrun~relax2nd~.shの中にある，IDの部分をidの配列に書き変えて，ジョブをキューに投下する．

outをグリーンで表示し，matchでoutと（）の中身の一致している部分表示し，先ほど求めたidにm\[1\]を代入する．

第２引数がモードを表していて，この場合だと，'a'が追加書き込みになっている．
