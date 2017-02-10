#ifndef HEAP
#define HEAP

#include "base.h"
#include "sort.h"

class Heap : public MySort
{
public :

    Heap();
    void execute();

private:

    inline int parent(int i);
    inline int leftChild(int i);
    inline int rightChild(int i);

    void heapSort(std::vector<int>& _numberVec);
    void heapify(std::vector<int>& _numberVec, int cur, int offset);

};
#endif // HEAP

