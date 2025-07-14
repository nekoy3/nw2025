#!　/usr/bin/ruby
require "socket"
require 'json'
require 'securerandom'

def server sock
  while buf = sock.gets
    response = ''
    nonce = ''
    begin
      data = JSON.parse(buf) 
    rescue => e
      response = { command: "result", status: "error", message: "Invalid message" }
      sock.puts(response.to_json)
      sock.close
      return
    end
    puts 'username: ' + data['username']

    # ファイルがなければエラーで終了
    if !File.exist?("auth_user.txt") then
      response = { command: "result", status: "error", message: "File not found" }
      sock.puts(response.to_json)
      sock.close
      return
    end

    # ファイルからユーザ名を読み出す
    is_user = false

    File.open("auth_user.txt") {|f|
      f.each_line{|line|
        #puts line.chomp
        tmp = line.chomp
        if data['username'] == tmp then
          is_user = true
        end
      }
    }
    if !is_user then
      response = { command: "result", status: "error", message: "Invalid user" }
      sock.puts(response.to_json)
      sock.close
      return
    end

    # nanceを投げつける
    nonce = SecureRandom.hex(16)
    response = { command: "challenge", nonce: nonce }

    sock.puts(response.to_json)

    # クライアントからの応答待機
    client_response_line = sock.gets
    begin
      data = JSON.parse(client_response_line) 
    rescue => e
      response = { command: "result", status: "error", message: "Invalid message" }
      sock.puts(response.to_json)
      sock.close
      return
    end
    print "response: "
    puts data
    
    if data['command'] == "auth_nonce" && data['nonce'] == nonce then
      response = { command: "result", status: "success"}
      puts "success"
    else
      response = { command: "result", status: "error", message: "Authentication failed."}
      puts "Authentication failed."
    end
    sock.puts(response.to_json)
  end
  sock.close
end

# ポート55555で待ち受け
s0 = TCPServer.open(55555)
# 終了しないようにしたい
while true
  sock = s0.accept
  Thread.new do
    server(sock)
  end
end
s0.close