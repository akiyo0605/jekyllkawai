``` {.ruby}
#!/usr/bin/env ruby 

[kawai@asura0 bin]$ cat inner_relax
#!/usr/bin/env ruby

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


```

ジュキルのきく マニュアルの作成
