file = File.open("sample.txt", "r")

#while line = file.gets.chomp #whileしていると、最後はnilが帰ってくるので、chompするとエラーになる
#  #line = line.chomp
#  #line.chomp! #破壊的メソッド（自分自身を変えて、返り値は無し）
#  pp line
#end

while line = file.gets&.chomp
  pp line
end

file.close