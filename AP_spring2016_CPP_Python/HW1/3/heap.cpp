#include "heap.h"


Heap::Heap () {

}

void Heap::execute()
{
    std::cout << "Heap Sort is Running ..." << std::endl;
    heapSort(m_numberVec);
}



inline int Heap::parent(int i)
{
    return i >> 1;
}

inline int Heap::leftChild(int i)
{
    return i << 1;
}

inline int Heap::rightChild(int i)
{
    return (i << 1) + 1;
}

void Heap::heapSort(std::vector<int>& t)
{
    for (int i{0}; i < t.size(); ++i)
    {
        heapify(t, 1, i);
    }
}

void Heap::heapify(std::vector<int>& _numberVec, int cur, int offset)
{

    if (cur + offset > _numberVec.size())
    {
        return;
    }

    heapify(_numberVec, leftChild(cur), offset);
    heapify(_numberVec, rightChild(cur), offset);

    if(cur > 1 &&
       _numberVec[cur + offset - 1] < _numberVec[parent(cur) + offset - 1])
    {
        swap(_numberVec[cur + offset - 1],
	     _numberVec[parent(cur) + offset - 1]);
    }
    setComparison(getComparison() + 1);
}
