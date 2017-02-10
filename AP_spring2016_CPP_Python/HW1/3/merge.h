#ifndef MERGE
#define MERGE

#include "base.h"
#include "sort.h"

class Merge : public MySort
{
public:

    Merge();
    void execute();

private:

    void merge(vec_it left, vec_it left_end,
	       vec_it right, vec_it right_end, vec_it numbers);
    
    void mergeSort(std::vector<int>& numbers);

};



#endif // MERGE

