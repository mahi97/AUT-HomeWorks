#ifndef SELECTION
#define SELECTION

#include "base.h"
#include "sort.h"

class Selection : public MySort{
public:

    Selection();
    void execute();

private:

    void selectionSort (std::vector<int>& theList, int sizeOfList);

};

#endif // SELECTION

