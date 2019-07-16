``` {.ruby}
 #!/usr/bin/env ruby



require 'pp'  #オブジェクトなどを見やすく出力するためのライブラリです。
require 'scanf'
def get_vals(dir) #dir ディレクトリの操作を行うためのクラスです。
  vals = []
  Dir.glob(File.join(dir,'*.o*')).each do |file| #ファイルパターンを指定してファイルを列挙することができます
    m = File.read(file).scan(/E0= (.+) d/)
    unless m!=[] # m=[]の時
      p dir
      next
    else
      vals << m[-1][0].scanf("%f")[0]
    end
  end
  vals
end

['relax_1st','relax_2nd','fix_1st','fix_50','fix_100','fix_150','fix_200'].each do |source|
  puts source+":="
  results = []
  Dir.glob('*/*').each do |dir|
    if dir.include?(source) and File.directory?(dir) #dirがsourceを含んでいるか，ディレクトリであれば
      dd = File.dirname(dir).split('_')[-2..-1] #dirを_で分ける
      vals = [dd[0].to_f, dd[1].to_f] 
      vals << get_vals(dir) #valsの末尾に右辺のオブジェクトを要素として加える
      results << vals.flatten #配列の配列を平坦化した新しい配列を返す
    end
  end
  pp results.sort #resultをソートする
  puts ";"
end

```

\#+end~example~ &lt;2019-07-11 木 18:28&gt;
