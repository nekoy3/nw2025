#()はいらないし、引数も返り値も型指定しない
# resultのスコープはメソッド内で宣言したことになる？
# Rubyは最後に評価された値が返り値になる
def max x, y
  if x > y
    result = x
  else
    result = y
  end
  result
end

# 評価した後何もしてない
def max2 x, y
  if x > y
    x
  else
    y
  end
  x+y
end

# 整数一つ受け取り偶数ならeven、奇数ならoddを返す
def evenOdd x
  if x%2 == 0
    "even"
  else
    "odd"
  end
end

a = 5
b = 10
c2 = max2(a, b)
puts c2

puts evenOdd 5
puts evenOdd 100