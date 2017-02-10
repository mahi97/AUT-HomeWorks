#include "base.h"
#include <cmath>
int row1{}, col1{}, row2{}, col2{}, row3{}, col3{};     

void matrixMultiply(double **_first, double **_second,
					int _row1, int _col1,
					int _row2, int _col2,
					double **_result);

int main() {


    std::ifstream file {"matrices.txt"};
    std::string mat{};
    double check{};
    bool isCorrectAnswer{true};
    double **elemnts;
    double **elemnts2;
    double **elemnts3;
    double **resultElemnts;
    double **finalResult;

    if(file.is_open()) {
       file >> mat;
       file >> row1 >> col1;
     
       elemnts = new double* [row1]; 
     
       for2(i,0,row1) 
          elemnts[i] = new double[col1];

       for2(i,0,row1) {
          for2(j,0,col1) {
             file >> elemnts[i][j];
             std::cout << i <<"  "<< j << "  "<< elemnts[i][j] << std::endl;
            }
        }

       file >> mat;
       file >> row2 >> col2;
     
       elemnts2 = new double* [row2]; 
     
       for2(i,0,row2) 
          elemnts2[i] = new double[col2];
       for2(i,0,row2)
          for2(j,0,col2) {
            file >> elemnts2[i][j];
            std::cout << i <<"  "<< j << "  "<< elemnts2[i][j] << std::endl;
          }


    	file >> mat;
       	file >> row3 >> col3;
     
       	elemnts3 = new double* [row3]; 
     
       	for2(i,0,row3) 
       	   elemnts3[i] = new double[col3];
       	for2(i,0,row3)
    	  for2(j,0,col3) {
		    file >> elemnts3[i][j];
            std::cout << i <<"  "<< j << "  "<< elemnts3[i][j] << std::endl;
          }

      	resultElemnts = new double* [row1];
    	  finalResult = new double*[row2];

      	for2(i,0,row1) 
  			resultElemnts[i] = new double[col2];
  		for2(i,0,row2)
  			finalResult[i] = new double[col3];

    }
    else {
        std::cout << "file not Found!" << std::endl;
        return 0;
    }
   
    std::cout << "row1 : " << row1 <<std::endl;
    std::cout << "col1 : " << col1 <<std::endl;
    std::cout << "row2 : " << row2 <<std::endl;
    std::cout << "col2 : " << col2 <<std::endl;
    std::cout << "row3 : " << row3 <<std::endl;
    std::cout << "col3 : " << col3 <<std::endl;

    matrixMultiply(elemnts, elemnts2,
    			   row1, col1, row2, col2,
    			   resultElemnts);
    matrixMultiply(resultElemnts, elemnts3,
    			   row1, col2, row3, col3,
    			   finalResult);

    for2(i, 0, row1) {
    	for2(j, 0 ,col2) {
    		std::cout << finalResult[i][j] << "  ";
    	}
    	std::cout << std::endl;
    }
    
    file.close();
    
    file.open("matrix-check.txt");
    
    file >> mat;
    file >> row2;
    file >> col1;
    
    if(row1 == row2 && col1 == col2) {
        for2(i, 0, row1) {
            for2(j, 0 ,col2) {
                file >> check;
                if(static_cast<int>(finalResult[i][j] + 0.005)  != static_cast<int>(check + 0.005)) {
                    isCorrectAnswer = false;
                    std::cout << i*col2 + j << " :  ";
                    std::cout << finalResult[i][j];
                    std::cout << " = ";
                    std::cout << check << std::endl;
                }
            }
        }
    }

    
    
    if(isCorrectAnswer) {
        std::cout << "Answer is Right!" << std::endl;
    }
    else {
        std::cout << "Answer is Wrong!" << std::endl;
    }
    
    
    file.close();
    

    for2(i,0,row2)
        delete [] elemnts2[i];
    delete [] elemnts2;

    for2(i,0,row1)
        delete [] elemnts[i];
    delete [] elemnts;

        for2(i,0,row3)
        delete [] elemnts3[i];
    delete [] elemnts3;

        for2(i,0,row1)
        delete [] resultElemnts[i];
    delete [] resultElemnts;

        for2(i,0,row2)
        delete [] finalResult[i];
    delete [] finalResult;

    return  0;
}

void matrixMultiply(double **_first, double **_second,
					int _row1, int _col1,
					int _row2, int _col2,
					double **_result) {
    
    for2(i, 0, _row1)
    	for2(j, 0, _col2) 
    		_result[i][j] = 0;

    for2(i,0,_row1)
    	for2(j, 0, _col2)
    		for2(k, 0, _col1)
    			_result[i][j] += _first[i][k] * _second[k][j];

}
