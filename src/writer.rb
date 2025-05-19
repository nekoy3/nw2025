file = File.open("sample.txt", "w")

file.puts "ナン" #改行あり
file.write("すし") #改行なし
file.print "改行無し" #改行無し　多分writeと同じ
file.puts "チーズ"
file.puts "おこめ"

file.close

STDOUT.puts "標準出力"
puts "標準出力"