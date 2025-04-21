#! /usr/bin/env ruby

i = 5
j = i * 2
puts i
puts j

s = "KSU"
puts s 
puts s + " IS"

i = "Ruby"
puts i

puts s*5
puts s+5.to_s
puts "j:" + j.to_s

x = "5"
puts x
puts x+"km"
puts x*3
y = x.to_i
puts y*3

puts 5+3
puts 5-3
puts 5*3
puts 5/3
puts 5%3
puts 5**3
puts 5/3.0
puts 5/3.0.to_i
puts 5/3.0.round

#Option + ¥ でバックスラッシュ
#ダブルクォートは特殊文字や変数(評価)を処理する
t = "Ruby\n"
u = 'Python\n'
puts t+" "+u

puts "j:#{j}"
puts 'j:#{j}'

#数値リテラル　浮動小数点リテラル　文字列リテラル　に加えてRubyは配列リテラルがある
#初期化の時だけリテラルで書ける -> 配列リテラル
a = [1, 2, 3, 4]
pp a
puts a[0]
puts a[1]
puts a[2] + a[3]
a[0]=10
pp a