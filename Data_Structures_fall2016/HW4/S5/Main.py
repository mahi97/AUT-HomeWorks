from S5.tree import *

# Global Cursor for traverse tree
place_ = 0


def _get_full(_tree: Tree, nodes):
    all_str = ""
    for n in nodes:
        all_str += str(n)
        if len(_tree.nodes[n].children) is not 0:
            all_str += _get_full(_tree, _tree.nodes[n].children)

    return all_str


def get_full(_tree: Tree):
    return '1' + str(_get_full(_tree, _tree.nodes[1].children))


def _find_limits(_tree: Tree, nodes):
    global place_
    full_node = []
    for node in nodes:
        place_ += 1
        _tree.nodes[node].place = place_
        full_node += _tree.nodes[node].children
    if len(full_node) is not 0:
        _find_limits(_tree, full_node)


def find_limits(_tree: Tree):
    global place_
    _tree.nodes[1].place = 1
    place_ = 1
    _find_limits(_tree, _tree.nodes[1].children)


def get_stop(_tree: Tree, node):
    max_place = -1
    if len(_tree.nodes[node].children) is 0:
        return _tree.nodes[node].place

    for node in _tree.nodes[node].children:
        stop = get_stop(_tree, node)
        if max_place < stop:
            max_place = stop

    return max_place


def get(_tree: Tree, node):
    start = _tree.nodes[node].place
    stop = get_stop(_tree, node)
    return start, stop


if __name__ == '__main__':

    # Get Data from standard input
    node_count = int(input("Node Count ? "))
    node_address = input("Parents ?")

    node_add_list = str(node_address).split(' ')

    # Handel Error from bad inputs
    if len(node_add_list) is not (node_count - 1):
        print('Bad input ' + str(node_count) + " != " + str(len(node_add_list)))
        exit()

    # Construct The Tree
    my_tree = Tree(node_count)

    # Fill Parent and Children Properties in node classes
    for i in range(len(node_add_list)):
        num = int(node_add_list[i])
        my_tree.nodes[i + 2].parent = num
        my_tree.nodes[num].children.append(i + 2)

    # Print the String that contain tree and sub-trees
    print(get_full(my_tree))

    # Find The the limits of all trees and sub-trees
    find_limits(my_tree)

    # Show Node Properties
    # for i in my_tree.nodes:
    #     print('--------------------')
    #     print('key: ', i.key)
    #     print('parent: ', i.parent)
    #     print('children: ', i.children)
    #     print('place: ', i.place)
    #     print('--------------------')

    # Show the limit of each sub-tree
    for i in range(1, node_count + 1):
        print(i, ':', get(my_tree, i))
