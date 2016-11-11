#include "bubble.h"

Bubble::Bubble ()
{

}

void Bubble::execute()
{

    std::cout << "Bubble Sort is Running ..." << std::endl;
    bubbleSort(m_numberVec);
}

void Bubble::bubbleSort(std::vector<int> &_inputVec)
{

    for (int i{0}; i < ( _inputVec.size() - 1 ); i++)
    {
        for (int j{0} ; j < (_inputVec.size() - i - 1); j++)
        {
            if (_inputVec.at(j) > _inputVec.at(j + 1))
            {
                swap(_inputVec.at(j), _inputVec.at(j + 1));
            }
        }
    }
}
