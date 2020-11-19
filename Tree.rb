require './Node.rb'
class Tree
    attr_accessor :root
    def initialize(array)
        @root = build_tree(array.uniq)
    end

    def build_tree(array)
        res = {}
        array.each do |num|
            difference = (array.filter{|a| a < num}.count -  array.filter{|a| a > num}.count).abs
            res[num] = difference
        end
        balanced = []
        res.each { |key,value| balanced.push(key) if value === res.values.min }
        Node.new(balanced[rand(balanced.length)]).tap do |tree|
            array.each { |v| tree.insert v }
        end
    end

    def insert(value)
        root.insert(value)
    end

    def delete(value)
        root.delete(value)
    end

    def find(value)
        root.find(value)
    end

    def level_order(root_node)
        root_node.level_order(root_node,[],[])
    end
end