File.open("sample.txt", "a") do |f|
  f.puts "ナン" #改行あり
  f.write("すし") #改行なし
  f.print "改行無し" #改行無し　多分writeと同じ
  f.puts "チーズ"
  f.puts "おこめ"
end