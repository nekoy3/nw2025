path=ARGV[0]
File.open(path, "r") do |f|
  c = 1
  while line = f.gets&.chomp
    #print c.to_s + ": "
    #puts line
    puts "#{c}: #{line}"
    c += 1
  end
end
