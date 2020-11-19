require './Tree.rb'

binary_tree = Tree.new([5,7,1,15,9,2,14,8,7,3])
p binary_tree
p binary_tree.find(3)
p binary_tree.level_order(binary_tree.root)