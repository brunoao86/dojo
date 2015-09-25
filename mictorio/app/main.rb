require '../lib/mictorio'

m = Mictorio.new([0,0,1,0,1])
m.processa_arranjo!

puts "Arranjo: " + m.arranjo.join(", ")
puts "Lugares disponíveis: " + m.lugares.to_s
puts "Posições: " + m.posicoes.join(", ")
puts "Novo Arranjo: " + m.novo_arranjo.join(", ")


