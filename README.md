# Binary search tree
This is implementation of Binary search tree on Ruby


## Notes:

### Classes:

+ Node class, which represents separate node.
+ BinarySearchTree class, which represents BST, consisting of separate nodes (inherited from Node class).


### Methods:

+ #build_tree takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of Node objects appropriately placed (note: #build_tree doesnt litteraly build BST, it just iterate through an array).
+ #place_node takes each element of array (from #build_tree) and directly "places" each node, step by step building BST
+ #show_tree used to form information about all nodes of single BST
+ #node_to_s used to form a string with information about particular node
+ #breadth_first_search takes a target value and returns the node at which it is located using the breadth first search technique. (use the queue)
+ #depth_first_search which returns the node at which the target value is located using the depth first search technique. (use the stack)
+ #dfs_rec implementation of #depth_first_search using recursion (I do not advise to use this method, it is only for demonstration of recursion using skill)
