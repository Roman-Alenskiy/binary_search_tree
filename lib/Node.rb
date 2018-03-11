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