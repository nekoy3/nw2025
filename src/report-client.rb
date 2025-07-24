#/usr/bin/env ruby

require "socket"
require "json"

print "username: "
user = gets.chomp
request_data = {
  command: "auth_request",
  username: user
}

# 認証開始
json_string = request_data.to_json #辞書型をjson文字列に変換する
begin
  s = TCPSocket.new("localhost", 55555) #サーバと通信するためにソケットオブジェクトを作成
rescue => e
  print "error: "
  puts e
end
s.puts(json_string) #改行コードを送る
# 応答待機
response_data = JSON.parse(s.gets)
if response_data['status'] == "error" then
  puts response_data
  return
end

# nonce入力
puts response_data
print "nonce: "
nonce = gets.chomp
request_data = {
  command: "auth_nonce",
  nonce: nonce
}

json_string = request_data.to_json
s.puts(json_string)

# 応答受信
response_data = JSON.parse(s.gets)
puts response_data