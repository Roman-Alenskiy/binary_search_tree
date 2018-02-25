class Node
    attr_accessor :value, :parent, :left_child, :right_child

    def initialize(value)
        @value = value
        @parent = nil
        @left_child = nil
        @right_child = nil
    end

end

class BinarySearchTree
    attr_accessor :data, :root

    def initialize(data = nil)
        @data = data
        @root = nil
    end

    def build_tree
        @data.each do |value|
            node = Node.new(value)
            place_node(node)
        end
    end

    def place_node(node, current_root = @root)
        
        if @root.nil?
            @root = node
            current_root = @root
            return puts "Root: #{@root.value}"
        end

        if (node.value < current_root.value) && (current_root.left_child.nil?)
            node.parent = current_root
            current_root.left_child = node
            
            return node_to_s(node)
        elsif (node.value < current_root.value) && !(current_root.left_child.nil?)
            place_node(node, current_root.left_child)
            return
        end

        if (node.value > current_root.value) && (current_root.right_child.nil?)
            node.parent = current_root
            current_root.right_child = node
            return node_to_s(node)
        elsif (node.value > current_root.value) && !(current_root.right_child.nil?)
            place_node(node, current_root.right_child)
            return
        end
    end

    # Private methods
    private 
    
    def node_to_s(node)
        string =  "Node: #{node.value}     Parent: #{node.parent.value}"
        unless node.parent.left_child.nil?  
            string += "     Parent's LC: #{node.parent.left_child.value}"
        else 
            string += "     Parent's LC: nil"
        end
        
        unless node.parent.right_child.nil?  
            string += "     Parent's RC: #{node.parent.right_child.value}"
        else 
            string += "     Parent's RC: nil"
        end 
        puts string
    end

end

tree = BinarySearchTree.new
tree.data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree.build_tree
            

