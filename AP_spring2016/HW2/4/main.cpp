#include<iostream>
#include<vector>
#include<time.h>

#define Vector3D std::vector<std::vector<std::vector<int> > >
#define Vector2D std::vector<std::vector<int> >
#define Vector1D std::vector<int>
#define for2(i, a, b) for(int i{a};i  < b;i++)


void fillVector(Vector3D& _inputVec);
void forVec(const Vector3D& _toShow);

void printVec(const Vector3D& _toShow, int _index);

int main() {

    srand(time(0));

    Vector3D vec;
    fillVector(vec);
    std::cout << std::endl
              << "below result shown by using 'For' :"    << std::endl
              << "(for show the result is real and true)" << std::endl
              << "just in case you have doubt in the algorithm :D"
              << std::endl;
    forVec(vec);
    std::cout << std::endl
              << "below result shown by using 'recursive Function' :" << std::endl;
    printVec(vec, 60);
    return 0;
}

void fillVector(Vector3D &_inputVec) {
    int tempInt{};
    Vector1D tempVec1D;
    Vector2D tempVec2D;

    _inputVec.clear();

    for2(i, 0, 3) {
        tempVec2D.clear();
        for2(j, 0, 4) {
            tempVec1D.clear();
            for2(k, 0, 5) {
                tempInt = (rand() % 100);
                tempVec1D.push_back(tempInt);
            }
            tempVec2D.push_back(tempVec1D);
        }
        _inputVec.push_back(tempVec2D);
    }

}

void forVec(const Vector3D& _toShow) {
    for2(i, 0, 3) {
        std::cout << std::endl << "Matrix Number:" << i << std::endl;
        for2(j, 0, 4) {
            for2(k, 0, 5) {
                std::cout << _toShow[i][j][k] << "  ";
            }
            std::cout << std::endl;
        }
    }
}

void printVec(const Vector3D&_toShow, int _index) {
    if(_index == 0) {
        std::cout << std::endl << "Matrix Number : 0" << std::endl;
    }
    else {
        printVec(_toShow, _index - 1);

        std::cout << _toShow[( (_index - 1) / 20)]
                            [( (_index - 1) % 20) / 5]
                            [( (_index - 1) % 20) % 5]
                  << "  ";

        if(_index % 60 == 0) {
            std::cout << std::endl << std::endl
		      << "FINISH"  << std::endl;
        }
        else if( _index % 20 == 0) {
            std::cout << std::endl << "Matrix Number : " 
                      << static_cast<int>(_index / 20) << std::endl;
        }
        else if(_index % 5 == 0) {
            std::cout << std::endl;
        }
    }
}
