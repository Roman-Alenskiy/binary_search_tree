class Node
    attr_accessor :value, :parent, :left_child, :right_child

    def initialize(value)
        @value = value
        @parent = nil
        @left_child = nil
        @right_child = nil
    end

    def node_to_s(node)
        return puts "\nRoot: #{@root.value}" if node == @root

        print "Node: #{node.value}".ljust(13)

        unless node.left_child.nil?  
            print "LC: #{node.left_child.value}".ljust(10)
        else
            print "LC: nil".ljust(10)
        end
        
        unless node.right_child.nil?  
            print "RC: #{node.right_child.value}".ljust(10)
        else
            print "RC: nil".ljust(10)
        end 

        print "Parent: #{node.parent.value}".ljust(15)

        unless node.parent.left_child.nil?  
            print "P's LC: #{node.parent.left_child.value}".ljust(15)
        else 
            print "P's LC: nil".ljust(15)
        end
        
        unless node.parent.right_child.nil?  
            print "P's RC: #{node.parent.right_child.value}".ljust(15)
        else 
            print "P's RC: nil".ljust(10)
        end 
        puts
    end

end

class BinarySearchTree < Node
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
            return
        end

        if (node.value < current_root.value) && (current_root.left_child.nil?)
            node.parent = current_root
            current_root.left_child = node
            return
        elsif (node.value < current_root.value) && !(current_root.left_child.nil?)
            place_node(node, current_root.left_child)
            return
        end

        if (node.value > current_root.value) && (current_root.right_child.nil?)
            node.parent = current_root
            current_root.right_child = node
            return
        elsif (node.value > current_root.value) && !(current_root.right_child.nil?)
            place_node(node, current_root.right_child)
            return
        end
    end

    def breadth_first_search(value)
        queue = [@root]
        until queue.empty? do # !!!!!#each iterator dont work correctly!!!!!!!
            if queue.first.value == value
                puts 
                node_to_s(queue.first)
                return queue.first
            else
                queue << queue.first.left_child unless queue.first.left_child.nil?
                queue << queue.first.right_child unless queue.first.right_child.nil?
                queue.shift
            end
        end
        puts "\nnil"
        return nil
    end

    def depth_first_search(value)
        stack = [@root]
        until stack.empty? do
            node = stack.pop # #pop delete last array element, then return this deleted element
            if node.value == value
                puts
                node_to_s(node)
                return node
            else
                stack << node.right_child unless node.right_child.nil?
                stack << node.left_child unless node.left_child.nil?  
            end              
        end
        puts "\nnil"
        return nil
    end

    def dfs_rec(value, current_root = @root)
        return if current_root.nil?

        node_to_s(current_root) if current_root.value == value

        dfs_rec(value, current_root.left_child)
        dfs_rec(value, current_root.right_child)
    end

    def show_tree
        queue = [@root]
        until queue.empty? do
            node_to_s(queue.first)
            queue << queue.first.left_child unless queue.first.left_child.nil?
            queue << queue.first.right_child unless queue.first.right_child.nil?
            queue.shift
        end
    end

end

tree = BinarySearchTree.new
tree.data = [2, 1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree.build_tree
tree.show_tree
tree.breadth_first_search(3)
tree.depth_first_search(3)
puts
tree.dfs_rec(3)

