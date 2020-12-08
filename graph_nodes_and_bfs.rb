class GraphNode
    attr_reader :value, :neighbors
    def initialize(value)
        @value = value
        @parent = nil
        @neighbors = []
    end

    def neighbors=(nodes)
        @neighbors += nodes
    end
end

def bfs(starting_node, target_value)
    checked_nodes = []
    queue = [starting_node]
    until queue.empty?
        node = queue.shift
        unless checked_nodes.include?(node)
            return node if node.value == target_value
            queue += node.neighbors
            checked_nodes << node 
        end
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
p bfs(a, "f")