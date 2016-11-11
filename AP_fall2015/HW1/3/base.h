#ifndef BASE_H
#define BASE_H

#include<vector>
#include<ctime>
#include <iostream>
#include <iomanip>


#define PROPERTY(type, name, label) \
private : type m_##name; \
public  :const type& get##label() const { return m_##name; } \
public  :void set##label(const type& v) { m_##name = v; }

typedef std::vector<int>::iterator vec_it;

enum class Esort {

    EBUBBLE,
    EMERGE,
    EQUICK,
    EINSERTION,
    ESELECTION,
    ESHELL,
    EHEAP
};

struct sortResult {

    int time{},comarison{},place{};
    Esort algorithm;
    std::vector<int> result;

};


#endif // BASE_H

