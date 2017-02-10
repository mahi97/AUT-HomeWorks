#ifndef BUBBLE
#define BUBBLE

#include "base.h"
#include "sort.h"

class Bubble : public MySort
{
public:

    Bubble();
    void execute();

private:

    void bubbleSort(std::vector<int>& _inputVec);
};

#endif // BUBBLE

