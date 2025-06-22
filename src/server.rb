#!　/usr/bin/ruby

require "socket"
def server sock
  while buf = sock.gets
    p buf
    sock.puts "reply:#{buf}"
  end
  sock.close
end

# ポート80で待ち受け
s0 = TCPServer.open(80)
# 終了しないようにしたい
while true
  sock = s0.accept
  Thread.new do
    server(sock)
  end
end
s0.close