#! /usr/bin/ruby

require "socket"

# listen
s0 = TCPServer.open(80)

loop do
  # クライアントからの応答待機
  sock = s0.accept

  # クライアントに対しスレッドを立ち上げ
  Thread.new do
    # クライアントからのデータを受け取り
    while line=sock.gets
      print line
      sock.print(line) #受け取った内容をクライアントに送り返す

      # 受信した行が空行だったらwhileを抜ける
      break if line == "\r\n"
    end
    sock.close
    sleep 60
  end
end

s0.close