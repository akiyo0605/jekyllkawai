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

    #!/usr/bin/env ruby
    dirs = ARGV[0]
    if dirs == nil
      puts "vasp_auto_submit [DIR] : like 'inner_relax_-2_0' or 'inner_relax_*'"
      exit
    end

3: dirに何も無かったら，puts以下を出力する


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
