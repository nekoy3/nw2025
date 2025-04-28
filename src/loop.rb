a = 5
while a>0
  puts a
  a -= 1
end
#インクリメント、デクリメントは自己破壊的な操作
ia = [10, 30, 50, 80]

for i in ia
  puts i
end

ia.each do |i|
  puts i
end

5.times do |i|
  puts i
end
