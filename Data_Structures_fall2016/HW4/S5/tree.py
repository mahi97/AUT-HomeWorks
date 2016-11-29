class Node:
    def __init__(self, key):
        self.key = key
        self.parent = -1
        self.children = []
        self.place = -1


class Tree:
    def __init__(self, node_count):
        self.nodes = [Node(i) for i in range(node_count + 1)]
