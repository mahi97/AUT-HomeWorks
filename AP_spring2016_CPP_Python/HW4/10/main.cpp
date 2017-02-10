#include <iostream>

using std::cout;
using std::endl;

void showNumber(const int& index);

int main() {
	//start with 0
    showNumber(0);
}

void showNumber(const int& index) {
	//first Time
    cout << index << " ";

    //Final Step in Recursive
    if(index == 100) {
        cout << index << " ";
        return;
    }

    //Recursive
    showNumber(index + 1);
    
    //Second Time
    cout << index << " ";
}
