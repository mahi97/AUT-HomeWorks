#ifndef SORT_H
#define SORT_H

#include "base.h"

class MySort {
public:

    MySort();
    virtual void execute();
    void setNubmerVec(std::vector<int> _numberVec);
    sortResult getResult();
    void reset();
    void swap(int& a, int& b);

    std::vector<int> m_numberVec;

private:

    PROPERTY(int,time, Time)
    PROPERTY(int,place, Place)
    PROPERTY(int,comparison, Comparison)
    PROPERTY(Esort,algorithm, Algorithm)   
};

#endif // SORT_H

