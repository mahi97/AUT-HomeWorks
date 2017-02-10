#include "quick.h"

Quick::Quick()
{

}


void Quick::execute()
{
    std::cout << "Quick Sort is Running ..." << std::endl;
    quickSortRecursive(m_numberVec,0,m_numberVec.size() - 1);
}

/******************************************************
 * Quicksort.
 * @param _input - The vector to be sorted.
 * @param first  - The start of the sequence to be sorted.
 * @param last   - The end of the sequence to be sorted.
**/
void Quick::quickSortRecursive(std::vector<int> &_input, int first, int last)
{
    int pivotElement{};
    setComparison(getComparison() + 1);
    if(first < last)
    {
        pivotElement = pivot(_input, first, last);
        quickSortRecursive(_input, first, pivotElement-1);
        quickSortRecursive(_input, pivotElement+1, last);
    }
}



/******************************************************
 * Find and return the index of pivot element.
 * @param _input - The Vector.
 * @param first  - The start of the sequence.
 * @param last   - The end of the sequence.
 * @return       - the pivot element
**/
int Quick::pivot(std::vector<int> &_input, int first, int last)
{
    int  p{first};
    int pivotElement{_input.at(first)};

    for(int i{first + 1}; i <= last; i++)
    {
        if(_input.at(i) <= pivotElement)
        {
            p++;
            swap(_input.at(i), _input.at(p));
        }

        setComparison(getComparison() + 2);
    }

    swap(_input.at(p), _input.at(first));
    return p;
}


