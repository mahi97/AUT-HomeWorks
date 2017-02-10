#include "shell.h"

Shell::Shell()
{

}

void Shell::execute()
{
    shellSort(m_numberVec, m_numberVec.size());
}


void Shell::shellSort(std::vector<int>& numbers, int array_size)
{
    int j{}, increment{3}, temp{};
    while (increment > 0)
    {
        for (int i{0}; i < array_size; i++)
        {
            j = i;
            temp = numbers[i];
            while ((j >= increment) && (numbers[j - increment] > temp))
            {
                numbers[j] = numbers[j - increment];
                j = j - increment;
            }
            numbers[j] = temp;
        }
        if (increment / 2 != 0)
        {
            increment = increment / 2;
        }
        else if (increment == 1)
        {
            increment = 0;
        }
        else
        {
            increment = 1;
        }
    }
}

