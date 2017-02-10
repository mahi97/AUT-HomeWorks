#include "base.h"

const int N{10};

template<typename T1, typename T2>
auto multiply(T1 (*_first)[N], T2 (*_second)[N])->
    decltype(_first[0][0] * _second[0][0]);

int main() {

    int (*pInt)[N] = new int[N][N];
    double (*pDouble)[N] = new double [N][N];

    std::cout << "pDouble = " << std::endl;

    for2(i, 0, N) {
        for2(j, 0, N) {
            pInt[i][j] = i * N + j + 1;
            pDouble[i][j] = pInt[i][j] * 0.1;
            std::cout << pDouble[i][j] << ' ';
        }
        std::cout << std::endl;
    }

    
    std::cout << "Resualt : " << std::endl;
    std::cout << multiply(pInt, pInt) << std::endl;
    std::cout << multiply(pDouble, pDouble) << std::endl;
    std::cout << multiply(pInt, pDouble) << std::endl;
    
    
    
    
    delete [] pInt;
    delete [] pDouble;



    return  0;
}

template<typename T1, typename T2>
auto multiply(T1 (*_first)[N], T2 (*_second)[N]) ->
decltype(_first[0][0] * _second[0][0]) {
    
    decltype(_first[0][0] * _second[0][0]) temp = {};
    
    for2(i, 0, N) {
        for2(j, 0, N) {
            temp += _first[i][j] * _second[i][j];
        }
    }
    temp /= 100;
    
    return temp;
}
