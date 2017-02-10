#include <iostream>
#include <cmath>
#include <ctime>

using std::cout;
using std::endl;

struct SPoint {
    SPoint(const int& _x,const int& _y) {
        x = _x;
        y = _y;
    }
    double mag() const{
        return sqrt(pow(x, 2) + pow(y, 2));
    }

    int x,y;
};

int main() {
    srand(time(NULL));

    //Square is 100 * 100
    //So circle Radius equals to 50
    const int radius{50};
    double PI{};
    unsigned int circleArea{};

    //Number of Points in total
    unsigned int squareArea{5000};

    for(size_t i{};i < squareArea;i++) {
        SPoint temp((rand() % (radius * 2)) - radius,
                    (rand() % (radius * 2)) - radius);

        if(temp.mag() < radius) {
            circleArea++;
        }
    }

    cout.precision(10);


    PI = (static_cast<double>(circleArea) * 4) /
         (static_cast<double>(squareArea));

    cout << endl << "PI is Calculated : "
         << PI << endl
         << "Real PI is :" << M_PI << endl
         << "Error is :"   << fabs(M_PI - PI) << endl;


}
