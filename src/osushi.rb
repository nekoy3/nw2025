#! /usr/bin/env ruby

#出力
puts "改行があるよ"
print "改行がないよ"
p "型がわかるよ"

s = "aa"
#puts s+5+3
#javaなら暗黙な変換によって「aa53」と出力される
#しかしRubyはIntegerを暗黙に文字列に変換しないので、意図的に変換しなければならない
a = 10
puts s + a.to_s

#コメント行
=begin
すし

=end
#定数に値を挿入すると警告が出る
NUMBER = 5
NUMBER = 3
puts NUMBER

b = 3.7
puts b.class
puts b.methods

#リテラル　3 -> Integer型 3.0 -> Float型 "a" -> String型　書き方によって型が決まる　値自体のことをリテラルという