#ifndef SHELL
#define SHELL

#include "base.h"
#include "sort.h"

class Shell : public MySort{
public:

    Shell();
    void execute();

private:

    void shellSort(std::vector<int>& numbers, int array_size);

};

#endif // SHELL

