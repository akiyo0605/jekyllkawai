``` {.ruby}
#!/usr/bin/env ruby 


require 'open3'
require 'colorize'

Dir.glob('inner_relax*').each do |dir|
  Dir.chdir(dir) do   # chdirでdirに移動
    target = "fix_100" #ターゲットの名前を指定します。
    p last = Dir.glob('test.o*').sort[-1] # test.oだけをpする
    ["mkdir #{target}",
     "cp POSCAR KPOINTS INCAR #{last} fix_100",
     "ls fix_100",
    ].each do |command| commandに入れる
      p command
      out, err, _status = Open3.capture3(command)  #out:標準出力　err:標準エラー status:プロセスの終了ステータス
      print err.red
    end

    puts dir.red
    p Dir.glob('test.*') #Rubyでディレクトリ内のファイルを処理する際、Dir.globを使います。
  end
end

```
