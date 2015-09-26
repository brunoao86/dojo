require '../lib/telefone'

telefone = Telefone.new

puts "Sem arquivo de entrada. Execute `ruby main.rb data`" if ARGV.length.zero?

ARGF.each do |line|
	puts telefone.converter(line)
end unless ARGV.length.zero?
