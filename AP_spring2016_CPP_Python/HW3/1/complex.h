#ifndef COMPLEX_H
#define COMPLEX_H

#include <string>
#include <iostream>
#include <stdio.h>
#include <cmath>

class CComplex
{
public:
    //Constructors
    CComplex();
    CComplex(float _real, float _imaginery = 0);
    CComplex(const CComplex& _copy);
    CComplex(CComplex&& _move);
    //Operators
    CComplex  operator +(const CComplex&& _toAdd   ) const;
    CComplex  operator +(const CComplex&  _toAdd   ) const;
    CComplex  operator /(const CComplex&  _toDivide) const;
    CComplex  operator /(const CComplex&& _toDivide) const;
    CComplex& operator =(const CComplex&  _toEqual );
    CComplex& operator =(const CComplex&& _toEqual );
    CComplex& operator+=(const CComplex& _toPlusEqual);
    //Public Const Functions
    std::string print() const;
    float mag() const;
    float ang() const;

    //Public Var
    float imag;
    float real;

private:


};

// Divide Operator for two Rvalue
CComplex operator/(CComplex&&, CComplex&&);





#endif // COMPLEX_H
