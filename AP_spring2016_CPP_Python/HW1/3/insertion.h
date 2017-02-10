#ifndef INSERTION
#define INSERTION

#include "base.h"
#include "sort.h"

class Insertion : public MySort
{
public:

    Insertion();
    void execute();

private:

    std::vector<int> sortedArray;

};

#endif // INSERTION

