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
        i = 0
        until queue.empty? do # !!!!!#each iterator dont work correctly!!!!!!!
            if queue[i].value == value
                puts 
                node_to_s(queue[i])
                return queue[i]
            else
                queue << queue[i].left_child unless queue[i].left_child.nil?
                queue << queue[i].right_child unless queue[i].right_child.nil?
                queue.shift
                i = 0
            end
        end
        puts "\nnil"
        return nil
    end

    def show_tree
        queue = [@root]
        i = 0
        until queue.empty? do
            node_to_s(queue[i])
            queue << queue[i].left_child unless queue[i].left_child.nil?
            queue << queue[i].right_child unless queue[i].right_child.nil?
            queue.shift
            i = 0
        end
    end

end

tree = BinarySearchTree.new
tree.data = [2, 1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree.build_tree
tree.show_tree
tree.breadth_first_search(3)

