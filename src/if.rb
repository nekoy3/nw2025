puts "Hello"
=begin
#変数の型を宣言しない getsは文字列を返す
a = gets
s = gets
puts a.to_i+2
puts a
puts s
p a #改行ごと取り込んでいる
pp a
pp s

a = gets.chomp #改行を取り除く
puts a + " is sushi"
=end
a = gets.to_i

if a >= 0
  puts "Positive"
else
  puts "Negative"
  puts "minus"
end

#javaはelse if
#Javaはあくまで一文しか入らない（{}が一文）ため、else if
#rubyはelsif
#複文が使えるため、else ifだと不恰好になる
#そのため専用の文法elsisが用意されている
if a >= 0
  puts "Positive"
elsif a == 0
  puts "Zero"
else
  puts "Negative"
end

print "name?"
name = gets.chomp
if name == "KSU"
  puts "Hello"
else
  puts "Hi!"
end

# Javaだとbooleanしかif文の評価に受け付けない
# Rubyはfalse, nil以外は全てtrueとみなす
# ただし警告が出る
# if.rb:47: warning: found `= literal' in conditional, should be ==
q = 5
if q = 2
  puts "three"
end
puts q if q == 3
puts q.to_s + " is not three" unless q == 3
