``` {.ruby}
#!/usr/bin/env ruby 


require 'open3'
require 'colorize'

Dir.glob('inner_relax*').each do |dir|
  Dir.chdir(dir) do   
    target = "fix_100" 
    p last = Dir.glob('test.o*').sort[-1]
    ["mkdir #{target}",
     "cp POSCAR KPOINTS INCAR #{last} fix_100",
     "ls fix_100",
    ].each do |command| commandに入れる
      p command
      out, err, _status = Open3.capture3(command)
      print err.red
    end

    puts dir.red
    p Dir.glob('test.*') 
  end
end

```

Line: Result

8: chdirでdirに移動

9: ターゲットの名前を指定します。

10: test.oだけをpする

16: out:標準出力　err:標準エラー status:プロセスの終了ステータス

17: コマンドを実行し、そのプロセスの標準出力と標準エラー、プ
ロセスの終了ステータスを表すオブジェクトを返します。

21: Rubyでディレクトリ内のファイルを処理する際、Dir.globを使います。

まずinner~relaxと名前のついたディレクトリdirに入れる~．

chdirでディレクトリをinner~relaxに切り替える~．

targetでfix~100を指定する~．

lastにtest.oの番号を一番大きい番号のものをpして，
mkdirでfix~100の中にPOSCAR~ KPOINTS INCAR \#{last} fix~100~
をコピーしてきて，それをcommandの中に入れる．

エラーをout, err, ~status~ = Open3.capture3(command)でprint
err.redを出力する．

inner~relaxを赤字で表示~，そのディレクトリの中のtest.oをすべて表示する.
