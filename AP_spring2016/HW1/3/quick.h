#ifndef QUICK
#define QUICK

#include "base.h"
#include "sort.h"

class Quick : public MySort
{
public:

    Quick();
    void execute();

private:

    void quickSortRecursive(std::vector<int> &_input, int first, int last);
    int  pivot(std::vector<int> &_input, int first, int last);

};

#endif // QUICK

