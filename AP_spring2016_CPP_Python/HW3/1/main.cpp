#include <iostream>
#include "complex.h"

using std::cout;
using std::endl;

int main() {

   CComplex a{2.5, 3}; // 2.5 + 3j
   CComplex b{2}; // 2 + 0j
   cout<< "a= ";
   // Output real and imaginary parts
   cout << a.print() << endl; // 2.5 + 3j
   CComplex c{b}; // copy constructor
   c.imag = -3.5; // c.real is accessible too
   a += b; // Implement +=
   c = (a + b) / (a + c);//Implement + and /
   cout<<"c= ";
   // Output magnitude and angle
   cout << c.mag() << '<' << c.ang() << endl;
   return 0;
}
