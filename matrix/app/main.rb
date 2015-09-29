require '../lib/matrix'

m = Matrix.new([
							 [2,1,1,1,1],
							 [1,2,1,1,1],
							 [1,1,2,1,1],
							 [1,1,1,2,1],
							 [1,1,1,1,2]
])
puts m.max

n = Matrix.new([
							 [2,1,1,1,1,5],
							 [1,2,1,1,5,1],
							 [1,1,2,5,1,1],
							 [1,1,1,2,1,1],
							 [1,1,1,1,2,1],
							 [1,1,1,1,1,2]
])
puts n.max

o = Matrix.new([
							[2,2,2,2,2],
							[1,1,1,1,1],
							[1,1,1,1,1],
							[1,1,1,1,1],
							[1,1,1,1,1]
])
puts o.max

p = Matrix.new([
							[2,1,1,1,1],
							[2,1,1,1,1],
							[2,1,1,1,1],
							[2,1,1,1,1],
							[2,1,1,1,1]
])
puts p.max
