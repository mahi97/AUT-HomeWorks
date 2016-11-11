#include "base.h"

int row1{}, col1{}, row2{}, col2{};     

template<typename T1, typename T2>
auto dynamicMultiply(T1 **_first, T2 **_second)->
decltype(_first[0][0] * _second[0][0]);

int main() {

    std::ifstream file {"matrix.txt"};
    std::string mat{};
    int **elemnts;
    double **elemnts2;


    if(file.is_open()) {
       file >> mat;
       file >> row1 >> col1;
     
       elemnts = new int* [row1]; 
     
       for2(i, 0, row1) 
          elemnts[i] = new int[col1];

       for2(i, 0, row1) {
          for2(j, 0, col1) {
             file >> elemnts[i][j];
             std::cout << i <<"  "<< j << "  "<< elemnts[i][j] << std::endl;
            }
        }

       file >> mat;
       file >> row2 >> col2;
     
       elemnts2 = new double* [row1]; 
     
       for2(i, 0, row2) 
          elemnts2[i] = new double[col2];
       for2(i, 0, row2)
          for2(j, 0, col2) {
            file >> elemnts2[i][j];
            std::cout << i <<"  "<< j << "  "<< elemnts2[i][j] << std::endl;

          }

      file.close();

    }
    else {
        std::cout << "file not Found!" << std::endl;
        return 0;
    }
   
    std::cout << "row1 : " << row1 <<std::endl;
    std::cout << "col1 : " << col1 <<std::endl;
    std::cout << "row2 : " << row2 <<std::endl;
    std::cout << "col2 : " << col2 <<std::endl;
    std::cout << "Result : " << dynamicMultiply(elemnts, elemnts2) << std::endl;
    
    
    for2(i, 0, row2)
        delete [] elemnts2[i];
    delete [] elemnts2;

    for2(i, 0, row1)
        delete [] elemnts[i];
    delete [] elemnts;


    return  0;
}

template<typename T1, typename T2>
auto dynamicMultiply(T1 **_first, T2 **_second) ->
 decltype(_first[0][0] * _second[0][0]) {
    
    decltype(_first[0][0] * _second[0][0]) temp = {};
    
    for2(i, 0, row1) {
        for2(j, 0, col1) {
            temp += _first[i][j] * _second[i][j];
        }
    }
    temp /= 100;
    
    return temp;
}
