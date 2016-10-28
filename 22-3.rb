require 'digest'

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Введите фразу, которую вы хотите зашифровать:"

string = STDIN.gets.chomp

puts "Каким способом хотите зашифровать?"
puts "1.MD5"
puts "2.SHA1"

user_choice = STDIN.gets.to_i

puts "Вот, что получилось :"

if (user_choice == 1)

  puts Digest::MD5.hexdigest string
else
  puts Digest::SHA1.hexdigest string
end
