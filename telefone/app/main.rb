$LOAD_PATH.unshift "/Users/Oliveira/dev/sandbox/dojo/telefone/lib"

require 'telefone'

telefone = Telefone.new

ARGF.each do |line|
	puts telefone.converter(line)
end
