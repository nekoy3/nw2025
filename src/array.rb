a = [10, 20, 50, 30]

a << 40

a.each do |i|
  puts i
end
puts 

if a[0] % 2 == 0
  # シフトして先頭を削除
  a.shift
end
#a.shift if a[0] % 2 == 0

a.each do |i|
  puts i
end
#a.each do |i| puts i end

puts a * ","