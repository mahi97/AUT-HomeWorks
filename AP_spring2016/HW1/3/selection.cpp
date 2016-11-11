#include "selection.h"

Selection::Selection()
{

}

void Selection::execute()
{
    selectionSort(m_numberVec, m_numberVec.size());
}

void Selection::selectionSort (std::vector<int>& theList, int sizeOfList)
{
    int min{0};
    for(int i{0}; i < sizeOfList-1; i++)
    {
        min = i;
        for(int j{i + 1}; j < sizeOfList; j++)
        {
            if (theList[j] < theList[min])
            {
                min = j;
            }
        }
        swap(theList[min], theList[i]);
    }
}
