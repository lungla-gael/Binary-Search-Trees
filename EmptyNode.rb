class EmptyNode
    def to_a
      []
    end

    def include?(*)
      false
    end

    def insert(*)
      false
    end

    def delete(*)
      false
    end

    def inspect
      "{}"
    end
end