#! /usr/local/bin/ruby

#シェバンをつけることでインタプリタを指定 rubyコマンドが不要に（権限が必要）

ARGV.each do |arg|
  File.open(arg, "r") do |f|
    while line = f.gets&.chomp
      puts line
    end
  end
end
