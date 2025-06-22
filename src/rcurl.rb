#! /usr/local/bin/ruby

require 'socket'
require 'uri'
# コマンドライン引数からURLを取得

url = ARGV[0]
# uri = URI.parse(url)
# host = uri.host
# path = uri.path

url = url[7..]
host_index = url.index('/')
host = url[0,host_index]
path = url[host_index..]

# ./client1.rb host pathで実行できるようにする
# ヘッダー情報を表示しないように改良
# URLをhttp://example.com/pathのように指定できるようにする

s = TCPSocket.open(host, "http")
s.print("GET #{path} HTTP/1.1\r\n")
s.print("Host: #{host}\r\n")
s.print("Connection: close\r\n")
s.print("\r\n")

# レスポンスのヘッダーを読み飛ばす
while line = s.gets&.chomp
  break if line.empty?
end

# ヘッダーを読み飛ばした後、ボディ部分を出力する
while line = s.gets&.chomp
  puts line
end