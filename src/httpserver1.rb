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
      if /\AGET/ =~ line then
        path = line.split(' ')[1]
        # case文を使った条件分岐
        case path
          when "/hello"
            sock.puts("HTTP/1.0 200 OK")
            sock.puts
            sock.puts("Hello, World!!")
          when "/301"
            sock.puts("HTTP/1.0 301 Moved Permanently")
            sock.puts("Location: http://www.kyusan-u.ac.jp")
            sock.puts
          else
            #ファイルを表示する、なければ404を返す
            #filename = path.slice(1..)
            filename = "." + path #ドット突っ込んでカレントディレクトリにしてもいい（おもしろい）
            if File.exist?(filename) then
              sock.puts("HTTP/1.0 200 OK")
              sock.puts "Content-Type: text/plain; charset=UTF-8"
              sock.puts
              file = File.open(filename, "r")
              while line = file.gets&.chomp
                sock.puts line
              end
            else
              sock.puts("HTTP/1.0 404 Not Found")
              sock.puts "Content-Type: text/plain; charset=UTF-8"
              sock.puts
              sock.puts("ファイルないよん ^ω^")
            end
        end
        
        break
      end

      # 受信した行が空行だったらwhileを抜ける
      #break if line == "\r\n"
    end
    sock.close
    sleep 60
  end
end

s0.close