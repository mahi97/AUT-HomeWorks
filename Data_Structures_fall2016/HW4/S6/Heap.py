class Heap:

    def __init__(self, first=None):
        if first is None:
            first = []
        self.heap = []
        for i in first:
            self.add(i)

    def add(self, num : int):
        self.heap += [num]
        self.bubble_up(len(self.heap) - 1)

    def parent(self, pos : int):
        if self.has_parent(pos):
            return int((pos - 1) / 2)
        return 0

    def has_parent(self, pos : int):
        if pos is 0:
            return False
        return True

    def bubble_up(self, position : int):
        if self.has_parent(position) and int(self.heap[position]) > int(self.heap[self.parent(position)]):
            self.swap(position, self.parent(position))
            self.bubble_up(self.parent(position))

    def swap(self, pos1, pos2):
        self.heap[pos1], self.heap[pos2] = self.heap[pos2], self.heap[pos1]