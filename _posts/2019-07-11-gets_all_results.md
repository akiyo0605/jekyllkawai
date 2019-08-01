    #!/usr/bin/env ruby

    require 'pp'  
    require 'scanf'
    def get_vals(dir) 
      vals = []
      Dir.glob(File.join(dir,'*.o*')).each do |file| 
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

list: result

1: オブジェクトなどを見やすく出力するためのライブラリです。

3: dir ディレクトリの操作を行うためのクラスです。

5: ファイルパターンを指定してファイルを列挙することができます

dirに入ってる.oのファイルを｜file｜に格納して
.oの中のE0の部分をreadして配列に入れる
mの中が空ならならdirをpする　そうでないならvalsにm\[-1\]\[0\]を格納する

> ``` {.example}
>
> ['relax_1st','relax_2nd','fix_1st','fix_50','fix_100','fix_150','fix_200'].each do |source|
>   puts source+":="
>   results = []
>   Dir.glob('*/*').each do |dir|
>     if dir.include?(source) and File.directory?(dir) 
>       dd = File.dirname(dir).split('_')[-2..-1]
>       vals = [dd[0].to_f, dd[1].to_f] 
>       vals << get_vals(dir) 
>       results << vals.flatten
>     end
>   end
>   pp results.sort
>   puts ";"
> end
>
> ```

line: result

4: ファイルパターンを指定してファイルを列挙することができます

6: dirを~で分ける~

8: valsの末尾に右辺のオブジェクトを要素として加える

9: 配列の配列を平坦化した新しい配列を返す

12: resultをソートする

'relax~1st~','relax~2nd~','fix~1st~','fix~50~','fix~100~','fix~150~','fix~200~'をsourceに入れる．

puts source+":=" で出力に””の中身を加えてる．

Dir.glob('**/**')で今いるディレクトリの中のすべてをdirに入れる

それがもし，sourceかdirを含んでいればif文の中に入る．

filenameで１番最後の/にあるディレクトリ（inner~relax00~）をspilitで0と0の部分をddに代入している．

先ほど代入したddの値２つをdd\[0\].to~f~, dd\[1\].to~fに代入する~．

そしてvalsにgets~valsで取得したE0の値を一番右に入れる~．

resultsにvalsを平坦化して代入．

最後にppでresultsをソートして出力する．
