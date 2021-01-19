require 'set'

class GraphNode

    attr_accessor :val, :neighbors

    def initialize(val)
        self.val = val
        self.neighbors = []
    end

    def add_neighbor(node)
        self.neighbors << node
    end

    def bfs(starting_node, target_value)
        seen = Set.new()
        queue = [starting_node]

        until queue.empty?
            el = queue.shift
            unless seen.include?(el)
                return el.val if el.val == target_value
                seen.add(el)
                queue += el.neighbors
            end
        end
        
        return nil
    end

end

# a = GraphNode.new('a')
# b = GraphNode.new('b')
# c = GraphNode.new('c')
# d = GraphNode.new('d')
# e = GraphNode.new('e')
# f = GraphNode.new('f')
# a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]

# p f.bfs(a, "b")
# p a.bfs(a, "f")
