#include "complex.h"

CComplex::CComplex() {
    imag = 0.0;
    real = 0.0;
}

CComplex::CComplex(float _real, float _imaginery) {
    real = _real;
    imag = _imaginery;
}

CComplex::CComplex(const CComplex &_copy) {
    this->real = _copy.real;
    this->imag = _copy.imag;
}

CComplex::CComplex(CComplex &&_move) {
    this->real = _move.real;
    this->imag = _move.imag;
}

CComplex CComplex::operator +(const CComplex& _toAdd) const{
    CComplex temp;
    temp.real = this->real + _toAdd.real;
    temp.imag = this->imag + _toAdd.imag;
    return temp;
}

CComplex CComplex::operator +(const CComplex&& _toAdd) const{
    CComplex temp;
    temp.real = this->real + _toAdd.real;
    temp.imag = this->imag + _toAdd.imag;
    return temp;
}

CComplex& CComplex::operator =(const CComplex& _toEqual) {
    this->real = _toEqual.real;
    this->imag = _toEqual.imag;

    return *this;
}


CComplex& CComplex::operator =(const CComplex&& _toEqual) {
    this->real = _toEqual.real;
    this->imag = _toEqual.imag;
    return *this;
}


CComplex CComplex::operator /(const CComplex& _toDivide) const{
    CComplex temp;
    temp.real = cosf((this->ang() - _toDivide.ang())*
                     (this->mag() / _toDivide.mag()));
    temp.imag = sinf((this->ang() - _toDivide.ang())*
                     (this->mag() / _toDivide.mag()));
    return temp;
}

CComplex CComplex::operator /(const CComplex&& _toDivide) const{
    CComplex temp;
    temp.real = cosf((this->ang() - _toDivide.ang())*
                     (this->mag() / _toDivide.mag()));
    temp.imag = sinf((this->ang() - _toDivide.ang())*
                     (this->mag() / _toDivide.mag()));
    return temp;
}


CComplex& CComplex::operator +=(const CComplex& _toPlusEqual) {
    this->real += _toPlusEqual.real;
    this->imag += _toPlusEqual.imag;

    return *this;
}

std::string CComplex::print() const{
    char temp[50];
    std::sprintf (temp, "%f + %fj", real, imag);
    return temp;
}

float CComplex::ang() const{
    return atanf(imag / real);
}

float CComplex::mag() const{
    return sqrtf(powf(this->real, 2) + powf(this->imag, 2));
}

CComplex operator/(CComplex&& _first, CComplex&& _second) {
    CComplex temp;
    temp.real = cosf( (_first.ang() - _second.ang()) ) 
                    * (_first.mag() / _second.mag());
    temp.imag = sinf( (_first.ang() - _second.ang()) )
                    * (_first.mag() / _second.mag());
    return temp;
}

