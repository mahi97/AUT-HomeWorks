#include "sort.h"

MySort::MySort()
{

}

void MySort::setNubmerVec(std::vector<int> _numberVec)
{
    m_numberVec.clear();
    for(int member : _numberVec)
    {
        m_numberVec.push_back(member);
    }
}

void MySort::reset()
{
    m_comparison = 0;
    m_time = 0;
    m_place = 0;
}

sortResult MySort::getResult()
{
    sortResult tempResult{};
    tempResult.time = m_time;
    tempResult.comarison = m_comparison;
    tempResult.algorithm = m_algorithm;
    tempResult.place = m_place;
    tempResult.result = m_numberVec;
    return tempResult;
}

void MySort::execute()
{

}

/**
 * Swap the parameters.
 * @param a - The first parameter.
 * @param b - The second parameter.
*/
void MySort::swap(int& a, int& b)
{
    int temp = a;
    a = b;
    b = temp;
}

