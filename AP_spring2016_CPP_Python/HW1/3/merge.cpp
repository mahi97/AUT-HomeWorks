#include "merge.h"

Merge::Merge() {

}

void Merge::execute() {
    std::cout << "Merge Sort is Running ..." << std::endl;
    mergeSort(m_numberVec);
}

void Merge::merge(vec_it left, vec_it left_end,
		  vec_it right, vec_it right_end, vec_it numbers)
{
    while (left != left_end)
    {
        if (*left < *right || right == right_end)
        {
            *numbers = *left;
            ++left;
        }
        else
        {
            *numbers = *right;
            ++right;
        }
        ++numbers;

        setComparison(getComparison() + 2);
        setPlace(getPlace() + 1);
    }

    while (right != right_end)
    {
        *numbers = *right;
        ++right;
        ++numbers;
        setPlace(getPlace() + 1);
    }

}

void Merge::mergeSort(std::vector<int>& numbers)
{
    if (numbers.size() <= 1)
    {
        return;
    }
    setPlace(getPlace() + 1);

    std::vector<int>::size_type middle = numbers.size() / 2;
    std::vector<int> left(numbers.begin(), numbers.begin() + middle);
    std::vector<int> right(numbers.begin() + middle, numbers.end());

    mergeSort(left);
    mergeSort(right);

    merge(left.begin(), left.end(),
	  right.begin(), right.end(), numbers.begin());

}
