# Binary search tree
This is implementation of Binary search tree on Ruby


## Notes:

### Classes:

+ BinarySearchTree class, which represents BST.
+ Node class, containing a @value, @parent, @left_child, @right_child attrs.


### Methods:

+ #build_tree takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of Node objects appropriately placed (note: #build_tree doesnt litteraly build BST, it just iterate through an array).
+ #place_node takes each element of array (from #build_tree) and directly "places" each node, step by step building BST

### Auxiliary methods:

+ #node_to_s used to form a string with information about particular node for #place_node
