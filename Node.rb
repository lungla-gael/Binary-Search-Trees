require './EmptyNode.rb'
class Node
    attr_reader :data
    attr_accessor :left_child, :right_child
    def initialize(data)
        @data = data
        @left_child = EmptyNode.new
        @right_child = EmptyNode.new
    end
  
    def insert(value)
      case data <=> value
      when 1 then insert_left_child(value)
      when -1 then insert_right_child(value)
      when 0 then false # the data is already present
      end
    end

    def delete(value)
        case data <=> value
        when 1 then delete_left_child(value)
        when -1 then delete_right_child(value)
        when 0 # data found
          if left_child.to_a.empty? && right_child.to_a.empty?
            false            
          else
            p self
            true
          end
        end
    end

    def find(value)
      case data <=> value
      when 1 then left_child.find(value)
      when -1 then right_child.find(value)
      when 0 then self
      end
    end

    def inspect
      "{#{data}:#{left_child.inspect}|#{right_child.inspect}}"
    end

    def to_a
      left_child.to_a + [data] + right_child.to_a
    end

    def level_order(node, display, queue)
      return display if queue.size == 1
      display.push(data) if display.empty?
      unless node.left_child.to_a.empty?
        display.push(node.left_child.data)
        queue.push(node.left_child)      
      end
      unless node.right_child.to_a.empty?
        display.push(node.right_child.data)
        queue.push(node.right_child)        
      end
      p queue.first
      level_order(queue.unshift, display, queue)
    end

    private

      def insert_left_child(value)
        left_child.insert(value) or self.left_child = Node.new(value)
      end

      def insert_right_child(value)
        right_child.insert(value) or self.right_child = Node.new(value)
      end

      def delete_left_child(value)
        left_child.delete(value) or self.left_child = EmptyNode.new
      end

      def delete_right_child(value)
        right_child.delete(value) or self.right_child = EmptyNode.new
      end
end